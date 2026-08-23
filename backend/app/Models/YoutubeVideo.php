<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class YoutubeVideo extends Model
{
    use HasUuids;

    protected $fillable = [
        'language_id',
        'title',
        'youtube_video_id',
        'thumbnail_url',
        'category',
        'is_premium',
        'is_free',
        'is_active',
        'order',
    ];

    protected function casts(): array
    {
        return [
            'is_premium' => 'boolean',
            'is_free' => 'boolean',
            'is_active' => 'boolean',
            'order' => 'integer',
        ];
    }

    public function language()
    {
        return $this->belongsTo(Language::class);
    }

    public function subtitles()
    {
        return $this->hasMany(VideoSubtitle::class, 'video_id')->orderBy('order');
    }

    public function progress()
    {
        return $this->hasMany(UserVideoProgress::class, 'video_id');
    }
}
