<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Coupon;
use App\Models\CouponRedemption;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class CouponSystemTest extends TestCase
{
    use RefreshDatabase;

    private User $user;
    private Coupon $activeCoupon;
    private Coupon $expiredCoupon;
    private Coupon $maxUsedCoupon;

    protected function setUp(): void
    {
        parent::setUp();

        $this->user = User::factory()->create();

        $this->activeCoupon = Coupon::create([
            'code' => 'ACTIVE50',
            'description' => 'Active 50% discount coupon',
            'discount_percent' => 50,
            'duration_days' => 30,
            'max_uses' => 10,
            'current_uses' => 0,
            'is_active' => true,
            'expires_at' => now()->addDays(10),
        ]);

        $this->expiredCoupon = Coupon::create([
            'code' => 'EXPIRED',
            'description' => 'Expired coupon',
            'discount_percent' => 10,
            'duration_days' => 7,
            'max_uses' => 10,
            'current_uses' => 0,
            'is_active' => true,
            'expires_at' => now()->subDays(1),
        ]);

        $this->maxUsedCoupon = Coupon::create([
            'code' => 'MAXUSED',
            'description' => 'Fully used coupon',
            'discount_percent' => 20,
            'duration_days' => 14,
            'max_uses' => 5,
            'current_uses' => 5,
            'is_active' => true,
            'expires_at' => now()->addDays(5),
        ]);
    }

    public function test_user_can_validate_active_coupon()
    {
        $response = $this->postJson('/api/coupons/validate', [
            'code' => 'ACTIVE50',
        ]);

        $response->assertStatus(200)
            ->assertJson([
                'valid' => true,
                'coupon' => [
                    'code' => 'ACTIVE50',
                ]
            ]);
    }

    public function test_user_cannot_validate_expired_coupon()
    {
        $response = $this->postJson('/api/coupons/validate', [
            'code' => 'EXPIRED',
        ]);

        $response->assertStatus(422)
            ->assertJson([
                'valid' => false,
                'message' => 'Kupon sudah tamat tempoh.',
            ]);
    }

    public function test_user_cannot_validate_max_used_coupon()
    {
        $response = $this->postJson('/api/coupons/validate', [
            'code' => 'MAXUSED',
        ]);

        $response->assertStatus(422)
            ->assertJson([
                'valid' => false,
                'message' => 'Kupon sudah mencapai had penggunaan.',
            ]);
    }

    public function test_user_can_redeem_active_coupon()
    {
        $response = $this->actingAs($this->user)
            ->postJson('/api/coupons/redeem', [
                'code' => 'ACTIVE50',
            ]);

        $response->assertStatus(200)
            ->assertJson([
                'valid' => true,
                'message' => 'Kupon berjaya digunakan!',
            ]);

        $this->assertDatabaseHas('coupon_redemptions', [
            'user_id' => $this->user->id,
            'coupon_id' => $this->activeCoupon->id,
        ]);

        $this->assertEquals(1, $this->activeCoupon->fresh()->current_uses);
    }

    public function test_user_cannot_redeem_same_coupon_twice()
    {
        // First redemption
        CouponRedemption::create([
            'user_id' => $this->user->id,
            'coupon_id' => $this->activeCoupon->id,
            'redeemed_at' => now(),
        ]);

        $response = $this->actingAs($this->user)
            ->postJson('/api/coupons/redeem', [
                'code' => 'ACTIVE50',
            ]);

        $response->assertStatus(422)
            ->assertJson([
                'valid' => false,
                'message' => 'Anda sudah pernah guna kupon ini.',
            ]);
    }

    public function test_user_can_list_their_coupons()
    {
        CouponRedemption::create([
            'user_id' => $this->user->id,
            'coupon_id' => $this->activeCoupon->id,
            'redeemed_at' => now(),
        ]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/coupons/my-coupons');

        $response->assertStatus(200)
            ->assertJsonCount(1)
            ->assertJsonFragment([
                'coupon_id' => $this->activeCoupon->id,
            ]);
    }

    public function test_user_subscription_status_shows_active_coupon_virtual_subscription()
    {
        CouponRedemption::create([
            'user_id' => $this->user->id,
            'coupon_id' => $this->activeCoupon->id,
            'redeemed_at' => now(),
        ]);

        $response = $this->actingAs($this->user)
            ->getJson('/api/subscription/status');

        $response->assertStatus(200)
            ->assertJson([
                'has_active' => true,
            ])
            ->assertJsonPath('subscription.plan.name', 'Kupon Hadiah: ACTIVE50');
    }
}
