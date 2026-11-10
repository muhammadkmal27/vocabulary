<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('site_visitors', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('visitor_id', 64)->unique()->index();
            $table->foreignUuid('user_id')->nullable()->constrained('users')->nullOnDelete()->index();
            $table->string('ip_address', 45)->nullable();
            $table->text('user_agent')->nullable();
            $table->string('last_page', 255)->nullable();
            $table->unsignedInteger('visits_count')->default(1);
            $table->timestamp('last_seen_at')->index();
            $table->timestamps();
        });

        // Masukkan pengguna sedia ada sebagai rekod awal pelawat (initial baseline)
        try {
            $users = \App\Models\User::all();
            foreach ($users as $user) {
                \App\Models\SiteVisitor::create([
                    'visitor_id'   => 'usr_' . substr(str_replace('-', '', $user->id), 0, 32),
                    'user_id'      => $user->id,
                    'ip_address'   => null,
                    'user_agent'   => 'Pengguna Berdaftar',
                    'last_page'    => '/',
                    'visits_count' => 1,
                    'last_seen_at' => $user->updated_at ?? $user->created_at ?? now(),
                    'created_at'   => $user->created_at ?? now(),
                    'updated_at'   => $user->updated_at ?? now(),
                ]);
            }
        } catch (\Throwable $e) {
            // Abaikan jika tiada sambungan DB semasa semakan awal
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('site_visitors');
    }
};

