<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
class UserController extends Controller
{
    public function index() { return User::withCount('subscriptions','quizSessions')->latest()->paginate(20); }
    public function show(User $user) { return $user->load('subscriptions'); }
    public function update(Request $request, User $user) { $user->update($request->validate(['name'=>'sometimes|max:255','role'=>'sometimes|in:user,admin'])); return $user; }
}
