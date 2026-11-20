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
        // Jalankan seeder khusus untuk Video #52 (Siri 4: Ramadan Reflections 2025 - Episod 02 yp-oI-4zPzE: Mufti Menk - Ramadan Reflections - Ep2 | The Truth About Your Money)
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
