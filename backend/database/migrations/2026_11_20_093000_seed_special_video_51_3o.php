<?php

use Illuminate\Database\Migrations\Migration;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Dibatalkan: Video Siri 4 (3OlR7bb7uOw: Ep1 The More You Give the More You Get) dipindahkan ke SKIP (klip pendek ~1 minit)
        $video = YoutubeVideo::where('youtube_video_id', '3OlR7bb7uOw')->first();
        if ($video) {
            VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // No-op rollback
    }
};
