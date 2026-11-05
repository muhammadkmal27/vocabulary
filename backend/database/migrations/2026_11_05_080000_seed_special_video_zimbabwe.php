<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo3Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #3 (Special Talk on the Favours of Allah - Zimbabwe - Mufti Menk)
     * and its 570 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo3Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'xxzQDuyjWj4')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};

