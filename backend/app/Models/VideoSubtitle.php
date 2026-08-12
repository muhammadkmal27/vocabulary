<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class VideoSubtitle extends Model
{
    use HasUuids;

    protected $fillable = [
        'video_id',
        'start_time',
        'end_time',
        'source_text',
        'target_text',
        'order',
    ];

    protected function casts(): array
    {
        return [
            'start_time' => 'float',
            'end_time' => 'float',
            'order' => 'integer',
        ];
    }

    public function video()
    {
        return $this->belongsTo(YoutubeVideo::class, 'video_id');
    }
}
