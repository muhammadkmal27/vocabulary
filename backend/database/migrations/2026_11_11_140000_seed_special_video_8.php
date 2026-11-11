<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo8Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #8 (The Orphan of Makkah | Life of the Final Messenger ﷺ | Ep.3 | Mufti Menk | Ramadan Series)
     * and its 76 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo8Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'kzIu3hrdqRM')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
