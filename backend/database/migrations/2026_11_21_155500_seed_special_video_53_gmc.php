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
        // Jalankan seeder khusus untuk Video #53 (gMc0jRygktg: Ease Comes After Hardship | Mufti Menk - Perth | 2026)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo53Seeder',
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
