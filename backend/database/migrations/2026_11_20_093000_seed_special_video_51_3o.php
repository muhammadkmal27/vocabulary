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
        // Jalankan seeder khusus untuk Video #51 (Siri 4: Ramadan Reflections 2025 - Episod 01 3OlR7bb7uOw: Mufti Menk - Ramadan Reflections - Ep1 The More You Give the More You Get)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo51Seeder',
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
