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
        // Seed Special Video #17 (Siri 1 Ep.12: The Pledge of ʿAqabah - KrzPe8NrRd4)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo17Seeder',
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

