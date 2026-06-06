<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\Sentence;
use Illuminate\Http\Request;
class SentenceController extends Controller
{
    public function index($langId, $levelId) { return Sentence::where('level_id', $levelId)->orderBy('order')->get(); }
    public function store(Request $request, $langId, $levelId) {
        $data = $request->validate([
            'source_text' => 'required',
            'target_text' => 'required',
            'difficulty' => 'sometimes|integer|min:1|max:3',
            'tags' => 'nullable|json',
            'order' => 'sometimes|integer'
        ]);
        $data['level_id'] = $levelId;
        if (!isset($data['order'])) {
            $data['order'] = Sentence::where('level_id', $levelId)->max('order') + 1;
        }
        return Sentence::create($data);
    }
    public function bulkStore(Request $request, $langId, $levelId) {
        $sentences = $request->validate([
            'sentences' => 'required|array',
            'sentences.*.source_text' => 'required',
            'sentences.*.target_text' => 'required'
        ]);
        $maxOrder = Sentence::where('level_id', $levelId)->max('order') ?? 0;
        foreach($sentences['sentences'] as $s) {
            $maxOrder++;
            $s['level_id'] = $levelId;
            $s['order'] = $maxOrder;
            Sentence::create($s);
        }
        return response()->json(['message' => count($sentences['sentences']) . ' sentences created']);
    }
    public function show(Sentence $sentence) { return $sentence; }
    public function update(Request $request, Sentence $sentence) { $sentence->update($request->validate(['source_text'=>'sometimes','target_text'=>'sometimes','difficulty'=>'sometimes|integer|min:1|max:3','tags'=>'nullable|json','order'=>'sometimes|integer'])); return $sentence; }
    public function destroy(Sentence $sentence) { $sentence->delete(); return response()->json(['message'=>'Deleted']); }
}
