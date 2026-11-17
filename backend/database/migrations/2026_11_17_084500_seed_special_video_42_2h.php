<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Artisan;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Jalankan seeder khusus untuk Video #42 (Siri 3 Ep.02 2hS9znm69Us: Seeking Laylatul Qadr - The Final Stretch)
        Artisan::call('db:seed', [
            '--class' => 'Database\Seeders\SpecialVideo42Seeder',
            '--force' => true,
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // No-op rollback
    }
};
