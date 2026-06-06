<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\Level;
use App\Models\Sentence;
use App\Models\Subscription;
use App\Models\User;
use Illuminate\Http\Request;
class DashboardController extends Controller
{
    public function index()
    {
        $monthlyRevenue = \App\Models\Transaction::where('status', 'paid')
            ->whereMonth('paid_at', now()->month)
            ->whereYear('paid_at', now()->year)
            ->sum('amount');

        $activeStripe = Subscription::where('stripe_status', 'active')
            ->where('payment_gateway', 'stripe')
            ->count();

        $activeToyyibpay = Subscription::where('stripe_status', 'active')
            ->where('payment_gateway', 'toyyibpay')
            ->count();

        return response()->json([
            'total_users' => User::count(),
            'active_subscriptions' => Subscription::where('stripe_status', 'active')->count(),
            'total_languages' => Language::count(),
            'total_levels' => Level::count(),
            'total_sentences' => Sentence::count(),
            'recent_users' => User::latest()->take(5)->get(),
            'monthly_revenue' => (float) $monthlyRevenue,
            'active_stripe_count' => $activeStripe,
            'active_toyyibpay_count' => $activeToyyibpay,
        ]);
    }
}
