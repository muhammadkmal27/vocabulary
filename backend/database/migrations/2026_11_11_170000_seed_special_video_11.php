<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo11Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #11 (Iqra — When the Heavens Opened | Life of the Final Messenger ﷺ | Ep.6 | Mufti Menk | Ramadan Series)
     * and its 126 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo11Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', '6M-NQKRdNuM')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
