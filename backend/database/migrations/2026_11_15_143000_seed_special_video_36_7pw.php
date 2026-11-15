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
        // Jalankan seeder khusus untuk Video #36 (Siri 2 Ep.01 7pwXrrBg3Hw: The Invitation | The Pilgrimage 2025)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo36Seeder',
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
