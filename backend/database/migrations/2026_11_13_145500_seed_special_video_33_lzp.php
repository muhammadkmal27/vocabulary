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
        // Jalankan seeder khusus untuk Video #33 (Ep.28 LZPqtScwpJQ: The Expedition to Tabuk)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo33Seeder',
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
