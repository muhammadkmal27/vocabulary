<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;

class SpecialVideo52Seeder extends Seeder
{
    public function run(): void
    {
        $english = Language::where('code', 'en')->first();
        if (!$english) {
            $english = Language::create([
                'code'      => 'en',
                'name'      => 'English',
                'flag'      => '🇬🇧',
                'is_active' => true,
            ]);
        }

        // Special Bilingual Religious Video #52 (Siri 4: Ramadan Reflections 2025 - Episod 02): Mufti Menk - Ramadan Reflections - Ep2 | The Truth About Your Money
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'yp-oI-4zPzE'],
            [
                'language_id'   => $english->id,
                'title'         => 'Mufti Menk - Ramadan Reflections - Ep2 | The Truth About Your Money',
                'thumbnail_url' => 'https://img.youtube.com/vi/yp-oI-4zPzE/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 52,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.0, 'end_time' => 1.2, 'target_text' => 'Assalamu alaikum.', 'source_text' => 'Assalamu\'alaikum.', 'order' => 1],
            ['start_time' => 1.52, 'end_time' => 3.5, 'target_text' => 'All wealth belongs to Allah.', 'source_text' => 'Segala harta dan kekayaan adalah milik mutlak Allah.', 'order' => 2],
            ['start_time' => 3.92, 'end_time' => 8.44, 'target_text' => 'Evidence of it is it was on earth before Adam alaihis salam came', 'source_text' => 'Buktinya adalah harta tersebut telah pun wujud di atas muka bumi sebelum kedatangan Nabi Adam \'Alaihissalam,', 'order' => 3],
            ['start_time' => 8.44, 'end_time' => 11.92, 'target_text' => 'and it will remain on earth after the last one of us leaves.', 'source_text' => 'dan ia akan terus kekal di bumi setelah perginya insan terakhir dalam kalangan kita.', 'order' => 4],
            ['start_time' => 12.5, 'end_time' => 15.92, 'target_text' => 'Similarly, in our own lives, we came in with nothing', 'source_text' => 'Begitu juga halnya dalam kehidupan kita sendiri, kita lahir ke dunia tanpa membawa apa-apa,', 'order' => 5],
            ['start_time' => 15.92, 'end_time' => 18.78, 'target_text' => 'and when we leave, we are taking nothing behind.', 'source_text' => 'dan tatkala kita meninggal dunia kelak, tiada satu pun harta yang dapat kita bawa bersama.', 'order' => 6],
            ['start_time' => 19.24, 'end_time' => 22.2, 'target_text' => 'That is evidence enough that this belongs to Allah.', 'source_text' => 'Itulah bukti yang nyata bahawa hakikat harta ini adalah kepunyaan Allah.', 'order' => 7],
            ['start_time' => 22.64, 'end_time' => 26.76, 'target_text' => 'So Allah says: I will ask you how to earn, what to earn,', 'source_text' => 'Oleh itu firman Allah: Aku akan menyoalmu bagaimana kamu meraihnya, apakah punca pendapatanmu,', 'order' => 8],
            ['start_time' => 26.76, 'end_time' => 30.1, 'target_text' => 'when to earn, why to earn, where to spend;', 'source_text' => 'bila kamu mencarinya, untuk apa kamu mengumpulnya, dan ke mana kamu membelanjakannya;', 'order' => 9],
            ['start_time' => 30.1, 'end_time' => 33.06, 'target_text' => 'everything is part of your test.', 'source_text' => 'segalanya merupakan sebahagian daripada ujian hidupmu.', 'order' => 10],
            ['start_time' => 33.56, 'end_time' => 35.58, 'target_text' => 'And this is Allah Almighty\'s decision.', 'source_text' => 'Dan ketetapan ini adalah ketentuan daripada Allah Yang Maha Berkuasa.', 'order' => 11],
            ['start_time' => 35.98, 'end_time' => 37.36, 'target_text' => 'You will earn your paradise.', 'source_text' => 'Anda akan meraih syurga anda.', 'order' => 12],
            ['start_time' => 38.06, 'end_time' => 43.32, 'target_text' => 'You will earn your paradise based on how you did what Allah instructed you to do', 'source_text' => 'Anda bakal memperoleh syurga berdasarkan sejauh mana anda mentaati apa yang diperintahkan Allah untuk anda laksanakan,', 'order' => 13],
            ['start_time' => 43.32, 'end_time' => 47.1, 'target_text' => 'or how you abstain from what He instructed you to abstain from.', 'source_text' => 'atau sejauh mana anda menjauhi apa yang diperintahkan-Nya untuk anda hindari.', 'order' => 14],
            ['start_time' => 47.64, 'end_time' => 52.14, 'target_text' => 'Remember, if you are going to use your wealth correctly, you will earn paradise.', 'source_text' => 'Ingatlah, sekiranya anda memanfaatkan harta anda dengan jalan yang benar, anda pasti akan beroleh syurga.', 'order' => 15],
            ['start_time' => 52.14, 'end_time' => 57.7, 'target_text' => 'One of the first things that are going to be asked about as human beings is wealth.', 'source_text' => 'Antara perkara terawal yang akan dipersoalkan terhadap kita sebagai manusia kelak adalah mengenai harta.', 'order' => 16],
            ['start_time' => 58.24, 'end_time' => 59.8, 'target_text' => 'Make sure you have the right answers.', 'source_text' => 'Pastikan anda mempunyai jawapan yang tepat di hadapan Allah.', 'order' => 17],
        ];

        foreach ($subtitles as $sub) {
            VideoSubtitle::create([
                'video_id'    => $video->id,
                'start_time'  => $sub['start_time'],
                'end_time'    => $sub['end_time'],
                'target_text' => $sub['target_text'],
                'source_text' => $sub['source_text'],
                'order'       => $sub['order'],
            ]);
        }
    }
}
