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
        // Seed Special Video #20 (Siri 1 Ep.15: The Battle of Badr - fH49JET37eY)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo20Seeder',
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
