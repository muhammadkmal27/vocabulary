<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo4Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #4 (The Ummah Can’t Heal Without This One Thing | Mufti Menk)
     * and its 390 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo4Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'uZT3McCJHzQ')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
