<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Language;
use App\Enums\UserRole;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AdminCrudTest extends TestCase
{
    use RefreshDatabase;

    private User $admin;
    private User $regularUser;

    protected function setUp(): void
    {
        parent::setUp();

        $this->admin = User::factory()->create([
            'role' => UserRole::Admin,
        ]);

        $this->regularUser = User::factory()->create([
            'role' => UserRole::User,
        ]);
    }

    public function test_regular_user_cannot_access_admin_endpoints()
    {
        $response = $this->actingAs($this->regularUser)
            ->getJson('/api/admin/dashboard');

        $response->assertStatus(403);
    }

    public function test_admin_can_access_admin_dashboard()
    {
        $response = $this->actingAs($this->admin)
            ->getJson('/api/admin/dashboard');

        $response->assertStatus(200);
    }

    public function test_admin_can_crud_languages()
    {
        // 1. Create (Store)
        $response = $this->actingAs($this->admin)
            ->postJson('/api/admin/languages', [
                'code' => 'jp',
                'name' => 'Japanese',
                'flag' => '🇯🇵',
            ]);

        $response->assertStatus(201)
            ->assertJson([
                'code' => 'jp',
                'name' => 'Japanese',
            ]);

        $this->assertDatabaseHas('languages', ['code' => 'jp']);
        $languageId = $response->json('id');

        // 2. Read (Show)
        $response = $this->actingAs($this->admin)
            ->getJson("/api/admin/languages/{$languageId}");

        $response->assertStatus(200)
            ->assertJson([
                'id' => $languageId,
                'code' => 'jp',
            ]);

        // 3. Update
        $response = $this->actingAs($this->admin)
            ->putJson("/api/admin/languages/{$languageId}", [
                'name' => 'Nihongo',
                'is_active' => true,
            ]);

        $response->assertStatus(200)
            ->assertJson([
                'name' => 'Nihongo',
                'is_active' => true,
            ]);

        $this->assertDatabaseHas('languages', [
            'id' => $languageId,
            'name' => 'Nihongo',
        ]);

        // 4. Delete
        $response = $this->actingAs($this->admin)
            ->deleteJson("/api/admin/languages/{$languageId}");

        $response->assertStatus(200)
            ->assertJson(['message' => 'Deleted']);

        $this->assertDatabaseMissing('languages', ['id' => $languageId]);
    }
}
