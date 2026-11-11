<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo9Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #9 (The Man Makkah Trusted | Life of the Final Messenger ﷺ | Ep.4 | Mufti Menk | Ramadan Series)
     * and its 80 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo9Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'Vdug1pNex54')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
