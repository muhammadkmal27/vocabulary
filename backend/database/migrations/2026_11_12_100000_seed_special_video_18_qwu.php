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
        // Seed Special Video #18 (Siri 1 Ep.13: The Hijrah - qWubL2TGPlc)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo18Seeder',
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
