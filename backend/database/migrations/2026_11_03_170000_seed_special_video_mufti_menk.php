<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideoSeeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video (Mufti Menk - Cape Town)
     * and its 817 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideoSeeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'L6QE6Vp7Oa4')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
