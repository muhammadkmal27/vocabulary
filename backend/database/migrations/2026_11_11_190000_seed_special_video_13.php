<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo13Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #13 (The Message Goes Public | Life of the Final Messenger ﷺ | Ep.8 | Mufti Menk | Ramadan Series)
     * and its 113 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo13Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'ntv3dJv8wqQ')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
