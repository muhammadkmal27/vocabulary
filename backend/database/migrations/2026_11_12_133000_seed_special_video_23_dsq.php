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
        // Seed Special Video #23 (Siri 1 Ep.18: The Aftermath of Uhud - dsQkLDtVy4Q)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo23Seeder',
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
