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
        // Seed Special Video #22 (Siri 1 Ep.17: The Battle of Uhud - OTwmuzD-n2w)
        Artisan::call('db:seed', [
            '--class' => 'Database\\Seeders\\SpecialVideo22Seeder',
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
