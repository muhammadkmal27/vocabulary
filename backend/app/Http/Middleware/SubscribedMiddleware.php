<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SubscribedMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Authentication required.'], 401);
        }

        $hasActiveSubscription = $user->subscriptions()
            ->where('stripe_status', 'active')
            ->where(function ($q) { $q->whereNull('ends_at')->orWhere('ends_at', '>', now()); })
            ->exists();

        $hasCouponAccess = \App\Models\CouponRedemption::where('user_id', $user->id)
            ->whereHas('coupon', fn($q) => $q->where('is_active', true))
            ->exists();

        if (!$hasActiveSubscription && !$hasCouponAccess) {
            return response()->json(['message' => 'Active subscription required.'], 403);
        }

        return $next($request);
    }
}
