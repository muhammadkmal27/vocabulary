<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo25Seeder extends Seeder
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

        // Special Bilingual Religious Video #25 (Siri 1 Ep.20): The Battle of al-Ahzab | Life of the Final Messenger ﷺ | Ep.20 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'SNmETUE2GFA'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Battle of al-Ahzab | Life of the Final Messenger ﷺ | Ep.20 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/SNmETUE2GFA/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 25,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.4, 'end_time' => 6.08, 'target_text' => 'He struck it once, a spark lit the trench. He struck it again,', 'source_text' => 'Baginda memukulnya sekali, lalu percikan api menerangi parit. Baginda memukulnya sekali lagi,', 'order' => 1],
            ['start_time' => 6.08, 'end_time' => 13.92, 'target_text' => 'a brighter spark. He struck it a third time and it shattered. A violent freezing wind swept through', 'source_text' => 'percikan yang lebih terang memancar. Baginda memukulnya buat kali ketiga lalu batu itu pun hancur berderai. Angin kencang yang membeku menyapu meredah', 'order' => 2],
            ['start_time' => 13.92, 'end_time' => 23.52, 'target_text' => 'the enemy camps. Tents tore and fires died, resolves broke. My beloved brothers and sisters,', 'source_text' => 'khemah-khemah pihak musuh. Khemah tercabut dan unggun api terpadam, tekad mereka hancur berkecai. Saudara dan saudariku yang dikasihi,', 'order' => 3],
            ['start_time' => 23.52, 'end_time' => 29.52, 'target_text' => 'sometimes the believer stands in a moment where the world seems to gather against him,', 'source_text' => 'kadang-kala orang yang beriman berada di suatu detik tatkala seluruh isi dunia seolah-olah bersekutu menentangnya,', 'order' => 4],
            ['start_time' => 29.52, 'end_time' => 39.84, 'target_text' => 'where every direction carries fear and only the heart remains between trust and doubt. This was', 'source_text' => 'tatkala setiap penjuru sarat dengan ketakutan dan hati berbolak-balik antara tawakal dan keraguan. Inilah', 'order' => 5],
            ['start_time' => 39.84, 'end_time' => 54.88, 'target_text' => 'the battle of the trench. The day when 10,000 warriors marched to erase Islam from Medina.', 'source_text' => 'Perang Parit (Khandaq). Hari tatkala 10,000 bala tentera berarak mara untuk melenyapkan Islam dari bumi Madinah.', 'order' => 6],
            ['start_time' => 62.72, 'end_time' => 67.28, 'target_text' => 'After the Muslims expelled Banu al-Nadir for their betrayal,', 'source_text' => 'Setelah kaum muslimin mengusir Bani al-Nadir atas pengkhianatan mereka,', 'order' => 7],
            ['start_time' => 67.28, 'end_time' => 72.4, 'target_text' => 'hatred grew inside them. So they traveled to Makkah praising Quraysh', 'source_text' => 'kebencian membara di dalam dada mereka. Lalu mereka berangkat ke Makkah memuji kaum Quraisy', 'order' => 8],
            ['start_time' => 72.4, 'end_time' => 81.84, 'target_text' => 'and even claiming that Quraysh were more guided than the believers. Allah revealed:', 'source_text' => 'bahkan mendakwa bahawa Quraisy lebih mendapat petunjuk daripada orang-orang yang beriman. Maka Allah menurunkan wahyu:', 'order' => 9],
            ['start_time' => 93.2, 'end_time' => 98.24, 'target_text' => 'Have you not seen those who were given a portion of the scripture who believe', 'source_text' => 'Tidakkah engkau memerhatikan orang-orang yang telah diberikan sebahagian daripada Kitab Suci, mereka percaya', 'order' => 10],
            ['start_time' => 98.24, 'end_time' => 105.84, 'target_text' => 'in falsehood and say to the disbelievers these are better guided than the believers.', 'source_text' => 'kepada benda-benda yang batil dan berkata kepada orang-orang kafir bahawa mereka lebih lurus jalannya daripada orang-orang beriman.', 'order' => 11],
            ['start_time' => 105.84, 'end_time' => 120.08, 'target_text' => 'Quraysh agreed. Ghatafan joined, Sulaym, Kinanah, Asad, until an army of 10,000 marched toward Medina.', 'source_text' => 'Quraisy bersetuju. Ghatafan menyertai pakatan, diikuti Sulaim, Kinanah, dan Asad, sehingga terhimpun tentera 10,000 orang berarak mara menuju Madinah.', 'order' => 12],
            ['start_time' => 120.08, 'end_time' => 125.92, 'target_text' => 'The strategy: the Prophet peace be upon him gathered the companions.', 'source_text' => 'Strategi dirangka: Nabi ﷺ mengumpulkan para sahabat sekalian.', 'order' => 13],
            ['start_time' => 125.92, 'end_time' => 131.76, 'target_text' => 'Every opinion was heard. Then Salman al-Farisi, may Allah be pleased with him,', 'source_text' => 'Setiap pandangan didengar. Lalu Salman al-Farisi, semoga Allah meredhainya,', 'order' => 14],
            ['start_time' => 131.76, 'end_time' => 138.88, 'target_text' => 'said, "In Persia, when armies come, we dig a trench." The Prophet, peace be upon him,', 'source_text' => 'berkata, "Di Parsi, apabila musuh mara menyerang, kami menggali parit." Nabi ﷺ', 'order' => 15],
            ['start_time' => 138.88, 'end_time' => 149.44, 'target_text' => 'smiled, and the trench became the plan. The trench, the wind was cold, the earth was hard,', 'source_text' => 'tersenyum, lalu parit dijadikan strategi pertahanan. Parit digali, angin bertiup dingin, tanah mengeras membeku,', 'order' => 16],
            ['start_time' => 149.44, 'end_time' => 158.4, 'target_text' => 'the hunger was real, but the faith was firm. They dug and dug and the Prophet peace be upon him dug', 'source_text' => 'kelaparan amat mencengkam, namun keimanan kekal teguh waja. Mereka terus menggali dan Nabi ﷺ turut sama menggali', 'order' => 17],
            ['start_time' => 158.4, 'end_time' => 172.48, 'target_text' => 'with them, dust upon his blessed shoulders. The companions raised their voices in unity:', 'source_text' => 'bersama mereka, debu tanah menyelimuti bahu baginda yang mulia. Para sahabat melaungkan suara bersama penuh padu:', 'order' => 18],
            ['start_time' => 172.48, 'end_time' => 177.92, 'target_text' => '"We are the ones who pledged to Muhammad peace be upon him to strive in jihad for', 'source_text' => '"Kamilah golongan yang telah berbai\'ah kepada Muhammad ﷺ untuk berjihad di jalan Allah', 'order' => 19],
            ['start_time' => 177.92, 'end_time' => 191.84, 'target_text' => 'as long as we live." And the Prophet peace be upon him answered with a voice full of warmth:', 'source_text' => 'selagi hayat dikandung badan." Dan Nabi ﷺ membalas laungan itu dengan suara yang sarat kehangatan kasih sayang:', 'order' => 20],
            ['start_time' => 191.84, 'end_time' => 197.84, 'target_text' => '"Oh Allah, the true life is the life of the hereafter. So forgive the Ansar and the', 'source_text' => '"Ya Allah, tiada kehidupan yang hakiki melainkan kehidupan akhirat. Maka ampunkanlah kaum Ansar dan', 'order' => 21],
            ['start_time' => 197.84, 'end_time' => 205.44, 'target_text' => 'Muhajirin." This was not just digging. This was faith taking shape in the earth. The miracle', 'source_text' => 'Muhajirin." Ini bukan sekadar menggali parit, ini adalah penjelmaan iman yang terpahat di bumi. Mukjizat', 'order' => 22],
            ['start_time' => 205.44, 'end_time' => 213.12, 'target_text' => 'of the rock. They encountered a massive rock no tool could break. They called the Prophet', 'source_text' => 'batu besar: Mereka menemui sebongkah batu gergasi yang tidak mampu dipecahkan oleh sebarang alat. Lalu mereka memanggil Nabi', 'order' => 23],
            ['start_time' => 213.12, 'end_time' => 221.28, 'target_text' => 'Muhammad peace be upon him. He struck it once. A spark lit the trench. He struck it again. A', 'source_text' => 'Muhammad ﷺ. Baginda memukulnya sekali. Kilauan api menerangi parit. Baginda memukulnya lagi.', 'order' => 24],
            ['start_time' => 221.28, 'end_time' => 229.12, 'target_text' => 'brighter spark. He struck it a third time and it shattered. He said, "Allahu Akbar,', 'source_text' => 'Kilauan yang lebih terang memancar. Baginda memukulnya buat kali ketiga lalu batu itu pun berkecai. Baginda bersabda, "Allahu Akbar,', 'order' => 25],
            ['start_time' => 229.12, 'end_time' => 237.36, 'target_text' => 'I have been given the keys of Sham. Allahu Akbar, I have been given the keys of Persia. Allahu Akbar,', 'source_text' => 'aku telah dikurniakan kunci-kunci negeri Syam. Allahu Akbar, aku telah dikurniakan kunci-kunci Parsi. Allahu Akbar,', 'order' => 26],
            ['start_time' => 237.36, 'end_time' => 248.16, 'target_text' => 'I have been given the keys of Yemen." In their darkest hardship, he spoke only of future victory.', 'source_text' => 'aku telah dikurniakan kunci-kunci Yaman." Di tengah-tengah kesempitan yang paling getir, baginda menjanjikan kemenangan masa hadapan.', 'order' => 27],
            ['start_time' => 248.16, 'end_time' => 255.6, 'target_text' => 'The Confederates arrived, a sea of armor and banners. But when they reached the trench,', 'source_text' => 'Tentera Bersekutu (Ahzab) pun tiba, laksana lautan baju besi dan panji-panji perang. Namun apabila tiba di parit,', 'order' => 28],
            ['start_time' => 255.6, 'end_time' => 262.32, 'target_text' => 'they stopped. Their plans collapsed. They could not pass. So they surrounded Medina.', 'source_text' => 'mereka terhenti kaku. Rancangan mereka buntu. Mereka tidak dapat menyeberang. Lalu mereka mengepung Madinah.', 'order' => 29],
            ['start_time' => 262.32, 'end_time' => 276.88, 'target_text' => 'The siege began and the test grew heavier. Allah describes that moment', 'source_text' => 'Pengepungan bermula dan ujian bertambah dahsyat. Allah merakamkan saat getir tersebut', 'order' => 30],
            ['start_time' => 276.88, 'end_time' => 285.28, 'target_text' => 'when the eyes grew wide and the hearts reached the throats. Fear, cold, hunger,', 'source_text' => 'tatkala pandangan mata terbeliak ketakutan dan hati berdegup kencang hingga terasa di kerongkong. Ketakutan, kedinginan, kelaparan,', 'order' => 31],
            ['start_time' => 285.28, 'end_time' => 294.24, 'target_text' => 'whispers of doubt and then betrayal. The betrayal of Banu Qurayzah. At the worst moment,', 'source_text' => 'bisikan keraguan, dan kemudian berlakunya pengkhianatan. Pengkhianatan Bani Quraizah. Pada saat yang paling genting,', 'order' => 32],
            ['start_time' => 294.24, 'end_time' => 300.32, 'target_text' => 'they broke the treaty. The city was now threatened from inside. But the', 'source_text' => 'mereka mengoyak perjanjian damai. Kota Madinah kini terancam bahaya dari dalam. Namun', 'order' => 33],
            ['start_time' => 300.32, 'end_time' => 309.12, 'target_text' => 'believers did not break the supplication that the Prophet raised his hands and said:', 'source_text' => 'kaum mukminin tidak pernah goyah. Nabi ﷺ menadah kedua-dua tangan baginda seraya berdoa:', 'order' => 34],
            ['start_time' => 315.44, 'end_time' => 319.36, 'target_text' => '"Oh Allah, revealer of the Book, swift in reckoning,', 'source_text' => '"Ya Allah, Tuhan yang menurunkan Kitab Suci, yang Maha Pantas membuat perhitungan,', 'order' => 35],
            ['start_time' => 319.36, 'end_time' => 326.8, 'target_text' => 'defeat the confederates. Oh Allah, defeat them and shake them." And Allah answered:', 'source_text' => 'tumpaskanlah bala tentera bersekutu. Ya Allah, kalahkanlah mereka dan goncangkanlah mereka." Dan Allah memperkenankan doa itu:', 'order' => 36],
            ['start_time' => 326.8, 'end_time' => 337.12, 'target_text' => 'A violent freezing wind swept through the enemy camps. Tents tore and fires died. Resolves broke.', 'source_text' => 'Angin taufan yang amat sejuk merempuh perkhemahan pihak musuh. Khemah-khemah koyak dan unggun api terpadam. Tekad mereka hancur luluh.', 'order' => 37],
            ['start_time' => 340.64, 'end_time' => 348, 'target_text' => '"We sent upon them a wind and armies you did not see." The siege ended.', 'source_text' => '"Kami hantarkan kepada mereka angin ribut dan bala tentera yang tidak dapat kamu lihat." Pengepungan pun berakhir.', 'order' => 38],
            ['start_time' => 348, 'end_time' => 356.72, 'target_text' => 'Islam remained standing. The Confederates fled. My beloved brothers and sisters,', 'source_text' => 'Islam kekal berdiri teguh. Tentera Ahzab berundur lari bertempiaran. Saudara dan saudariku yang dikasihi,', 'order' => 39],
            ['start_time' => 356.72, 'end_time' => 363.04, 'target_text' => 'the battle of the trench ended, but the story did not. For the betrayal that came from inside', 'source_text' => 'perang parit telah pun berakhir, namun kisahnya belum selesai. Kerana pengkhianatan yang timbul dari dalam', 'order' => 40],
            ['start_time' => 363.04, 'end_time' => 373.36, 'target_text' => 'Medina must now be answered in the next episode insha\'Allah: The siege of Banu Qurayzah.', 'source_text' => 'Madinah mesti diadili dalam episod yang berikutnya insya-Allah: Pengepungan Bani Quraizah.', 'order' => 41],
            ['start_time' => 373.36, 'end_time' => 373.76, 'target_text' => 'Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'Semoga selawat dan salam tercurah ke atas Nabi Muhammad dan seluruh keluarga serta sahabat baginda.', 'order' => 42],
        ];

        $records = [];
        foreach ($subtitles as $sub) {
            $records[] = [
                'id'          => (string) Str::uuid(),
                'video_id'    => $video->id,
                'start_time'  => $sub['start_time'],
                'end_time'    => $sub['end_time'],
                'target_text' => $sub['target_text'],
                'source_text' => $sub['source_text'],
                'order'       => $sub['order'],
                'created_at'  => now(),
                'updated_at'  => now(),
            ];
        }

        foreach (array_chunk($records, 50) as $chunk) {
            DB::table('video_subtitles')->insert($chunk);
        }
    }
}
