<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
class CouponController extends Controller
{
    public function index() { return Coupon::all(); }
    public function store(Request $request) { return Coupon::create($request->validate(['code'=>'required|max:50|unique:coupons','description'=>'nullable','discount_percent'=>'required|integer|min:0|max:100','duration_days'=>'required|integer','max_uses'=>'nullable|integer|min:1','is_active'=>'boolean','expires_at'=>'nullable|date'])); }
    public function generate(Request $request) { $request->validate(['count'=>'sometimes|integer|min:1|max:100','discount_percent'=>'required|integer|min:0|max:100','duration_days'=>'required|integer','max_uses'=>'nullable|integer|min:1']); $created = []; for($i=0;$i<($request->count??1);$i++) { $created[] = Coupon::create(['code'=>strtoupper(Str::random(8)),'discount_percent'=>$request->discount_percent,'duration_days'=>$request->duration_days,'max_uses'=>$request->max_uses]); } return response()->json(['created'=>count($created),'coupons'=>$created]); }
    public function show(Coupon $coupon) { return $coupon; }
    public function update(Request $request, Coupon $coupon) { $coupon->update($request->validate(['code'=>'sometimes|max:50|unique:coupons,code,'.$coupon->id,'description'=>'nullable','discount_percent'=>'sometimes|integer|min:0|max:100','duration_days'=>'sometimes|integer','max_uses'=>'nullable|integer|min:1','is_active'=>'boolean','expires_at'=>'nullable|date'])); return $coupon; }
    public function destroy(Coupon $coupon) { $coupon->delete(); return response()->json(['message'=>'Deleted']); }
}
