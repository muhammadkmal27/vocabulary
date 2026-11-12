<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo24Seeder extends Seeder
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

        // Special Bilingual Religious Video #24 (Siri 1 Ep.19): The Siege of Banu al-Nadir | Life of the Final Messenger ﷺ | Ep.19 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'Je-6cTCJtwM'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Siege of Banu al-Nadir | Life of the Final Messenger ﷺ | Ep.19 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/Je-6cTCJtwM/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 24,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.32, 'end_time' => 5.6, 'target_text' => 'The Prophet peace be upon him sent to them a message: "Leave Medina within ten', 'source_text' => 'Nabi ﷺ mengirimkan suatu perutusan kepada mereka: "Tinggalkanlah Madinah dalam tempoh sepuluh', 'order' => 1],
            ['start_time' => 5.6, 'end_time' => 12.88, 'target_text' => 'days. Whoever remains shall face war." Their courage melted into fear. The Prophet peace', 'source_text' => 'hari. Sesiapa yang masih berdegil akan berdepan peperangan." Keberanian mereka lebur menjadi ketakutan. Nabi ﷺ', 'order' => 2],
            ['start_time' => 12.88, 'end_time' => 21.04, 'target_text' => 'be upon him distributed their lands among the Muhajirin. My beloved brothers and sisters,', 'source_text' => 'mengagihkan tanah-tanah peninggalan mereka kepada kaum Muhajirin. Saudara dan saudariku yang dikasihi,', 'order' => 3],
            ['start_time' => 21.04, 'end_time' => 28.24, 'target_text' => 'after the pain of Uhud and the reflections that followed, Medina entered a time of caution.', 'source_text' => 'selepas kepedihan perang Uhud dan muhasabah yang menyusul, Madinah melangkah ke fasa penuh kewaspadaan.', 'order' => 4],
            ['start_time' => 28.24, 'end_time' => 36.88, 'target_text' => 'The wounds of battle had begun to heal. But not all wounds are on the battlefield. Sometimes the', 'source_text' => 'Luka-luka pertempuran kian pulih. Namun bukanlah semua luka berada di medan perang. Kadang-kadang', 'order' => 5],
            ['start_time' => 36.88, 'end_time' => 43.04, 'target_text' => 'greatest tests come from those who live close. Among the people of Medina were tribes who', 'source_text' => 'ujian yang paling hebat datang daripada mereka yang tinggal berdekatan. Antara penduduk Madinah ialah kabilah-kabilah yang', 'order' => 6],
            ['start_time' => 43.04, 'end_time' => 49.52, 'target_text' => 'had agreed to peace and loyalty. But when the believers were weakened, their true intentions', 'source_text' => 'telah memeterai perjanjian damai dan taat setia. Namun tatkala kaum mukminin kelihatan lemah, niat sebenar mereka', 'order' => 7],
            ['start_time' => 49.52, 'end_time' => 57.68, 'target_text' => 'surfaced. This is a story of trust, betrayal, strategy, and wisdom. So come with me to the', 'source_text' => 'mula terbongkar. Inilah kisah tentang kepercayaan, pengkhianatan, strategi, dan kebijaksanaan. Maka marilah bersama saya ke', 'order' => 8],
            ['start_time' => 57.68, 'end_time' => 78.24, 'target_text' => 'days when the Prophet peace be upon him protected the unity of Medina with patience and justice.', 'source_text' => 'zaman tatkala Nabi ﷺ memelihara perpaduan Madinah dengan kesabaran dan keadilan.', 'order' => 9],
            ['start_time' => 78.24, 'end_time' => 86.64, 'target_text' => 'Medina stood quiet under the morning sun. The wounds of Uhud had barely healed. Yet new unrest', 'source_text' => 'Kota Madinah berdiri tenang di bawah sinaran matahari pagi. Luka-luka perang Uhud baru sahaja reda. Namun keresahan baharu', 'order' => 10],
            ['start_time' => 86.64, 'end_time' => 95.04, 'target_text' => 'stirred in its heart. Among the tribes who lived within its walls were Banu al-Nadir, known for their', 'source_text' => 'mula bergolak di dalam kotanya. Antara kabilah yang menetap di dalam lingkungannya ialah Bani an-Nadhir, yang terkenal dengan', 'order' => 11],
            ['start_time' => 95.04, 'end_time' => 101.2, 'target_text' => 'strength, their wealth, and their knowledge of scripture. They had once signed a pact with the', 'source_text' => 'kekuatan, kekayaan, dan pengetahuan mereka tentang kitab suci. Mereka dahulunya pernah menandatangani perjanjian dengan', 'order' => 12],
            ['start_time' => 101.2, 'end_time' => 108.32, 'target_text' => 'Messenger of Allah, peace be upon him, a covenant of peace and loyalty. But treachery had begun to', 'source_text' => 'Rasulullah ﷺ, suatu ikrar perdamaian dan kesetiaan. Namun benih pengkhianatan mula', 'order' => 13],
            ['start_time' => 108.32, 'end_time' => 115.12, 'target_text' => 'grow in secret whispers. One day the Prophet peace be upon him went to them seeking help in paying', 'source_text' => 'bercambah dalam bisikan rahsia. Pada suatu hari, Nabi ﷺ pergi menemui mereka untuk meminta bantuan membayar', 'order' => 14],
            ['start_time' => 115.12, 'end_time' => 122.8, 'target_text' => 'blood money for two men killed by mistake. He sat by the wall of one of their houses surrounded by', 'source_text' => 'wang pampasan darah (diyat) bagi dua orang lelaki yang terbunuh secara tidak sengaja. Baginda duduk di tepi dinding salah sebuah rumah mereka sambil dikelilingi oleh', 'order' => 15],
            ['start_time' => 122.8, 'end_time' => 131.28, 'target_text' => 'their leaders. Among them were Huyayy ibn Akhtab and Sallam ibn Mishkam, men of cunning and pride. While they', 'source_text' => 'para pemimpin mereka. Antara mereka ialah Huyai bin Akhtab dan Sallam bin Misykam, tokoh-tokoh yang penuh tipu muslihat dan keangkuhan. Semasa mereka', 'order' => 16],
            ['start_time' => 131.28, 'end_time' => 137.68, 'target_text' => 'pretended to welcome him, one whispered to another, "Who will climb the wall and drop a rock upon him', 'source_text' => 'berpura-pura menyambut baginda, salah seorang daripada mereka berbisik kepada yang lain, "Siapakah yang sanggup memanjat dinding dan menjatuhkan seketul batu besar ke atasnya', 'order' => 17],
            ['start_time' => 137.68, 'end_time' => 144.72, 'target_text' => 'to end this?" But Allah the protector revealed their plot to His Messenger peace be upon him.', 'source_text' => 'bagi menamatkan semua ini?" Namun Allah Yang Maha Memelihara mewahyukan tipu daya jahat mereka kepada Rasul-Nya ﷺ.', 'order' => 18],
            ['start_time' => 144.72, 'end_time' => 163.52, 'target_text' => 'He rose quietly and departed before the trap could fall. That evening revelation descended:', 'source_text' => 'Baginda bangkit dengan tenang lalu beredar sebelum perangkap tersebut dapat dijatuhkan. Pada petang itu, wahyu al-Quran pun diturunkan:', 'order' => 19],
            ['start_time' => 163.52, 'end_time' => 169.36, 'target_text' => '"O you who believe, remember Allah\'s favor upon you when a people intended to harm you,', 'source_text' => '"Wahai orang-orang yang beriman, kenanglah nikmat Allah ke atas kamu tatkala suatu kaum berniat jahat hendak mencederakan kamu,', 'order' => 20],
            ['start_time' => 169.36, 'end_time' => 176.72, 'target_text' => 'but He withheld their hands from you." The Prophet peace be upon him sent to them a message: "Leave', 'source_text' => 'lalu Allah menahan tangan-tangan mereka daripada menyentuh kamu." Nabi ﷺ lantas mengirimkan utusan tegas kepada mereka: "Keluarlah', 'order' => 21],
            ['start_time' => 176.72, 'end_time' => 186, 'target_text' => 'Medina within ten days. Whoever remains shall face war." But they refused. The hypocrite', 'source_text' => 'meninggalkan Madinah dalam tempoh sepuluh hari. Sesiapa yang masih tinggal akan menghadapi peperangan." Namun mereka enggan. Ketua kaum munafik,', 'order' => 22],
            ['start_time' => 186, 'end_time' => 195.12, 'target_text' => 'Abdullah ibn Ubayy sent word, "Stand firm. We will fight beside you." Encouraged by false promises,', 'source_text' => 'Abdullah ibn Ubayy mengirim perutusan, "Kekallah bertahan. Kami akan berjuang bersama-sama kamu." Didorong oleh janji-janji palsu ini,', 'order' => 23],
            ['start_time' => 195.12, 'end_time' => 202.24, 'target_text' => 'Banu al-Nadir barricaded themselves in their fortresses. The Prophet peace be upon him surrounded them,', 'source_text' => 'Bani an-Nadhir mengurung diri mereka di dalam benteng-benteng kubu mereka. Nabi ﷺ mengepung mereka,', 'order' => 24],
            ['start_time' => 202.24, 'end_time' => 210.24, 'target_text' => 'cutting off their supplies. Days passed. Their courage melted into fear. After six nights', 'source_text' => 'memutuskan bekalan makanan dan minuman mereka. Hari demi hari berlalu. Keberanian mereka lebur menjadi ketakutan. Selepas enam malam', 'order' => 25],
            ['start_time' => 210.24, 'end_time' => 218, 'target_text' => 'of siege, their hearts broke. No ally came. No promise was fulfilled. They surrendered.', 'source_text' => 'pengepungan, semangat mereka hancur berkecai. Tiada sekutu yang datang membantu. Tiada janji yang ditepati. Akhirnya mereka menyerah kalah.', 'order' => 26],
            ['start_time' => 218, 'end_time' => 223.28, 'target_text' => 'They packed their camels with wealth, gold and armor and left Medina,', 'source_text' => 'Mereka memuatkan unta-unta mereka dengan harta kekayaan, emas, dan baju perisai, lalu meninggalkan Madinah,', 'order' => 27],
            ['start_time' => 223.28, 'end_time' => 231.28, 'target_text' => 'their homes echoing behind them. Some journeyed to Khaybar, others to al-Sham.', 'source_text' => 'rumah-rumah mereka sunyi sepi ditinggalkan. Sebahagiannya berhijrah ke Khaibar, dan sebahagian lagi ke negeri Syam.', 'order' => 28],
            ['start_time' => 231.28, 'end_time' => 240.4, 'target_text' => 'It was a victory without bloodshed, a lesson written in the dust of betrayal.', 'source_text' => 'Ia merupakan sebuah kemenangan mutlak tanpa pertumpahan darah, suatu pengajaran agung yang terpahat di atas debu pengkhianatan.', 'order' => 29],
            ['start_time' => 244.08, 'end_time' => 251.12, 'target_text' => '"He it is who expelled those who disbelieved among the People of the Book from their homes', 'source_text' => '"Dialah yang telah mengeluarkan orang-orang kafir di antara Ahli Kitab dari kampung halaman mereka', 'order' => 30],
            ['start_time' => 251.12, 'end_time' => 259.28, 'target_text' => 'at the first gathering." As the dust settled, Abdullah ibn Ubayy stood humiliated. His promises had', 'source_text' => 'pada saat pengusiran yang pertama." Setelah debu peristiwa reda, Abdullah ibn Ubayy berdiri dalam kehinaan. Janji-janjinya telah', 'order' => 31],
            ['start_time' => 259.28, 'end_time' => 267.44, 'target_text' => 'crumbled. His allies were gone. And the believers knew his words were hollow, his loyalty false.', 'source_text' => 'hancur berkecai. Sekutu-sekutunya telah pergi. Dan kaum mukminin mengetahui bahawa kata-katanya hanyalah dusta kosong, dan kesetiaannya adalah kepalsuan belaka.', 'order' => 32],
            ['start_time' => 267.44, 'end_time' => 273.84, 'target_text' => 'The Prophet peace be upon him distributed their lands among the Muhajirin, those who had left', 'source_text' => 'Nabi ﷺ mengagihkan tanah-tanah peninggalan mereka kepada kaum Muhajirin, mereka yang telah mengorbankan', 'order' => 33],
            ['start_time' => 273.84, 'end_time' => 281.52, 'target_text' => 'everything for Allah so that none among them would remain poor. The Ansar rejoiced saying,', 'source_text' => 'segala-galanya demi Allah, agar tiada lagi dalam kalangan mereka yang hidup miskin. Kaum Ansar bergembira seraya berkata,', 'order' => 34],
            ['start_time' => 281.52, 'end_time' => 291.12, 'target_text' => '"May Allah reward our brothers. They are more in need than us." Thus, unity triumphed over deceit.', 'source_text' => '"Semoga Allah mengurniakan ganjaran buat saudara-saudara kita. Mereka lebih memerlukannya berbanding kami." Maka bersatulah keikhlasan mengatasi tipu daya.', 'order' => 35],
            ['start_time' => 291.12, 'end_time' => 298.32, 'target_text' => 'The Quran called this moment a victory granted by Allah. For no sword was raised, yet hearts', 'source_text' => 'Al-Quran menggelarkan detik ini sebagai suatu kemenangan kurniaan Allah. Kerana tiada pedang yang dihunus, namun hati-hati musuh', 'order' => 36],
            ['start_time' => 298.32, 'end_time' => 305.52, 'target_text' => 'were shaken. It was a reminder that strength lies not in walls or wealth, but in faith,', 'source_text' => 'tergoncang ketakutan. Ia adalah peringatan bahawa kekuatan hakiki bukanlah pada tembok kubu atau timbunan harta, sebaliknya pada keimanan,', 'order' => 37],
            ['start_time' => 305.52, 'end_time' => 312.48, 'target_text' => 'sincerity, and truth. And the Prophet peace be upon him taught his companions, "Trust in Allah,', 'source_text' => 'keikhlasan, dan kebenaran. Dan Nabi ﷺ berpesan kepada para sahabatnya, "Bertawakallah kepada Allah,', 'order' => 38],
            ['start_time' => 312.48, 'end_time' => 320.8, 'target_text' => 'for He alone turns hearts and writes destiny." The wind moves softly through the empty streets', 'source_text' => 'kerana Dialah yang membolak-balikkan hati dan menentukan takdir." Angin bertiup lembut merentasi lorong-lorong sunyi', 'order' => 39],
            ['start_time' => 320.8, 'end_time' => 328.96, 'target_text' => 'of Banu al-Nadir\'s fortresses, once filled with pride, now silent beneath the sun. The story', 'source_text' => 'benteng kubu Bani an-Nadhir, yang dahulunya sarat dengan keangkuhan, kini terdiam kaku di bawah sinaran matahari. Kisah', 'order' => 40],
            ['start_time' => 328.96, 'end_time' => 336.48, 'target_text' => 'of their betrayal became a warning that treachery destroys its own shelter. And those who plot in', 'source_text' => 'pengkhianatan mereka menjadi amaran bahawa kelicikan membinasakan pelindungnya sendiri. Dan sesiapa yang merancang tipu helah secara', 'order' => 41],
            ['start_time' => 336.48, 'end_time' => 344.32, 'target_text' => 'secret cannot escape the will of Allah. And so the threat was removed and the unity of Medina', 'source_text' => 'sembunyi tidak akan sesekali mampu melepaskan diri daripada kehendak Allah. Maka ancaman tersebut berjaya dilenyapkan dan perpaduan Madinah', 'order' => 42],
            ['start_time' => 344.32, 'end_time' => 352.24, 'target_text' => 'preserved. But those who carry hatred do not rest. And new alliances were forming in the shadows.', 'source_text' => 'berjaya dipelihara. Namun mereka yang memendam kebencian tidak berdiam diri. Dan pakatan-pakatan baharu mula dibentuk di balik kegelapan bayang-bayang.', 'order' => 43],
            ['start_time' => 353.12, 'end_time' => 363.52, 'target_text' => 'In the next episode, insha\'Allah, we witness the siege that would test the believers once more.', 'source_text' => 'Dalam episod seterusnya, insya-Allah, kita akan menyaksikan peristiwa pengepungan dahsyat yang bakal menguji kaum mukminin sekali lagi.', 'order' => 44],
            ['start_time' => 363.52, 'end_time' => 376.48, 'target_text' => 'Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'Semoga selawat dan salam tercurah ke atas Nabi Muhammad dan seluruh keluarga serta para sahabat baginda.', 'order' => 45],
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
