<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class FacebookCapiService
{
    /**
     * Send a standard purchase event to Facebook Conversions API.
     */
    public function sendPurchaseEvent(User $user, float $value, string $currency = 'MYR'): void
    {
        $pixelId = config('services.facebook.pixel_id');
        $accessToken = config('services.facebook.access_token');

        // Failsafe: if not configured, skip silently
        if (empty($pixelId) || empty($accessToken) || $pixelId === 'YOUR_FB_PIXEL_ID' || $accessToken === 'YOUR_FB_ACCESS_TOKEN') {
            Log::info('Facebook CAPI skipped: Pixel ID or Access Token is not set.');
            return;
        }

        $url = "https://graph.facebook.com/v19.0/{$pixelId}/events";

        // Normalize and SHA-256 hash user email
        $hashedEmail = hash('sha256', strtolower(trim($user->email)));

        $clientIp = request()->ip();
        $userAgent = request()->userAgent();

        $payload = [
            'data' => [
                [
                    'event_name' => 'Purchase',
                    'event_time' => time(),
                    'action_source' => 'website',
                    'event_source_url' => request()->fullUrl(),
                    'user_data' => array_filter([
                        'em' => [$hashedEmail],
                        'client_ip_address' => $clientIp,
                        'client_user_agent' => $userAgent,
                    ]),
                    'custom_data' => [
                        'currency' => $currency,
                        'value' => $value,
                    ],
                ]
            ],
            'access_token' => $accessToken,
        ];

        try {
            $response = Http::post($url, $payload);

            if (!$response->successful()) {
                Log::error('Facebook CAPI request failed', [
                    'status' => $response->status(),
                    'body' => $response->body(),
                ]);
            } else {
                Log::info('Facebook CAPI event "Purchase" sent successfully.', [
                    'user_id' => $user->id,
                    'value' => $value,
                ]);
            }
        } catch (\Exception $e) {
            // Rule #7: Fail-safe error handling.
            Log::error('Facebook CAPI exception caught', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);
        }
    }
}
