<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class QuizSentencesUpdateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     * Updates all 1,000 quiz sentences for Level 1 to Level 50
     * using the verified [Standard / Casual] format from correction.md.
     */
    public function run(): void
    {
        $jsonPath = database_path('quiz_sentences_l1_l50_updates.json');
        if (!file_exists($jsonPath)) {
            $this->command?->warn("[Seeder] quiz_sentences_l1_l50_updates.json not found at: {$jsonPath}");
            Log::warning("[Seeder] quiz_sentences_l1_l50_updates.json not found at: {$jsonPath}");
            return;
        }

        $items = json_decode(file_get_contents($jsonPath), true);
        if (empty($items)) {
            $this->command?->warn("[Seeder] No items found in quiz_sentences_l1_l50_updates.json");
            Log::warning("[Seeder] No items found in quiz_sentences_l1_l50_updates.json");
            return;
        }

        // Cache English level IDs by order
        $englishLevels = DB::table('levels')
            ->whereIn('language_id', function ($query) {
                $query->select('id')->from('languages')->where('code', 'en')->orWhere('name', 'English');
            })
            ->pluck('id', 'order')
            ->toArray();

        DB::transaction(function () use ($items, $englishLevels) {
            $updatedCount = 0;
            $now = now();

            foreach ($items as $item) {
                // 1. Primary match: exact sentence UUID
                $affected = DB::table('sentences')
                    ->where('id', $item['id'])
                    ->update([
                        'source_text' => $item['source_text'],
                        'target_text' => $item['target_text'],
                        'updated_at' => $now,
                    ]);

                // 2. Fallback match: English level order and sentence order
                if ($affected === 0 && isset($englishLevels[$item['level_order']])) {
                    $levelId = $englishLevels[$item['level_order']];
                    $affected = DB::table('sentences')
                        ->where('level_id', $levelId)
                        ->where('order', $item['order'])
                        ->update([
                            'source_text' => $item['source_text'],
                            'target_text' => $item['target_text'],
                            'updated_at' => $now,
                        ]);
                }

                if ($affected > 0) {
                    $updatedCount++;
                }
            }

            $msg = "Successfully updated {$updatedCount}/" . count($items) . " quiz sentences (Levels 1-50).";
            $this->command?->info("[Seeder] {$msg}");
            Log::info("[Seeder] {$msg}");
        });
    }
}
