<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\SiteVisitor;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class VisitorTrackingTest extends TestCase
{
    use RefreshDatabase;

    public function test_visitor_ping_creates_new_visitor(): void
    {
        $response = $this->postJson('/api/track/ping', [
            'visitor_id' => 'v_abc123xyz',
            'path'       => '/special',
        ]);

        $response->assertStatus(200)
            ->assertJson(['status' => 'ok']);

        $this->assertDatabaseHas('site_visitors', [
            'visitor_id'   => 'v_abc123xyz',
            'last_page'    => '/special',
            'visits_count' => 1,
        ]);
    }

    public function test_visitor_ping_updates_existing_visitor(): void
    {
        SiteVisitor::create([
            'visitor_id'   => 'v_existing123',
            'user_id'      => null,
            'ip_address'   => '127.0.0.1',
            'last_page'    => '/',
            'visits_count' => 1,
            'last_seen_at' => now()->subMinutes(10),
        ]);

        $response = $this->postJson('/api/track/ping', [
            'visitor_id' => 'v_existing123',
            'path'       => '/video',
        ]);

        $response->assertStatus(200);

        $this->assertDatabaseHas('site_visitors', [
            'visitor_id'   => 'v_existing123',
            'last_page'    => '/video',
            'visits_count' => 1,
        ]);
    }

    public function test_invalid_visitor_id_fails_validation(): void
    {
        $response = $this->postJson('/api/track/ping', [
            'visitor_id' => '<script>alert(1)</script>',
            'path'       => '/',
        ]);

        $response->assertStatus(422)
            ->assertJsonValidationErrors(['visitor_id']);
    }

    public function test_admin_dashboard_returns_live_and_total_visitor_counts(): void
    {
        $admin = User::factory()->create(['role' => 'admin']);

        // Visitor 1: Active now
        SiteVisitor::create([
            'visitor_id'   => 'v_active_1',
            'user_id'      => null,
            'last_page'    => '/video',
            'visits_count' => 1,
            'last_seen_at' => now()->subMinutes(2),
        ]);

        // Visitor 2: Active now
        SiteVisitor::create([
            'visitor_id'   => 'v_active_2',
            'user_id'      => null,
            'last_page'    => '/special',
            'visits_count' => 1,
            'last_seen_at' => now()->subMinute(),
        ]);

        // Visitor 3: Inactive (seen 15 minutes ago)
        SiteVisitor::create([
            'visitor_id'   => 'v_inactive',
            'user_id'      => null,
            'last_page'    => '/',
            'visits_count' => 1,
            'last_seen_at' => now()->subMinutes(15),
        ]);

        $response = $this->actingAs($admin)
            ->getJson('/api/admin/dashboard');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'live_now',
                'total_visitors',
                'live_visitors',
                'total_users',
            ]);

        $data = $response->json();
        $this->assertEquals(2, $data['live_now']);
        $this->assertGreaterThanOrEqual(3, $data['total_visitors']);
    }
}
