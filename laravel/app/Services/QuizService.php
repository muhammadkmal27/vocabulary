<?php
namespace App\Services;
use App\Models\QuizAnswer;
use App\Models\QuizSession;
use App\Models\Sentence;
use Carbon\Carbon;
class QuizService
{
    private function resolveLevelId(string $languageId, string $levelId): string
    {
        if (!preg_match('/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i', $levelId)) {
            $level = \App\Models\Level::where('language_id', $languageId)
                ->where('order', (int)$levelId)
                ->first();
            if ($level) {
                return $level->id;
            }
        }
        return $levelId;
    }

    public function startSession(string $userId, string $languageId, string $levelId): QuizSession
    {
        $levelId = $this->resolveLevelId($languageId, $levelId);
        
        $sentences = Sentence::whereHas('level', fn($q) => $q->where('language_id', $languageId)->where('id', $levelId))
            ->inRandomOrder()->limit(20)->get();

        $session = QuizSession::create([
            'user_id' => $userId,
            'language_id' => $languageId,
            'level_id' => $levelId,
            'status' => 'in_progress',
            'total_questions' => min($sentences->count(), 20),
            'correct_count' => 0,
            'started_at' => now(),
        ]);

        foreach ($sentences->take(20) as $i => $sentence) {
            QuizAnswer::create([
                'session_id' => $session->id,
                'sentence_id' => $sentence->id,
                'answered_at' => now(),
            ]);
        }

        return $session->fresh()->load('answers.sentence');
    }

    private function cleanPunctuation(string $text): string
    {
        $cleaned = preg_replace('/[.,!?\'’‘]/u', '', $text);
        $cleaned = preg_replace('/\s+/', ' ', $cleaned);
        return trim(strtolower($cleaned));
    }

    public function submitAnswer(string $sessionId, string $answerId, string $userAnswer): QuizAnswer
    {
        $answer = QuizAnswer::with('sentence')->findOrFail($answerId);
        $normalizedUser = $this->cleanPunctuation($userAnswer);
        $normalizedCorrect = $this->cleanPunctuation($answer->sentence->target_text);
        $isCorrect = $normalizedUser === $normalizedCorrect;

        $answer->update([
            'user_answer' => $userAnswer,
            'is_correct' => $isCorrect,
        ]);

        if ($isCorrect) {
            QuizSession::where('id', $sessionId)->increment('correct_count');
        }

        return $answer->fresh();
    }

    public function revealAnswer(string $answerId): QuizAnswer
    {
        $answer = QuizAnswer::with('sentence')->findOrFail($answerId);
        $answer->update(['revealed' => true]);
        return $answer->fresh();
    }

    public function completeSession(string $sessionId): array
    {
        $session = QuizSession::with(['answers.sentence', 'level'])->findOrFail($sessionId);
        $session->update(['status' => 'completed', 'completed_at' => now()]);

        // Check if this level was completed for the first time → unlock next level
        $nextLevel = \App\Models\Level::where('language_id', $session->language_id)
            ->where('order', $session->level->order + 1)
            ->first();

        return [
            'session' => $session,
            'score' => $session->correct_count . '/' . $session->total_questions,
            'percentage' => $session->total_questions > 0 ? round(($session->correct_count / $session->total_questions) * 100) : 0,
            'next_level_unlocked' => (bool) $nextLevel,
            'next_level_id' => $nextLevel ? $nextLevel->id : null,
        ];
    }

    public function getUnmemorizedSentences(string $userId, string $languageId, string $levelId)
    {
        $levelId = $this->resolveLevelId($languageId, $levelId);

        // Get distinct sentence IDs that the user answered incorrectly
        $incorrectSentenceIds = QuizAnswer::whereHas('session', fn($q) => $q->where('user_id', $userId)->where('level_id', $levelId))
            ->where('is_correct', false)
            ->distinct()
            ->pluck('sentence_id')
            ->toArray();

        return \App\Models\Sentence::whereIn('id', $incorrectSentenceIds)->get();
    }
}
