<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class SubscriptionPlan extends Model {
    use HasUuids;
    protected $fillable = ['name','slug','price_myr','stripe_price_id','is_active','member_limit'];
    protected function casts(): array {
        return [
            'is_active'=>'boolean',
            'price_myr'=>'decimal:2',
            'member_limit'=>'integer'
        ];
    }
    public function subscriptions() {
        return $this->hasMany(Subscription::class);
    }

    public function getStripePriceIdAttribute($value)
    {
        if ($this->slug === 'monthly-premium') {
            return env('STRIPE_MONTHLY_PRICE_ID', $value);
        }
        return $value;
    }
}
