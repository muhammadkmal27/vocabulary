<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Services\QuizService;
use Illuminate\Http\Request;
class QuizController extends Controller
{
    public function __construct(private QuizService $quizService) {}

    public function start(Request $request)
    {
        $request->validate(['language_id' => 'required', 'level_id' => 'required']);
        $user = $request->user();
        $levelId = $request->level_id;

        // Resolve level ID if it's order number
        if (!preg_match('/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i', $levelId)) {
            $level = \App\Models\Level::where('language_id', $request->language_id)
                ->where('order', (int)$levelId)
                ->first();
        } else {
            $level = \App\Models\Level::find($levelId);
        }

        if (!$level) {
            return response()->json(['message' => 'Level not found.'], 404);
        }

        // Check if user is subscribed
        $hasActiveSubscription = $user->subscriptions()
            ->where('stripe_status', 'active')
            ->where(function ($q) { $q->whereNull('ends_at')->orWhere('ends_at', '>', now()); })
            ->exists();
        if (!$hasActiveSubscription) {
            $hasActiveSubscription = \App\Models\CouponRedemption::where('user_id', $user->id)
                ->whereHas('coupon', fn($q) => $q->where('is_active', true))
                ->exists();
        }

        if ($level->order !== 1 && !$hasActiveSubscription) {
            return response()->json(['message' => 'Akses terhad kepada Level 1 sahaja. Sila langgan untuk membuka level ini.'], 403);
        }

        return response()->json($this->quizService->startSession($user->id, $request->language_id, $level->id));
    }

    public function publicSentences(string $levelId)
    {
        $level = \App\Models\Level::findOrFail($levelId);
        if ($level->order !== 1) {
            return response()->json(['message' => 'Akses terhad kepada Level 1 sahaja. Sila daftar/langgan untuk membuka level ini.'], 403);
        }
        $sentences = \App\Models\Sentence::where('level_id', $levelId)->inRandomOrder()->limit(20)->get();
        return response()->json($sentences);
    }

    public function submitAnswer(Request $request, string $sessionId)
    {
        $request->validate(['answer_id' => 'required', 'user_answer' => 'required']);
        $userId = $request->user()->id;
        // OLAC check: session must belong to user
        \App\Models\QuizSession::where('id', $sessionId)->where('user_id', $userId)->firstOrFail();
        return response()->json($this->quizService->submitAnswer($userId, $sessionId, $request->answer_id, $request->user_answer));
    }

    public function reveal(Request $request, string $sessionId, string $answerId)
    {
        $userId = $request->user()->id;
        // OLAC check: session must belong to user
        \App\Models\QuizSession::where('id', $sessionId)->where('user_id', $userId)->firstOrFail();
        return response()->json($this->quizService->revealAnswer($userId, $answerId));
    }

    public function complete(Request $request, string $sessionId)
    {
        $userId = $request->user()->id;
        // OLAC check: session must belong to user
        \App\Models\QuizSession::where('id', $sessionId)->where('user_id', $userId)->firstOrFail();
        return response()->json($this->quizService->completeSession($userId, $sessionId));
    }

    public function reset(Request $request, string $sessionId)
    {
        $userId = $request->user()->id;
        // OLAC check: session must belong to user
        \App\Models\QuizSession::where('id', $sessionId)->where('user_id', $userId)->firstOrFail();
        return response()->json($this->quizService->resetSession($userId, $sessionId));
    }

    public function show(Request $request, string $sessionId)
    {
        return \App\Models\QuizSession::where('id', $sessionId)
            ->where('user_id', $request->user()->id)
            ->with(['answers.sentence', 'level'])
            ->firstOrFail();
    }

    public function review(Request $request, string $languageId, string $levelId)
    {
        return response()->json($this->quizService->getUnmemorizedSentences($request->user()->id, $languageId, $levelId));
    }
}
