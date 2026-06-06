<?php

namespace Tests\Feature;

use App\Models\User;
use App\Services\FacebookCapiService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Tests\TestCase;

class FacebookCapiTest extends TestCase
{
    use RefreshDatabase;

    public function test_capi_skips_when_config_is_missing()
    {
        Http::fake();
        Log::shouldReceive('info')->with('Facebook CAPI skipped: Pixel ID or Access Token is not set.')->once();

        // Ensure configs are empty or placeholders
        config(['services.facebook.pixel_id' => 'YOUR_FB_PIXEL_ID']);
        config(['services.facebook.access_token' => 'YOUR_FB_ACCESS_TOKEN']);

        $user = User::factory()->create(['email' => 'TEST@example.com']);

        $service = new FacebookCapiService();
        $service->sendPurchaseEvent($user, 15.00);

        Http::assertNothingSent();
    }

    public function test_capi_sends_correct_hashed_payload_when_configured()
    {
        Http::fake([
            'https://graph.facebook.com/*' => Http::response(['success' => true], 200),
        ]);

        config(['services.facebook.pixel_id' => '123456789']);
        config(['services.facebook.access_token' => 'test_token']);

        $user = User::factory()->create(['email' => '  myEmail@Example.com  ']);

        $service = new FacebookCapiService();
        $service->sendPurchaseEvent($user, 49.90);

        Http::assertSent(function ($request) {
            $data = $request->data();
            
            // Check that the correct URL is hit
            if ($request->url() !== 'https://graph.facebook.com/v19.0/123456789/events') {
                return false;
            }

            // Check that the token is passed in root
            if (($data['access_token'] ?? '') !== 'test_token') {
                return false;
            }

            $event = $data['data'][0] ?? null;
            if (!$event || $event['event_name'] !== 'Purchase') {
                return false;
            }

            // Normlized email: '  myEmail@Example.com  ' -> trim -> lowercase -> sha256
            // 'myemail@example.com' -> hash
            $expectedHash = hash('sha256', 'myemail@example.com');
            if (($event['user_data']['em'][0] ?? '') !== $expectedHash) {
                return false;
            }

            if (($event['custom_data']['value'] ?? 0) !== 49.90) {
                return false;
            }

            if (($event['custom_data']['currency'] ?? '') !== 'MYR') {
                return false;
            }

            return true;
        });
    }
}
