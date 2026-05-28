<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Laravel\Socialite\Facades\Socialite;
use Mockery;
use Tests\TestCase;

class GoogleAuthTest extends TestCase
{
    use RefreshDatabase;

    public function test_google_redirect_returns_url()
    {
        $mockProvider = Mockery::mock('Laravel\Socialite\Two\GoogleProvider');
        $mockProvider->shouldReceive('stateless')->andReturnSelf();
        $mockProvider->shouldReceive('redirect')->andReturnSelf();
        $mockProvider->shouldReceive('getTargetUrl')->andReturn('https://mock-google-login-url.com');

        Socialite::shouldReceive('driver')
            ->with('google')
            ->andReturn($mockProvider);

        $response = $this->getJson('/api/auth/google');

        $response->assertStatus(200)
                 ->assertJson([
                     'url' => 'https://mock-google-login-url.com'
                 ]);
    }

    public function test_google_callback_registers_new_user()
    {
        $mockUser = Mockery::mock('Laravel\Socialite\Two\User');
        $mockUser->name = 'Google User';
        $mockUser->email = 'newgoogleuser@example.com';

        $mockProvider = Mockery::mock('Laravel\Socialite\Two\GoogleProvider');
        $mockProvider->shouldReceive('stateless')->andReturnSelf();
        $mockProvider->shouldReceive('user')->andReturn($mockUser);

        Socialite::shouldReceive('driver')
            ->with('google')
            ->andReturn($mockProvider);

        $response = $this->getJson('/api/auth/google/callback?code=mock_code');

        $response->assertStatus(200)
                 ->assertJsonStructure([
                     'user' => ['id', 'name', 'email'],
                     'token'
                 ]);

        $this->assertDatabaseHas('users', [
            'email' => 'newgoogleuser@example.com',
            'name' => 'Google User'
        ]);
    }

    public function test_google_callback_authenticates_existing_user()
    {
        $user = User::factory()->create([
            'email' => 'existinggoogleuser@example.com',
            'name' => 'Existing User'
        ]);

        $mockUser = Mockery::mock('Laravel\Socialite\Two\User');
        $mockUser->name = 'Existing User';
        $mockUser->email = 'existinggoogleuser@example.com';

        $mockProvider = Mockery::mock('Laravel\Socialite\Two\GoogleProvider');
        $mockProvider->shouldReceive('stateless')->andReturnSelf();
        $mockProvider->shouldReceive('user')->andReturn($mockUser);

        Socialite::shouldReceive('driver')
            ->with('google')
            ->andReturn($mockProvider);

        $response = $this->getJson('/api/auth/google/callback?code=mock_code');

        $response->assertStatus(200)
                 ->assertJsonStructure([
                     'user' => ['id', 'name', 'email'],
                     'token'
                 ]);

        $this->assertEquals($user->id, $response->json('user.id'));
    }

    public function test_google_callback_handles_exceptions()
    {
        $mockProvider = Mockery::mock('Laravel\Socialite\Two\GoogleProvider');
        $mockProvider->shouldReceive('stateless')->andReturnSelf();
        $mockProvider->shouldReceive('user')->andThrow(new \Exception('Google error'));

        Socialite::shouldReceive('driver')
            ->with('google')
            ->andReturn($mockProvider);

        $response = $this->getJson('/api/auth/google/callback?code=mock_code');

        $response->assertStatus(400)
                 ->assertJson([
                     'message' => 'Google authentication failed.'
                 ]);
    }

    protected function tearDown(): void
    {
        Mockery::close();
        parent::tearDown();
    }
}
