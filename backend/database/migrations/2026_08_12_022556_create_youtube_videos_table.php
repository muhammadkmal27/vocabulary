<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('youtube_videos', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('language_id')->constrained('languages')->cascadeOnDelete();
            $table->string('title', 255);
            $table->string('youtube_video_id', 50);
            $table->string('thumbnail_url', 255)->nullable();
            $table->string('category', 100)->nullable();
            $table->boolean('is_premium')->default(true);
            $table->boolean('is_free')->default(false);
            $table->boolean('is_active')->default(true);
            $table->integer('order')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('youtube_videos');
    }
};
