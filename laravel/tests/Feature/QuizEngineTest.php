<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Language;
use App\Models\Level;
use App\Models\Sentence;
use App\Models\QuizSession;
use App\Models\QuizAnswer;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class QuizEngineTest extends TestCase
{
    use RefreshDatabase;

    private User $user;
    private Language $language;
    private Level $level;
    private Sentence $sentence;

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

        $this->level = Level::create([
            'language_id' => $this->language->id,
            'order' => 1,
            'name' => 'Beginner',
        ]);

        $this->sentence = Sentence::create([
            'level_id' => $this->level->id,
            'source_text' => 'Kucing',
            'target_text' => 'Cat',
            'tags' => ['animals'],
            'difficulty' => 1,
            'order' => 1,
        ]);
    }

    public function test_user_can_start_quiz_session()
    {
        $response = $this->actingAs($this->user)
            ->postJson('/api/quiz/start', [
                'language_id' => $this->language->id,
                'level_id' => $this->level->id,
            ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'id',
                'user_id',
                'language_id',
                'level_id',
                'status',
                'total_questions',
                'correct_count',
                'answers' => [
                    '*' => [
                        'id',
                        'session_id',
                        'sentence_id',
                        'sentence' => [
                            'id',
                            'source_text',
                            'target_text',
                        ]
                    ]
                ]
            ]);

        $this->assertDatabaseHas('quiz_sessions', [
            'user_id' => $this->user->id,
            'level_id' => $this->level->id,
            'status' => 'in_progress',
        ]);
    }

    public function test_user_can_submit_answer()
    {
        // Start a session first
        $session = QuizSession::create([
            'user_id' => $this->user->id,
            'language_id' => $this->language->id,
            'level_id' => $this->level->id,
            'status' => 'in_progress',
            'total_questions' => 1,
            'correct_count' => 0,
            'started_at' => now(),
        ]);

        $answer = QuizAnswer::create([
            'session_id' => $session->id,
            'sentence_id' => $this->sentence->id,
            'answered_at' => now(),
        ]);

        // Submit correct answer
        $response = $this->actingAs($this->user)
            ->postJson("/api/quiz/{$session->id}/answer", [
                'answer_id' => $answer->id,
                'user_answer' => 'Cat',
            ]);

        $response->assertStatus(200)
            ->assertJson([
                'id' => $answer->id,
                'is_correct' => true,
                'user_answer' => 'Cat',
            ]);

        $this->assertEquals(1, $session->fresh()->correct_count);
    }

    public function test_user_can_reveal_answer()
    {
        $session = QuizSession::create([
            'user_id' => $this->user->id,
            'language_id' => $this->language->id,
            'level_id' => $this->level->id,
            'status' => 'in_progress',
            'total_questions' => 1,
            'correct_count' => 0,
            'started_at' => now(),
        ]);

        $answer = QuizAnswer::create([
            'session_id' => $session->id,
            'sentence_id' => $this->sentence->id,
            'answered_at' => now(),
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/quiz/{$session->id}/reveal/{$answer->id}");

        $response->assertStatus(200)
            ->assertJson([
                'id' => $answer->id,
                'revealed' => true,
            ]);
    }

    public function test_user_can_complete_quiz_session()
    {
        $session = QuizSession::create([
            'user_id' => $this->user->id,
            'language_id' => $this->language->id,
            'level_id' => $this->level->id,
            'status' => 'in_progress',
            'total_questions' => 1,
            'correct_count' => 1,
            'started_at' => now(),
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/quiz/{$session->id}/complete");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'session' => [
                    'id',
                    'status',
                    'completed_at',
                ],
                'score',
                'percentage',
                'next_level_unlocked',
            ]);

        $this->assertEquals('completed', $session->fresh()->status);
    }

    public function test_user_can_get_unmemorized_sentences()
    {
        $session = QuizSession::create([
            'user_id' => $this->user->id,
            'language_id' => $this->language->id,
            'level_id' => $this->level->id,
            'status' => 'completed',
            'total_questions' => 1,
            'correct_count' => 0,
            'started_at' => now(),
        ]);

        $answer = QuizAnswer::create([
            'session_id' => $session->id,
            'sentence_id' => $this->sentence->id,
            'user_answer' => 'Wrong',
            'is_correct' => false,
            'answered_at' => now(),
        ]);

        $response = $this->actingAs($this->user)
            ->getJson("/api/review/{$this->language->id}/{$this->level->id}");

        $response->assertStatus(200)
            ->assertJsonFragment([
                'id' => $this->sentence->id,
                'source_text' => 'Kucing',
                'target_text' => 'Cat',
            ]);
    }

    public function test_user_answer_punctuation_tolerance()
    {
        $session = QuizSession::create([
            'user_id' => $this->user->id,
            'language_id' => $this->language->id,
            'level_id' => $this->level->id,
            'status' => 'in_progress',
            'total_questions' => 1,
            'correct_count' => 0,
            'started_at' => now(),
        ]);

        $sentence = Sentence::create([
            'level_id' => $this->level->id,
            'source_text' => 'Dah pukul 11:30 malam sekarang.',
            'target_text' => 'It is already 11:30 PM.',
            'tags' => ['time'],
            'difficulty' => 1,
            'order' => 2,
        ]);

        $answer = QuizAnswer::create([
            'session_id' => $session->id,
            'sentence_id' => $sentence->id,
            'answered_at' => now(),
        ]);

        $response = $this->actingAs($this->user)
            ->postJson("/api/quiz/{$session->id}/answer", [
                'answer_id' => $answer->id,
                'user_answer' => '  it is already 11:30 pm  ',
            ]);

        $response->assertStatus(200)
            ->assertJson([
                'id' => $answer->id,
                'is_correct' => true,
            ]);

        $this->assertEquals(1, $session->fresh()->correct_count);
    }

    public function test_unsubscribed_user_cannot_start_level_2()
    {
        $level2 = Level::create([
            'language_id' => $this->language->id,
            'order' => 2,
            'name' => 'Intermediate',
        ]);

        $response = $this->actingAs($this->user)
            ->postJson('/api/quiz/start', [
                'language_id' => $this->language->id,
                'level_id' => $level2->id,
            ]);

        $response->assertStatus(403)
            ->assertJsonFragment([
                'message' => 'Akses terhad kepada Level 1 sahaja. Sila langgan untuk membuka level ini.',
            ]);
    }

    public function test_unsubscribed_user_can_start_level_1()
    {
        $response = $this->actingAs($this->user)
            ->postJson('/api/quiz/start', [
                'language_id' => $this->language->id,
                'level_id' => $this->level->id,
            ]);

        $response->assertStatus(200);
    }

    public function test_guest_can_fetch_level_1_sentences()
    {
        $response = $this->getJson("/api/public/levels/{$this->level->id}/sentences");

        $response->assertStatus(200)
            ->assertJsonFragment([
                'id' => $this->sentence->id,
            ]);
    }

    public function test_guest_cannot_fetch_level_2_sentences()
    {
        $level2 = Level::create([
            'language_id' => $this->language->id,
            'order' => 2,
            'name' => 'Intermediate',
        ]);

        $response = $this->getJson("/api/public/levels/{$level2->id}/sentences");

        $response->assertStatus(403);
    }
}
