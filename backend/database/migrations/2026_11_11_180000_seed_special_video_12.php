<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo12Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #12 (The First People to Believe | Life of the Final Messenger ﷺ | Ep.7 | Mufti Menk | Ramadan Series)
     * and its 72 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo12Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'l1Zwj51KF9g')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
