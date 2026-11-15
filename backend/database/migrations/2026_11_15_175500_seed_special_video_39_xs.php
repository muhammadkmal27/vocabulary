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
        // Jalankan seeder khusus untuk Video #39 (Siri 2 Ep.04 xs_8xmFqRJ4: Arafah | The Pilgrimage 2025)
        Artisan::call('db:seed', [
            '--class' => 'Database\Seeders\SpecialVideo39Seeder',
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
