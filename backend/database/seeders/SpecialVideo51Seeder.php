<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;

class SpecialVideo51Seeder extends Seeder
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

        // Special Bilingual Religious Video #51 (Siri 4: Ramadan Reflections 2025 - Episod 01): Mufti Menk - Ramadan Reflections - Ep1 The More You Give the More You Get
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => '3OlR7bb7uOw'],
            [
                'language_id'   => $english->id,
                'title'         => 'Mufti Menk - Ramadan Reflections - Ep1 The More You Give the More You Get',
                'thumbnail_url' => 'https://img.youtube.com/vi/3OlR7bb7uOw/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 51,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.0, 'end_time' => 1.1, 'target_text' => 'Assalamu alaikum.', 'source_text' => 'Assalamu\'alaikum.', 'order' => 1],
            ['start_time' => 1.6, 'end_time' => 3.34, 'target_text' => 'Ma naqasa malun min sadaqah.', 'source_text' => 'Tidak akan berkurang harta kerana bersedekah.', 'order' => 2],
            ['start_time' => 3.96, 'end_time' => 7.88, 'target_text' => 'No one\'s wealth has ever depleted through a charity.', 'source_text' => 'Tiada harta sesiapapun yang pernah susut akibat bersedekah.', 'order' => 3],
            ['start_time' => 8.46, 'end_time' => 14.06, 'target_text' => 'Whenever you give a charity, don\'t think that your money is going to be depleted because it won\'t.', 'source_text' => 'Setiap kali anda menghulurkan sedekah, jangan sesekali menyangka bahawa wang anda akan berkurangan, kerana ia sama sekali tidak akan susut.', 'order' => 4],
            ['start_time' => 14.22, 'end_time' => 16.34, 'target_text' => 'If anything, it\'s the other way around.', 'source_text' => 'Bahkan sebenarnya, ia berlaku secara sebaliknya.', 'order' => 5],
            ['start_time' => 16.76, 'end_time' => 18.46, 'target_text' => 'The more you give, the more you get.', 'source_text' => 'Semakin banyak yang anda infakkan, semakin banyak yang bakal anda peroleh.', 'order' => 6],
            ['start_time' => 19.0, 'end_time' => 20.46, 'target_text' => 'Anfiq yabna Adama.', 'source_text' => 'Infakkanlah, wahai anak Adam.', 'order' => 7],
            ['start_time' => 20.76, 'end_time' => 21.56, 'target_text' => 'Unfiq \'alayk.', 'source_text' => 'Nescaya Aku akan berinfak ke atasmu.', 'order' => 8],
            ['start_time' => 21.96, 'end_time' => 23.28, 'target_text' => 'Spend, O son of Adam.', 'source_text' => 'Nafkahkanlah hartamu, wahai anak Adam.', 'order' => 9],
            ['start_time' => 23.8, 'end_time' => 25.92, 'target_text' => 'I will spend on you, Allah is saying.', 'source_text' => 'Nescaya Aku akan melimpahkan rezeki kepadamu, demikian firman Allah.', 'order' => 10],
            ['start_time' => 26.42, 'end_time' => 28.98, 'target_text' => 'So never think that if I give a charity,', 'source_text' => 'Oleh itu, jangan sesekali berfikir bahawa jika daku bersedekah,', 'order' => 11],
            ['start_time' => 29.54, 'end_time' => 31.36, 'target_text' => 'I might not have any more money.', 'source_text' => 'daku mungkin tidak akan mempunyai wang lagi.', 'order' => 12],
            ['start_time' => 31.98, 'end_time' => 33.58, 'target_text' => 'But rather, think to yourself,', 'source_text' => 'Sebaliknya, tanamkanlah keyakinan di dalam hati anda:', 'order' => 13],
            ['start_time' => 33.76, 'end_time' => 37.4, 'target_text' => 'let me give a portion of my wealth so that Allah will give me more,', 'source_text' => 'biarlah daku menginfakkan sebahagian hartaku agar Allah melipatgandakan rezeki kepadaku,', 'order' => 14],
            ['start_time' => 37.72, 'end_time' => 41.9, 'target_text' => 'so that I can do more, and that is the circle and the cycle.', 'source_text' => 'supaya daku mampu berbakti dengan lebih banyak lagi, dan itulah lingkaran kitaran keberkatan rezeki.', 'order' => 15],
            ['start_time' => 42.34, 'end_time' => 45.8, 'target_text' => 'May Allah make it easy for everyone of us to donate and to give', 'source_text' => 'Semoga Allah memudahkan urusan setiap seorang daripada kita untuk menderma dan menyumbang', 'order' => 16],
            ['start_time' => 46.42, 'end_time' => 50.3, 'target_text' => 'to all causes that come to our attention.', 'source_text' => 'kepada segala kebajikan yang sampai ke pengetahuan kita.', 'order' => 17],
            ['start_time' => 50.9, 'end_time' => 54.82, 'target_text' => 'And at the same time, we ask Allah Almighty to bless us', 'source_text' => 'Dan pada masa yang sama, kita memohon agar Allah Yang Maha Kuasa memberkati kita', 'order' => 18],
            ['start_time' => 54.82, 'end_time' => 56.82, 'target_text' => 'and our families in every way.', 'source_text' => 'serta keluarga kita dalam segenap aspek kehidupan.', 'order' => 19],
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
