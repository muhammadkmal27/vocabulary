<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserVideoProgress extends Model
{
    use HasUuids;

    protected $table = 'user_video_progress';

    protected $fillable = [
        'user_id',
        'video_id',
        'last_watched_seconds',
        'duration_seconds',
        'is_completed',
        'last_watched_at',
    ];

    protected function casts(): array
    {
        return [
            'last_watched_seconds' => 'float',
            'duration_seconds'     => 'float',
            'is_completed'          => 'boolean',
            'last_watched_at'      => 'datetime',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function video(): BelongsTo
    {
        return $this->belongsTo(YoutubeVideo::class, 'video_id');
    }
}
