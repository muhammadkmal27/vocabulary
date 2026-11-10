<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\Level;
use App\Models\Sentence;
use App\Models\Subscription;
use App\Models\User;
use App\Models\SiteVisitor;
use App\Models\Transaction;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $monthlyRevenue = Transaction::where('status', 'paid')
            ->whereMonth('paid_at', now()->month)
            ->whereYear('paid_at', now()->year)
            ->sum('amount');

        $activeStripe = Subscription::where('stripe_status', 'active')
            ->where('payment_gateway', 'stripe')
            ->count();

        $activeToyyibpay = Subscription::where('stripe_status', 'active')
            ->where('payment_gateway', 'toyyibpay')
            ->count();

        // 1. Live Now: Pelawat aktif dalam tempoh 5 minit terakhir
        $liveNow = SiteVisitor::where('last_seen_at', '>=', now()->subMinutes(5))->count();

        // 2. Total Visitors: Jumlah pelawat unik keseluruhan
        $totalVisitors = SiteVisitor::count();

        // Senarai ringkas pelawat aktif terkini untuk pemantauan pentadbir
        $liveVisitors = SiteVisitor::with('user:id,name,email')
            ->where('last_seen_at', '>=', now()->subMinutes(5))
            ->orderByDesc('last_seen_at')
            ->take(5)
            ->get()
            ->map(function ($v) {
                return [
                    'id'                    => $v->id,
                    'user_name'             => $v->user?->name ?? 'Pelawat Tetamu',
                    'user_email'            => $v->user?->email,
                    'last_page'             => $v->last_page ?? '/',
                    'last_seen_seconds_ago' => max(0, (int) now()->diffInSeconds($v->last_seen_at)),
                ];
            });

        return response()->json([
            'live_now'               => $liveNow,
            'total_visitors'         => $totalVisitors,
            'live_visitors'          => $liveVisitors,
            'total_users'            => User::count(),
            'active_subscriptions'   => Subscription::where('stripe_status', 'active')->count(),
            'total_languages'        => Language::count(),
            'total_levels'           => Level::count(),
            'total_sentences'        => Sentence::count(),
            'recent_users'           => User::latest()->take(5)->get(),
            'monthly_revenue'        => (float) $monthlyRevenue,
            'active_stripe_count'    => $activeStripe,
            'active_toyyibpay_count' => $activeToyyibpay,
        ]);
    }
}
