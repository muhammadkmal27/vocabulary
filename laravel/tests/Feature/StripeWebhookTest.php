<?php

namespace Tests\Feature;

use App\Services\StripeService;
use Mockery\MockInterface;
use Tests\TestCase;

class StripeWebhookTest extends TestCase
{
    public function test_stripe_webhook_calls_service_successfully()
    {
        $payload = json_encode(['id' => 'evt_123', 'type' => 'checkout.session.completed']);
        $signature = 't=123,v1=abc';

        $this->mock(StripeService::class, function (MockInterface $mock) use ($payload, $signature) {
            $mock->shouldReceive('handleWebhook')
                ->once()
                ->with($payload, $signature);
        });

        $response = $this->postJson('/api/stripe/webhook', json_decode($payload, true), [
            'Stripe-Signature' => $signature,
        ]);

        $response->assertStatus(200)
            ->assertJson(['received' => true]);
    }

    public function test_stripe_webhook_returns_400_on_exception()
    {
        $payload = json_encode(['id' => 'evt_123']);
        $signature = 't=123,v1=abc';

        $this->mock(StripeService::class, function (MockInterface $mock) {
            $mock->shouldReceive('handleWebhook')
                ->once()
                ->andThrow(new \Exception('Invalid signature'));
        });

        $response = $this->postJson('/api/stripe/webhook', json_decode($payload, true), [
            'Stripe-Signature' => $signature,
        ]);

        $response->assertStatus(400)
            ->assertJson(['error' => 'Webhook processing failed.']);
    }
}
