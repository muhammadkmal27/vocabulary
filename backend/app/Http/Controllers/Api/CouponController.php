<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\CouponService;
use Illuminate\Http\Request;

class CouponController extends Controller
{
    public function __construct(private CouponService $couponService) {}

    public function validate(Request $request)
    {
        $request->validate(['code' => 'required|string|max:50']);
        $result = $this->couponService->validate($request->code);
        if (!$result['valid']) {
            return response()->json($result, 422);
        }
        return response()->json($result);
    }

    public function redeem(Request $request)
    {
        $request->validate([
            'code' => 'required|string|max:50',
            'cf-turnstile-response' => [app()->environment('testing') ? 'nullable' : 'required', new \App\Rules\Turnstile()],
        ]);
        $result = $this->couponService->redeem($request->user(), $request->code);
        if (!$result['valid']) {
            return response()->json($result, 422);
        }
        return response()->json($result);
    }

    public function myCoupons(Request $request)
    {
        return response()->json($this->couponService->myCoupons($request->user()));
    }
}
