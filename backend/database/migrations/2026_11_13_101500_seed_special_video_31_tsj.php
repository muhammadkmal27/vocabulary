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
        // Seed Special Video #31 (Siri 1 Ep.26: The Conquest of Makkah - TsjC5a7AwYU)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo31Seeder',
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
