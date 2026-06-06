<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Level;
use Illuminate\Http\Request;
class LevelController extends Controller
{
    public function index($langId) { return Level::where('language_id', $langId)->orderBy('order')->get(); }
    public function store(Request $request, $langId) { $data = $request->validate(['name'=>'required|max:100','order'=>'required|integer']); $data['language_id'] = $langId; return Level::create($data); }
    public function show(Level $level) { return $level->load('sentences'); }
    public function update(Request $request, Level $level) { $level->update($request->validate(['name'=>'sometimes|max:100','order'=>'sometimes|integer'])); return $level; }
    public function destroy(Level $level) { $level->delete(); return response()->json(['message'=>'Deleted']); }
}
