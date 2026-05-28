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
        Schema::table('subscriptions', function (Blueprint $table) {
            $table->string('payment_gateway')->default('stripe')->after('stripe_subscription_id');
            $table->boolean('is_lifetime')->default(false)->after('auto_renew');
        });

        Schema::table('transactions', function (Blueprint $table) {
            $table->string('payment_gateway')->default('stripe')->after('stripe_invoice_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('subscriptions', function (Blueprint $table) {
            $table->dropColumn(['payment_gateway', 'is_lifetime']);
        });

        Schema::table('transactions', function (Blueprint $table) {
            $table->dropColumn('payment_gateway');
        });
    }
};
