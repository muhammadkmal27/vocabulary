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
        // Seed Special Video #32 (Siri 1 Ep.27: The Battle of Hunayn - 1JCCeBE81WQ)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo32Seeder',
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
