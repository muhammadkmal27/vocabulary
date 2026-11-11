<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo11Seeder extends Seeder
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

        // Special Bilingual Religious Video #11 (Siri 1 Ep.6): Iqra — When the Heavens Opened | Life of the Final Messenger ﷺ | Ep.6 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => '6M-NQKRdNuM'],
            [
                'language_id'   => $english->id,
                'title'         => 'Iqra — When the Heavens Opened | Life of the Final Messenger ﷺ | Ep.6 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/6M-NQKRdNuM/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 11,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.4, 'end_time' => 5.82, 'target_text' => 'In the solitude of his cave, Muhammad peace be upon him sat in reflection.', 'source_text' => 'Dalam kesendirian guanya, Muhammad ﷺ duduk bertafakur merenung hakikat.', 'order' => 1],
            ['start_time' => 5.92, 'end_time' => 10.22, 'target_text' => 'The angel Gibl may peace be upon him stood before him.', 'source_text' => 'Malaikat Jibril \'alaihissalam berdiri di hadapannya.', 'order' => 2],
            ['start_time' => 10.32, 'end_time' => 12.84, 'target_text' => 'His voice echoing', 'source_text' => 'Suaranya bergema menyeru:', 'order' => 3],
            ['start_time' => 13.36, 'end_time' => 15.16, 'target_text' => 'readman.', 'source_text' => '"Bacalah, wahai insan! (Iqra\')."', 'order' => 4],
            ['start_time' => 16.4, 'end_time' => 22.7, 'target_text' => 'My beloved brothers and sisters, today we arrive at the moment where history itself took a breath.', 'source_text' => 'Saudara-saudariku yang dikasihi, hari ini kita tiba pada saat di mana sejarah dunia itu sendiri seakan menahan nafasnya.', 'order' => 5],
            ['start_time' => 22.8, 'end_time' => 28.78, 'target_text' => 'The moment when the heavens opened and the final message to mankind began.', 'source_text' => 'Detik ketika pintu-pintu langit terbuka dan bermulanya penurunan risalah terakhir buat sekalian umat manusia.', 'order' => 6],
            ['start_time' => 28.88, 'end_time' => 36.54, 'target_text' => 'For years, Muhammad, peace be upon him, withdrew from the noise of the world, seeking truth in the stillness of the night.', 'source_text' => 'Bertahun-tahun lamanya, Muhammad ﷺ mengasingkan diri daripada keriuhan dunia, mendambakan kebenaran dalam keheningan malam.', 'order' => 7],
            ['start_time' => 36.64, 'end_time' => 41.74, 'target_text' => 'While Makkah slept, he climbed the mountain step by step alone.', 'source_text' => 'Tatkala kota Mekah lena dibuai tidur, baginda mendaki bukit langkah demi langkah bersendirian.', 'order' => 8],
            ['start_time' => 41.84, 'end_time' => 46.06, 'target_text' => 'His heart calling upon the one who created the stars above him.', 'source_text' => 'Sanubarinya bermunajat kepada Dia yang menciptakan taburan bintang-bintang di atasnya.', 'order' => 9],
            ['start_time' => 46.16, 'end_time' => 52.92, 'target_text' => 'There are moments in life when the soul whispers before the world changes.', 'source_text' => 'Ada detik-detik dalam kehidupan di mana sanubari berbisik sebelum berlakunya perubahan besar kepada dunia.', 'order' => 10],
            ['start_time' => 53.28, 'end_time' => 55.9, 'target_text' => 'This was one of those moments.', 'source_text' => 'Inilah salah satu daripada detik-detik agung tersebut.', 'order' => 11],
            ['start_time' => 56.0, 'end_time' => 57.58, 'target_text' => 'The desert was silent.', 'source_text' => 'Padang pasir hening membisu.', 'order' => 12],
            ['start_time' => 57.68, 'end_time' => 63.5, 'target_text' => 'The cave was still and the world did not know that mercy was about to descend.', 'source_text' => 'Gua itu sunyi sepi dan seisi dunia langsung tidak menyangka bahawa rahmat Ilahi bakal turun membasahi bumi.', 'order' => 13],
            ['start_time' => 63.6, 'end_time' => 72.78, 'target_text' => 'Tonight we enter the cave of Herra, the place where fear met comfort, where trembling met reassurance, where the voice of', 'source_text' => 'Malam ini kita melangkah masuk ke Gua Hira\', tempat di mana rasa takut bertemu ketenteraman, di mana kegerunan bertemu ketenangan jiwa, di mana suara', 'order' => 14],
            ['start_time' => 72.88, 'end_time' => 76.92, 'target_text' => 'the angel touched the hearts of the beloved.', 'source_text' => 'malaikat menyentuh sanubari kekasih Allah.', 'order' => 15],
            ['start_time' => 77.04, 'end_time' => 83.56, 'target_text' => 'This is the moment when the first word was spoken to humanity once more.', 'source_text' => 'Inilah detik ketika kalimah pertama diperdengarkan kembali kepada umat manusia.', 'order' => 16],
            ['start_time' => 98.08, 'end_time' => 105.42, 'target_text' => 'The night over Mecca was still a silence so deep that even the stars seemed to listen.', 'source_text' => 'Malam di atas kota Mekah sungguh hening, suatu kesunyian yang amat mendalam sehingga bintang-bintang seakan turut sama mendengar.', 'order' => 17],
            ['start_time' => 105.52, 'end_time' => 113.5, 'target_text' => 'Upon the mountain of Herra, in the solitude of his cave, Muhammad peace be upon him sat in reflection.', 'source_text' => 'Di atas Jabal Hira\', dalam kesendirian guanya, Muhammad ﷺ duduk bertafakur merenung hakikat.', 'order' => 18],
            ['start_time' => 113.6, 'end_time' => 121.66, 'target_text' => 'The world below slept in heedlessness, unaware that creation itself was on the edge of awakening.', 'source_text' => 'Dunia di bawah lena dalam kelalaian, tanpa menyedari bahawa sekalian makhluk kini berada di ambang kebangkitan kesedaran.', 'order' => 19],
            ['start_time' => 121.76, 'end_time' => 125.98, 'target_text' => 'For years he had climbed this mountain, seeking peace, seeking truth.', 'source_text' => 'Bertahun-tahun lamanya baginda mendaki bukit ini, mencari kedamaian jiwa, mencari kebenaran hakiki.', 'order' => 20],
            ['start_time' => 126.08, 'end_time' => 131.66, 'target_text' => 'And now the moment he had been prepared for all his life was drawing near.', 'source_text' => 'Dan kini saat yang telah dipersiapkan untuknya sepanjang hidupnya kian menghampiri.', 'order' => 21],
            ['start_time' => 131.76, 'end_time' => 138.46, 'target_text' => 'The moonlight brushed the stones and the desert wind whispered through the valley.', 'source_text' => 'Cahaya bulan menyinari permukaan batu-batuan dan deruan angin padang pasir berbisik lembut menyusuri lembah.', 'order' => 22],
            ['start_time' => 138.56, 'end_time' => 140.7, 'target_text' => 'His heart was at rest.', 'source_text' => 'Sanubarinya berada dalam ketenangan.', 'order' => 23],
            ['start_time' => 140.8, 'end_time' => 143.42, 'target_text' => 'Yet something unseen approached.', 'source_text' => 'Namun ada sesuatu yang ghaib sedang mendekat menghampiri.', 'order' => 24],
            ['start_time' => 143.52, 'end_time' => 149.9, 'target_text' => 'Then suddenly a presence filled the cave unlike anything he had ever felt before.', 'source_text' => 'Tiba-tiba suatu kehadiran agung memenuhi ruang gua tersebut, tidak seperti apa-apa yang pernah baginda rasai sebelum ini.', 'order' => 25],
            ['start_time' => 150.0, 'end_time' => 155.82, 'target_text' => 'It was neither shadow nor light, but something greater enveloping him.', 'source_text' => 'Ia bukanlah bayang-bayang mahupun sekadar cahaya, sebaliknya suatu keagungan yang lebih hebat menyelubungi dirinya.', 'order' => 26],
            ['start_time' => 155.92, 'end_time' => 167.72, 'target_text' => 'In awe, the angel Gibl, may peace be on him, stood before him, his voice echoing not through air but through existence itself.', 'source_text' => 'Penuh rasa takjub dan gerun, Malaikat Jibril \'alaihissalam berdiri di hadapannya, suaranya bergema bukan sekadar di udara tetapi menembusi hakikat kewujudan itu sendiri.', 'order' => 27],
            ['start_time' => 168.56, 'end_time' => 172.94, 'target_text' => 'Read the word struck the stillness like thunder.', 'source_text' => '"Bacalah!" Kalimah itu memecah keheningan laksana dentuman guruh halilintar.', 'order' => 28],
            ['start_time' => 173.04, 'end_time' => 175.18, 'target_text' => 'Muhammad peace be upon him trembled.', 'source_text' => 'Muhammad ﷺ menggigil ketakutan.', 'order' => 29],
            ['start_time' => 175.28, 'end_time' => 178.46, 'target_text' => 'His breath caught between fear and confusion.', 'source_text' => 'Nafas baginda tersekat di antara rasa gerun dan kebingungan.', 'order' => 30],
            ['start_time' => 178.56, 'end_time' => 180.38, 'target_text' => 'I cannot read, he said.', 'source_text' => '"Aku tidak pandai membaca," jawab baginda.', 'order' => 31],
            ['start_time' => 180.48, 'end_time' => 187.82, 'target_text' => 'The angel embraced him firm but not cruel until the command filled every fiber of his being.', 'source_text' => 'Malaikat itu mendakapnya dengan kemas dan erat tanpa mencederakannya, sehingga perintah itu meresap ke segenap urat nadi dan zarah tubuhnya.', 'order' => 32],
            ['start_time' => 187.92, 'end_time' => 189.72, 'target_text' => 'Again,', 'source_text' => 'Sekali lagi berseru,', 'order' => 33],
            ['start_time' => 189.84, 'end_time' => 191.18, 'target_text' => 'read.', 'source_text' => '"Bacalah!"', 'order' => 34],
            ['start_time' => 191.28, 'end_time' => 194.14, 'target_text' => 'He gasped, his heart racing.', 'source_text' => 'Baginda tercungap-cungap, degupan jantungnya berdegup begitu kencang.', 'order' => 35],
            ['start_time' => 194.24, 'end_time' => 195.98, 'target_text' => 'I\'m not one who reads.', 'source_text' => '"Aku bukanlah orang yang tahu membaca."', 'order' => 36],
            ['start_time' => 196.08, 'end_time' => 198.14, 'target_text' => 'The embrace came once more.', 'source_text' => 'Dakapan erat itu merangkulnya sekali lagi.', 'order' => 37],
            ['start_time' => 198.24, 'end_time' => 201.34, 'target_text' => 'The mountain itself seemed to hold his breath.', 'source_text' => 'Bukit batu itu sendiri seakan turut menahan nafasnya.', 'order' => 38],
            ['start_time' => 201.44, 'end_time' => 206.36, 'target_text' => 'Then for the third time, the voice filled the universe.', 'source_text' => 'Kemudian buat kali ketiga, suara itu berkumandang memenuhi alam semesta.', 'order' => 39],
            ['start_time' => 219.76, 'end_time' => 225.74, 'target_text' => 'Recite in the name of your Lord who created created man from a clinging substance.', 'source_text' => '"Bacalah dengan nama Tuhanmu yang menciptakan. Dia telah menciptakan manusia daripada segumpal darah (\'alaq).', 'order' => 40],
            ['start_time' => 225.84, 'end_time' => 234.14, 'target_text' => 'Recite for your Lord is the most generous who taught by the pen taught man what he did not know.', 'source_text' => 'Bacalah, dan Tuhanmulah Yang Maha Pemurah. Yang mengajar manusia dengan perantaraan pena, mengajar manusia apa yang tidak diketahuinya."', 'order' => 41],
            ['start_time' => 234.24, 'end_time' => 237.74, 'target_text' => 'In that instant the world changed forever.', 'source_text' => 'Pada saat itu juga, dunia berubah untuk selama-lamanya.', 'order' => 42],
            ['start_time' => 237.84, 'end_time' => 244.06, 'target_text' => 'The silence of centuries shattered and the first rays of revelation began to spread.', 'source_text' => 'Keheningan berabad-abad lamanya kini pecah berkecai dan pancaran pertama cahaya wahyu mula menyinari persada alam.', 'order' => 43],
            ['start_time' => 244.16, 'end_time' => 247.02, 'target_text' => 'Not as light upon stone,', 'source_text' => 'Bukan sekadar cahaya yang jatuh ke atas batu,', 'order' => 44],
            ['start_time' => 247.12, 'end_time' => 254.78, 'target_text' => 'but as guidance within the human heart, the voice of Allah had reached the final messenger.', 'source_text' => 'sebaliknya sebagai petunjuk hidayah di dalam sanubari manusia; firman Allah telah pun sampai kepada pesuruh terakhir-Nya.', 'order' => 45],
            ['start_time' => 254.88, 'end_time' => 260.86, 'target_text' => 'And the mercy destined for all creation had begun to flow.', 'source_text' => 'Dan limpahan rahmat yang ditakdirkan untuk seluruh ciptaan mula mengalir dengan derasnya.', 'order' => 46],
            ['start_time' => 260.96, 'end_time' => 264.94, 'target_text' => 'Trembling, Muhammad, peace be upon him descended the mountain.', 'source_text' => 'Dalam keadaan menggigil gementar, Muhammad ﷺ bergegas menuruni bukit itu.', 'order' => 47],
            ['start_time' => 265.04, 'end_time' => 275.34, 'target_text' => 'The rocks, the wind, the sand, all seemed alive whispering, "Peace be upon you, oh messenger of Allah."', 'source_text' => 'Batu-batuan, deruan angin, dan butiran pasir semuanya seakan hidup berbisik: "Salam sejahtera ke atasmu, wahai Rasulullah."', 'order' => 48],
            ['start_time' => 275.44, 'end_time' => 276.7, 'target_text' => 'He could hear them.', 'source_text' => 'Baginda dapat mendengar suara-suara tersebut.', 'order' => 49],
            ['start_time' => 276.8, 'end_time' => 280.3, 'target_text' => 'Each grain of creation testifying to the truth.', 'source_text' => 'Setiap butiran ciptaan alam bersaksi mengakui kebenaran hakiki.', 'order' => 50],
            ['start_time' => 280.4, 'end_time' => 288.46, 'target_text' => 'But his heart was overwhelmed, the weight of revelation pressed upon him like the burden of the sky itself.', 'source_text' => 'Namun sanubarinya diselubungi rasa teramat berat, bebanan wahyu menekan jiwanya bagaikan bebanan seisi langit.', 'order' => 51],
            ['start_time' => 288.56, 'end_time' => 295.5, 'target_text' => 'His steps quickened as he reached the city, his chest heaving with awe and fear.', 'source_text' => 'Langkah kakinya semakin pantas tatkala baginda tiba di pinggir kota, dadanya berombak kencang menahan rasa kagum dan gerun.', 'order' => 52],
            ['start_time' => 295.6, 'end_time' => 305.02, 'target_text' => 'He burst into his home calling out, "Cover me, cover me." Khadijah, may Allah be pleased with her, came running, her eyes', 'source_text' => 'Baginda bergegas menerpa masuk ke rumahnya seraya berseru, "Selimutkan aku! Selimutkan aku!" Khadijah radhiyallahu \'anha berlari mendapatkan baginda, matanya', 'order' => 53],
            ['start_time' => 305.12, 'end_time' => 306.46, 'target_text' => 'wide with concern.', 'source_text' => 'terbeliak bulat penuh kerisauan.', 'order' => 54],
            ['start_time' => 306.56, 'end_time' => 310.78, 'target_text' => 'She wrapped him in a cloak, her hands trembling, but her voice steady.', 'source_text' => 'Beliau menyelimuti tubuh baginda dengan sehelai kain selimut, tangannya terketar-ketar namun suaranya kekal tenang menenteramkan.', 'order' => 55],
            ['start_time' => 310.88, 'end_time' => 314.78, 'target_text' => 'What has happened, oh messenger of Allah?', 'source_text' => '"Apakah yang telah berlaku, wahai Rasulullah?"', 'order' => 56],
            ['start_time' => 314.88, 'end_time' => 319.34, 'target_text' => 'He told her the presence, the words, the command.', 'source_text' => 'Baginda menceritakan kepadanya tentang kehadiran lembaga itu, kalimah-kalimah yang didengar, dan perintah wahyu tersebut.', 'order' => 57],
            ['start_time' => 319.44, 'end_time' => 329.74, 'target_text' => 'His voice broke as he said, "I feared for myself." She looked at him with certainty that cut through all doubt by Allah.', 'source_text' => 'Suara baginda terputus-putus seraya berkata, "Sesungguhnya aku bimbang akan keselamatan diriku." Khadijah menatap wajahnya dengan penuh keyakinan yang menepis segala keraguan: Demi Allah!', 'order' => 58],
            ['start_time' => 329.84, 'end_time' => 333.42, 'target_text' => 'She said, "Allah will never disgrace you.', 'source_text' => 'Khadijah menegaskan, "Allah tidak akan sekali-kali mengaibkan dan menghinakan dirimu.', 'order' => 59],
            ['start_time' => 333.52, 'end_time' => 335.5, 'target_text' => 'You keep the ties of kinship.', 'source_text' => 'Engkau sentiasa menyambung tali silaturahim.', 'order' => 60],
            ['start_time' => 335.6, 'end_time' => 337.66, 'target_text' => 'You bear the burden of the weak.', 'source_text' => 'Engkau menanggung bebanan golongan yang lemah.', 'order' => 61],
            ['start_time' => 337.76, 'end_time' => 339.34, 'target_text' => 'You honor the guests.', 'source_text' => 'Engkau memuliakan para tetamu.', 'order' => 62],
            ['start_time' => 339.44, 'end_time' => 341.18, 'target_text' => 'You help those in need.', 'source_text' => 'Engkau sentiasa membantu mereka yang ditimpa kesusahan.', 'order' => 63],
            ['start_time' => 341.28, 'end_time' => 346.12, 'target_text' => 'Allah would never abandon one such as you.', 'source_text' => 'Allah tidak akan pernah sesekali mensia-siakan insan semulia dirimu."', 'order' => 64],
            ['start_time' => 346.32, 'end_time' => 349.74, 'target_text' => 'Her words calmed the storm within him.', 'source_text' => 'Kata-kata Sayyidatina Khadijah itu meredakan badai gelora di dalam sanubari baginda.', 'order' => 65],
            ['start_time' => 349.84, 'end_time' => 353.98, 'target_text' => 'When he rested, she took his hand and said, "Come,', 'source_text' => 'Setelah baginda berehat menenangkan diri, Khadijah memegang lembut tangannya lalu berkata, "Marilah,', 'order' => 66],
            ['start_time' => 354.08, 'end_time' => 356.84, 'target_text' => 'we will go to my cousin."', 'source_text' => 'kita pergi berjumpa dengan sepupuku."', 'order' => 67],
            ['start_time' => 357.12, 'end_time' => 365.1, 'target_text' => 'Waraka was an old and blind man who had studied the scriptures of the earlier prophets.', 'source_text' => 'Waraqah bin Nawfal merupakan seorang lelaki yang telah lanjut usia dan buta matanya, yang tekun mendalami kitab-kitab suci nabi terdahulu.', 'order' => 68],
            ['start_time' => 365.2, 'end_time' => 369.5, 'target_text' => 'When he heard the story, his eyes filled with tears.', 'source_text' => 'Sebaik sahaja mendengar kisah tersebut, kedua-dua matanya bergenang dengan titisan air mata.', 'order' => 69],
            ['start_time' => 369.6, 'end_time' => 376.54, 'target_text' => 'This is the same angel, he said softly, that came to Moses, may peace be on him.', 'source_text' => '"Inilah malaikat Namus yang sama," katanya perlahan, "yang pernah diutuskan kepada Nabi Musa \'alaihissalam.', 'order' => 70],
            ['start_time' => 376.64, 'end_time' => 380.78, 'target_text' => 'You, oh Muhammad, are the prophet of this nation.', 'source_text' => 'Sesungguhnya engkau, wahai Muhammad, adalah nabi bagi umat ini."', 'order' => 71],
            ['start_time' => 380.88, 'end_time' => 382.86, 'target_text' => 'The room fell silent.', 'source_text' => 'Bilik itu serta-merta diselubungi keheningan.', 'order' => 72],
            ['start_time' => 382.96, 'end_time' => 389.1, 'target_text' => 'A breeze moved through curtains as if the world itself bowed in recognition.', 'source_text' => 'Hembusan angin sepoi-sepoi menggerakkan langsir seolah-olah seisi dunia tunduk patuh mengakui keagungan detik itu.', 'order' => 73],
            ['start_time' => 389.2, 'end_time' => 391.26, 'target_text' => 'The revelation had begun.', 'source_text' => 'Penurunan wahyu Ilahi telah pun bermula.', 'order' => 74],
            ['start_time' => 391.36, 'end_time' => 398.06, 'target_text' => 'The mercy that would reach every nation, every heart, every soul that sought truth.', 'source_text' => 'Rahmat agung yang bakal menyentuh setiap umat, setiap sanubari, dan setiap jiwa yang mendambakan kebenaran.', 'order' => 75],
            ['start_time' => 398.16, 'end_time' => 400.14, 'target_text' => 'Days passed in stillness.', 'source_text' => 'Hari demi hari berlalu dalam keheningan.', 'order' => 76],
            ['start_time' => 400.24, 'end_time' => 403.1, 'target_text' => 'The cave of Harah stood silent once more.', 'source_text' => 'Gua Hira\' kembali sepi seperti sediakala.', 'order' => 77],
            ['start_time' => 403.2, 'end_time' => 405.82, 'target_text' => 'But its stones had become witnesses.', 'source_text' => 'Namun batu-batuannya telah pun menjadi saksi agung.', 'order' => 78],
            ['start_time' => 405.92, 'end_time' => 407.98, 'target_text' => 'The heavens had opened.', 'source_text' => 'Pintu-pintu langit telah terbuka.', 'order' => 79],
            ['start_time' => 408.08, 'end_time' => 414.06, 'target_text' => 'And though revelation paused for a short while, it was only to prepare his heart for what was to come.', 'source_text' => 'Dan walaupun penurunan wahyu terhenti buat seketika waktu (fatratul wahyi), ia hanyalah bertujuan mempersiapkan sanubari baginda menghadapi apa yang bakal menyusul.', 'order' => 80],
            ['start_time' => 414.16, 'end_time' => 418.76, 'target_text' => 'The Quran would later remind him of the gentle mercy.', 'source_text' => 'Al-Quran kelak mengingatkan baginda tentang rahmat kelembutan Ilahi ini:', 'order' => 81],
            ['start_time' => 423.36, 'end_time' => 430.78, 'target_text' => 'Did we not expand for you your chest and relieve you of your burden which had weighed heavily upon your back?', 'source_text' => '"Bukankah Kami telah melapangkan bagimu dadamu? Dan Kami telah meringankan daripadamu bebanmu, yang memberati belakangmu?"', 'order' => 82],
            ['start_time' => 430.88, 'end_time' => 436.54, 'target_text' => 'With every passing day, the fear turned into strength, the awe into purpose.', 'source_text' => 'Dengan berlalunya hari demi hari, perasaan gerun bertukar menjadi kekuatan jiwa, dan rasa takjub bertukar menjadi tekad perjuangan.', 'order' => 83],
            ['start_time' => 436.64, 'end_time' => 445.18, 'target_text' => 'When revelation came again, his heart was ready to receive it, ready to carry a message that would outlive empires and silence', 'source_text' => 'Apabila wahyu diturunkan kembali, hati baginda sudah bersedia menerimanya, bersedia menggalas risalah yang bakal melangkaui kejatuhan empayar dan membisukan', 'order' => 84],
            ['start_time' => 445.28, 'end_time' => 446.7, 'target_text' => 'kings.', 'source_text' => 'para raja yang zalim.', 'order' => 85],
            ['start_time' => 446.8, 'end_time' => 451.34, 'target_text' => 'Yet even as prophecy began, his humility remained unchanged.', 'source_text' => 'Namun di sebalik bermulanya tugas kenabian, sikap tawaduk dan rendah diri baginda langsung tidak berubah.', 'order' => 86],
            ['start_time' => 451.44, 'end_time' => 460.38, 'target_text' => 'He prayed alone in the nights, seeking only Allah, whispering gratitude through tears that no one saw.', 'source_text' => 'Baginda bermunajat seorang diri pada keheningan malam, mencari keredaan Allah semata-mata, membisikkan kesyukuran diiringi air mata yang tidak disedari sesiapa.', 'order' => 87],
            ['start_time' => 460.48, 'end_time' => 465.02, 'target_text' => 'The people of Mecca continued their days unaware of what had begun.', 'source_text' => 'Penduduk kota Mekah meneruskan kehidupan harian mereka tanpa menyedari peristiwa agung yang telah bermula.', 'order' => 88],
            ['start_time' => 465.12, 'end_time' => 467.34, 'target_text' => 'The Kaa still stood.', 'source_text' => 'Kaabah masih tegak berdiri di sana.', 'order' => 89],
            ['start_time' => 467.44, 'end_time' => 470.3, 'target_text' => 'The idols still towered.', 'source_text' => 'Patung-patung berhala masih menjulang tinggi.', 'order' => 90],
            ['start_time' => 470.4, 'end_time' => 479.5, 'target_text' => 'But above them all, unseen, the angels were descending line upon line, carrying words that would guide mankind till the end', 'source_text' => 'Namun nun di atas mereka semua, tanpa kelihatan, para malaikat turun berbaris-baris teratur, membawa kalam firman yang akan membimbing umat manusia hingga ke akhir', 'order' => 91],
            ['start_time' => 479.6, 'end_time' => 480.3, 'target_text' => 'of time.', 'source_text' => 'zaman.', 'order' => 92],
            ['start_time' => 480.4, 'end_time' => 486.52, 'target_text' => 'And to the heart of the prophet, peace be upon him, came reassurance from his Lord.', 'source_text' => 'Dan kepada sanubari Rasulullah ﷺ, hadir ketenangan penenteram jiwa daripada Tuhannya:', 'order' => 93],
            ['start_time' => 493.76, 'end_time' => 501.02, 'target_text' => 'Your Lord has not forsaken you, nor has he detested you, and the hereafter will be better for you than the first.', 'source_text' => '"Tuhanmu tidak meninggalkanmu dan tidak pula membencimu, dan sesungguhnya hari akhirat itu jauh lebih baik bagimu daripada dunia permulaan.', 'order' => 94],
            ['start_time' => 501.12, 'end_time' => 505.34, 'target_text' => 'And your Lord will surely give you, and you will be satisfied.', 'source_text' => 'Dan kelak Tuhanmu pasti memberikan kurniaan-Nya kepadamu, sehingga engkau merasa puas hati dan reda."', 'order' => 95],
            ['start_time' => 505.44, 'end_time' => 516.22, 'target_text' => 'And so began the dawn of guidance, not with armies or banners, but with a single word spoken in the darkness of a cave.', 'source_text' => 'Maka bermulalah fajar menyinsingnya hidayah petunjuk, bukan dengan bala tentera atau kibaran panji-panji perang, tetapi dengan satu kalimah yang diucapkan di kepekatan sebuah gua.', 'order' => 96],
            ['start_time' => 516.32, 'end_time' => 524.78, 'target_text' => 'A command that carried within it the light of every book, the truth of every heart, and the hope of every soul that would', 'source_text' => 'Satu perintah agung yang mengandungi di dalamnya nur sekelian kitab suci, kebenaran setiap sanubari, dan harapan setiap jiwa yang bakal', 'order' => 97],
            ['start_time' => 524.88, 'end_time' => 526.54, 'target_text' => 'ever believe.', 'source_text' => 'beriman.', 'order' => 98],
            ['start_time' => 526.64, 'end_time' => 529.74, 'target_text' => 'From that moment, nothing would ever be the same.', 'source_text' => 'Bermula daripada saat keramat itu, tiada lagi yang kekal sama seperti sebelumnya.', 'order' => 99],
            ['start_time' => 529.84, 'end_time' => 534.38, 'target_text' => 'The earth that once slept in heedlessness, now stirred with meaning.', 'source_text' => 'Bumi yang dahulunya lena dibuai kealpaan, kini bergetar penuh erti dan makna.', 'order' => 100],
            ['start_time' => 534.48, 'end_time' => 540.38, 'target_text' => 'The stars above Mecca glittered brighter than before and the angels filled the horizon.', 'source_text' => 'Bintang-bintang di angkasa Mekah berkelip-kelip lebih cerah berseri berbanding sebelumnya dan para malaikat memenuhi kaki langit.', 'order' => 101],
            ['start_time' => 540.48, 'end_time' => 548.06, 'target_text' => 'The messenger of Allah, peace be upon him, stood at the threshold of his mission, chosen, purified and ready.', 'source_text' => 'Rasulullah ﷺ berdiri tegak di ambang permulaan risalahnya, terpilih, disucikan jiwa raganya, dan bersiap siaga.', 'order' => 102],
            ['start_time' => 548.16, 'end_time' => 556.86, 'target_text' => 'And the light that began that night in the cave of Hah still burns in every prayer, every word of truth, every heart that', 'source_text' => 'Dan cahaya petunjuk yang bermula pada malam itu di Gua Hira\' masih terus menyala dalam setiap solat, setiap kalimah kebenaran, dan setiap sanubari yang', 'order' => 103],
            ['start_time' => 556.96, 'end_time' => 558.62, 'target_text' => 'whispers', 'source_text' => 'membisikkan', 'order' => 104],
            ['start_time' => 558.72, 'end_time' => 560.52, 'target_text' => 'illallahhammed', 'source_text' => 'kalimah tauhid: La ilaha illallah', 'order' => 105],
            ['start_time' => 561.04, 'end_time' => 562.22, 'target_text' => 'Allah.', 'source_text' => 'Muhammadur Rasulullah.', 'order' => 106],
            ['start_time' => 562.32, 'end_time' => 566.3, 'target_text' => 'The voice of Gibl, may peace be upon him, was not just a sound.', 'source_text' => 'Suara Malaikat Jibril \'alaihissalam bukan sekadar bunyi gemaan biasa.', 'order' => 107],
            ['start_time' => 566.4, 'end_time' => 570.14, 'target_text' => 'It was the awakening of hearts until the end of time.', 'source_text' => 'Ia adalah seruan kebangkitan sanubari hati manusia sehingga ke akhir zaman.', 'order' => 108],
            ['start_time' => 570.24, 'end_time' => 573.98, 'target_text' => 'But even the greatest of messengers is still human.', 'source_text' => 'Namun seafdal-afdal rasul utusan tetaplah seorang insan.', 'order' => 109],
            ['start_time' => 574.08, 'end_time' => 574.86, 'target_text' => 'He trembled.', 'source_text' => 'Baginda bergetar gementar.', 'order' => 110],
            ['start_time' => 574.96, 'end_time' => 575.5, 'target_text' => 'He feared.', 'source_text' => 'Baginda berasa takut.', 'order' => 111],
            ['start_time' => 575.6, 'end_time' => 579.9, 'target_text' => 'He ran to the one heart that always believed him.', 'source_text' => 'Baginda segera berlari mendapatkan satu-satunya insan yang sentiasa mempercayainya.', 'order' => 112],
            ['start_time' => 580.0, 'end_time' => 582.62, 'target_text' => 'Khadijah, may Allah be pleased with her.', 'source_text' => 'Iaitu Sayyidatina Khadijah radhiyallahu \'anha.', 'order' => 113],
            ['start_time' => 582.72, 'end_time' => 583.9, 'target_text' => 'And she held him.', 'source_text' => 'Dan Khadijah mendakapnya dengan erat.', 'order' => 114],
            ['start_time' => 584.0, 'end_time' => 585.34, 'target_text' => 'And she comforted him.', 'source_text' => 'Dan Khadijah menenteramkannya dengan penuh kasih.', 'order' => 115],
            ['start_time' => 585.44, 'end_time' => 589.74, 'target_text' => 'And she spoke words that would soothe the earth itself.', 'source_text' => 'Dan Khadijah menuturkan kata-kata yang mampu menyejukkan seluruh persada bumi.', 'order' => 116],
            ['start_time' => 589.84, 'end_time' => 591.9, 'target_text' => 'Allah will never disgrace you.', 'source_text' => '"Allah tidak akan sekali-kali mengaibkan dirimu.', 'order' => 117],
            ['start_time' => 592.0, 'end_time' => 594.54, 'target_text' => 'Allah will never let you down.', 'source_text' => 'Allah tidak akan pernah membiarkanmu kecewa.', 'order' => 118],
            ['start_time' => 594.64, 'end_time' => 602.7, 'target_text' => 'For the one who lifts the weak, who shelters the orphan, who speaks the truth, is always held by Allah.', 'source_text' => 'Kerana insan yang membela golongan yang lemah, yang melindungi anak-anak yatim, dan yang sentiasa berkata benar, pasti sentiasa berada dalam perlindungan Allah."', 'order' => 119],
            ['start_time' => 602.8, 'end_time' => 604.54, 'target_text' => 'The revelation had begun.', 'source_text' => 'Wahyu Ilahi telah pun bermula.', 'order' => 120],
            ['start_time' => 604.64, 'end_time' => 606.46, 'target_text' => 'The final light had descended.', 'source_text' => 'Nur cahaya terakhir telah pun turun ke bumi.', 'order' => 121],
            ['start_time' => 606.56, 'end_time' => 609.1, 'target_text' => 'The journey of prophethood had opened.', 'source_text' => 'Perjalanan agung kenabian kini telah terbuka luas.', 'order' => 122],
            ['start_time' => 609.2, 'end_time' => 618.3, 'target_text' => 'In the next episode, inshallah, we witness how this message spreads softly, quietly, heart to heart in the earliest days of', 'source_text' => 'Dalam episod seterusnya, insya-Allah, kita akan menyaksikan bagaimana risalah ini tersebar dengan lembut dan tenang, dari hati ke hati pada zaman terawal', 'order' => 123],
            ['start_time' => 618.4, 'end_time' => 619.66, 'target_text' => 'Islam.', 'source_text' => 'Islam.', 'order' => 124],
            ['start_time' => 619.76, 'end_time' => 626.68, 'target_text' => 'But until then, may your heart remain open to the one who calls it', 'source_text' => 'Namun sehingga itu, semoga sanubari kalian kekal terbuka menyambut seruan Dia yang memanggilnya,', 'order' => 125],
            ['start_time' => 627.2, 'end_time' => 629.4, 'target_text' => 'Allah Muhammad.', 'source_text' => 'Sallallahu \'ala Muhammad ﷺ.', 'order' => 126],
        ];

        $now = now();
        $rows = [];
        foreach ($subtitles as $sub) {
            $rows[] = [
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

        foreach (array_chunk($rows, 100) as $chunk) {
            DB::table('video_subtitles')->insert($chunk);
        }
    }
}
