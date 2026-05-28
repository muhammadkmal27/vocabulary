<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Subscription extends Model { use HasUuids; protected $fillable = ['user_id','plan_id','stripe_subscription_id','stripe_status','auto_renew','ends_at','trial_ends_at','payment_gateway','is_lifetime']; protected function casts(): array { return ['auto_renew'=>'boolean','is_lifetime'=>'boolean','ends_at'=>'datetime','trial_ends_at'=>'datetime']; } public function user() { return $this->belongsTo(User::class); } public function plan() { return $this->belongsTo(SubscriptionPlan::class); } }
