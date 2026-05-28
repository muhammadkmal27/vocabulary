<?php

namespace Tests\Feature;

use App\Models\User;
use App\Services\StripeService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Mockery;
use Tests\TestCase;

class StripeVerifyReturnTest extends TestCase
{
    use RefreshDatabase;

    public function test_verify_return_success()
    {
        $user = User::factory()->create();

        $this->mock(StripeService::class, function ($mock) {
            $mock->shouldReceive('verifyCheckoutSession')
                ->once()
                ->with('cs_test_123')
                ->andReturn([
                    'activated' => true,
                    'message' => 'Langganan Stripe berjaya diaktifkan!'
                ]);
        });

        $response = $this->actingAs($user)
            ->postJson('/api/subscription/stripe/verify-return', [
                'session_id' => 'cs_test_123',
            ]);

        $response->assertStatus(200)
            ->assertJson([
                'activated' => true,
                'message' => 'Langganan Stripe berjaya diaktifkan!'
            ]);
    }

    public function test_verify_return_validation_error()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)
            ->postJson('/api/subscription/stripe/verify-return', [
                'session_id' => '',
            ]);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['session_id']);
    }

    public function test_verify_return_unauthenticated()
    {
        $response = $this->postJson('/api/subscription/stripe/verify-return', [
            'session_id' => 'cs_test_123',
        ]);

        $response->assertStatus(401);
    }
}
