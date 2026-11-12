<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo22Seeder extends Seeder
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

        // Special Bilingual Religious Video #22 (Siri 1 Ep.17): The Battle of Uhud | Life of the Final Messenger ﷺ | Ep.17 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'OTwmuzD-n2w'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Battle of Uhud | Life of the Final Messenger ﷺ | Ep.17 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/OTwmuzD-n2w/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 22,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.08, 'end_time' => 2.7, 'target_text' => 'The earth trembles as Quraysh advances.', 'source_text' => 'Bumi bergegar tatkala kaum Quraisy mara ke hadapan.', 'order' => 1],
            ['start_time' => 2.8, 'end_time' => 4.38, 'target_text' => 'His blade flashes.', 'source_text' => 'Bilah matanya berkilauan pantas.', 'order' => 2],
            ['start_time' => 4.48, 'end_time' => 9.66, 'target_text' => 'Tearing through the ranks lurks Wahshi, the Abyssinian spearman.', 'source_text' => 'Merempuh barisan tentera, mengendaplah Wahshi, seorang perejam lembing berbangsa Habsyi.', 'order' => 3],
            ['start_time' => 9.76, 'end_time' => 13.419, 'target_text' => 'Then in a single breath, the spear flies.', 'source_text' => 'Kemudian dalam sekelip mata, lembing itu meluncur laju.', 'order' => 4],
            ['start_time' => 13.519, 'end_time' => 18.06, 'target_text' => 'It pierces Hamzah\'s side and emerges through him.', 'source_text' => 'Ia menusuk rusuk Hamzah dan menembusi jasadnya.', 'order' => 5],
            ['start_time' => 18.16, 'end_time' => 24.04, 'target_text' => 'The lion of Allah falls and the mountain falls silent.', 'source_text' => 'Singa Allah rebah, dan gunung Uhud terdiam sunyi.', 'order' => 6],
            ['start_time' => 27.039, 'end_time' => 33.26, 'target_text' => 'Bismillahir Rahmanir Rahim. My beloved brothers and sisters, today we stand before a moment heavy with meaning.', 'source_text' => 'Bismillahir Rahmanir Rahim. Saudara dan saudariku yang dikasihi, hari ini kita berdiri di hadapan suatu detik yang sarat dengan makna.', 'order' => 7],
            ['start_time' => 33.36, 'end_time' => 38.38, 'target_text' => 'After the triumph at Badr, the hearts of the believers carried strength and hope.', 'source_text' => 'Selepas kemenangan gilang-gemilang di Badar, hati kaum mukminin dipenuhi kekuatan dan harapan.', 'order' => 8],
            ['start_time' => 38.48, 'end_time' => 41.02, 'target_text' => 'But faith is not measured only in victory.', 'source_text' => 'Namun keimanan tidak diukur hanya melalui kemenangan.', 'order' => 9],
            ['start_time' => 41.12, 'end_time' => 45.66, 'target_text' => 'It is tested in loss, in patience, and in trust.', 'source_text' => 'Ia diuji tatkala menghadapi kehilangan, dalam kesabaran, dan dalam pergantungan kepada Allah.', 'order' => 10],
            ['start_time' => 45.76, 'end_time' => 49.5, 'target_text' => 'And so a mountain rises before us.', 'source_text' => 'Dan begitulah tersergamnya sebuah gunung di hadapan kita.', 'order' => 11],
            ['start_time' => 49.6, 'end_time' => 57.96, 'target_text' => 'Uhud, a mountain that has witnessed tears, courage, and lessons that would echo through centuries.', 'source_text' => 'Uhud, sebuah gunung yang telah menyaksikan titisan air mata, keberanian waja, dan iktibar yang bergema merentasi zaman.', 'order' => 12],
            ['start_time' => 58.239, 'end_time' => 66.94, 'target_text' => 'Come with me to a day when the believers walked with certainty and yet were reminded that victory is not in numbers nor in', 'source_text' => 'Marilah bersama saya menyelami hari tatkala kaum mukminin melangkah dengan penuh keyakinan, namun diingatkan bahawa kemenangan bukanlah pada bilangan tentera atau', 'order' => 13],
            ['start_time' => 67.04, 'end_time' => 71.72, 'target_text' => 'strategy, but in remaining steadfast with Allah.', 'source_text' => 'pada strategi semata-mata, sebaliknya pada keteguhan hati bersama Allah.', 'order' => 14],
            ['start_time' => 84.799, 'end_time' => 88.86, 'target_text' => 'The desert wind carries a heavy silence over Mount Uhud.', 'source_text' => 'Angin padang pasir membawa keheningan yang sayu di atas Gunung Uhud.', 'order' => 15],
            ['start_time' => 88.96, 'end_time' => 90.46, 'target_text' => 'Dust rises.', 'source_text' => 'Debu-debu berterbangan ke udara.', 'order' => 16],
            ['start_time' => 90.56, 'end_time' => 93.5, 'target_text' => 'Armor gleams beneath the morning sun.', 'source_text' => 'Baju-baju zirah berkilauan di bawah sinaran matahari pagi.', 'order' => 17],
            ['start_time' => 93.6, 'end_time' => 97.26, 'target_text' => 'In Makkah, the wounds of Badr still burn.', 'source_text' => 'Di Mekah, luka kekalahan di Badar masih membakar jiwa.', 'order' => 18],
            ['start_time' => 97.36, 'end_time' => 104.699, 'target_text' => 'Fathers, sons, and brothers, all seeking revenge, gather under Abu Sufyan\'s banner.', 'source_text' => 'Para bapa, anak-anak, dan saudara mara, kesemuanya menuntut bela, berhimpun di bawah panji Abu Sufyan.', 'order' => 19],
            ['start_time' => 104.799, 'end_time' => 106.46, 'target_text' => 'Gold is collected.', 'source_text' => 'Harta emas dikumpulkan.', 'order' => 20],
            ['start_time' => 106.56, 'end_time' => 108.14, 'target_text' => 'Swords are forged.', 'source_text' => 'Pedang-pedang ditempa rapi.', 'order' => 21],
            ['start_time' => 108.24, 'end_time' => 110.78, 'target_text' => 'Quraysh rides again.', 'source_text' => 'Bala tentera Quraisy berkuda mara sekali lagi.', 'order' => 22],
            ['start_time' => 110.88, 'end_time' => 115.18, 'target_text' => 'That night, the Messenger of Allah, peace be upon him, sees a dream.', 'source_text' => 'Pada malam tersebut, Rasulullah ﷺ telah bermimpi.', 'order' => 23],
            ['start_time' => 115.28, 'end_time' => 121.339, 'target_text' => 'He sees a cow being slaughtered, a sign of his companions martyred.', 'source_text' => 'Baginda melihat seekor lembu disembelih, satu petanda para sahabat baginda akan gugur syahid.', 'order' => 24],
            ['start_time' => 121.439, 'end_time' => 126.299, 'target_text' => 'He sees a gap in his sword, the loss of a family member,', 'source_text' => 'Baginda melihat serpihan pada mata pedangnya, petanda kehilangan seorang ahli keluarganya,', 'order' => 25],
            ['start_time' => 126.399, 'end_time' => 133.66, 'target_text' => 'and he places his hand inside a strong armor, a sign that Medina will be safe.', 'source_text' => 'dan baginda meletakkan tangannya ke dalam baju besi yang kukuh, petanda bahawa Madinah akan selamat.', 'order' => 26],
            ['start_time' => 133.76, 'end_time' => 140.139, 'target_text' => 'He tells his companions, "If you remain within Medina, they will not enter upon you."', 'source_text' => 'Baginda bersabda kepada para sahabatnya, "Sekiranya kamu kekal berada di dalam Madinah, mereka tidak akan dapat menceroboh kamu."', 'order' => 27],
            ['start_time' => 140.239, 'end_time' => 149.74, 'target_text' => 'But young companions, those who missed Badr, eager for martyrdom, plead, "O Messenger of Allah, lead us out to our enemies.', 'source_text' => 'Namun para sahabat muda, mereka yang terlepas perang Badar dan mendambakan syahid, merayu, "Wahai Rasulullah, bawalah kami keluar berhadapan musuh.', 'order' => 28],
            ['start_time' => 149.84, 'end_time' => 155.9, 'target_text' => 'Let them not think we feared them." The Prophet peace be upon him reluctantly agrees.', 'source_text' => 'Jangan biarkan mereka menyangka kita gentar terhadap mereka." Nabi ﷺ akhirnya menyetujuinya.', 'order' => 29],
            ['start_time' => 156, 'end_time' => 158.62, 'target_text' => 'The army sets out with a thousand men.', 'source_text' => 'Bala tentera Islam berangkat keluar dengan kekuatan seribu orang pejuang.', 'order' => 30],
            ['start_time' => 158.72, 'end_time' => 164.38, 'target_text' => 'But on the way, Abdullah ibn Ubayy turns back with 300 hypocrites.', 'source_text' => 'Namun di pertengahan jalan, Abdullah ibn Ubayy berpaling undur bersama 300 orang kaum munafik.', 'order' => 31],
            ['start_time' => 164.48, 'end_time' => 167.34, 'target_text' => 'The mountain of Uhud stands tall before them.', 'source_text' => 'Gunung Uhud berdiri megah di hadapan mereka.', 'order' => 32],
            ['start_time' => 167.44, 'end_time' => 171.9, 'target_text' => 'The Prophet peace be upon him takes position with his back to the mountain,', 'source_text' => 'Nabi ﷺ mengambil posisi pertahanan dengan membelakangi gunung,', 'order' => 33],
            ['start_time' => 172, 'end_time' => 174.06, 'target_text' => 'the valley stretching ahead.', 'source_text' => 'manakala lembah terbentang luas di hadapan.', 'order' => 34],
            ['start_time' => 174.16, 'end_time' => 180.139, 'target_text' => 'He appoints Abdullah ibn Jubayr and 50 archers on the hill.', 'source_text' => 'Baginda melantik Abdullah ibn Jubair bersama 50 orang pemanah di atas bukit.', 'order' => 35],
            ['start_time' => 180.239, 'end_time' => 182.779, 'target_text' => '"Protect our backs with your arrows.', 'source_text' => '"Lindungilah belakang kami dengan anak-anak panah kamu.', 'order' => 36],
            ['start_time' => 182.879, 'end_time' => 187.419, 'target_text' => 'Do not leave your posts even if you see us winning or defeated."', 'source_text' => 'Jangan sesekali meninggalkan pos kamu walau kamu melihat kami menang ataupun tewas."', 'order' => 37],
            ['start_time' => 187.519, 'end_time' => 190.38, 'target_text' => 'The earth trembles as Quraysh advances.', 'source_text' => 'Bumi bergegar tatkala tentera Quraisy mara menyerang.', 'order' => 38],
            ['start_time' => 190.48, 'end_time' => 192.219, 'target_text' => 'Women beat their drums.', 'source_text' => 'Wanita-wanita mereka memalu gendang perang.', 'order' => 39],
            ['start_time' => 192.319, 'end_time' => 197.1, 'target_text' => 'Hind bint \'Utbah chants vengeful poems.', 'source_text' => 'Hindun binti \'Utbah mendendangkan syair ratapan dendam kesumat.', 'order' => 40],
            ['start_time' => 197.2, 'end_time' => 200.7, 'target_text' => 'Dust and steel collide beneath the mountain.', 'source_text' => 'Debu dan kilauan pedang besi bertembung sengit di kaki gunung.', 'order' => 41],
            ['start_time' => 200.8, 'end_time' => 202.62, 'target_text' => 'Abu Dujana steps forward.', 'source_text' => 'Abu Dujanah melangkah mara ke hadapan.', 'order' => 42],
            ['start_time' => 202.72, 'end_time' => 206.38, 'target_text' => 'The Prophet peace be upon him hands him his blessed sword.', 'source_text' => 'Nabi ﷺ menyerahkan pedang baginda yang diberkati kepadanya.', 'order' => 43],
            ['start_time' => 206.48, 'end_time' => 210.38, 'target_text' => '"Who will take this sword and give it its due right?"', 'source_text' => '"Siapakah yang sanggup mengambil pedang ini dan menunaikan haknya yang sebenar?"', 'order' => 44],
            ['start_time' => 210.48, 'end_time' => 217.66, 'target_text' => '"What is its right, O Messenger of Allah?" "That you strike with it until it bends."', 'source_text' => '"Apakah haknya, wahai Rasulullah?" "Iaitu engkau memukul dengannya sehingga ia membengkok."', 'order' => 45],
            ['start_time' => 217.76, 'end_time' => 225.72, 'target_text' => 'Abu Dujana ties a red band around his head, the mark of death, and then charges.', 'source_text' => 'Abu Dujanah mengikat kain merah di kepalanya, lambang keazaman menempuh maut, lalu terus menyerbu.', 'order' => 46],
            ['start_time' => 226.239, 'end_time' => 233.34, 'target_text' => 'Hamzah ibn Abdil Muttalib, may Allah be pleased with him, roars into battle like a lion of Allah.', 'source_text' => 'Hamzah bin Abdul Muttalib, semoga Allah meredhainya, mengaum di medan pertempuran laksana singa Allah.', 'order' => 47],
            ['start_time' => 233.44, 'end_time' => 236.54, 'target_text' => 'His blade flashes, tearing through the ranks.', 'source_text' => 'Mata pedangnya berkilauan, membelah dan merempuh barisan musuh.', 'order' => 48],
            ['start_time' => 236.64, 'end_time' => 240.3, 'target_text' => 'The banner of Quraysh falls again and again.', 'source_text' => 'Panji kaum Quraisy tumbang berkali-kali.', 'order' => 49],
            ['start_time' => 240.4, 'end_time' => 246.38, 'target_text' => 'But in the shadows lurks Wahshi, the Abyssinian spearman,', 'source_text' => 'Namun di balik bayang-bayang kegelapan, mengendaplah Wahshi, perejam lembing berbangsa Habsyi,', 'order' => 50],
            ['start_time' => 246.48, 'end_time' => 249.58, 'target_text' => 'promised freedom if he kills Hamzah.', 'source_text' => 'yang dijanjikan kebebasan daripada perhambaan sekiranya dia berjaya membunuh Hamzah.', 'order' => 51],
            ['start_time' => 249.68, 'end_time' => 253.8, 'target_text' => 'He waits until Hamzah strikes down an enemy.', 'source_text' => 'Dia menunggu sehingga Hamzah selesai menumpaskan musuh.', 'order' => 52],
            ['start_time' => 254.239, 'end_time' => 257.9, 'target_text' => 'Then in a single breath, the spear flies.', 'source_text' => 'Kemudian dalam satu hembusan nafas yang pantas, lembing itu meluncur.', 'order' => 53],
            ['start_time' => 258, 'end_time' => 262.539, 'target_text' => 'It pierces Hamzah\'s side and emerges through him.', 'source_text' => 'Ia menembusi rusuk Hamzah dan menembusi tubuhnya.', 'order' => 54],
            ['start_time' => 262.639, 'end_time' => 268.6, 'target_text' => 'The lion of Allah falls and the mountain falls silent.', 'source_text' => 'Rebahlah singa Allah, dan gunung Uhud terdiam terpaku.', 'order' => 55],
            ['start_time' => 271.28, 'end_time' => 275.74, 'target_text' => 'When Quraysh flee, many archers believe the battle is won.', 'source_text' => 'Tatkala Quraisy mula berundur lari, ramai pemanah menyangka pertempuran telah pun dimenangi.', 'order' => 56],
            ['start_time' => 275.84, 'end_time' => 280.62, 'target_text' => 'They descend to collect spoils, leaving the hill unguarded.', 'source_text' => 'Mereka turun untuk mengutip harta rampasan perang, meninggalkan bukit tanpa kawalan.', 'order' => 57],
            ['start_time' => 280.72, 'end_time' => 285.02, 'target_text' => 'From the rear, Khalid ibn al-Walid leads a cavalry charge.', 'source_text' => 'Dari arah belakang, Khalid bin al-Walid memimpin serbuan pasukan berkuda.', 'order' => 58],
            ['start_time' => 285.12, 'end_time' => 286.7, 'target_text' => 'The trap closes.', 'source_text' => 'Perangkap mula mencengkam.', 'order' => 59],
            ['start_time' => 286.8, 'end_time' => 288.379, 'target_text' => 'Chaos erupts.', 'source_text' => 'Kekalutan dahsyat tercetus.', 'order' => 60],
            ['start_time' => 288.479, 'end_time' => 291.42, 'target_text' => 'Arrows rain from every side.', 'source_text' => 'Hujan anak panah mencurah-curah dari segenap penjuru.', 'order' => 61],
            ['start_time' => 291.52, 'end_time' => 292.94, 'target_text' => 'Cries spread:', 'source_text' => 'Jeritan mula tersebar:', 'order' => 62],
            ['start_time' => 293.04, 'end_time' => 294.539, 'target_text' => '"Muhammad has been killed!"', 'source_text' => '"Muhammad telah dibunuh!"', 'order' => 63],
            ['start_time' => 294.639, 'end_time' => 304.14, 'target_text' => 'But the Prophet peace be upon him calls out, "To me, O servants of Allah!" Bleeding, wounded, and shielded by his companions, he', 'source_text' => 'Namun Nabi ﷺ berseru lantang, "Kemarilah kepadaku, wahai hamba-hamba Allah!" Dalam keadaan berdarah, terluka, dan diperisai para sahabatnya, baginda', 'order' => 64],
            ['start_time' => 304.24, 'end_time' => 305.98, 'target_text' => 'is pushed toward the mountain.', 'source_text' => 'dibawa berundur rapat ke arah lereng gunung.', 'order' => 65],
            ['start_time' => 306.08, 'end_time' => 308.939, 'target_text' => 'The battlefield is strewn with the fallen.', 'source_text' => 'Medan pertempuran dipenuhi dengan jasad para syuhada yang gugur.', 'order' => 66],
            ['start_time' => 309.039, 'end_time' => 311.58, 'target_text' => '70 martyrs lie in the valley.', 'source_text' => '70 orang syuhada terbaring kaku di lembah Uhud.', 'order' => 67],
            ['start_time' => 311.68, 'end_time' => 316.06, 'target_text' => 'Among them Hamzah, the uncle of the Prophet peace be upon him,', 'source_text' => 'Antara mereka ialah Hamzah, bapa saudara Nabi ﷺ,', 'order' => 68],
            ['start_time' => 316.16, 'end_time' => 317.98, 'target_text' => 'may Allah be pleased with him.', 'source_text' => 'semoga Allah meredhainya.', 'order' => 69],
            ['start_time' => 318.08, 'end_time' => 320.52, 'target_text' => 'The Quran reveals:', 'source_text' => 'Al-Quran merakamkan hakikat ini:', 'order' => 70],
            ['start_time' => 328, 'end_time' => 331.58, 'target_text' => '"Do not think those killed in the path of Allah are dead.', 'source_text' => '"Janganlah kamu mengira bahawa orang-orang yang gugur di jalan Allah itu mati;', 'order' => 71],
            ['start_time' => 331.68, 'end_time' => 335.34, 'target_text' => 'Rather, they are alive with their Lord receiving provision."', 'source_text' => 'sebaliknya mereka hidup di sisi Tuhan mereka dengan mendapat rezeki."', 'order' => 72],
            ['start_time' => 335.44, 'end_time' => 341.42, 'target_text' => 'It was the day when courage was tested and faith was refined in fire.', 'source_text' => 'Ia merupakan hari tatkala keberanian diuji dan keimanan disaring di dalam api perjuangan.', 'order' => 73],
            ['start_time' => 341.52, 'end_time' => 345.42, 'target_text' => 'The day when the tide turned at Uhud.', 'source_text' => 'Hari tatkala arus pertempuran beralih arah di Uhud.', 'order' => 74],
            ['start_time' => 345.52, 'end_time' => 349.26, 'target_text' => 'And so the field of Uhud lay silent.', 'source_text' => 'Maka terdiam sepi medan peperangan Uhud.', 'order' => 75],
            ['start_time' => 349.36, 'end_time' => 352.379, 'target_text' => 'Not every day ends in triumph.', 'source_text' => 'Bukan setiap hari berakhir dengan kejayaan manis.', 'order' => 76],
            ['start_time' => 352.479, 'end_time' => 357.099, 'target_text' => 'Some days are written for reflection, humility, and growth.', 'source_text' => 'Ada hari-hari yang ditakdirkan untuk muhasabah diri, ketundukan jiwa, dan kematangan rohani.', 'order' => 77],
            ['start_time' => 357.199, 'end_time' => 363.659, 'target_text' => 'For even when the body is wounded and the heart is shaken, Allah never abandons the believer.', 'source_text' => 'Kerana walaupun jasad terluka dan sanubari tergoncang hebat, Allah tidak sesekali meninggalkan orang yang beriman.', 'order' => 78],
            ['start_time' => 363.759, 'end_time' => 372.78, 'target_text' => 'The lessons of Uhud were not of defeat but of guidance to teach this ummah that standing firm is not in the absence of pain but', 'source_text' => 'Iktibar di Uhud bukanlah tentang kekalahan semata-mata, melainkan petunjuk bagi mengajar ummah ini bahawa ketabahan bukan bererti ketiadaan kesakitan, sebaliknya', 'order' => 79],
            ['start_time' => 372.88, 'end_time' => 375.9, 'target_text' => 'in trusting Allah through it.', 'source_text' => 'bergantung harap sepenuhnya kepada Allah tatkala melaluinya.', 'order' => 80],
            ['start_time' => 376, 'end_time' => 384.839, 'target_text' => 'In the next episode, insha\'Allah, we will witness how the believers healed, rose again, and learned the meaning of sacrifice.', 'source_text' => 'Dalam episod seterusnya, insya-Allah, kita akan menyaksikan bagaimana kaum mukminin merawat luka, bangkit semula, dan memahami erti pengorbanan.', 'order' => 81],
            ['start_time' => 385.44, 'end_time' => 387.559, 'target_text' => 'Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'Semoga selawat dan salam tercurah ke atas Nabi Muhammad dan seluruh keluarga serta para sahabat baginda.', 'order' => 82],
        ];

        $now = now();
        foreach (array_chunk($subtitles, 50) as $chunk) {
            $insertData = [];
            foreach ($chunk as $sub) {
                $insertData[] = [
                    'id'          => (string) Str::uuid(),
                    'video_id'    => $video->id,
                    'start_time'  => $sub['start_time'],
                    'end_time'    => $sub['end_time'],
                    'target_text' => $sub['target_text'],
                    'source_text' => $sub['source_text'],
                    'order'       => $sub['order'],
                    'created_at'  => $now,
                    'updated_at'  => $now,
                ];
            }
            DB::table('video_subtitles')->insert($insertData);
        }
    }
}
