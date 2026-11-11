<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo10Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #10 (The Silence Before Revelation | Life of the Final Messenger ﷺ | Ep.5 | Mufti Menk | Ramadan Series)
     * and its 73 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo10Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'xUqhH8gHdJw')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
