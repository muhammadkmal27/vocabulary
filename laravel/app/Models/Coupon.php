<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model { use HasUuids; protected $fillable = ['code','description','discount_percent','duration_days','max_uses','current_uses','is_active','expires_at']; protected function casts(): array { return ['is_active'=>'boolean','expires_at'=>'datetime','max_uses'=>'integer','current_uses'=>'integer']; } }
