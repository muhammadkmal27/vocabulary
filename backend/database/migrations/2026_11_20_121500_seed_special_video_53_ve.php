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
        // Dibatalkan: Video Siri 4 (ve7wVZ34rL4: Ep3 The Truth About Your Money) dipindahkan ke SKIP (klip pendek ~1 minit)
        $video = YoutubeVideo::where('youtube_video_id', 've7wVZ34rL4')->first();
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
