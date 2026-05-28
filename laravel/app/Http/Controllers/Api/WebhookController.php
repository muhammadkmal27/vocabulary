<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\StripeService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class WebhookController extends Controller
{
    public function __construct(private StripeService $stripe) {}

    /**
     * Handle Stripe webhook events.
     * Fix #3: Secure error handling — generic message to client, real error logged internally.
     * Null-check on Stripe-Signature header to prevent processing unsigned requests.
     */
    public function handle(Request $request)
    {
        $payload = $request->getContent();
        $sigHeader = $request->header('Stripe-Signature');

        // Guard: reject requests without signature header
        if (empty($sigHeader)) {
            Log::warning('Stripe webhook received without Stripe-Signature header', [
                'ip' => $request->ip(),
            ]);
            return response()->json(['error' => 'Missing signature.'], 400);
        }

        try {
            $this->stripe->handleWebhook($payload, $sigHeader);
            return response()->json(['received' => true]);
        } catch (\Stripe\Exception\SignatureVerificationException $e) {
            // Signature verification failed — possible spoofing attempt
            Log::error('Stripe webhook signature verification failed', [
                'ip' => $request->ip(),
                'error' => $e->getMessage(),
            ]);
            return response()->json(['error' => 'Webhook signature verification failed.'], 400);
        } catch (\Exception $e) {
            // Fix #3: Never expose internal error details to the client
            Log::error('Stripe webhook processing error', [
                'ip' => $request->ip(),
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);
            return response()->json(['error' => 'Webhook processing failed.'], 400);
        }
    }
}
