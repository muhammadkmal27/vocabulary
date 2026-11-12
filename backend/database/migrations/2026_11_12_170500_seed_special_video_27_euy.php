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
        // Seed Special Video #27 (Siri 1 Ep.22: The Slander of A'ishah - EuyDY1bKkpk)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo27Seeder',
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
