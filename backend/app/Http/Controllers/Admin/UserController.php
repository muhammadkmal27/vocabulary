<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
class UserController extends Controller
{
    public function index(Request $request)
    {
        $perPage = min(max((int) $request->input('per_page', 50), 5), 100);
        $search = $request->input('search');

        $query = User::withCount('subscriptions', 'quizSessions')->latest();

        if ($search) {
            $searchLower = strtolower($search);
            $query->where(function ($q) use ($searchLower) {
                $q->whereRaw('LOWER(name) LIKE ?', ["%{$searchLower}%"])
                  ->orWhereRaw('LOWER(email) LIKE ?', ["%{$searchLower}%"]);
            });
        }

        return $query->paginate($perPage);
    }
    public function show(User $user) { return $user->load('subscriptions'); }
    public function update(Request $request, User $user) { $user->update($request->validate(['name'=>'sometimes|max:255','role'=>'sometimes|in:user,admin'])); return $user; }
}
