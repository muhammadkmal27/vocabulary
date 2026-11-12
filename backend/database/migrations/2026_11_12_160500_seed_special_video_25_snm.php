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
        // Seed Special Video #25 (Siri 1 Ep.20: The Battle of al-Ahzab - SNmETUE2GFA)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo25Seeder',
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
