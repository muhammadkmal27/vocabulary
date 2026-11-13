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
        // Seed Special Video #30 (Siri 1 Ep.25: The Battle of Muʾtah - mu0BjJXXExY)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo30Seeder',
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
