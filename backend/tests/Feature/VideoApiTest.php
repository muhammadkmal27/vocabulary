<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class VideoApiTest extends TestCase
{
    use RefreshDatabase;

    private User $user;
    private Language $language;
    private YoutubeVideo $freeVideo;
    private YoutubeVideo $premiumVideo;

    protected function setUp(): void
    {
        parent::setUp();

        $this->user = User::factory()->create();

        $this->language = Language::create([
            'code' => 'en',
            'name' => 'English',
            'flag' => '🇬🇧',
            'is_active' => true,
        ]);

        $this->freeVideo = YoutubeVideo::create([
            'language_id' => $this->language->id,
            'title' => 'Free Video',
            'youtube_video_id' => 'free_id_123',
            'is_premium' => false,
            'is_free' => true,
            'is_active' => true,
            'order' => 1,
        ]);

        $this->premiumVideo = YoutubeVideo::create([
            'language_id' => $this->language->id,
            'title' => 'Premium Video',
            'youtube_video_id' => 'premium_id_123',
            'is_premium' => true,
            'is_free' => false,
            'is_active' => true,
            'order' => 2,
        ]);

        VideoSubtitle::create([
            'video_id' => $this->freeVideo->id,
            'start_time' => 1.00,
            'end_time' => 3.00,
            'target_text' => 'Hello',
            'source_text' => 'Halo',
            'order' => 1,
        ]);
    }

    public function test_authenticated_user_can_list_videos()
    {
        $response = $this->actingAs($this->user)
            ->getJson('/api/videos');

        $response->assertStatus(200)
            ->assertJsonCount(2)
            ->assertJsonFragment(['youtube_video_id' => 'free_id_123'])
            ->assertJsonFragment(['youtube_video_id' => 'premium_id_123']);
    }

    public function test_unsubscribed_user_can_access_free_video()
    {
        $response = $this->actingAs($this->user)
            ->getJson("/api/videos/{$this->freeVideo->id}");

        $response->assertStatus(200)
            ->assertJsonPath('title', 'Free Video')
            ->assertJsonFragment(['target_text' => 'Hello']);
    }

    public function test_unsubscribed_user_cannot_access_premium_video()
    {
        $response = $this->actingAs($this->user)
            ->getJson("/api/videos/{$this->premiumVideo->id}");

        $response->assertStatus(403);
    }

    public function test_admin_user_can_create_video()
    {
        $admin = User::factory()->create(['role' => 'admin']);
        $response = $this->actingAs($admin)
            ->postJson('/api/admin/videos', [
                'language_id' => $this->language->id,
                'title' => 'Admin Video',
                'youtube_video_id' => 'admin_id_123',
                'category' => 'Advanced',
                'is_premium' => true,
                'is_free' => false,
                'is_active' => true,
                'order' => 3,
            ]);

        $response->assertStatus(201)
            ->assertJsonPath('title', 'Admin Video');
    }

    public function test_non_admin_user_cannot_create_video()
    {
        $response = $this->actingAs($this->user)
            ->postJson('/api/admin/videos', [
                'language_id' => $this->language->id,
                'title' => 'Fake Video',
                'youtube_video_id' => 'fake_id_123',
            ]);

        $response->assertStatus(403);
    }

    public function test_admin_can_update_subtitles()
    {
        $admin = User::factory()->create(['role' => 'admin']);
        $sub = VideoSubtitle::create([
            'video_id' => $this->freeVideo->id,
            'start_time' => 1.00,
            'end_time' => 3.00,
            'target_text' => 'Hello',
            'source_text' => 'Halo',
            'order' => 1,
        ]);

        $response = $this->actingAs($admin)
            ->putJson("/api/admin/videos/{$this->freeVideo->id}/subtitles", [
                'subtitles' => [
                    [
                        'id' => $sub->id,
                        'target_text' => 'Hello World',
                        'source_text' => 'Halo Dunia',
                        'start_time' => 2.00,
                        'end_time' => 4.00,
                    ]
                ]
            ]);

        $response->assertStatus(200);
        $this->assertDatabaseHas('video_subtitles', [
            'id' => $sub->id,
            'target_text' => 'Hello World',
            'source_text' => 'Halo Dunia',
        ]);
    }
}
