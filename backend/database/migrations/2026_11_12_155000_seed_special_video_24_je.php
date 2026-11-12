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
        // Seed Special Video #24 (Siri 1 Ep.19: The Siege of Banu al-Nadir - Je-6cTCJtwM)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo24Seeder',
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
