<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo29Seeder extends Seeder
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

        // Special Bilingual Religious Video #29 (Siri 1 Ep.24): The Battle of Khaybar | Life of the Final Messenger ﷺ | Ep.24 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'Ay8sLvO2jGQ'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Battle of Khaybar | Life of the Final Messenger ﷺ | Ep.24 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/Ay8sLvO2jGQ/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 29,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.08, 'end_time' => 7.28, 'target_text' => 'and he lifted a fortress gate to defend himself. A feat witnessed by seven companions who later tried', 'source_text' => '...dan beliau mengangkat daun pintu gerbang kubu untuk mempertahankan dirinya. Satu kehebatan yang disaksikan oleh tujuh orang sahabat yang kemudiannya cuba', 'order' => 1],
            ['start_time' => 7.28, 'end_time' => 14.4, 'target_text' => 'to lift it together but couldn\'t. They offered to remain on the land working in its fields in return', 'source_text' => 'mengangkatnya bersama-sama namun tidak berdaya. Mereka merayu untuk terus tinggal di tanah itu bagi mengusahakan ladang-ladangnya sebagai balasan', 'order' => 2],
            ['start_time' => 14.4, 'end_time' => 22.32, 'target_text' => 'for half its produce. My beloved brothers and sisters, after the treaty of al-Hudaybiyyah,', 'source_text' => 'kepada separuh daripada hasil buminya. Saudara dan saudariku yang dikasihi, setelah termeterainya Perjanjian Hudaibiyyah,', 'order' => 3],
            ['start_time' => 22.32, 'end_time' => 28.24, 'target_text' => 'many believed the Muslims had accepted weakness. But strength is not always loud.', 'source_text' => 'ramai yang menyangka bahawa kaum Muslimin telah menerima kelemahan. Namun kekuatan bukanlah sentiasa bergema lantang.', 'order' => 4],
            ['start_time' => 28.24, 'end_time' => 35.52, 'target_text' => 'Sometimes strength is patience. Khaybar stood as a fortress of stone and pride.', 'source_text' => 'Kadangkala kekuatan yang hakiki itu adalah kesabaran. Khaibar berdiri megah sebagai sebuah kubu batu dan keangkuhan.', 'order' => 5],
            ['start_time' => 35.52, 'end_time' => 42.8, 'target_text' => 'But no wall can stand when Allah has written its fall. So come with me to', 'source_text' => 'Namun tiada satu tembok pun yang mampu bertahan apabila Allah telah menetapkan keruntuhannya. Maka hayutilah bersama saya', 'order' => 6],
            ['start_time' => 42.8, 'end_time' => 54.48, 'target_text' => 'the day when the banner of Islam was carried by a heart filled with unshakable certainty.', 'source_text' => 'detik tatkala panji Islam dijulang oleh sekeping sanubari yang dipenuhi keyakinan yang tidak tergoyahkan.', 'order' => 7],
            ['start_time' => 62.88, 'end_time' => 68, 'target_text' => 'After returning from Hudaybiyyah, the Messenger of Allah peace be upon him stayed only a short', 'source_text' => 'Sekembalinya daripada Hudaibiyyah, Rasulullah ﷺ hanya bermastautin untuk seketika', 'order' => 8],
            ['start_time' => 68, 'end_time' => 77.2, 'target_text' => 'while in Medina before marching once more, this time toward Khaybar in the seventh year after Hijrah.', 'source_text' => 'di Madinah sebelum kembali memimpin perarakan tentera, kali ini menuju ke Khaibar pada tahun ketujuh Hijrah.', 'order' => 9],
            ['start_time' => 77.2, 'end_time' => 84.64, 'target_text' => 'Khaybar was a land of strongholds and wealth, home to tribes who had supported Quraysh and plotted against', 'source_text' => 'Khaibar merupakan bumi perkubuan kukuh dan kekayaan, tempat tinggal kabilah-kabilah yang pernah menyokong Quraisy dan bersekongkol menentang', 'order' => 10],
            ['start_time' => 84.64, 'end_time' => 90.72, 'target_text' => 'Islam. As the Prophet peace be upon him prepared, he appointed one of his trusted companions to', 'source_text' => 'Islam. Tatkala Nabi ﷺ bersiap sedia, baginda melantik salah seorang sahabat kepercayaannya untuk', 'order' => 11],
            ['start_time' => 90.72, 'end_time' => 98.32, 'target_text' => 'oversee Medina and entrusted the banner of command to Ali ibn Abi Talib, may Allah be pleased with him.', 'source_text' => 'mengawasi Madinah dan mengamanahkan panji kepimpinan kepada Ali bin Abi Talib RA.', 'order' => 12],
            ['start_time' => 98.32, 'end_time' => 105.2, 'target_text' => 'The army advanced through the dark valleys of Hijaz. Along the way, the companions sang lines', 'source_text' => 'Bala tentera mara merentasi lurah-lurah gelap Hijaz. Di sepanjang perjalanan, para sahabat melantunkan bait-bait syair', 'order' => 13],
            ['start_time' => 105.2, 'end_time' => 112.88, 'target_text' => 'of courage: "By Allah, had it not been for Allah, we would not have been guided, nor given charity,', 'source_text' => 'keberanian: "Demi Allah, jikalau bukan kerana petunjuk Allah, nescaya kami tidak mendapat hidayah, tidak bersedekah,', 'order' => 14],
            ['start_time' => 112.88, 'end_time' => 119.52, 'target_text' => 'nor prayed. Send down tranquility upon us, and make firm our feet if we face the enemy."', 'source_text' => 'dan tidak pula mendirikan solat. Maka turunkanlah ketenteraman ke atas kami, dan teguhkanlah pendirian kami sekiranya kami bertembung dengan musuh."', 'order' => 15],
            ['start_time' => 119.52, 'end_time' => 125.36, 'target_text' => 'The Prophet peace be upon him smiled and said, "May Allah have mercy on you." Umar,', 'source_text' => 'Nabi ﷺ tersenyum seraya bersabda, "Semoga Allah merahmatimu." Umar,', 'order' => 16],
            ['start_time' => 125.36, 'end_time' => 130.96, 'target_text' => 'may Allah be pleased with him, said, "Victory is assured by Allah." When dawn broke, the people', 'source_text' => 'semoga Allah meredhainya, berkata, "Kemenangan pasti dijamin oleh Allah." Tatkala fajar menyingsing, penduduk', 'order' => 17],
            ['start_time' => 130.96, 'end_time' => 137.04, 'target_text' => 'of Khaybar came out with their tools and baskets. But as soon as they saw the army approaching,', 'source_text' => 'Khaibar keluar membawa cangkul dan bakul-bakul tanaman mereka. Namun sebaik sahaja mereka melihat ketumbukan tentera Islam menghampiri,', 'order' => 18],
            ['start_time' => 137.04, 'end_time' => 144.08, 'target_text' => 'they shouted in fear, "Muhammad and the army!" The Prophet peace be upon him raised his voice,', 'source_text' => 'mereka menjerit ketakutan, "Muhammad dan tenteranya!" Maka Nabi ﷺ melaungkan suaranya,', 'order' => 19],
            ['start_time' => 144.08, 'end_time' => 153.6, 'target_text' => '"Allahu Akbar! Khaybar is ruined! Whenever we descend upon a people, what an evil morning it is for those warned!"', 'source_text' => '"Allahu Akbar! Hancurlah Khaibar! Sesungguhnya apabila kami turun melanda perkarangan sesebuah kaum, maka amat buruklah pagi hari bagi orang-orang yang telah diberi peringatan!"', 'order' => 20],
            ['start_time' => 153.6, 'end_time' => 161.52, 'target_text' => 'Khaybar was made of seven great fortresses, each a mountain of stone and pride. The Prophet', 'source_text' => 'Khaibar terbina daripada tujuh buah benteng kubu yang hebat, setiap satunya ibarat gunung batu dan keangkuhan. Nabi', 'order' => 21],
            ['start_time' => 161.52, 'end_time' => 170.16, 'target_text' => 'peace be upon him surrounded them one by one. The first fortress fell. There Mahmud ibn Maslamah was martyred', 'source_text' => 'ﷺ mengepung kubu-kubu tersebut satu demi satu. Benteng pertama berjaya ditawan. Di situ Mahmud bin Maslamah gugur syahid', 'order' => 22],
            ['start_time' => 170.16, 'end_time' => 179.28, 'target_text' => 'when a millstone was dropped upon him. Then fell the next one, the stronghold of Banu Abi al-Huqayq. Among', 'source_text' => 'apabila batu kisaran dijatuhkan ke atasnya. Kemudian tumpas pula benteng seterusnya, kubu kukuh Bani Abi al-Huqaiq. Antara', 'order' => 23],
            ['start_time' => 179.28, 'end_time' => 186.96, 'target_text' => 'the captives was Safiyyah bint Huyayy, daughter of the chief of Banu Nadir, a woman of noble lineage and faith.', 'source_text' => 'tawanan perang ialah Safiyyah binti Huyayy, anak perempuan kepada ketua Bani al-Nadir, seorang wanita bernasab mulia dan beriman.', 'order' => 24],
            ['start_time' => 186.96, 'end_time' => 194.16, 'target_text' => 'She was brought to the Prophet peace be upon him. He honored her, freed her, and later married her,', 'source_text' => 'Beliau dibawa menghadap Nabi ﷺ. Baginda memuliakannya, memerdekakannya, dan kemudiannya mengahwininya,', 'order' => 25],
            ['start_time' => 194.16, 'end_time' => 202, 'target_text' => 'thus uniting two tribes that had once been enemies. From within the fortress came a warrior,', 'source_text' => 'sekali gus menyatukan dua kabilah yang suatu ketika dahulu bermusuhan. Dari dalam benteng kubu itu muncul seorang pahlawan,', 'order' => 26],
            ['start_time' => 202, 'end_time' => 213.76, 'target_text' => 'Marhab, a giant clad in armor, roaring, "Khaybar knows that I am Marhab, armed and valiant when battle flames rise!" He', 'source_text' => 'Marhab, seorang gergasi perkasa berbaju zirah yang mengaum bangga, "Khaibar mengenali aku Marhab, pahlawan bersenjata gagah tatkala api perang marak menjulang!" Dia', 'order' => 27],
            ['start_time' => 213.76, 'end_time' => 220.8, 'target_text' => 'challenged the Muslims, and Muhammad ibn Maslamah stepped forward. He struck Marhab down in combat, avenging', 'source_text' => 'mencabar kaum Muslimin, lalu Muhammad bin Maslamah melangkah mara ke hadapan. Beliau menumpaskan Marhab dalam pertarungan satu lawan satu, membela', 'order' => 28],
            ['start_time' => 220.8, 'end_time' => 229.84, 'target_text' => 'his brother\'s death. Then another, Yasir, came out and was slain by the young al-Zubayr ibn al-Awwam, fulfilling the', 'source_text' => 'kematian saudaranya. Kemudian seorang lagi musuh, Yasir, keluar mencabar dan ditumpaskan oleh pemuda al-Zubair bin al-Awwam, menyempurnakan', 'order' => 29],
            ['start_time' => 229.84, 'end_time' => 236.4, 'target_text' => 'Prophet\'s peace be upon him words to Safiyyah: "Your son will slay him, insha\'Allah." The Prophet peace be', 'source_text' => 'sabdaan Nabi ﷺ kepada bondanya Safiyyah: "Anakmu pasti akan menewaskannya, insya-Allah." Kemudian Nabi', 'order' => 30],
            ['start_time' => 236.4, 'end_time' => 242.32, 'target_text' => 'upon him then said, "Tomorrow I will give the banner to a man who loves Allah and His Messenger, and', 'source_text' => 'ﷺ bersabda, "Esok hari aku akan menyerahkan panji perang ini kepada seorang lelaki yang mencintai Allah dan Rasul-Nya, serta', 'order' => 31],
            ['start_time' => 242.32, 'end_time' => 250.8, 'target_text' => 'Allah and His Messenger love him; through him Allah will grant victory." The companions waited eagerly.', 'source_text' => 'Allah dan Rasul-Nya mencintainya; melalui tangannyalah Allah akan mengurniakan kemenangan." Para sahabat menanti dengan penuh debaran.', 'order' => 32],
            ['start_time' => 250.8, 'end_time' => 257.6, 'target_text' => 'The next morning he called for Ali ibn Abi Talib, may Allah be pleased with him, whose eyes were sore.', 'source_text' => 'Keesokan paginya baginda memanggil Ali bin Abi Talib RA, yang matanya ketika itu sedang sakit pedih.', 'order' => 33],
            ['start_time' => 257.6, 'end_time' => 266, 'target_text' => 'The Prophet peace be upon him blew in them with some saliva and supplicated, and Ali was healed. He', 'source_text' => 'Nabi ﷺ meniup pada kedua matanya dengan sedikit air liur baginda seraya berdoa, lantas mata Ali sembuh serta-merta. Baginda', 'order' => 34],
            ['start_time' => 266, 'end_time' => 274.56, 'target_text' => 'gave him the banner and said, "Go forward and do not turn back until Allah grants victory." Ali ibn Abi Talib,', 'source_text' => 'menyerahkan panji itu kepadanya seraya bersabda, "Maralah ke hadapan dan jangan berpaling ke belakang sehinggalah Allah mengurniakan kemenangan." Ali bin Abi Talib', 'order' => 35],
            ['start_time' => 274.56, 'end_time' => 280.72, 'target_text' => 'may Allah be pleased with him, advanced crying "Allahu Akbar!" and fought with immense courage. At', 'source_text' => 'semoga Allah meredhainya, mara melaungkan takbir "Allahu Akbar!" dan bertempur dengan keberanian yang luar biasa. Pada', 'order' => 36],
            ['start_time' => 280.72, 'end_time' => 288.24, 'target_text' => 'one point his shield fell and he lifted a fortress gate to defend himself. A feat witnessed by seven', 'source_text' => 'satu ketika perisainya terlepas lalu beliau menjulang daun pintu gerbang kubu untuk mempertahankan dirinya. Kehebatan luar biasa yang disaksikan oleh tujuh orang', 'order' => 37],
            ['start_time' => 288.24, 'end_time' => 295.12, 'target_text' => 'companions who later tried to lift it together but couldn\'t. One by one the fortresses fell', 'source_text' => 'sahabat yang kemudiannya cuba mengangkat pintu itu bersama-sama namun tidak berdaya. Satu demi satu benteng kubu itu tumbang', 'order' => 38],
            ['start_time' => 295.12, 'end_time' => 302.48, 'target_text' => 'until the last surrendered after a long siege. The people of Khaybar, realizing their defeat, pleaded for', 'source_text' => 'sehinggalah kubu terakhir menyerah kalah setelah dikepung berhari-hari. Penduduk Khaibar yang menyedari kekalahan mereka merayu meminta', 'order' => 39],
            ['start_time' => 302.48, 'end_time' => 309.92, 'target_text' => 'peace. They offered to remain on the land working in its fields in return for half its produce.', 'source_text' => 'perdamaian. Mereka menawarkan diri untuk terus menetap di tanah itu bagi mengusahakan ladang-ladangnya sebagai balasan kepada separuh hasil tanaman.', 'order' => 40],
            ['start_time' => 309.92, 'end_time' => 316.88, 'target_text' => 'The Prophet peace be upon him agreed saying, "We will keep you as long as we will." Thus,', 'source_text' => 'Nabi ﷺ bersetuju seraya bersabda, "Kami membiarkan kamu menetap selama mana kami kehendaki." Maka demikianlah,', 'order' => 41],
            ['start_time' => 316.88, 'end_time' => 324.16, 'target_text' => 'Khaybar was divided between the Muslims and its people, a symbol of both strength and mercy. After peace', 'source_text' => 'hasil bumi Khaibar dibahagikan antara kaum Muslimin dan penduduknya, menjadi lambang ketegasan kekuatan dan keluasan rahmat. Setelah keamanan', 'order' => 42],
            ['start_time' => 324.16, 'end_time' => 331.76, 'target_text' => 'was declared, Zaynab bint al-Harith, a Jewish woman, sent the Prophet peace be upon him a roasted lamb', 'source_text' => 'diisytiharkan, Zaynab binti al-Harith, seorang wanita Yahudi, menghadiahkan seekor kambing panggang kepada Nabi ﷺ', 'order' => 43],
            ['start_time' => 331.76, 'end_time' => 338.64, 'target_text' => 'secretly poisoned. He took one bite and said, "This bone tells me it is poisoned." He spat', 'source_text' => 'yang disuntik racun secara rahsia. Baginda mengambil satu suapan lalu bersabda, "Tulang ini memberitahuku bahawa ia beracun." Baginda segera meludahkan', 'order' => 44],
            ['start_time' => 338.64, 'end_time' => 348.64, 'target_text' => 'it out. But Bishr ibn al-Bara\', who had eaten with him, swallowed a portion and later died. The Prophet', 'source_text' => 'daging itu keluar. Namun Bishr bin al-Bara\' yang makan bersama baginda sempat menelan sebahagiannya dan kemudiannya meninggal dunia. Nabi', 'order' => 45],
            ['start_time' => 348.64, 'end_time' => 356.96, 'target_text' => 'peace be upon him would say, "The poison of Khaybar still affects me." After the Prophet peace be upon him', 'source_text' => 'ﷺ kemudiannya pernah bersabda, "Kesan bisa racun Khaibar masih terasa pada diriku." Setelah itu Nabi ﷺ', 'order' => 46],
            ['start_time' => 356.96, 'end_time' => 364.32, 'target_text' => 'moved towards Wadi al-Qura which surrendered peacefully and then returned to Medina, he distributed the', 'source_text' => 'berangkat mara ke Wadi al-Qura yang menyerah diri secara damai lalu baginda kembali ke Madinah. Baginda mengagihkan', 'order' => 47],
            ['start_time' => 364.32, 'end_time' => 370.64, 'target_text' => 'spoils with fairness and gratitude. The women who had aided in the battle, tending to the', 'source_text' => 'harta rampasan perang dengan penuh keadilan dan kesyukuran. Kaum wanita yang turut membantu di medan juang, merawat para pejuang', 'order' => 48],
            ['start_time' => 370.64, 'end_time' => 377.76, 'target_text' => 'wounded, were also granted a share. That night the Prophet peace be upon him married Safiyyah, may Allah', 'source_text' => 'yang tercedera, turut diberikan bahagian harta rampasan. Pada malam itu Nabi ﷺ melangsungkan perkahwinan bersama Safiyyah, semoga Allah', 'order' => 49],
            ['start_time' => 377.76, 'end_time' => 384.72, 'target_text' => 'be pleased with her, and Abu Ayyub al-Ansari stood guard outside his tent, sword drawn. When the Prophet', 'source_text' => 'meredhainya, manakala Abu Ayyub al-Ansari RA berdiri berkawal di luar khemah dengan pedang terhunus. Tatkala Nabi', 'order' => 50],
            ['start_time' => 384.72, 'end_time' => 393.44, 'target_text' => 'peace be upon him awoke, he prayed: "O Allah, protect Abu Ayyub as he protected me!" Khaybar stood as a fortress of', 'source_text' => 'ﷺ terjaga, baginda mendoakan: "Ya Allah, peliharalah Abu Ayyub sebagaimana beliau telah menjagaku!" Khaibar yang dahulunya berdiri megah sebagai lambang', 'order' => 51],
            ['start_time' => 393.44, 'end_time' => 401.12, 'target_text' => 'arrogance, yet fell through faith, unity, and divine aid. The companions saw that no wall is high enough', 'source_text' => 'keangkuhan akhirnya tewas melalui keimanan, kesatuan ukhuwah, dan pertolongan Ilahi. Para sahabat menyaksikan tiada tembok yang cukup tinggi', 'order' => 52],
            ['start_time' => 401.12, 'end_time' => 407.92, 'target_text' => 'and no fortress is strong enough to stand against the will of Allah. Victory belongs to Allah. He', 'source_text' => 'dan tiada kubu yang cukup kebal untuk menentang kehendak Allah. Sesungguhnya kemenangan adalah milik mutlak Allah. Dia', 'order' => 53],
            ['start_time' => 407.92, 'end_time' => 416.24, 'target_text' => 'grants it to whom He wills. And so Khaybar fell, not by numbers or power, but by certainty and trust in', 'source_text' => 'mengurniakannya kepada sesiapa yang dikehendaki-Nya. Maka tewaslah Khaibar, bukan semata-mata kerana bilangan atau kekuatan, melainkan kerana keyakinan dan tawakal kepada', 'order' => 54],
            ['start_time' => 416.24, 'end_time' => 423.12, 'target_text' => 'Allah. The believers returned strengthened in faith, in unity, and in conviction.', 'source_text' => 'Allah. Kaum mukminin pulang dengan keimanan, kesatuan, dan keyakinan yang semakin teguh terpateri.', 'order' => 55],
            ['start_time' => 423.12, 'end_time' => 431.76, 'target_text' => 'But beyond lay a new test, a battlefield unlike any before, where commanders would fall, but the', 'source_text' => 'Namun di hadapan sana terbentang suatu ujian baharu, sebuah medan pertempuran yang belum pernah disaksikan sebelumnya, tatkala para panglima perang gugur syahid, namun', 'order' => 56],
            ['start_time' => 431.76, 'end_time' => 445.68, 'target_text' => 'message would not. In the next episode, insha\'Allah, we will walk toward Mu\'tah. Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'risalah dakwah tetap megah berkibar. Dalam episod seterusnya, insya-Allah, kita akan menuju ke medan perang Mu\'tah. Selawat dan salam ke atas junjungan Nabi Muhammad dan seluruh keluarga serta para sahabat baginda sekalian.', 'order' => 57],
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
