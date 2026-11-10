<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\SiteVisitor;
use Illuminate\Http\Request;

class VisitorTrackingController extends Controller
{
    /**
     * Handle incoming visitor activity heartbeat/ping.
     */
    public function ping(Request $request)
    {
        $validated = $request->validate([
            'visitor_id' => 'required|string|max:64|regex:/^[a-zA-Z0-9_\-]+$/',
            'path'       => 'nullable|string|max:255',
        ]);

        $visitorId = $validated['visitor_id'];
        $path = $validated['path'] ?? '/';
        $user = auth('sanctum')->user();
        $ip = $request->ip();
        $userAgent = substr($request->userAgent() ?? '', 0, 500);

        $visitor = SiteVisitor::where('visitor_id', $visitorId)->first();

        if ($visitor) {
            // New session if returning after 30 minutes of inactivity
            $isNewSession = $visitor->last_seen_at && $visitor->last_seen_at->lt(now()->subMinutes(30));

            $visitor->update([
                'user_id'      => $user?->id ?? $visitor->user_id,
                'ip_address'   => $ip,
                'user_agent'   => $userAgent,
                'last_page'    => $path,
                'visits_count' => $isNewSession ? $visitor->visits_count + 1 : $visitor->visits_count,
                'last_seen_at' => now(),
            ]);
        } else {
            SiteVisitor::create([
                'visitor_id'   => $visitorId,
                'user_id'      => $user?->id,
                'ip_address'   => $ip,
                'user_agent'   => $userAgent,
                'last_page'    => $path,
                'visits_count' => 1,
                'last_seen_at' => now(),
            ]);
        }

        return response()->json([
            'status' => 'ok',
        ]);
    }
}

