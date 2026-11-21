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
        // Jalankan seeder khusus untuk Video #51 (PYbU9cRrtFc: NEW | Why Make Peace? Resolving your Disputes - Mufti Menk)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo51Seeder',
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
