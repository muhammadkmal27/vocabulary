<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo30Seeder extends Seeder
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

        // Special Bilingual Religious Video #30 (Siri 1 Ep.25): The Battle of Muʾtah | Life of the Final Messenger ﷺ | Ep.25 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'mu0BjJXXExY'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Battle of Muʾtah | Life of the Final Messenger ﷺ | Ep.25 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/mu0BjJXXExY/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 30,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.64, 'end_time' => 8.32, 'target_text' => '100,000 Roman soldiers and an equal number from Arab tribes allied to the Byzantines. So', 'source_text' => '...100,000 tentera Rom dan jumlah yang sama daripada kabilah-kabilah Arab yang bersekutu dengan Byzantine. Maka', 'order' => 1],
            ['start_time' => 8.32, 'end_time' => 15.2, 'target_text' => 'he pressed the banner to his chest until he was struck down. Seventy wounds upon his body,', 'source_text' => 'beliau mendakap panji itu ke dadanya sehinggalah beliau gugur ditetak. Tujuh puluh kesan luka pada tubuhnya,', 'order' => 2],
            ['start_time' => 15.2, 'end_time' => 23.28, 'target_text' => 'none in his back. "Zayd has taken the banner and he has fallen. Now Ja\'far has taken it and he has fallen. Now Ibn Rawahah has', 'source_text' => 'tiada satu pun di belakang tubuhnya. "Zaid telah menjulang panji dan beliau telah gugur. Kini Ja\'far mengambilnya dan beliau pula gugur. Sekarang Ibn Rawahah', 'order' => 3],
            ['start_time' => 23.28, 'end_time' => 31.52, 'target_text' => 'taken it and he too has fallen." My beloved brothers and sisters, some stories in our', 'source_text' => 'menjulang panji itu dan beliau juga telah gugur." Saudara dan saudariku yang dikasihi, sebahagian kisah dalam lembaran', 'order' => 4],
            ['start_time' => 31.52, 'end_time' => 37.84, 'target_text' => 'history are written not in victory or triumph, but in courage, loyalty, and love for Allah and', 'source_text' => 'sejarah kita tidak tertulis dengan kemenangan megah atau penaklukan semata-mata, melainkan dengan keberanian, kesetiaan, dan kecintaan kepada Allah serta', 'order' => 5],
            ['start_time' => 37.84, 'end_time' => 46.64, 'target_text' => 'His Messenger. Mu\'tah was a battlefield far from home. No familiar lands, no supporting forces,', 'source_text' => 'Rasul-Nya. Mu\'tah merupakan medan pertempuran yang amat jauh dari tanah air. Tiada bumi yang dikenali, tiada bala bantuan sokongan,', 'order' => 6],
            ['start_time' => 46.64, 'end_time' => 55.52, 'target_text' => 'only faith. The believers marched not to conquer land, but to uphold justice. So come with me to', 'source_text' => 'hanyalah perisai keimanan. Kaum mukminin mara bukan untuk menjajah bumi, melainkan untuk menegakkan keadilan. Maka hayutilah bersama saya', 'order' => 7],
            ['start_time' => 55.52, 'end_time' => 75.76, 'target_text' => 'the moment when three commanders fell as martyrs, yet the banner of Islam did not fall with them.', 'source_text' => 'detik tatkala tiga orang panglima perang gugur syahid, namun panji Islam sama sekali tidak pernah rebah bersama mereka.', 'order' => 8],
            ['start_time' => 75.76, 'end_time' => 80.72, 'target_text' => 'The dust of Khaybar had barely settled when a letter arrived in Medina, a', 'source_text' => 'Debu-debu perang Khaibar baru sahaja reda tatkala sepucuk warkah tiba di Madinah, suatu', 'order' => 9],
            ['start_time' => 80.72, 'end_time' => 89.12, 'target_text' => 'message drenched in tragedy. The Prophet peace be upon him sent a messenger, al-Harith ibn \'Umayr al-Azdi,', 'source_text' => 'perkhabaran yang diselubungi kedukaan. Nabi ﷺ telah mengutuskan seorang utusan rasmi, al-Harith bin \'Umair al-Azdi,', 'order' => 10],
            ['start_time' => 89.12, 'end_time' => 97.12, 'target_text' => 'carrying peace and an invitation to Islam. But before he reached his destination, he was seized and slain', 'source_text' => 'yang membawa perutusan damai dan seruan dakwah Islam. Namun sebelum sempat tiba ke destinasinya, beliau telah ditangkap dan dibunuh kejam', 'order' => 11],
            ['start_time' => 97.12, 'end_time' => 106.16, 'target_text' => 'by Shurahbil ibn \'Amr al-Ghassani, governor under the Byzantines — the only envoy of the Prophet peace be upon him ever', 'source_text' => 'oleh Syurahbil bin \'Amr al-Ghassani, gabenor di bawah naungan kerajaan Byzantine — satu-satunya utusan Nabi ﷺ yang pernah', 'order' => 12],
            ['start_time' => 106.16, 'end_time' => 113.44, 'target_text' => 'killed in such a way. The Messenger of Allah peace be upon him gathered the people and declared: "Take', 'source_text' => 'dibunuh sedemikian rupa. Maka Rasulullah ﷺ mengumpulkan kaum Muslimin seraya mengisytiharkan: "Tuntutlah', 'order' => 13],
            ['start_time' => 113.44, 'end_time' => 122.88, 'target_text' => 'revenge for your companion, may Allah be pleased with him." He appointed Zayd ibn Harithah as commander of the', 'source_text' => 'keadilan bagi sahabatmu yang dizalimi ini." Baginda melantik Zaid bin Harithah RA sebagai panglima utama mengetuai', 'order' => 14],
            ['start_time' => 122.88, 'end_time' => 132.72, 'target_text' => '3,000 men saying, "If Zayd is martyred, then Ja\'far; if Ja\'far is martyred, then Abdullah ibn Rawahah; and if he falls,', 'source_text' => '3,000 tentera seraya bersabda, "Sekiranya Zaid gugur syahid, maka Ja\'far penggantinya; jika Ja\'far gugur syahid, maka Abdullah bin Rawahah; dan sekiranya beliau gugur,', 'order' => 15],
            ['start_time' => 132.72, 'end_time' => 140, 'target_text' => 'let the Muslims choose among themselves." They marched northward through the lands of the Hijaz,', 'source_text' => 'maka biarlah kaum Muslimin memilih seorang ketua dalam kalangan mereka." Mereka mara berarak ke arah utara merentasi bumi Hijaz,', 'order' => 16],
            ['start_time' => 140, 'end_time' => 148.88, 'target_text' => 'passing valleys and deserts until they reached Mu\'tah. There they learned of the enemy\'s strength:', 'source_text' => 'melepasi lurah-lurah bukit dan padang pasir sehinggalah mereka tiba di bumi Mu\'tah. Di sanalah mereka mengetahui kekuatan sebenar pihak musuh:', 'order' => 17],
            ['start_time' => 148.88, 'end_time' => 156.72, 'target_text' => '100,000 Roman soldiers and an equal number from Arab tribes allied to the Byzantines.', 'source_text' => '100,000 tentera Rom dan bilangan yang sama daripada kabilah-kabilah Arab yang bersekutu dengan empayar Byzantine.', 'order' => 18],
            ['start_time' => 156.72, 'end_time' => 162.32, 'target_text' => 'The companions consulted among themselves: should they send word to the Prophet peace be upon him or', 'source_text' => 'Para sahabat bermesyuarat sesama mereka: wajarkah mereka menghantar utusan memohon arahan lanjut daripada Nabi ﷺ atau', 'order' => 19],
            ['start_time' => 162.32, 'end_time' => 169.6, 'target_text' => 'advance? Then Abdullah ibn Rawahah, may Allah be pleased with him, rose, his voice steady: "O people,', 'source_text' => 'terus mara ke hadapan? Lantas Abdullah bin Rawahah RA bangkit dengan suara yang tegas dan tenang: "Wahai kaumku,', 'order' => 20],
            ['start_time' => 169.6, 'end_time' => 175.52, 'target_text' => 'we do not fight by numbers or power. We fight for the faith Allah has honored us with. One', 'source_text' => 'kita tidak pernah berjuang bersandarkan jumlah bilangan tentera ataupun kelengkapan senjata. Kita berjuang demi agama yang Allah muliakan kita dengannya. Salah satu', 'order' => 21],
            ['start_time' => 175.52, 'end_time' => 183.12, 'target_text' => 'of two good things awaits us: victory or martyrdom!" The army shouted, "By Allah,', 'source_text' => 'daripada dua kebaikan pasti menanti kita: kemenangan ataupun mati syahid!" Bala tentera melaungkan, "Demi Allah,', 'order' => 22],
            ['start_time' => 183.12, 'end_time' => 190.24, 'target_text' => 'he has spoken the truth!" And they marched on, hearts burning with conviction. The two armies', 'source_text' => 'benarlah apa yang diperkatakannya!" Lalu mereka mara ke hadapan dengan dada yang membakar penuh keyakinan. Kedua-dua bala tentera', 'order' => 23],
            ['start_time' => 190.24, 'end_time' => 196.88, 'target_text' => 'met on the plains of Mu\'tah. The grounds trembled under the charge of horses and shields, the', 'source_text' => 'bertembung di dataran Mu\'tah. Bumi bergegar di bawah derapan kaki kuda perang dan lagaan perisai, tatkala', 'order' => 24],
            ['start_time' => 196.88, 'end_time' => 203.92, 'target_text' => 'cry of "Allahu Akbar!" echoing through the valley. Zayd ibn Harithah, may Allah be pleased with him, grasped the', 'source_text' => 'laungan takbir "Allahu Akbar!" bergema memenuhi segenap lurah. Zaid bin Harithah RA menggenggam erat', 'order' => 25],
            ['start_time' => 203.92, 'end_time' => 211.12, 'target_text' => 'banner of the Prophet peace be upon him and fought until he fell, pierced by arrows. Then Ja\'far ibn Abi Talib,', 'source_text' => 'panji Rasulullah ﷺ dan bertempur gagah sehinggalah beliau gugur syahid ditembusi panah musuh. Kemudian Ja\'far bin Abi Talib', 'order' => 26],
            ['start_time' => 211.12, 'end_time' => 217.12, 'target_text' => 'may Allah be pleased with him, took it, leapt from his horse, and fought like a lion. His right arm', 'source_text' => 'semoga Allah meredhainya, menyambut panji itu, melompat turun dari kudanya, lalu bertarung laksana singa yang perkasa. Lengan kanannya', 'order' => 27],
            ['start_time' => 217.12, 'end_time' => 223.76, 'target_text' => 'was struck off, and so he held the banner in his left. That too was cut. So he pressed the banner', 'source_text' => 'ditetak putus, lantas beliau memegang panji itu dengan tangan kirinya. Tangan kirinya pula terputus. Maka beliau mendakap panji itu', 'order' => 28],
            ['start_time' => 223.76, 'end_time' => 232.08, 'target_text' => 'to his chest until he was struck down. Seventy wounds upon his body, none in his back. The Prophet peace', 'source_text' => 'ke dadanya sehinggalah beliau gugur rebah. Terdapat tujuh puluh kesan tikaman dan tetakan pada tubuhnya, tiada satu pun di belakang tubuhnya. Nabi', 'order' => 29],
            ['start_time' => 232.08, 'end_time' => 238.64, 'target_text' => 'be upon him would later say: "Allah replaced his arms with two wings with which he flies', 'source_text' => 'ﷺ kemudiannya bersabda: "Allah telah menggantikan kedua-dua tangannya dengan dua sayap yang membolehkannya terbang', 'order' => 30],
            ['start_time' => 238.64, 'end_time' => 247.6, 'target_text' => 'in Paradise wherever he wishes." From that day he was called Ja\'far al-Tayyar, the one who flies, may Allah', 'source_text' => 'di dalam syurga ke mana sahaja yang beliau kehendaki." Sejak hari itu beliau digelar Ja\'far al-Tayyar (Ja\'far sang penerbang), semoga Allah', 'order' => 31],
            ['start_time' => 247.6, 'end_time' => 254.8, 'target_text' => 'be pleased with him. Then came Abdullah ibn Rawahah, may Allah be pleased with him, reciting verses to strengthen', 'source_text' => 'meredhainya. Kemudian majulah Abdullah bin Rawahah RA, melantunkan bait-bait syair untuk meneguhkan', 'order' => 32],
            ['start_time' => 254.8, 'end_time' => 261.52, 'target_text' => 'his soul: "O my soul, if you are not slain, you will die anyway. This is your appointed death;', 'source_text' => 'jiwanya: "Wahai jiwaku, jika engkau tidak gugur di medan juang, engkau pasti akan mati juga. Inilah ketetapan ajalmu;', 'order' => 33],
            ['start_time' => 261.52, 'end_time' => 269.6, 'target_text' => 'so why fear the truth?" He hesitated only for a breath, then advanced until he too was martyred.', 'source_text' => 'maka mengapa harus gentar pada kebenaran?" Beliau hanya teragak-agak seketika, lalu mara bertarung sehinggalah beliau turut gugur syahid.', 'order' => 34],
            ['start_time' => 269.6, 'end_time' => 276.32, 'target_text' => 'The Prophet peace be upon him, though far away in Medina, began to describe what was happening', 'source_text' => 'Nabi ﷺ walaupun berada jauh di Madinah, mula menggambarkan apa yang sedang berlaku di medan Mu\'tah', 'order' => 35],
            ['start_time' => 276.32, 'end_time' => 286, 'target_text' => 'as if before his eyes: "Zayd has taken the banner and he has fallen. Now Ja\'far has taken it and he', 'source_text' => 'seolah-olah terpampang di hadapan mata baginda: "Zaid telah menjulang panji dan beliau telah gugur. Kini Ja\'far mengambilnya dan beliau', 'order' => 36],
            ['start_time' => 286, 'end_time' => 295.36, 'target_text' => 'has fallen. Now Ibn Rawahah has taken it and he too has fallen." His eyes filled with tears as he said,', 'source_text' => 'pula gugur. Sekarang Ibn Rawahah mengambilnya dan beliau juga telah gugur." Kedua-dua mata Nabi ﷺ berlinangan air mata seraya bersabda,', 'order' => 37],
            ['start_time' => 295.36, 'end_time' => 302.4, 'target_text' => '"They are all with their Lord, seated on thrones of gold. I saw a difference between them: Ibn Rawahah', 'source_text' => '"Mereka semua kini berada di sisi Tuhan mereka, bersemayam di atas takhta-takhta emas. Aku melihat sedikit perbezaan darjat antara mereka: Ibn Rawahah', 'order' => 38],
            ['start_time' => 302.4, 'end_time' => 310.08, 'target_text' => 'hesitated for a moment, then followed them." When all three commanders fell, Thabit ibn Aqram seized the banner and', 'source_text' => 'sempat teragak-agak seketika sebelum menyusul mereka." Tatkala ketiga-tiga panglima gugur, Thabit bin Aqram menyambar panji itu lalu', 'order' => 39],
            ['start_time' => 310.08, 'end_time' => 317.04, 'target_text' => 'cried out: "O Muslims, choose for yourself a leader!" They chose Khalid ibn al-Walid, may Allah be pleased with', 'source_text' => 'melaungkan: "Wahai kaum Muslimin, pilihlah seorang pemimpin bagi diri kamu!" Maka mereka memilih Khalid bin al-Walid RA,', 'order' => 40],
            ['start_time' => 317.04, 'end_time' => 324.8, 'target_text' => 'him, who fought fiercely, breaking nine swords in his hands that day. With strategy and courage,', 'source_text' => 'yang bertempur dengan begitu dahsyat sehingga mematahkan sembilan bilah pedang di tangannya pada hari itu. Berbekalkan strategi licik dan keberanian,', 'order' => 41],
            ['start_time' => 324.8, 'end_time' => 332, 'target_text' => 'he shielded the army, maneuvering until night fell, and both sides withdrew. Though outnumbered,', 'source_text' => 'beliau melindungi barisan tentera, mengatur gerak muslihat ketenteraan hingga malam menjelang, dan kedua-dua pihak berundur. Walaupun kalah dari segi jumlah,', 'order' => 42],
            ['start_time' => 332, 'end_time' => 340.64, 'target_text' => 'the Muslims returned safely — not defeated, but preserved by divine wisdom. When they neared', 'source_text' => 'kaum Muslimin berjaya pulang dengan selamat — bukan ditewaskan, sebaliknya dipelihara oleh kebijaksanaan hikmah Ilahi. Apabila mereka menghampiri', 'order' => 43],
            ['start_time' => 340.64, 'end_time' => 346.96, 'target_text' => 'Medina, some came out shouting, "O deserters!" The Prophet peace be upon him said, "They are not', 'source_text' => 'Madinah, segelintir orang keluar melaungkan kecaman, "Wahai orang-orang yang lari dari perang!" Namun Nabi ﷺ bersabda, "Mereka bukanlah', 'order' => 44],
            ['start_time' => 346.96, 'end_time' => 354.48, 'target_text' => 'deserters; they are the defenders of Islam." When news reached Medina, the Prophet peace be upon him', 'source_text' => 'pelarian; sebaliknya mereka adalah para perwira pejuang Islam yang akan kembali bertempur." Tatkala khabar duka sampai ke Madinah, Nabi ﷺ', 'order' => 45],
            ['start_time' => 354.48, 'end_time' => 360.32, 'target_text' => 'went to the house of Ja\'far, may Allah be pleased with him. He embraced Ja\'far\'s children, his eyes', 'source_text' => 'segera menziarahi rumah Ja\'far RA. Baginda memeluk anak-anak yatim Ja\'far, sedang kedua-dua mata baginda', 'order' => 46],
            ['start_time' => 360.32, 'end_time' => 368.32, 'target_text' => 'filled with tears. Asma\' bint \'Umays, may Allah be pleased with her, who was Ja\'far\'s wife, said, "O Messenger', 'source_text' => 'berlinangan air mata. Asma\' binti \'Umais RA, isteri kepada Ja\'far, berkata, "Wahai Rasulullah,', 'order' => 47],
            ['start_time' => 368.32, 'end_time' => 377.12, 'target_text' => 'of Allah, why do you weep? Has news reached you?" He replied, "Yes, they were martyred today." Then he said,', 'source_text' => 'mengapakah engkau menangis? Adakah perkhabaran dari medan juang telah sampai kepadamu?" Baginda menjawab, "Benar, mereka telah gugur syahid hari ini." Kemudian baginda bersabda,', 'order' => 48],
            ['start_time' => 377.12, 'end_time' => 384.16, 'target_text' => '"Prepare food for the family of Ja\'far; they are too stricken to prepare it for themselves." For three days', 'source_text' => '"Sediakanlah makanan untuk keluarga Ja\'far; sesungguhnya mereka kini diselubungi kedukaan yang menghalang mereka menyediakannya sendiri." Selama tiga hari', 'order' => 49],
            ['start_time' => 384.16, 'end_time' => 391.2, 'target_text' => 'the city mourned. The Prophet peace be upon him comforted every home that had lost a son. Mu\'tah was', 'source_text' => 'seluruh kota Madinah berdukacita. Nabi ﷺ menyantuni dan menenteramkan setiap rumah yang kehilangan anak tersayang. Mu\'tah bukanlah', 'order' => 50],
            ['start_time' => 391.2, 'end_time' => 398.56, 'target_text' => 'not a defeat; it was a testament to faith where three banners fell, but the message did not. In', 'source_text' => 'suatu kekalahan; ia adalah bukti keteguhan iman tatkala tiga panji pimpinan gugur, namun risalah dakwah tidak pernah rebah. Melalui', 'order' => 51],
            ['start_time' => 398.56, 'end_time' => 405.52, 'target_text' => 'their sacrifice, the light of Islam reached the lands beyond Arabia. Think not of those who are', 'source_text' => 'pengorbanan mereka, cahaya Islam mula menyinari bumi di luar Semenanjung Tanah Arab. Janganlah kamu sekali-kali menyangka bahawa orang-orang yang', 'order' => 52],
            ['start_time' => 405.52, 'end_time' => 416.08, 'target_text' => 'slain in the way of Allah as dead. Nay, they are alive with their Lord, receiving provision.', 'source_text' => 'gugur di jalan Allah itu mati. Bahkan mereka sebenarnya hidup di sisi Tuhan mereka dengan mendapat rezeki limpah kurnia-Nya.', 'order' => 53],
            ['start_time' => 420.8, 'end_time' => 427.92, 'target_text' => 'And so Mu\'tah was not a victory of the sword, but of the heart — a lesson in loyalty and', 'source_text' => 'Maka Mu\'tah bukanlah sekadar kemenangan mata pedang, sebaliknya kemenangan sanubari — suatu iktibar agung tentang kesetiaan dan', 'order' => 54],
            ['start_time' => 427.92, 'end_time' => 435.52, 'target_text' => 'steadfastness. Those who returned did not return defeated, but honored. And beyond this chapter', 'source_text' => 'keteguhan jiwa. Mereka yang pulang tidak kembali dalam kehinaan, sebaliknya dimuliakan. Dan di sebalik lembaran peristiwa ini,', 'order' => 55],
            ['start_time' => 435.52, 'end_time' => 441.44, 'target_text' => 'lay a horizon long awaited: the return to Makkah. In the next episode,', 'source_text' => 'terbentang ufuk yang sekian lama dinanti-nantikan: kepulangan semula ke kota Makkah. Dalam episod seterusnya,', 'order' => 56],
            ['start_time' => 441.44, 'end_time' => 455.2, 'target_text' => 'insha\'Allah, we will witness the moment that changed history: the Conquest of Makkah. Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'insya-Allah, kita akan menyaksikan saat bersejarah yang merubah peta peradaban dunia: Pembukaan Kota Makkah (Fathu Makkah). Selawat dan salam ke atas junjungan Nabi Muhammad dan seluruh keluarga serta para sahabat baginda sekalian.', 'order' => 57],
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
