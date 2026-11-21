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
        // Jalankan seeder khusus untuk Video #52 (bxQEtrhjuXo: Don't Lose Faith | Mufti Menk - Dundee | 2026)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo52Seeder',
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
