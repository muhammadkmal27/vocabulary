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
        // Seed Special Video #26 (Siri 1 Ep.21: The Siege of Banu Qurayzah - nFfMy76PfIc)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo26Seeder',
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
