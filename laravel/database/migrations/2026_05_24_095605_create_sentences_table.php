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
        Schema::create('sentences', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('level_id')->constrained('levels')->cascadeOnDelete();
            $table->text('source_text');
            $table->text('target_text');
            $table->text('tags')->nullable();
            $table->smallInteger('difficulty')->default(1);
            $table->integer('order');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sentences');
    }
};
