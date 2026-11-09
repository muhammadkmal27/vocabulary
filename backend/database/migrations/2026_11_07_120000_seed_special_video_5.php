<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo5Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #5 (NEW | Allah Knows What's in Your Heart, But… | Mufti Menk - Aberdeen | 2026)
     * and its 1100 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo5Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', '6rXG_fPTbl8')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};

