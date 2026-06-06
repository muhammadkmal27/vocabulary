<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
{
    public function authorize(): true { return true; }

    public function rules(): array
    {
        return [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email',
            'password' => 'required|string|min:8|confirmed',
            'cf-turnstile-response' => [app()->environment('testing') ? 'nullable' : 'required', new \App\Rules\Turnstile()],
        ];
    }

    public function messages(): array
    {
        return [
            'email.unique' => 'Email ini sudah didaftarkan.',
            'password.min' => 'Kata laluan minimum 8 aksara.',
            'password.confirmed' => 'Kata laluan tidak sepadan.',
        ];
    }
}
