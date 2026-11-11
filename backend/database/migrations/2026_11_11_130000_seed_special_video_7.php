<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo7Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Seeds the special religious bilingual video #7 (The Vow of Sacrifice | Life of the Final Messengerﷺ | Ep.2 | Mufti Menk | Ramadan Series)
     * and its 86 verified subtitles.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo7Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $video = \App\Models\YoutubeVideo::where('youtube_video_id', 'VgHWqe0ltxs')->first();
        if ($video) {
            \App\Models\VideoSubtitle::where('video_id', $video->id)->delete();
            $video->delete();
        }
    }
};
