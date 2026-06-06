<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class CouponRedemption extends Model { use HasUuids; protected $fillable = ['user_id','coupon_id','redeemed_at']; public $timestamps = false; protected function casts(): array { return ['redeemed_at'=>'datetime']; } public function coupon() { return $this->belongsTo(Coupon::class); } }
