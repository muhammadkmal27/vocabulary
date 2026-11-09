<?php

use Illuminate\Database\Migrations\Migration;
use App\Models\YoutubeVideo;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Set the first Special video (order 1 / L6QE6Vp7Oa4) as free,
     * and set all subsequent Special videos as premium.
     */
    public function up(): void
    {
        // 1. Pastikan video pertama kategori Special kekal percuma
        YoutubeVideo::where('category', 'Special')
            ->where(function ($q) {
                $q->where('order', 1)
                  ->orWhere('youtube_video_id', 'L6QE6Vp7Oa4');
            })
            ->update([
                'is_premium' => false,
                'is_free'    => true,
            ]);

        // 2. Tetapkan semua video kategori Special yang lain sebagai premium
        YoutubeVideo::where('category', 'Special')
            ->where(function ($q) {
                $q->where('order', '>', 1)
                  ->orWhere('youtube_video_id', '!=', 'L6QE6Vp7Oa4');
            })
            ->update([
                'is_premium' => true,
                'is_free'    => false,
            ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        YoutubeVideo::where('category', 'Special')
            ->update([
                'is_premium' => false,
                'is_free'    => true,
            ]);
    }
};
