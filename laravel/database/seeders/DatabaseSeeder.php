<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\SubscriptionPlan;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Seed default Monthly Premium plan
        SubscriptionPlan::updateOrCreate(
            ['slug' => 'monthly-premium'],
            [
                'name' => 'Monthly Premium',
                'price_myr' => 20.00,
                'stripe_price_id' => env('STRIPE_MONTHLY_PRICE_ID'),
                'is_active' => true,
            ]
        );

        // Seed Lifetime Promo plan
        SubscriptionPlan::updateOrCreate(
            ['slug' => 'lifetime'],
            [
                'name' => 'Lifetime Promo',
                'price_myr' => 100.00,
                'stripe_price_id' => null,
                'is_active' => true,
            ]
        );

        // Seed admin user
        User::updateOrCreate(
            ['email' => 'admin@vocabulary.com'],
            [
                'name' => 'Admin Vocabulary',
                'password' => bcrypt('Admin@Vocab2026!'),
                'role' => 'admin',
            ]
        );
    }
}
