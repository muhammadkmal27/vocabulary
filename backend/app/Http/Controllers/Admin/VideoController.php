<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\YoutubeVideo;
use Illuminate\Http\Request;

class VideoController extends Controller
{
    public function index()
    {
        return YoutubeVideo::with('language')
            ->withCount('subtitles')
            ->orderBy('order')
            ->get();
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'language_id' => 'required|exists:languages,id',
            'title' => 'required|string|max:255',
            'youtube_video_id' => 'required|string|max:50',
            'category' => 'nullable|string|max:100',
            'is_premium' => 'boolean',
            'is_free' => 'boolean',
            'is_active' => 'boolean',
            'order' => 'integer',
        ]);

        $data['thumbnail_url'] = "https://img.youtube.com/vi/{$data['youtube_video_id']}/0.jpg";

        return YoutubeVideo::create($data);
    }

    public function show(YoutubeVideo $video)
    {
        return $video->load(['language', 'subtitles']);
    }

    public function update(Request $request, YoutubeVideo $video)
    {
        $data = $request->validate([
            'language_id' => 'sometimes|required|exists:languages,id',
            'title' => 'sometimes|required|string|max:255',
            'youtube_video_id' => 'sometimes|required|string|max:50',
            'category' => 'nullable|string|max:100',
            'is_premium' => 'boolean',
            'is_free' => 'boolean',
            'is_active' => 'boolean',
            'order' => 'integer',
        ]);

        if (isset($data['youtube_video_id'])) {
            $data['thumbnail_url'] = "https://img.youtube.com/vi/{$data['youtube_video_id']}/0.jpg";
        }

        $video->update($data);
        return $video;
    }

    public function destroy(YoutubeVideo $video)
    {
        $video->delete();
        return response()->json(['message' => 'Deleted']);
    }

    public function importSubtitles(Request $request, string $id)
    {
        $video = YoutubeVideo::findOrFail($id);
        $youtubeVideoId = $video->youtube_video_id;

        // Use a fixed filename to avoid Windows shell % variable expansion
        $tmpDir  = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'yt_subs_' . uniqid();
        mkdir($tmpDir, 0755, true);
        $outFile = $tmpDir . DIRECTORY_SEPARATOR . 'subtitle';

        try {
            // yt-dlp: download auto-subtitles in json3 format
            $cmd = sprintf(
                'python -m yt_dlp --skip-download --write-auto-sub --sub-langs en --sub-format json3 --output %s %s 2>&1',
                escapeshellarg($outFile),
                escapeshellarg('https://www.youtube.com/watch?v=' . $youtubeVideoId)
            );

            $output = shell_exec($cmd);

            // Find the json3 file (e.g. subtitle.en.json3)
            $files = glob($tmpDir . DIRECTORY_SEPARATOR . '*.json3');
            if (empty($files)) {
                array_map('unlink', glob($tmpDir . DIRECTORY_SEPARATOR . '*'));
                rmdir($tmpDir);
                return response()->json([
                    'message' => 'Gagal mengimport: Tiada sari kata dijumpai. ' . substr($output ?? '', 0, 300)
                ], 400);
            }

            $data = json_decode(file_get_contents($files[0]), true);
            array_map('unlink', glob($tmpDir . DIRECTORY_SEPARATOR . '*'));
            rmdir($tmpDir);

            if (!$data || !isset($data['events'])) {
                return response()->json(['message' => 'Format sari kata tidak sah.'], 400);
            }

            // ---------------------------------------------------------------
            // WORD-LEVEL TIMING
            // json3 segs contain tOffsetMs (ms relative to event tStartMs).
            // Extract every word with its ABSOLUTE timestamp so subtitles
            // are perfectly aligned — no manual timing adjustment needed.
            // ---------------------------------------------------------------
            $allWords = [];
            foreach ($data['events'] as $event) {
                if (!isset($event['segs'])) continue;
                $eventStartMs = (int)($event['tStartMs'] ?? 0);

                foreach ($event['segs'] as $seg) {
                    $utf8 = $seg['utf8'] ?? '';
                    if ($utf8 === "\n" || trim($utf8) === '') continue;
                    // Ensure words from different events are separated by a space
                    // (some segs already start with space, some don't)
                    $allWords[] = [
                        'text'    => $utf8,
                        'time_ms' => $eventStartMs + (int)($seg['tOffsetMs'] ?? 0),
                    ];
                }
            }

            // Sort by absolute timestamp (rolling-window CC events can overlap)
            usort($allWords, fn($a, $b) => $a['time_ms'] <=> $b['time_ms']);

            // Deduplicate: same word within 150 ms = rolling-window duplicate
            $uniqueWords = [];
            $prevTime    = -9999;
            $prevText    = '';
            foreach ($allWords as $w) {
                $t = trim($w['text']);
                if ($t === $prevText && abs($w['time_ms'] - $prevTime) < 150) continue;
                $uniqueWords[] = $w;
                $prevTime = $w['time_ms'];
                $prevText = $t;
            }

            // ---------------------------------------------------------------
            // GROUP WORDS INTO CLEAN SENTENCES (non-overlapping)
            // Sentence boundary: punctuation (.!?) OR line >90 chars
            //                    OR silence gap >1500 ms to next word
            // ---------------------------------------------------------------
            $subtitleLines   = [];
            $currentText     = '';
            $sentenceStartMs = null;
            $total           = count($uniqueWords);

            foreach ($uniqueWords as $i => $word) {
                if ($sentenceStartMs === null) {
                    $sentenceStartMs = $word['time_ms'];
                }
                // Insert space if current text is non-empty and next word doesn't begin with space or punctuation
                $wordText = $word['text'];
                if ($currentText !== '' && !str_starts_with($wordText, ' ') && !preg_match('/^[,.:!?]/', $wordText)) {
                    $wordText = ' ' . $wordText;
                }
                $currentText .= $wordText;

                $isLast      = ($i === $total - 1);
                $endsPunct   = (bool) preg_match('/[.!?]$/', rtrim($word['text']));
                $isTooLong   = mb_strlen(trim($currentText)) > 120;

                // Long silence gap → treat as sentence break
                $silenceBreak = false;
                if (!$isLast) {
                    $silenceBreak = ($uniqueWords[$i + 1]['time_ms'] - $word['time_ms']) > 1500;
                }

                if ($endsPunct || $isLast || $isTooLong || $silenceBreak) {
                    $text = trim(preg_replace('/\s+/', ' ', $currentText));

                    if (!empty($text)) {
                        // End = last word + 1.8 s, strictly capped at (next word − 100 ms)
                        $endMs = $word['time_ms'] + 1800;
                        if (!$isLast) {
                            $endMs = min($endMs, $uniqueWords[$i + 1]['time_ms'] - 100);
                        }
                        $endMs = max($endMs, $sentenceStartMs + 400); // min 0.4 s

                        $subtitleLines[] = [
                            'start_time' => round($sentenceStartMs / 1000, 3),
                            'end_time'   => round($endMs / 1000, 3),
                            'text'       => $text,
                        ];
                    }

                    $currentText     = '';
                    $sentenceStartMs = null;
                }
            }

            if (empty($subtitleLines)) {
                return response()->json(['message' => 'Tiada baris sari kata dijumpai.'], 400);
            }

            // Final pass: guarantee zero overlaps (handles floating-point edge cases)
            for ($i = 0; $i < count($subtitleLines) - 1; $i++) {
                if ($subtitleLines[$i]['end_time'] >= $subtitleLines[$i + 1]['start_time']) {
                    $subtitleLines[$i]['end_time'] = round($subtitleLines[$i + 1]['start_time'] - 0.001, 3);
                }
            }

            // Persist inside a transaction for atomicity
            \DB::transaction(function () use ($video, $subtitleLines) {
                $video->subtitles()->delete();
                $order = 1;
                foreach ($subtitleLines as $line) {
                    $video->subtitles()->create([
                        'start_time'  => $line['start_time'],
                        'end_time'    => $line['end_time'],
                        'target_text' => $line['text'],
                        'source_text' => $line['text'], // Admin fills BM translation
                        'order'       => $order++,
                    ]);
                }
            });

            return response()->json([
                'message'         => 'Sari kata berjaya diimport & diselaraskan secara automatik! Sila isi terjemahan BM.',
                'subtitles_count' => count($subtitleLines),
            ]);

        } catch (\Exception $e) {
            if (is_dir($tmpDir)) {
                array_map('unlink', glob($tmpDir . DIRECTORY_SEPARATOR . '*'));
                rmdir($tmpDir);
            }
            return response()->json(['message' => 'Ralat mengimport: ' . $e->getMessage()], 500);
        }
    }

    public function updateSubtitles(Request $request, YoutubeVideo $video)
    {
        $request->validate([
            'subtitles' => 'required|array',
            'subtitles.*.id' => 'required|exists:video_subtitles,id',
            'subtitles.*.target_text' => 'required|string',
            'subtitles.*.source_text' => 'required|string',
            'subtitles.*.start_time' => 'required|numeric',
            'subtitles.*.end_time' => 'required|numeric',
        ]);

        foreach ($request->subtitles as $sub) {
            $video->subtitles()->where('id', $sub['id'])->update([
                'target_text' => $sub['target_text'],
                'source_text' => $sub['source_text'],
                'start_time' => $sub['start_time'],
                'end_time' => $sub['end_time'],
            ]);
        }

        return response()->json(['message' => 'Subtitles updated successfully']);
    }
}
