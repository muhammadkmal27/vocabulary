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
        // Jalankan seeder khusus untuk Video #49 (Siri 3 Ep.09 5AQjsPpNDsw: Seeking Cure and Healing in Ramadan - The Final Stretch)
        Artisan::call('db:seed', [
            '--class' => 'Database\Seeders\SpecialVideo49Seeder',
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
