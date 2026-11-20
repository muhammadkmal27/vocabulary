<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;

class SpecialVideo53Seeder extends Seeder
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

        // Special Bilingual Religious Video #53 (Siri 4: Ramadan Reflections 2025 - Episod 03): The Truth About Your Money | Mufti Menk - Ramadan Reflections - Ep3
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 've7wVZ34rL4'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Truth About Your Money | Mufti Menk - Ramadan Reflections - Ep3',
                'thumbnail_url' => 'https://img.youtube.com/vi/ve7wVZ34rL4/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 53,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.0, 'end_time' => 1.32, 'target_text' => 'Assalamu alaikum.', 'source_text' => 'Assalamu\'alaikum.', 'order' => 1],
            ['start_time' => 1.92, 'end_time' => 5.1, 'target_text' => 'Wealth increases when you spend in the right cause.', 'source_text' => 'Harta akan bertambah apabila anda membelanjakannya ke jalan kebajikan yang benar.', 'order' => 2],
            ['start_time' => 5.66, 'end_time' => 8.3, 'target_text' => 'It is like sowing a seed and watering it.', 'source_text' => 'Ia ibarat menyemai benih dan menyiramnya.', 'order' => 3],
            ['start_time' => 8.62, 'end_time' => 9.4, 'target_text' => 'What will happen?', 'source_text' => 'Apakah yang akan berlaku kelak?', 'order' => 4],
            ['start_time' => 9.78, 'end_time' => 14.16, 'target_text' => 'Germination, and you find a new seedling and a whole plant grows.', 'source_text' => 'Percambahan berlaku, lalu anda melihat anak benih baharu dan keseluruhan pohon tumbuh mekar.', 'order' => 5],
            ['start_time' => 14.7, 'end_time' => 17.82, 'target_text' => 'Allah Almighty gives the same example in the Quran where He says,', 'source_text' => 'Allah Yang Maha Berkuasa memberikan perumpamaan yang serupa di dalam al-Quran di mana Dia berfirman,', 'order' => 6],
            ['start_time' => 18.52, 'end_time' => 22.42, 'target_text' => 'similarly to a seed multiplied 100, 700 times and beyond.', 'source_text' => 'ibarat sebutir benih yang digandakan 100 kali, 700 kali ganda, bahkan jauh lebih banyak lagi.', 'order' => 7],
            ['start_time' => 23.04, 'end_time' => 28.52, 'target_text' => 'So remember when you spend, you\'re actually investing with Allah Subhanahu Wa Ta\'ala', 'source_text' => 'Maka ingatlah, tatkala anda berinfak, hakikatnya anda sedang melabur bersama Allah Subhanahu wa Ta\'ala,', 'order' => 8],
            ['start_time' => 28.52, 'end_time' => 33.14, 'target_text' => 'and who is there better than Allah Almighty for you to invest with?', 'source_text' => 'dan siapakah lagi yang lebih baik daripada Allah Yang Maha Berkuasa untuk anda melabur bersama-Nya?', 'order' => 9],
            ['start_time' => 33.54, 'end_time' => 36.52, 'target_text' => 'Allah Almighty says, you will see the fruit of it in this world', 'source_text' => 'Firman Allah Yang Maha Berkuasa, anda bakal melihat buah hasilnya di dunia ini,', 'order' => 10],
            ['start_time' => 36.52, 'end_time' => 41.32, 'target_text' => 'and you will see a humongous multiplication of it in the hereafter.', 'source_text' => 'dan anda akan menyaksikan ganjaran berlipat ganda yang luar biasa besarnya di akhirat kelak.', 'order' => 11],
            ['start_time' => 41.7, 'end_time' => 45.36, 'target_text' => 'Never shy away from spending in the cause of Allah.', 'source_text' => 'Jangan sesekali berasa segan atau ragu-ragu untuk berinfak pada jalan Allah.', 'order' => 12],
            ['start_time' => 46.0, 'end_time' => 50.02, 'target_text' => 'Try a few dollars, a few pounds, whatever it may be, a little bit of wealth', 'source_text' => 'Cubalah beberapa dolar, beberapa paun, apa jua nilainya, biarpun sedikit harta yang anda ada,', 'order' => 13],
            ['start_time' => 50.02, 'end_time' => 54.62, 'target_text' => 'and see what Allah does, but remain humble and consider yourself fortunate.', 'source_text' => 'dan lihatlah apa yang Allah bakal kurniakan; namun kekallah rendah hati dan anggaplah diri anda insan yang bertuah.', 'order' => 14],
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
