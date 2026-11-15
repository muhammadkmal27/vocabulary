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
        // Jalankan seeder khusus untuk Video #37 (Siri 2 Ep.02 TG9SrLECiBE: Origin Story | The Pilgrimage 2025)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo37Seeder',
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
