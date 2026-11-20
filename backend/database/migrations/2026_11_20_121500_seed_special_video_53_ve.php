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
        // Jalankan seeder khusus untuk Video #53 (Siri 4: Ramadan Reflections 2025 - Episod 03 ve7wVZ34rL4: The Truth About Your Money | Mufti Menk - Ramadan Reflections - Ep3)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo53Seeder',
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
