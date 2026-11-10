<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\YoutubeVideo;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Make all videos (standard learning videos and Special videos) free.
     */
    public function up(): void
    {
        // 1. Kemaskini semua video sedia ada di pangkalan data kepada percuma
        YoutubeVideo::query()->update([
            'is_premium' => false,
            'is_free'    => true,
        ]);

        // 2. Ubah nilai lalai (default) kolum kepada percuma untuk sebarang video baharu
        Schema::table('youtube_videos', function (Blueprint $table) {
            $table->boolean('is_premium')->default(false)->change();
            $table->boolean('is_free')->default(true)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        YoutubeVideo::where('order', '>', 1)->update([
            'is_premium' => true,
            'is_free'    => false,
        ]);

        Schema::table('youtube_videos', function (Blueprint $table) {
            $table->boolean('is_premium')->default(true)->change();
            $table->boolean('is_free')->default(false)->change();
        });
    }
};

