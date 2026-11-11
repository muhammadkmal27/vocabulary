<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo14Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #14 (The Migration to Abyssinia | Life of the Final Messenger ﷺ | Ep.9 | Mufti Menk | Ramadan Series)
     * and its 69 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo14Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'qMmn1Lqh95M')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
