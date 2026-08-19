<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\YoutubeVideo;
use Illuminate\Http\Request;
use App\Models\CouponRedemption;

class VideoController extends Controller
{
    public function index(Request $request)
    {
        $user = auth('sanctum')->user();

        // Check if user is premium
        $hasActiveSubscription = false;
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
        }

        $videos = YoutubeVideo::where('is_active', true)
            ->orderBy('order')
            ->get();

        // Map premium status for frontend display
        $videos = $videos->map(function ($video) use ($hasActiveSubscription) {
            $video->is_locked = $video->is_premium && !$hasActiveSubscription && !$video->is_free;
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

        return response()->json($video);
    }
}
