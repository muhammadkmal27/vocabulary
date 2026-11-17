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
        // Jalankan seeder khusus untuk Video #48 (Siri 3 Ep.08 EKYp-MiXXUs: The Most Powerful Dua for Laylatul Qadr - The Final Stretch)
        Artisan::call('db:seed', [
            '--class' => 'Database\Seeders\SpecialVideo48Seeder',
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
