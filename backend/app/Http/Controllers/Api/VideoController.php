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

        // Check if user is premium / subscribed
        $isUserPremium = false;
        $progressMap = [];

        if ($user) {
            $isUserPremium = $user->isAdmin() || (bool) $user->subscribed;

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

        $query = YoutubeVideo::where('is_active', true);

        if ($request->query('category') === 'Special') {
            $query->where('category', 'Special');
        } else {
            $query->where(function ($q) {
                $q->whereNull('category')->orWhere('category', '!=', 'Special');
            });
        }

        $videos = $query->orderBy('order')->get();

        // Freemium model: All videos are open to view without card-level lock.
        // First 10 minutes of subtitles are accessible to all; full subtitles unlocked for premium.
        $videos = $videos->map(function ($video) use ($isUserPremium, $progressMap) {
            $video->is_locked = false;
            $video->is_user_premium = $isUserPremium;
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

        $isUserPremium = false;
        if ($user) {
            $isUserPremium = $user->isAdmin() || (bool) $user->subscribed;
        }

        // Freemium access: Video playback and first 10 minutes of subtitles are free for everyone.
        // Subtitles after 10 minutes are gated for premium users on the client side.
        $video->is_locked = false;
        $video->is_user_premium = $isUserPremium;

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

        // Attach next video in sequence
        $isSpecial = ($video->category === 'Special');

        $nextVideoQuery = YoutubeVideo::where('is_active', true)
            ->where('language_id', $video->language_id);

        if ($isSpecial) {
            $nextVideoQuery->where('category', 'Special');
        } else {
            $nextVideoQuery->where(function ($q) {
                $q->whereNull('category')->orWhere('category', '!=', 'Special');
            });
        }

        $nextVideo = (clone $nextVideoQuery)
            ->where('order', '>', $video->order)
            ->orderBy('order', 'asc')
            ->first(['id', 'title']);

        if (!$nextVideo) {
            // Loop back to first video if reached end of list
            $nextVideo = (clone $nextVideoQuery)
                ->where('id', '!=', $video->id)
                ->orderBy('order', 'asc')
                ->first(['id', 'title']);
        }

        $video->setAttribute('next_video_id', $nextVideo ? $nextVideo->id : null);
        $video->setAttribute('next_video_title', $nextVideo ? $nextVideo->title : null);

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
