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
        // Jalankan seeder khusus untuk Video #41 (Siri 3 Ep.01 GdxpXf9LUQY: The Power of the Last 10 Nights - The Final Stretch)
        Artisan::call('db:seed', [
            '--class' => 'Database\Seeders\SpecialVideo41Seeder',
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
