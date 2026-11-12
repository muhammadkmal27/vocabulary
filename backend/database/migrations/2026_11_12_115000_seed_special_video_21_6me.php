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
        // Seed Special Video #21 (Siri 1 Ep.16: The Betrayal of Bana Qaynuqa - 6MEIPR3f4u0)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo21Seeder',
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
