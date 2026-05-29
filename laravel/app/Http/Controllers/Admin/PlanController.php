<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\SubscriptionPlan;
use Illuminate\Http\Request;
class PlanController extends Controller
{
    public function index()
    {
        return SubscriptionPlan::all();
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|max:100',
            'slug' => 'required|max:50|unique:subscription_plans',
            'price_myr' => 'required|numeric|min:0',
            'stripe_price_id' => 'nullable|string',
            'is_active' => 'boolean',
            'member_limit' => 'nullable|integer|min:1',
        ]);

        $plan = SubscriptionPlan::create($validated);
        \Illuminate\Support\Facades\Cache::forget('subscription_plans_active');
        return $plan;
    }

    public function show(SubscriptionPlan $plan)
    {
        return $plan;
    }

    public function update(Request $request, SubscriptionPlan $plan)
    {
        $validated = $request->validate([
            'name' => 'sometimes|max:100',
            'price_myr' => 'sometimes|numeric|min:0',
            'stripe_price_id' => 'nullable|string',
            'is_active' => 'boolean',
            'member_limit' => 'nullable|integer|min:1',
        ]);

        $plan->update($validated);
        \Illuminate\Support\Facades\Cache::forget('subscription_plans_active');
        return $plan;
    }

    public function destroy(SubscriptionPlan $plan)
    {
        $plan->delete();
        \Illuminate\Support\Facades\Cache::forget('subscription_plans_active');
        return response()->json(['message' => 'Deleted']);
    }
}
