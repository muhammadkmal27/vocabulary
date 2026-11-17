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
        // Jalankan seeder khusus untuk Video #50 (Siri 3 Ep.10 PG_4AyIrLzQ: Ending Ramadan with Gratitude - The Final Stretch)
        Artisan::call('db:seed', [
            '--class' => 'Database\Seeders\SpecialVideo50Seeder',
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
