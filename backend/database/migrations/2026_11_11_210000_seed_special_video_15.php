<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo15Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #15 (The Conversion of Umar (RA) | Life of the Final Messenger ﷺ | Ep.10 | Mufti Menk | Ramadan Series)
     * and its 103 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo15Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'butrsoKNPz4')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
