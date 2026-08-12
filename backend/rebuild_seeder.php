<?php
// Rebuild seeder in proper UTF-8 encoding
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\YoutubeVideo;

$videos = YoutubeVideo::with(['subtitles' => function($q){ $q->orderBy('order'); }])
    ->whereIn('youtube_video_id', ['030RzwpiK8U','mNzj1eABGB0'])
    ->orderBy('order')
    ->get();

$out = '<?php' . "\n\n";
$out .= 'namespace Database\\Seeders;' . "\n\n";
$out .= 'use App\\Models\\Language;' . "\n";
$out .= 'use App\\Models\\YoutubeVideo;' . "\n";
$out .= 'use App\\Models\\VideoSubtitle;' . "\n";
$out .= 'use Illuminate\\Database\\Seeder;' . "\n\n";
$out .= 'class YoutubeVideoSeeder extends Seeder' . "\n";
$out .= '{' . "\n";
$out .= '    public function run(): void' . "\n";
$out .= '    {' . "\n";
$out .= '        $english = Language::where(\'code\', \'en\')->first();' . "\n";
$out .= '        if (!$english) {' . "\n";
$out .= '            $english = Language::create([' . "\n";
$out .= '                \'code\'      => \'en\',' . "\n";
$out .= '                \'name\'      => \'English\',' . "\n";
$out .= '                \'flag\'      => \':gb:\',' . "\n";
$out .= '                \'is_active\' => true,' . "\n";
$out .= '            ]);' . "\n";
$out .= '        }' . "\n\n";

foreach ($videos as $video) {
    $varName = '$vid_' . preg_replace('/[^a-zA-Z0-9]/', '_', $video->youtube_video_id);
    $out .= '        // --- ' . $video->youtube_video_id . ': ' . addslashes($video->title) . " ---\n";
    $out .= '        ' . $varName . ' = YoutubeVideo::updateOrCreate(' . "\n";
    $out .= '            [\'youtube_video_id\' => \'' . $video->youtube_video_id . '\'],' . "\n";
    $out .= '            [' . "\n";
    $out .= '                \'language_id\'   => $english->id,' . "\n";
    $out .= '                \'title\'         => ' . var_export($video->title, true) . ',' . "\n";
    $out .= '                \'thumbnail_url\' => \'https://img.youtube.com/vi/' . $video->youtube_video_id . '/0.jpg\',' . "\n";
    $out .= '                \'category\'      => ' . var_export($video->category, true) . ',' . "\n";
    $out .= '                \'is_premium\'    => ' . ($video->is_premium ? 'true' : 'false') . ',' . "\n";
    $out .= '                \'is_free\'       => ' . ($video->is_free ? 'true' : 'false') . ',' . "\n";
    $out .= '                \'is_active\'     => true,' . "\n";
    $out .= '                \'order\'         => ' . (int)$video->order . ',' . "\n";
    $out .= '            ]' . "\n";
    $out .= '        );' . "\n";
    $out .= '        VideoSubtitle::where(\'video_id\', ' . $varName . '->id)->delete();' . "\n";
    $out .= '        foreach ([' . "\n";

    foreach ($video->subtitles as $sub) {
        $out .= '            [\'start_time\'=>' . number_format((float)$sub->start_time, 3, '.', '') .
                ',\'end_time\'=>' . number_format((float)$sub->end_time, 3, '.', '') .
                ',\'target_text\'=>' . var_export($sub->target_text, true) .
                ',\'source_text\'=>' . var_export($sub->source_text, true) .
                ',\'order\'=>' . (int)$sub->order . '],' . "\n";
    }

    $out .= '        ] as $s) { ' . $varName . '->subtitles()->create($s); }' . "\n\n";
}

$out .= '    }' . "\n";
$out .= '}' . "\n";

// Write UTF-8 without BOM
file_put_contents('database/seeders/YoutubeVideoSeeder.php', $out);
echo "Done. File size: " . strlen($out) . " bytes\n";
echo "Encoding: " . mb_detect_encoding($out, ['UTF-8','UTF-16'], true) . "\n";
echo "Line count: " . count(explode("\n", $out)) . "\n";

// Verify PHP syntax
$result = shell_exec('php -l database/seeders/YoutubeVideoSeeder.php 2>&1');
echo "Syntax check: $result\n";
