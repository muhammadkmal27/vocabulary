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
        // Seed Special Video #19 (Siri 1 Ep.14: The Brotherhood of Madinah - cRmeK1tKuiY)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo19Seeder',
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
