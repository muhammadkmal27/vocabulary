<?php

namespace App\Services;

use App\Models\Coupon;
use App\Models\CouponRedemption;
use App\Models\User;
use Illuminate\Support\Carbon;

class CouponService
{
    public function validate(string $code): array
    {
        $coupon = Coupon::where('code', $code)->where('is_active', true)->first();
        if (!$coupon) return ['valid' => false, 'message' => 'Kupon tidak dijumpai.'];
        if ($coupon->expires_at && Carbon::parse($coupon->expires_at)->isPast()) return ['valid' => false, 'message' => 'Kupon sudah tamat tempoh.'];
        if ($coupon->max_uses && $coupon->current_uses >= $coupon->max_uses) return ['valid' => false, 'message' => 'Kupon sudah mencapai had penggunaan.'];
        return ['valid' => true, 'coupon' => $coupon];
    }

    public function redeem(User $user, string $code): array
    {
        $check = $this->validate($code);
        if (!$check['valid']) return $check;

        $already = CouponRedemption::where('user_id', $user->id)
            ->whereHas('coupon', fn($q) => $q->where('code', $code))
            ->exists();
        if ($already) return ['valid' => false, 'message' => 'Anda sudah pernah guna kupon ini.'];

        /** @var Coupon $coupon */
        $coupon = $check['coupon'];

        CouponRedemption::create([
            'user_id' => $user->id,
            'coupon_id' => $coupon->id,
            'redeemed_at' => now(),
        ]);

        $coupon->increment('current_uses');

        return [
            'valid' => true,
            'message' => 'Kupon berjaya digunakan!',
            'access_until' => now()->addDays($coupon->duration_days),
            'coupon' => $coupon,
        ];
    }

    public function myCoupons(User $user)
    {
        return CouponRedemption::where('user_id', $user->id)
            ->with('coupon')
            ->latest('redeemed_at')
            ->get();
    }
}
