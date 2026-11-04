<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo2Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #2 (Mufti Menk - Tanzania 2026)
     * and its 472 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo2Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'Ivb_Nnop4xs')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
