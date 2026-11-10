<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\YoutubeVideo;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Set all videos to premium status under the freemium model
     * (accessible to watch freely, with first 10 minutes of subtitles free,
     * and full subtitles/transcript unlocked for premium subscribers).
     */
    public function up(): void
    {
        YoutubeVideo::query()->update([
            'is_premium' => true,
        ]);

        Schema::table('youtube_videos', function (Blueprint $table) {
            $table->boolean('is_premium')->default(true)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        YoutubeVideo::query()->update([
            'is_premium' => false,
        ]);

        Schema::table('youtube_videos', function (Blueprint $table) {
            $table->boolean('is_premium')->default(false)->change();
        });
    }
};

