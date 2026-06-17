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
        $text = str_replace(['’', '‘', 'ʼ', '`', '´', '՚', '＇'], "'", $text);
        $cleaned = preg_replace('/[^\w\s]/u', '', $text);
        $cleaned = preg_replace('/\s+/', '', $cleaned);
        return trim(strtolower($cleaned));
    }

    private function generatePermutations(string $text): array
    {
        if (empty($text)) return [''];
        
        $parts = [];
        $lastIndex = 0;
        
        if (preg_match_all('/\[([^\]]+)\]/', $text, $matches, PREG_OFFSET_CAPTURE)) {
            foreach ($matches[0] as $i => $match) {
                $start = $match[1];
                $length = strlen($match[0]);
                
                if ($start > $lastIndex) {
                    $parts[] = [substr($text, $lastIndex, $start - $lastIndex)];
                }
                
                $options = array_map('trim', explode('/', $matches[1][$i][0]));
                $parts[] = $options;
                
                $lastIndex = $start + $length;
            }
        }
        
        if ($lastIndex < strlen($text)) {
            $parts[] = [substr($text, $lastIndex)];
        }
        
        if (empty($parts)) return [$text];
        
        $results = [''];
        foreach ($parts as $partOptions) {
            $newResults = [];
            foreach ($results as $res) {
                foreach ($partOptions as $opt) {
                    $newResults[] = $res . $opt;
                }
            }
            $results = $newResults;
        }
        
        return $results;
    }

    public function submitAnswer(string $userId, string $sessionId, string $answerId, string $userAnswer): QuizAnswer
    {
        $answer = QuizAnswer::where('id', $answerId)
            ->where('session_id', $sessionId)
            ->whereHas('session', fn($q) => $q->where('user_id', $userId))
            ->with('sentence')
            ->firstOrFail();
        
        $quizEngineUrl = config('services.quiz_engine.url', 'http://127.0.0.1:8080');

        try {
            $response = \Illuminate\Support\Facades\Http::timeout(3)->post($quizEngineUrl . '/check-answer', [
                'user_answer' => $userAnswer,
                'correct_answer' => $answer->sentence->target_text,
            ]);

            $isCorrect = $response->successful() && $response->json('is_correct') === true;
        } catch (\Exception $e) {
            // Fallback sekiranya Rust service terputus/down (Fail-safe R7)
            \Illuminate\Support\Facades\Log::warning("Quiz Engine Connection Failed: falling back to PHP normalizer", [
                'error' => $e->getMessage()
            ]);
            $normalizedUser = $this->cleanPunctuation($userAnswer);
            $permutations = $this->generatePermutations($answer->sentence->target_text);
            $isCorrect = false;
            foreach ($permutations as $perm) {
                if ($normalizedUser === $this->cleanPunctuation($perm)) {
                    $isCorrect = true;
                    break;
                }
            }
        }

        $answer->update([
            'user_answer' => $userAnswer,
            'is_correct' => $isCorrect,
        ]);

        $correctCount = QuizAnswer::where('session_id', $sessionId)->where('is_correct', true)->count();
        QuizSession::where('id', $sessionId)->update(['correct_count' => $correctCount]);

        return $answer->fresh();
    }

    public function revealAnswer(string $userId, string $answerId): QuizAnswer
    {
        $answer = QuizAnswer::where('id', $answerId)
            ->whereHas('session', fn($q) => $q->where('user_id', $userId))
            ->with('sentence')
            ->firstOrFail();

        $answer->update([
            'revealed' => true,
            'is_correct' => false,
        ]);

        $correctCount = QuizAnswer::where('session_id', $answer->session_id)->where('is_correct', true)->count();
        QuizSession::where('id', $answer->session_id)->update(['correct_count' => $correctCount]);

        return $answer->fresh();
    }

    public function completeSession(string $userId, string $sessionId): array
    {
        $session = QuizSession::where('id', $sessionId)
            ->where('user_id', $userId)
            ->with(['answers.sentence', 'level'])
            ->firstOrFail();

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

    public function resetSession(string $userId, string $sessionId): QuizSession
    {
        $session = QuizSession::where('id', $sessionId)
            ->where('user_id', $userId)
            ->firstOrFail();

        $session->update([
            'status' => 'in_progress',
            'correct_count' => 0,
            'completed_at' => null,
        ]);

        QuizAnswer::where('session_id', $sessionId)->update([
            'user_answer' => null,
            'is_correct' => false,
            'revealed' => false,
        ]);

        return $session->fresh()->load('answers.sentence');
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
