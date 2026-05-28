<?php

namespace Tests\Feature;

use App\Models\Subscription;
use App\Models\SubscriptionPlan;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Http;
use Tests\TestCase;

class ToyyibPayTest extends TestCase
{
    use RefreshDatabase;

    private User $user;

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
    }

    public function test_get_toyyibpay_status()
    {
        $response = $this->actingAs($this->user)
            ->getJson('/api/subscription/toyyibpay/status');

        $response->assertStatus(200)
            ->assertJson([
                'quota_used' => 0,
                'quota_remaining' => 100,
                'is_available' => true,
            ]);
    }

    public function test_create_toyyibpay_bill_success()
    {
        Http::fake([
            'dev.toyyibpay.com/index.php/api/createBill' => Http::response([
                [
                    'BillCode' => 'bill_test_code_123',
                ]
            ], 200)
        ]);

        $response = $this->actingAs($this->user)
            ->postJson('/api/subscription/toyyibpay/create-bill', [
                'success_url' => 'http://localhost/success',
            ]);

        $response->assertStatus(200)
            ->assertJson([
                'url' => 'https://dev.toyyibpay.com/bill_test_code_123',
            ]);
    }

    public function test_toyyibpay_webhook_activates_lifetime_subscription()
    {
        // Webhook payload sent by ToyyibPay
        $payload = [
            'refno' => 'TXY1029381',
            'status' => '1', // success
            'billExternalReferenceNo' => $this->user->id,
            'amount' => '100.00',
        ];

        $response = $this->postJson('/api/subscription/toyyibpay/webhook', $payload);

        $response->assertStatus(200);

        // Verify active lifetime subscription is created
        $this->assertDatabaseHas('subscriptions', [
            'user_id' => $this->user->id,
            'payment_gateway' => 'toyyibpay',
            'is_lifetime' => true,
            'stripe_status' => 'active',
            'auto_renew' => false,
            'ends_at' => null,
        ]);

        // Verify transaction is logged
        $this->assertDatabaseHas('transactions', [
            'user_id' => $this->user->id,
            'payment_gateway' => 'toyyibpay',
            'amount' => 100.00,
            'status' => 'paid',
        ]);
    }

    public function test_get_toyyibpay_status_with_custom_limit()
    {
        SubscriptionPlan::create([
            'name' => 'Lifetime Promo',
            'slug' => 'lifetime',
            'price_myr' => 100.00,
            'is_active' => true,
            'member_limit' => 25,
        ]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/subscription/toyyibpay/status');

        $response->assertStatus(200)
            ->assertJson([
                'quota_used' => 0,
                'quota_remaining' => 25,
                'is_available' => true,
            ]);
    }

    public function test_create_toyyibpay_bill_fails_when_quota_reached()
    {
        $plan = SubscriptionPlan::create([
            'name' => 'Lifetime Promo',
            'slug' => 'lifetime',
            'price_myr' => 100.00,
            'is_active' => true,
            'member_limit' => 5,
        ]);

        // Create 5 active lifetime subscriptions
        for ($i = 0; $i < 5; $i++) {
            $u = User::factory()->create();
            Subscription::create([
                'user_id' => $u->id,
                'plan_id' => $plan->id,
                'stripe_status' => 'active',
                'stripe_subscription_id' => 'toyyibpay_test_' . $i,
                'payment_gateway' => 'toyyibpay',
                'is_lifetime' => true,
                'auto_renew' => false,
            ]);
        }

        // Attempting to buy 6th lifetime subscription
        $response = $this->actingAs($this->user)
            ->postJson('/api/subscription/toyyibpay/create-bill', [
                'success_url' => 'http://localhost/success',
            ]);

        $response->assertStatus(400)
            ->assertJsonFragment([
                'message' => 'Lifetime promo quota (5 users) has been fully reached.',
            ]);
    }
}
