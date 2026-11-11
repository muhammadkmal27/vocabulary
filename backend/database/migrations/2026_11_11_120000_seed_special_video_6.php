<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo6Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #6 (The Year of the Elephant | Life of the Final Messengerﷺ | Ep.1 | Mufti Menk | Ramadan Series)
     * and its 80 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo6Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'PH61HNWHCyU')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
