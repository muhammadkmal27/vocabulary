<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class SiteVisitor extends Model
{
    use HasUuids;

    protected $fillable = [
        'visitor_id',
        'user_id',
        'ip_address',
        'user_agent',
        'last_page',
        'visits_count',
        'last_seen_at',
    ];

    protected function casts(): array
    {
        return [
            'visits_count' => 'integer',
            'last_seen_at' => 'datetime',
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}

