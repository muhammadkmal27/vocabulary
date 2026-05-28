<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Language;
use Illuminate\Http\Request;
class LanguageController extends Controller
{
    public function index() { return Language::all(); }
    public function store(Request $request) { return Language::create($request->validate(['code'=>'required|string|max:10|unique:languages','name'=>'required|max:100','flag'=>'nullable|max:10'])); }
    public function show(Language $language) { return $language->load('levels'); }
    public function update(Request $request, Language $language) { $language->update($request->validate(['code'=>'sometimes|string|max:10|unique:languages,code,'.$language->id,'name'=>'sometimes|max:100','flag'=>'nullable|max:10','is_active'=>'boolean'])); return $language; }
    public function destroy(Language $language) { $language->delete(); return response()->json(['message' => 'Deleted']); }
}
