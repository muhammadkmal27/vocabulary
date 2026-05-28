<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Level;
use App\Models\QuizSession;
use Illuminate\Http\Request;
class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user('sanctum');
        $languageId = $request->language_id;

        $totalSessions = 0;
        $completedSessions = 0;
        $totalCorrect = 0;
        $totalQuestions = 0;
        $accuracy = 0;

        $hasActiveSubscription = false;
        if ($user) {
            $totalSessions = QuizSession::where('user_id', $user->id)->where('language_id', $languageId)->count();
            $completedSessions = QuizSession::where('user_id', $user->id)->where('language_id', $languageId)->where('status', 'completed')->count();
            $totalCorrect = QuizSession::where('user_id', $user->id)->where('language_id', $languageId)->sum('correct_count');
            $totalQuestions = QuizSession::where('user_id', $user->id)->where('language_id', $languageId)->sum('total_questions');
            $accuracy = $totalQuestions > 0 ? round(($totalCorrect / $totalQuestions) * 100) : 0;

            $hasActiveSubscription = $user->subscriptions()
                ->where('stripe_status', 'active')
                ->where(function ($q) { $q->whereNull('ends_at')->orWhere('ends_at', '>', now()); })
                ->exists();
            if (!$hasActiveSubscription) {
                $hasActiveSubscription = \App\Models\CouponRedemption::where('user_id', $user->id)
                    ->whereHas('coupon', fn($q) => $q->where('is_active', true))
                    ->exists();
            }
        }

        $levels = Level::where('language_id', $languageId)->orderBy('order')->get();
        
        $mappedLevels = [];
        $previousCompleted = true; // First level is always unlocked
        
        foreach ($levels as $index => $level) {
            $progress = 0;
            if ($user) {
                // Find the highest percentage completed session
                $bestSession = QuizSession::where('user_id', $user->id)
                    ->where('level_id', $level->id)
                    ->where('status', 'completed')
                    ->orderByRaw('CASE WHEN total_questions > 0 THEN (correct_count::float / total_questions) ELSE 0 END DESC')
                    ->first();
                    
                if (!$bestSession) {
                    // Fallback to the latest session (could be in_progress)
                    $bestSession = QuizSession::where('user_id', $user->id)
                        ->where('level_id', $level->id)
                        ->latest()
                        ->first();
                }
                
                if ($bestSession) {
                    $progress = round(($bestSession->correct_count / max($bestSession->total_questions, 1)) * 100);
                }
            }
            
            if ($user && $hasActiveSubscription) {
                $unlocked = true;
            } else {
                $unlocked = ($index === 0); // Lock level 2+ for guest/unsubscribed
            }
            
            $mappedLevels[] = [
                'id' => $level->id,
                'name' => $level->name,
                'order' => $level->order,
                'progress' => $progress,
                'unlocked' => $unlocked,
            ];
            
            $previousCompleted = ((int)$progress === 100);
        }

        return response()->json([
            'streak' => $user ? 7 : 0,
            'total_levels_completed' => $completedSessions,
            'total_sentences_memorized' => $totalCorrect,
            'accuracy' => $accuracy,
            'levels' => $mappedLevels,
            'is_premium' => $hasActiveSubscription,
        ]);
    }
}
