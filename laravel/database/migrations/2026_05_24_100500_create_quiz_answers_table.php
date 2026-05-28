<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration
{
    public function up(): void
    {
        Schema::create('quiz_answers', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('session_id')->constrained('quiz_sessions')->cascadeOnDelete();
            $table->foreignUuid('sentence_id')->constrained('sentences')->cascadeOnDelete();
            $table->text('user_answer')->nullable();
            $table->boolean('is_correct')->default(false);
            $table->boolean('revealed')->default(false);
            $table->timestamp('answered_at');
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('quiz_answers');
    }
};
