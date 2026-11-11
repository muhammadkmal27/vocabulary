<?php

use Illuminate\Database\Migrations\Migration;
use Database\Seeders\SpecialVideo5Seeder;

return new class extends Migration
{
    /**
     * Run the migrations.
     * Re-seeds Special Video #5 (6rXG_fPTbl8 - Aberdeen) with 1099 verified subtitles from mirror Vhif2JMvK1g
     * with authentic word-for-word audio sync and 1:1 Malay translations.
     */
    public function up(): void
    {
        $seeder = new SpecialVideo5Seeder();
        $seeder->run();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // No down action needed for reseed
    }
};
