<?php

namespace App\Services;

use App\Models\Subscription;
use App\Models\SubscriptionPlan;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Stripe\StripeClient;

class StripeService
{
    private ?StripeClient $stripe = null;

    /**
     * Get Stripe client instance.
     * Fix #12: Throw exception if key not configured instead of using hardcoded mock.
     */
    private function getStripe(): StripeClient
    {
        if ($this->stripe === null) {
            $key = config('stripe.secret');
            if (empty($key)) {
                throw new \RuntimeException('STRIPE_SECRET_KEY is not configured. Please set it in .env');
            }
            $this->stripe = new StripeClient($key);
        }
        return $this->stripe;
    }

    public function createCheckoutSession(User $user, SubscriptionPlan $plan, string $successUrl, string $cancelUrl): array
    {
        // Create or get Stripe customer
        if (!$user->stripe_id) {
            $customer = $this->getStripe()->customers->create([
                'email' => $user->email,
                'name' => $user->name,
                'metadata' => ['user_id' => $user->id],
            ]);
            $user->update(['stripe_id' => $customer->id]);
        }

        // Create Stripe Price if not set
        if (!$plan->stripe_price_id) {
            $price = $this->getStripe()->prices->create([
                'unit_amount' => (int) ($plan->price_myr * 100),
                'currency' => 'myr',
                'product_data' => ['name' => $plan->name],
                'recurring' => ['interval' => 'month'],
            ]);
            $plan->update(['stripe_price_id' => $price->id]);
        }

        // Create checkout session
        $session = $this->getStripe()->checkout->sessions->create([
            'customer' => $user->stripe_id,
            'mode' => 'subscription',
            'line_items' => [['price' => $plan->stripe_price_id, 'quantity' => 1]],
            'success_url' => $successUrl,
            'cancel_url' => $cancelUrl,
            'metadata' => ['user_id' => $user->id, 'plan_id' => $plan->id],
        ]);

        // Fix #10: Security event logging
        Log::info('Stripe checkout session created', [
            'user_id' => $user->id,
            'plan_id' => $plan->id,
            'session_id' => $session->id,
        ]);

        return ['url' => $session->url, 'session_id' => $session->id];
    }

    public function verifyCheckoutSession(string $sessionId): array
    {
        $session = $this->getStripe()->checkout->sessions->retrieve($sessionId);

        if ($session->payment_status === 'paid' && $session->status === 'complete') {
            // Activate the subscription
            $this->activateSubscription($session);

            // Log the transaction using the invoice from Stripe
            if ($session->invoice) {
                try {
                    $invoice = $this->getStripe()->invoices->retrieve($session->invoice);
                    if ($invoice) {
                        $this->logTransaction($invoice);
                    }
                } catch (\Exception $e) {
                    Log::error('Stripe verifyCheckoutSession invoice retrieval/logging failed', [
                        'invoice_id' => $session->invoice,
                        'error' => $e->getMessage(),
                    ]);
                }
            }

            return ['activated' => true, 'message' => 'Langganan Stripe berjaya diaktifkan!'];
        }

        return ['activated' => false, 'message' => 'Pembayaran belum berjaya diproses oleh Stripe.'];
    }

    public function handleWebhook(string $payload, string $sigHeader): void
    {
        $event = \Stripe\Webhook::constructEvent($payload, $sigHeader, config('stripe.webhook_secret'));

        // Fix #10: Log all webhook events for audit trail
        Log::info('Stripe webhook received', [
            'event_type' => $event->type,
            'event_id' => $event->id,
        ]);

        switch ($event->type) {
            case 'checkout.session.completed':
                $session = $event->data->object;
                $this->activateSubscription($session);
                break;

            case 'invoice.paid':
                $invoice = $event->data->object;
                $this->logTransaction($invoice);
                break;

            case 'customer.subscription.updated':
                $sub = $event->data->object;
                $this->syncSubscription($sub);
                break;

            case 'customer.subscription.deleted':
                $sub = $event->data->object;
                $this->deactivateSubscription($sub);
                break;
        }
    }

    public function getSubscription(string $id)
    {
        return $this->getStripe()->subscriptions->retrieve($id);
    }

    public function toggleAutoRenew(Subscription $subscription): Subscription
    {
        $newState = !$subscription->auto_renew;
        $this->getStripe()->subscriptions->update($subscription->stripe_subscription_id, [
            'cancel_at_period_end' => !$newState,
        ]);
        $subscription->update(['auto_renew' => $newState]);

        // Fix #10: Security event logging
        Log::info('Stripe auto-renew toggled', [
            'user_id' => $subscription->user_id,
            'subscription_id' => $subscription->id,
            'auto_renew' => $newState,
        ]);

        return $subscription->fresh();
    }

    public function cancelSubscription(Subscription $subscription): void
    {
        $this->getStripe()->subscriptions->cancel($subscription->stripe_subscription_id);
        $subscription->update(['stripe_status' => 'canceled', 'auto_renew' => false]);

        // Fix #10: Security event logging
        Log::info('Stripe subscription canceled', [
            'user_id' => $subscription->user_id,
            'subscription_id' => $subscription->id,
            'stripe_subscription_id' => $subscription->stripe_subscription_id,
        ]);
    }

    /**
     * Activate subscription from checkout.session.completed webhook.
     * Fix #4: Wrapped in DB::transaction for atomicity.
     * Fix #5: Added payment_gateway = 'stripe'.
     */
    private function activateSubscription($session): void
    {
        $userId = $session->metadata['user_id'] ?? null;
        $planId = $session->metadata['plan_id'] ?? null;
        if (!$userId || !$planId) {
            Log::warning('Stripe activateSubscription missing metadata', [
                'session_id' => $session->id ?? 'unknown',
            ]);
            return;
        }

        DB::transaction(function () use ($session, $userId, $planId) {
            // Deactivate any other active Stripe subscriptions for this user
            Subscription::where('user_id', $userId)
                ->where('payment_gateway', 'stripe')
                ->where('stripe_status', 'active')
                ->where('stripe_subscription_id', '!=', $session->subscription)
                ->update(['stripe_status' => 'canceled', 'auto_renew' => false]);

            Subscription::updateOrCreate(
                ['stripe_subscription_id' => $session->subscription],
                [
                    'user_id' => $userId,
                    'plan_id' => $planId,
                    'stripe_status' => 'active',
                    'auto_renew' => true,
                    'payment_gateway' => 'stripe',
                ]
            );
        });

        // Fix #10: Security event logging
        Log::info('Stripe subscription activated', [
            'user_id' => $userId,
            'plan_id' => $planId,
            'stripe_subscription_id' => $session->subscription,
        ]);
    }

    /**
     * Log transaction from invoice.paid webhook.
     * Fix #8: Changed create() to updateOrCreate() for idempotency on webhook retry.
     * Fix #6: Added payment_gateway = 'stripe'.
     */
    private function logTransaction($invoice): void
    {
        $subId = $invoice->subscription;
        $subscription = Subscription::where('stripe_subscription_id', $subId)->first();
        if (!$subscription) {
            Log::warning('Stripe logTransaction: subscription not found', [
                'stripe_subscription_id' => $subId,
                'invoice_id' => $invoice->id,
            ]);
            return;
        }

        Transaction::updateOrCreate(
            ['stripe_invoice_id' => $invoice->id],
            [
                'user_id' => $subscription->user_id,
                'subscription_id' => $subscription->id,
                'amount' => $invoice->amount_paid / 100,
                'currency' => $invoice->currency,
                'status' => $invoice->status,
                'payment_gateway' => 'stripe',
                'paid_at' => now(),
            ]
        );

        // Fix #10: Security event logging
        Log::info('Stripe transaction logged', [
            'user_id' => $subscription->user_id,
            'invoice_id' => $invoice->id,
            'amount' => $invoice->amount_paid / 100,
        ]);
    }

    private function syncSubscription($stripeSub): void
    {
        $affected = Subscription::where('stripe_subscription_id', $stripeSub->id)
            ->update([
                'stripe_status' => $stripeSub->status,
                'auto_renew' => !$stripeSub->cancel_at_period_end,
                'ends_at' => $stripeSub->cancel_at ? \Illuminate\Support\Carbon::createFromTimestamp($stripeSub->cancel_at) : null,
            ]);

        // Fix #10: Security event logging
        Log::info('Stripe subscription synced', [
            'stripe_subscription_id' => $stripeSub->id,
            'new_status' => $stripeSub->status,
            'rows_affected' => $affected,
        ]);
    }

    /**
     * Deactivate subscription from customer.subscription.deleted webhook.
     */
    private function deactivateSubscription($stripeSub): void
    {
        $affected = Subscription::where('stripe_subscription_id', $stripeSub->id)
            ->update([
                'stripe_status' => 'canceled',
                'auto_renew' => false,
                'ends_at' => $stripeSub->ended_at ? \Illuminate\Support\Carbon::createFromTimestamp($stripeSub->ended_at) : now(),
            ]);

        // Fix #10: Security event logging
        Log::warning('Stripe subscription deactivated/deleted', [
            'stripe_subscription_id' => $stripeSub->id,
            'rows_affected' => $affected,
        ]);
    }
}
