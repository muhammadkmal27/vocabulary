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
        // Seed Special Video #28 (Siri 1 Ep.23: The Treaty of Hudaybiyyah - FwbSkCofNA4)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo28Seeder',
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
