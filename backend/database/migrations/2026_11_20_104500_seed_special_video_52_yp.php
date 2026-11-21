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
        // Dibatalkan: Video Siri 4 (yp-oI-4zPzE: Ep2 The Truth About Your Money) dipindahkan ke SKIP (klip pendek ~1 minit)
        $video = YoutubeVideo::where('youtube_video_id', 'yp-oI-4zPzE')->first();
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
