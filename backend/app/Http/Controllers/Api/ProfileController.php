<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Language;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
class ProfileController extends Controller
{
    public function show(Request $request) { return $request->user(); }
    public function update(Request $request) { $request->user()->update($request->validate(['name'=>'sometimes|max:255','email'=>'sometimes|email|unique:users,email,'.$request->user()->id])); return $request->user(); }
    public function updatePassword(Request $request)
    {
        $user = $request->user();
        $hasPassword = !empty($user->password);

        $rules = [
            'new_password' => 'required|min:8|confirmed'
        ];

        if ($hasPassword) {
            $rules['current_password'] = 'required';
        }

        $request->validate($rules);

        if ($hasPassword && !Hash::check($request->current_password, $user->password)) {
            return response()->json(['message' => 'Kata laluan semasa salah.'], 422);
        }

        $user->update([
            'password' => Hash::make($request->new_password)
        ]);

        return response()->json(['message' => 'Kata laluan berjaya dikemaskini.']);
    }
}
