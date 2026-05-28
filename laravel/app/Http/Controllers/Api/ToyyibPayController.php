<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Subscription;
use App\Models\SubscriptionPlan;
use App\Services\ToyyibPayService;
use Illuminate\Http\Request;

class ToyyibPayController extends Controller
{
    public function __construct(private ToyyibPayService $toyyibpay) {}

    public function createBill(Request $request)
    {
        $request->validate([
            'success_url' => 'nullable|url',
            'cf-turnstile-response' => [app()->environment('testing') ? 'nullable' : 'required', new \App\Rules\Turnstile()],
        ]);

        try {
            $successUrl = $request->success_url ?? config('app.url') . '/subscription?success=1';
            
            // Enforce same-domain redirection to prevent open redirect / SSRF
            $appHost = parse_url(config('app.url'), PHP_URL_HOST);
            $reqHost = parse_url($successUrl, PHP_URL_HOST);
            if ($reqHost && $appHost && strtolower($reqHost) !== strtolower($appHost)) {
                $successUrl = config('app.url') . '/subscription?success=1';
            }

            $redirectUrl = $this->toyyibpay->createBill($request->user(), $successUrl);
            
            return response()->json(['url' => $redirectUrl]);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function webhook(Request $request)
    {
        // ToyyibPay callback is sent as POST parameters
        $this->toyyibpay->handleWebhook($request->all());
        
        return response('OK', 200);
    }

    /**
     * Called by the frontend after user is redirected back from ToyyibPay.
     * Verifies the payment and activates the subscription.
     */
    public function verifyReturn(Request $request)
    {
        $request->validate([
            'billcode' => 'required|string|max:50',
        ]);

        try {
            $result = $this->toyyibpay->verifyReturnPayment(
                $request->user(),
                $request->billcode
            );

            $statusCode = $result['activated'] ? 200 : 422;
            return response()->json($result, $statusCode);
        } catch (\Exception $e) {
            return response()->json([
                'activated' => false,
                'message' => 'Ralat semasa mengesahkan pembayaran.',
            ], 500);
        }
    }

    public function status()
    {
        $plan = SubscriptionPlan::where('slug', 'lifetime')->first();
        $limit = $plan ? ($plan->member_limit ?? 100) : 100;

        $count = Subscription::where('payment_gateway', 'toyyibpay')
            ->where('is_lifetime', true)
            ->where('stripe_status', 'active')
            ->count();

        return response()->json([
            'quota_used' => $count,
            'quota_remaining' => max(0, $limit - $count),
            'is_available' => $count < $limit && ($plan ? (bool) $plan->is_active : true),
        ]);
    }
}
