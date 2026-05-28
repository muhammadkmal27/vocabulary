<?php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     * Fix #7: Register rate limiters for payment and auth endpoints (Rule #21).
     */
    public function boot(): void
    {
        // Payment creation — strict: 5 attempts per minute per user
        RateLimiter::for('payment-create', function (Request $request) {
            return Limit::perMinute(5)->by($request->user()?->id ?: $request->ip())
                ->response(function () {
                    return response()->json([
                        'message' => 'Terlalu banyak percubaan. Sila tunggu sebelum cuba lagi.',
                    ], 429);
                });
        });

        // Payment management (toggle, status) — moderate: 10 per minute
        RateLimiter::for('payment-manage', function (Request $request) {
            return Limit::perMinute(10)->by($request->user()?->id ?: $request->ip())
                ->response(function () {
                    return response()->json([
                        'message' => 'Terlalu banyak permintaan. Sila tunggu sebentar.',
                    ], 429);
                });
        });

        // Webhook — moderate: 30 per minute per IP (webhooks may come in bursts)
        RateLimiter::for('webhook', function (Request $request) {
            return Limit::perMinute(30)->by($request->ip())
                ->response(function () {
                    return response()->json([
                        'message' => 'Too many webhook requests.',
                    ], 429);
                });
        });

        // Auth endpoints — strict: 5 per minute per IP
        RateLimiter::for('auth', function (Request $request) {
            return Limit::perMinute(5)->by($request->ip())
                ->response(function () {
                    return response()->json([
                        'message' => 'Terlalu banyak percubaan log masuk. Sila tunggu 1 minit.',
                    ], 429);
                });
        });

        // Coupon redemption — strict: 5 per minute
        RateLimiter::for('coupon', function (Request $request) {
            return Limit::perMinute(5)->by($request->user()?->id ?: $request->ip())
                ->response(function () {
                    return response()->json([
                        'message' => 'Terlalu banyak percubaan. Sila tunggu sebentar.',
                    ], 429);
                });
        });
    }
}
