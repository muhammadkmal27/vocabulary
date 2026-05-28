<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class Turnstile implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        // Skip validation in testing environment if turnstile key is not set
        if (app()->environment('testing')) {
            return;
        }

        $secret = config('services.turnstile.secret') ?? env('TURNSTILE_SECRET_KEY');

        if (empty($secret)) {
            Log::error('Turnstile validation failed: TURNSTILE_SECRET_KEY is empty');
            $fail('Pengesahan bot gagal disebabkan masalah konfigurasi pelayan.');
            return;
        }

        try {
            $response = Http::asForm()->post('https://challenges.cloudflare.com/turnstile/v0/siteverify', [
                'secret' => $secret,
                'response' => $value,
                'remoteip' => request()->ip(),
            ]);

            if (!$response->successful() || !$response->json('success')) {
                Log::warning('Turnstile verification failed', [
                    'ip' => request()->ip(),
                    'response' => $response->json(),
                ]);
                $fail('Sila sahkan anda bukan bot.');
            }
        } catch (\Exception $e) {
            Log::error('Turnstile connection error', ['error' => $e->getMessage()]);
            $fail('Ralat semasa menyambung ke perkhidmatan pengesahan bot.');
        }
    }
}
