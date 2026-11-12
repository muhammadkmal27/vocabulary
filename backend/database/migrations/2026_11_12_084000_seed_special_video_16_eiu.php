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
        // Seed Special Video #16 (Siri 1 Ep.11: The Night of Ascension - EiuTxK2MbAo)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo16Seeder',
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
