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
        // Padam rekod video Siri 4: Ramadan Reflections 2025 yang dipindahkan ke SKIP
        $videoIds = ['3OlR7bb7uOw', 'yp-oI-4zPzE', 've7wVZ34rL4'];
        $videos = YoutubeVideo::whereIn('youtube_video_id', $videoIds)->get();
        foreach ($videos as $video) {
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
