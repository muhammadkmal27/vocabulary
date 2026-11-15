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
        // Jalankan seeder khusus untuk Video #34 (Ep.29 ziRT5GhtgvY: The Year of Delegations)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo34Seeder',
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
