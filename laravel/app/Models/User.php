<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Enums\UserRole;
use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<UserFactory> */
    use HasApiTokens, HasFactory, HasUuids, Notifiable;

    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
        'stripe_id',
        'pm_type',
        'pm_last_four',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $appends = [
        'subscribed',
        'subscription_source',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'role' => UserRole::class,
        ];
    }

    public function subscriptions()
    {
        return $this->hasMany(Subscription::class);
    }

    public function quizSessions()
    {
        return $this->hasMany(QuizSession::class);
    }

    public function isAdmin(): bool
    {
        return $this->role === UserRole::Admin;
    }

    public function getSubscribedAttribute(): bool
    {
        $hasActiveSubscription = $this->subscriptions()
            ->where('stripe_status', 'active')
            ->where(function ($q) {
                $q->whereNull('ends_at')->orWhere('ends_at', '>', now());
            })
            ->exists();

        if ($hasActiveSubscription) {
            return true;
        }

        $hasCouponAccess = \App\Models\CouponRedemption::where('user_id', $this->id)
            ->whereHas('coupon', fn($q) => $q->where('is_active', true))
            ->exists();

        return $hasCouponAccess;
    }

    public function getSubscriptionSourceAttribute(): string
    {
        $activeSub = $this->subscriptions()
            ->where('stripe_status', 'active')
            ->where(function ($q) {
                $q->whereNull('ends_at')->orWhere('ends_at', '>', now());
            })
            ->first();

        if ($activeSub) {
            if ($activeSub->payment_gateway === 'toyyibpay') {
                return $activeSub->is_lifetime ? 'Lifetime' : 'ToyyibPay';
            }
            return 'Stripe';
        }

        $activeCoupon = \App\Models\CouponRedemption::where('user_id', $this->id)
            ->whereHas('coupon', fn($q) => $q->where('is_active', true))
            ->with('coupon')
            ->first();

        if ($activeCoupon) {
            return 'Kupon: ' . $activeCoupon->coupon->code;
        }

        return 'Tiada';
    }
}
