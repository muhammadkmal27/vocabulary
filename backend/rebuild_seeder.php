<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;

$videos = YoutubeVideo::with('subtitles')->orderBy('order')->get();
echo "Found " . $videos->count() . " videos in database.\n";

$seederCode = "<?php\n\nnamespace Database\\Seeders;\n\nuse App\\Models\\Language;\nuse App\\Models\\YoutubeVideo;\nuse App\\Models\\VideoSubtitle;\nuse Illuminate\\Database\\Seeder;\n\nclass YoutubeVideoSeeder extends Seeder\n{\n    public function run(): void\n    {\n        \$english = Language::where('code', 'en')->first();\n        if (!\$english) {\n            \$english = Language::create([\n                'code'      => 'en',\n                'name'      => 'English',\n                'flag'      => '🇬🇧',\n                'is_active' => true,\n            ]);\n        }\n\n";

foreach ($videos as $v) {
    $cleanVar = 'vid_' . preg_replace('/[^a-zA-Z0-9_]/', '_', $v->youtube_video_id);
    $isPrem = $v->is_premium ? 'true' : 'false';
    $isFree = $v->is_free ? 'true' : 'false';
    $isAct = $v->is_active ? 'true' : 'false';
    $safeTitle = addslashes($v->title);
    $safeThumb = addslashes($v->thumbnail_url);
    $safeCat = addslashes($v->category);
    $orderVal = (int)$v->order;
    $ytId = $v->youtube_video_id;

    $seederCode .= "        // --- {$ytId}: {$safeTitle} ---\n";
    $seederCode .= "        \${$cleanVar} = YoutubeVideo::updateOrCreate(\n";
    $seederCode .= "            ['youtube_video_id' => '{$ytId}'],\n";
    $seederCode .= "            [\n";
    $seederCode .= "                'language_id'   => \$english->id,\n";
    $seederCode .= "                'title'         => '{$safeTitle}',\n";
    $seederCode .= "                'thumbnail_url' => '{$safeThumb}',\n";
    $seederCode .= "                'category'      => '{$safeCat}',\n";
    $seederCode .= "                'is_premium'    => {$isPrem},\n";
    $seederCode .= "                'is_free'       => {$isFree},\n";
    $seederCode .= "                'is_active'     => {$isAct},\n";
    $seederCode .= "                'order'         => {$orderVal},\n";
    $seederCode .= "            ]\n";
    $seederCode .= "        );\n";
    $seederCode .= "        VideoSubtitle::where('video_id', \${$cleanVar}->id)->delete();\n";
    $seederCode .= "        foreach ([\n";

    $subs = $v->subtitles()->orderBy('order')->get();
    foreach ($subs as $s) {
        $safeTarget = addslashes($s->target_text);
        $safeSource = addslashes($s->source_text);
        $seederCode .= "            ['start_time'=>{$s->start_time},'end_time'=>{$s->end_time},'target_text'=>'{$safeTarget}','source_text'=>'{$safeSource}','order'=>{$s->order}],\n";
    }

    $seederCode .= "        ] as \$sub) {\n";
    $seederCode .= "            VideoSubtitle::create([\n";
    $seederCode .= "                'video_id'    => \${$cleanVar}->id,\n";
    $seederCode .= "                'start_time'  => \$sub['start_time'],\n";
    $seederCode .= "                'end_time'    => \$sub['end_time'],\n";
    $seederCode .= "                'target_text' => \$sub['target_text'],\n";
    $seederCode .= "                'source_text' => \$sub['source_text'],\n";
    $seederCode .= "                'order'       => \$sub['order'],\n";
    $seederCode .= "            ]);\n";
    $seederCode .= "        }\n\n";
}

$seederCode .= "    }\n}\n";

file_put_contents('database/seeders/YoutubeVideoSeeder.php', $seederCode);
echo "SUCCESS: YoutubeVideoSeeder.php rebuilt! Total chars: " . strlen($seederCode) . "\n";
