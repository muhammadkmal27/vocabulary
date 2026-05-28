<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\StripeService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class SubscriptionController extends Controller
{
    public function __construct(private StripeService $stripe) {}

    /**
     * Create Stripe checkout session.
     * Fix #1: Strict input validation + same-domain redirect enforcement (SSRF prevention).
     */
    public function createCheckout(Request $request)
    {
        $request->validate([
            'plan_id' => 'required|uuid',
            'success_url' => 'nullable|url|max:500',
            'cancel_url' => 'nullable|url|max:500',
            'cf-turnstile-response' => [app()->environment('testing') ? 'nullable' : 'required', new \App\Rules\Turnstile()],
        ]);

        $plan = \App\Models\SubscriptionPlan::where('id', $request->plan_id)
            ->where('is_active', true)
            ->firstOrFail();

        // Enforce same-domain redirection to prevent Open Redirect / SSRF
        $frontendUrl = env('FRONTEND_URL', 'http://localhost:3000');
        $frontendHost = parse_url($frontendUrl, PHP_URL_HOST);
        $frontendPort = parse_url($frontendUrl, PHP_URL_PORT);

        $successUrl = $request->success_url ?? $frontendUrl . '/subscription?success=1&session_id={CHECKOUT_SESSION_ID}';
        $cancelUrl = $request->cancel_url ?? $frontendUrl . '/pricing';

        $successHost = parse_url($successUrl, PHP_URL_HOST);
        $successPort = parse_url($successUrl, PHP_URL_PORT);
        $cancelHost = parse_url($cancelUrl, PHP_URL_HOST);
        $cancelPort = parse_url($cancelUrl, PHP_URL_PORT);

        if ($successHost && $frontendHost && (strtolower($successHost) !== strtolower($frontendHost) || $successPort != $frontendPort)) {
            $successUrl = $frontendUrl . '/subscription?success=1&session_id={CHECKOUT_SESSION_ID}';
        }
        if ($cancelHost && $frontendHost && (strtolower($cancelHost) !== strtolower($frontendHost) || $cancelPort != $frontendPort)) {
            $cancelUrl = $frontendUrl . '/pricing';
        }

        try {
            $result = $this->stripe->createCheckoutSession(
                $request->user(),
                $plan,
                $successUrl,
                $cancelUrl
            );
            return response()->json($result);
        } catch (\Exception $e) {
            Log::error('Stripe createCheckout failed', [
                'user_id' => $request->user()->id,
                'plan_id' => $request->plan_id,
                'error' => $e->getMessage(),
            ]);
            return response()->json(['message' => 'Gagal membuat sesi pembayaran. Sila cuba semula.'], 500);
        }
    }

    /**
     * Toggle auto-renew on a Stripe subscription.
     * Fix #2: OLAC — scope subscription query by authenticated user.
     */
    public function toggleRenew(Request $request)
    {
        $request->validate([
            'subscription_id' => 'required|uuid',
        ]);

        // OLAC: Only allow toggling own subscriptions, scoped by user_id
        $sub = $request->user()->subscriptions()
            ->where('id', $request->subscription_id)
            ->where('payment_gateway', 'stripe')
            ->firstOrFail();

        // Prevent toggle on lifetime or non-active subscriptions
        if ($sub->is_lifetime) {
            return response()->json(['message' => 'Langganan lifetime tidak memerlukan auto-billing.'], 422);
        }

        if ($sub->stripe_status !== 'active') {
            return response()->json(['message' => 'Hanya langganan aktif boleh ditukar auto-billing.'], 422);
        }

        try {
            $updated = $this->stripe->toggleAutoRenew($sub);
            $updated->load('plan');
            return response()->json($updated);
        } catch (\Exception $e) {
            Log::error('Stripe toggleRenew failed', [
                'user_id' => $request->user()->id,
                'subscription_id' => $request->subscription_id,
                'error' => $e->getMessage(),
            ]);
            return response()->json(['message' => 'Gagal mengemaskini auto-billing. Sila cuba semula.'], 500);
        }
    }

    /**
     * Get current subscription status.
     * Fix #9: OLAC consistently applied — all queries scoped by authenticated user.
     */
    public function status(Request $request)
    {
        $user = $request->user();

        // OLAC: Query scoped by user relationship
        $activeSub = $user->subscriptions()
            ->where('stripe_status', 'active')
            ->where(function ($q) { $q->whereNull('ends_at')->orWhere('ends_at', '>', now()); })
            ->with('plan')
            ->first();

        // Direct Stripe status sync for robustness (crucial in localhost without webhook tunnels)
        if ($activeSub && $activeSub->payment_gateway === 'stripe') {
            try {
                $stripeSub = $this->stripe->getSubscription($activeSub->stripe_subscription_id);
                if ($stripeSub) {
                    $activeSub->update([
                        'stripe_status' => $stripeSub->status,
                        'auto_renew' => !$stripeSub->cancel_at_period_end,
                        'ends_at' => $stripeSub->cancel_at ? \Illuminate\Support\Carbon::createFromTimestamp($stripeSub->cancel_at) : null,
                    ]);
                    // Refresh model and relation
                    $activeSub = $activeSub->fresh('plan');
                }
            } catch (\Exception $e) {
                Log::warning('Stripe active subscription status direct sync failed', [
                    'user_id' => $user->id,
                    'stripe_subscription_id' => $activeSub->stripe_subscription_id,
                    'error' => $e->getMessage(),
                ]);
            }
        }

        // Re-evaluate if it's still active after potential direct sync update
        $isStillActive = $activeSub && 
            $activeSub->stripe_status === 'active' && 
            (is_null($activeSub->ends_at) || \Illuminate\Support\Carbon::parse($activeSub->ends_at)->isFuture());

        if (!$isStillActive) {
            $activeSub = null;
        }

        if (!$activeSub) {
            // OLAC: Coupon redemption also scoped by user_id
            $latestRedemption = \App\Models\CouponRedemption::where('user_id', $user->id)
                ->whereHas('coupon', fn($q) => $q->where('is_active', true))
                ->with('coupon')
                ->latest('redeemed_at')
                ->first();

            if ($latestRedemption) {
                $expiresAt = \Illuminate\Support\Carbon::parse($latestRedemption->redeemed_at)->addDays($latestRedemption->coupon->duration_days);
                if ($expiresAt->isFuture()) {
                    $activeSub = [
                        'id' => 'coupon_' . $latestRedemption->id,
                        'stripe_status' => 'active',
                        'auto_renew' => false,
                        'ends_at' => $expiresAt->toIso8601String(),
                        'is_lifetime' => ($latestRedemption->coupon->duration_days >= 3600),
                        'payment_gateway' => 'coupon',
                        'plan' => [
                            'id' => 'coupon_plan',
                            'name' => 'Kupon Hadiah: ' . $latestRedemption->coupon->code,
                            'price_myr' => 0,
                        ],
                    ];
                }
            }
        }

        return response()->json([
            'has_active' => (bool) $activeSub,
            'subscription' => $activeSub,
        ]);
    }

    public function verifyReturn(Request $request)
    {
        $request->validate([
            'session_id' => 'required|string|max:150',
        ]);

        try {
            $result = $this->stripe->verifyCheckoutSession($request->session_id);
            $statusCode = $result['activated'] ? 200 : 422;
            return response()->json($result, $statusCode);
        } catch (\Exception $e) {
            Log::error('Stripe verifyReturn failed', [
                'user_id' => $request->user()->id,
                'session_id' => $request->session_id,
                'error' => $e->getMessage(),
            ]);
            return response()->json([
                'activated' => false,
                'message' => 'Ralat semasa mengesahkan pembayaran Stripe.',
            ], 500);
        }
    }
}
