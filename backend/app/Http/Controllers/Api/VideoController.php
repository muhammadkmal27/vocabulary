<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\YoutubeVideo;
use App\Models\UserVideoProgress;
use App\Models\CouponRedemption;
use Illuminate\Http\Request;

class VideoController extends Controller
{
    public function index(Request $request)
    {
        $user = auth('sanctum')->user();

        // Check if user is premium
        $hasActiveSubscription = false;
        $progressMap = [];

        if ($user) {
            $hasActiveSubscription = $user->subscriptions()
                ->where('stripe_status', 'active')
                ->where(function ($q) { $q->whereNull('ends_at')->orWhere('ends_at', '>', now()); })
                ->exists();

            if (!$hasActiveSubscription) {
                $hasActiveSubscription = CouponRedemption::where('user_id', $user->id)
                    ->whereHas('coupon', fn($q) => $q->where('is_active', true))
                    ->exists();
            }

            // Fetch all progress records for current user
            $progressRecords = UserVideoProgress::where('user_id', $user->id)->get();
            foreach ($progressRecords as $p) {
                $percent = 0;
                if ($p->is_completed) {
                    $percent = 100;
                } elseif ($p->duration_seconds > 0) {
                    $percent = (int) round(($p->last_watched_seconds / $p->duration_seconds) * 100);
                    $percent = min(max($percent, 0), 100);
                }

                $progressMap[$p->video_id] = [
                    'is_completed'          => (bool) $p->is_completed,
                    'last_watched_seconds' => (float) $p->last_watched_seconds,
                    'duration_seconds'     => (float) $p->duration_seconds,
                    'progress_percent'     => $percent,
                    'last_watched_at'      => $p->last_watched_at ? $p->last_watched_at->toISOString() : null,
                ];
            }
        }

        $videos = YoutubeVideo::where('is_active', true)
            ->orderBy('order')
            ->get();

        // Map premium status and user progress
        $videos = $videos->map(function ($video) use ($hasActiveSubscription, $progressMap) {
            $video->is_locked = $video->is_premium && !$hasActiveSubscription && !$video->is_free;
            $video->user_progress = $progressMap[$video->id] ?? [
                'is_completed'          => false,
                'last_watched_seconds' => 0,
                'duration_seconds'     => 0,
                'progress_percent'     => 0,
                'last_watched_at'      => null,
            ];
            return $video;
        });

        return response()->json($videos);
    }

    public function show(Request $request, string $id)
    {
        $user = auth('sanctum')->user();
        $video = YoutubeVideo::with('subtitles')->findOrFail($id);

        // Check subscription for premium videos
        if ($video->is_premium && !$video->is_free) {
            if (!$user) {
                return response()->json([
                    'message' => 'Sila log masuk untuk menonton video premium.'
                ], 401);
            }

            $hasActiveSubscription = $user->subscriptions()
                ->where('stripe_status', 'active')
                ->where(function ($q) { $q->whereNull('ends_at')->orWhere('ends_at', '>', now()); })
                ->exists();

            if (!$hasActiveSubscription) {
                $hasActiveSubscription = CouponRedemption::where('user_id', $user->id)
                    ->whereHas('coupon', fn($q) => $q->where('is_active', true))
                    ->exists();
            }

            if (!$hasActiveSubscription) {
                return response()->json([
                    'message' => 'Akses terhad kepada video percuma sahaja. Sila langgan untuk membuka video premium ini.'
                ], 403);
            }
        }

        // Attach user progress if logged in
        if ($user) {
            $progress = UserVideoProgress::where('user_id', $user->id)
                ->where('video_id', $video->id)
                ->first();

            $percent = 0;
            if ($progress) {
                if ($progress->is_completed) {
                    $percent = 100;
                } elseif ($progress->duration_seconds > 0) {
                    $percent = (int) round(($progress->last_watched_seconds / $progress->duration_seconds) * 100);
                    $percent = min(max($percent, 0), 100);
                }
            }

            $video->user_progress = [
                'is_completed'          => $progress ? (bool) $progress->is_completed : false,
                'last_watched_seconds' => $progress ? (float) $progress->last_watched_seconds : 0,
                'duration_seconds'     => $progress ? (float) $progress->duration_seconds : 0,
                'progress_percent'     => $percent,
                'last_watched_at'      => $progress && $progress->last_watched_at ? $progress->last_watched_at->toISOString() : null,
            ];
        } else {
            $video->user_progress = [
                'is_completed'          => false,
                'last_watched_seconds' => 0,
                'duration_seconds'     => 0,
                'progress_percent'     => 0,
                'last_watched_at'      => null,
            ];
        }

        return response()->json($video);
    }

    public function updateProgress(Request $request, string $id)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Unauthenticated.'], 401);
        }

        $video = YoutubeVideo::findOrFail($id);

        $validated = $request->validate([
            'last_watched_seconds' => 'required|numeric|min:0',
            'duration_seconds'     => 'nullable|numeric|min:0',
        ]);

        $lastWatched = (float) $validated['last_watched_seconds'];
        $duration    = isset($validated['duration_seconds']) ? (float) $validated['duration_seconds'] : 0;

        $progress = UserVideoProgress::firstOrNew([
            'user_id'  => $user->id,
            'video_id' => $video->id,
        ]);

        // Auto-complete if >= 85% watched
        $isCompleted = $progress->is_completed;
        if (!$isCompleted && $duration > 0 && ($lastWatched / $duration) >= 0.85) {
            $isCompleted = true;
        }

        $progress->last_watched_seconds = $lastWatched;
        if ($duration > 0) {
            $progress->duration_seconds = $duration;
        }
        $progress->is_completed = $isCompleted;
        $progress->last_watched_at = now();
        $progress->save();

        $percent = 0;
        if ($progress->is_completed) {
            $percent = 100;
        } elseif ($progress->duration_seconds > 0) {
            $percent = (int) round(($progress->last_watched_seconds / $progress->duration_seconds) * 100);
            $percent = min(max($percent, 0), 100);
        }

        return response()->json([
            'message'              => 'Progress updated successfully.',
            'is_completed'         => (bool) $progress->is_completed,
            'last_watched_seconds' => (float) $progress->last_watched_seconds,
            'duration_seconds'     => (float) $progress->duration_seconds,
            'progress_percent'     => $percent,
        ]);
    }

    public function toggleComplete(Request $request, string $id)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Unauthenticated.'], 401);
        }

        $video = YoutubeVideo::findOrFail($id);

        $progress = UserVideoProgress::firstOrNew([
            'user_id'  => $user->id,
            'video_id' => $video->id,
        ]);

        $progress->is_completed = !$progress->is_completed;
        if ($progress->is_completed && $progress->last_watched_seconds == 0 && $progress->duration_seconds > 0) {
            $progress->last_watched_seconds = $progress->duration_seconds;
        }
        $progress->last_watched_at = now();
        $progress->save();

        $percent = $progress->is_completed ? 100 : 0;

        return response()->json([
            'message'              => $progress->is_completed ? 'Video ditandakan sebagai selesai.' : 'Video ditandakan sebagai belum selesai.',
            'is_completed'         => (bool) $progress->is_completed,
            'last_watched_seconds' => (float) $progress->last_watched_seconds,
            'duration_seconds'     => (float) $progress->duration_seconds,
            'progress_percent'     => $percent,
        ]);
    }
}
