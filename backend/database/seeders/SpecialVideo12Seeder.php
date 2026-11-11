<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo12Seeder extends Seeder
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

        // Special Bilingual Religious Video #12 (Siri 1 Ep.7): The First People to Believe | Life of the Final Messenger ﷺ | Ep.7 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'l1Zwj51KF9g'],
            [
                'language_id'   => $english->id,
                'title'         => 'The First People to Believe | Life of the Final Messenger ﷺ | Ep.7 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/l1Zwj51KF9g/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 12,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.16, 'end_time' => 7.84, 'target_text' => 'And the first heart to answer was the one that had always stood beside him. May Allah', 'source_text' => 'Dan sanubari pertama yang menyahut seruan wahyu adalah insan yang sentiasa teguh berdiri di samping baginda. Semoga Allah', 'order' => 1],
            ['start_time' => 7.84, 'end_time' => 19.2, 'target_text' => 'be pleased with her in the home of Alam. That humble house became the first school of Islam.', 'source_text' => 'meredai Sayyidatina Khadijah. Di rumah Al-Arqam, rumah yang serba sederhana itu telah menjadi madrasah pertama dalam sejarah Islam.', 'order' => 2],
            ['start_time' => 19.2, 'end_time' => 25.44, 'target_text' => 'My beloved brothers and sisters, today we enter a chapter filled with quiet courage and sincere', 'source_text' => 'Saudara-saudariku yang dikasihi, hari ini kita melangkah masuk ke dalam lembaran yang sarat dengan keberanian yang tenang dan ketulusan', 'order' => 3],
            ['start_time' => 25.44, 'end_time' => 32.96, 'target_text' => 'hearts. For when the first light of revelation descended, it did not spread through armies,', 'source_text' => 'hati yang ikhlas. Kerana tatkala nur wahyu pertama diturunkan, ia tidak tersebar melalui bala tentera,', 'order' => 4],
            ['start_time' => 32.96, 'end_time' => 39.52, 'target_text' => 'speeches, or force. It spread through hearts. Hearts that recognize truth the', 'source_text' => 'pidato retorik, mahupun paksaan senjata. Ia tersebar melalui sentuhan sanubari. Hati-hati yang terus mengenali kebenaran hakiki pada', 'order' => 5],
            ['start_time' => 39.52, 'end_time' => 46.8, 'target_text' => 'moment they heard it. Islam began softly in whispers, in gentle conversations,', 'source_text' => 'saat pertama mendengarnya. Islam bermula dengan lembut melalui bisikan-bisikan, perbualan santun yang mendalam,', 'order' => 6],
            ['start_time' => 46.8, 'end_time' => 53.36, 'target_text' => 'in small circles hidden from the noise of Mecca. But the ones who believed first,', 'source_text' => 'dalam kelompok-kelompok kecil yang tersembunyi daripada keriuhan kota Mekah. Namun insan-insan terawal yang beriman ini,', 'order' => 7],
            ['start_time' => 53.36, 'end_time' => 59.76, 'target_text' => 'they were not ordinary people. They were the purehearted, the seekers, the ones whom', 'source_text' => 'bukanlah orang-orang biasa. Mereka adalah golongan berjiwa suci murni, para pencari hakikat, insan-insan yang', 'order' => 8],
            ['start_time' => 59.76, 'end_time' => 67.84, 'target_text' => 'Allah had already prepared long before. A loyal friend, a devoted wife, a child of pure light,', 'source_text' => 'telah dipersiapkan oleh Allah sekian lama sebelum itu. Seorang sahabat setia, seorang isteri yang berbakti, seorang anak kecil berjiwa suci,', 'order' => 9],
            ['start_time' => 67.84, 'end_time' => 76.08, 'target_text' => 'and a servant of unwavering love. These were the first believers, the first carriers of the light.', 'source_text' => 'dan seorang hamba yang membalas dengan kasih sayang yang tidak berbelah bahagi. Merekalah golongan mukmin yang terawal, pembawa panji nur pertama.', 'order' => 10],
            ['start_time' => 76.08, 'end_time' => 83.52, 'target_text' => 'The first to say there is no God but Allah and Muhammad is his messenger. So come with me. Let us', 'source_text' => 'Insan pertama yang melafazkan tiada Tuhan yang disembah melainkan Allah dan Muhammad adalah utusan-Nya. Ayuh ikutilah saya. Marilah kita', 'order' => 11],
            ['start_time' => 83.52, 'end_time' => 101.28, 'target_text' => 'return to those early days where faith began as a seed hidden small yet destined to fill the world.', 'source_text' => 'kembali ke zaman-zaman terawal itu, saat keimanan bermula bagaikan sebutir benih kecil yang tersembunyi, namun ditakdirkan untuk memenuhi seisi dunia.', 'order' => 12],
            ['start_time' => 109.04, 'end_time' => 116.32, 'target_text' => 'The dawn after revelation broke gently over Mecca. The prophet peace be upon him had descended from', 'source_text' => 'Fajar selepas peristiwa penurunan wahyu menyinsing lembut di ufuk kota Mekah. Baginda Nabi ﷺ telah menuruni bukit', 'order' => 13],
            ['start_time' => 116.32, 'end_time' => 124.72, 'target_text' => 'Hra with a heart transformed. The words of his lord still echoed within him. And though the', 'source_text' => 'Gua Hira\' dengan jiwa sanubari yang telah berubah sepenuhnya. Kalam firman Tuhannya masih bergema indah di dalam dirinya. Dan sungguhpun', 'order' => 14],
            ['start_time' => 124.72, 'end_time' => 132.72, 'target_text' => 'night of fear had passed, a new dawn of purpose was rising. The light that began in the cave now', 'source_text' => 'malam kegerunan telah berlalu, fajar matlamat hidup yang baharu kini mula terbit bersinar. Nur cahaya yang bermula di dalam gua kini', 'order' => 15],
            ['start_time' => 132.72, 'end_time' => 141.2, 'target_text' => 'sought hearts to receive it. And the first heart to answer was the one that had always stood beside', 'source_text' => 'mencari sanubari manusia untuk menyambutnya. Dan hati pertama yang menyahut seruan itu adalah insan yang sentiasa berdiri teguh di sisi', 'order' => 16],
            ['start_time' => 141.2, 'end_time' => 148.08, 'target_text' => 'him. Khadijah, may Allah be pleased with her, the first to believe. When others hesitated,', 'source_text' => 'baginda. Iaitu Sayyidatina Khadijah radhiyallahu \'anha, insan pertama yang beriman. Tatkala orang lain berasa ragu-ragu,', 'order' => 17],
            ['start_time' => 148.08, 'end_time' => 154.4, 'target_text' => 'she was certain. When he trembled, she was calm. Her faith was not born of words,', 'source_text' => 'beliau berasa yakin teguh. Tatkala baginda gementar ketakutan, beliau tetap tenang menenteramkan. Keimanan Khadijah bukan sekadar lahir daripada tutur kata,', 'order' => 18],
            ['start_time' => 154.4, 'end_time' => 162.96, 'target_text' => 'but of knowing him, his truth, his honesty, his light. In the stillness of their home,', 'source_text' => 'sebaliknya lahir daripada pengenalannya yang mendalam terhadap peribadi baginda; kejujurannya, ketulusannya, dan nur kemuliaannya. Dalam keheningan rumah mereka,', 'order' => 19],
            ['start_time' => 162.96, 'end_time' => 171.44, 'target_text' => 'she bore witness to the beginning of Islam. Soon after, a boy of 10 watched them in quiet wonder.', 'source_text' => 'Khadijah menjadi saksi pertama kepada bermulanya era kebangkitan Islam. Tidak lama selepas itu, seorang anak lelaki berusia 10 tahun memerhatikan mereka penuh takjub.', 'order' => 20],
            ['start_time' => 171.44, 'end_time' => 179.12, 'target_text' => 'Ali Ib Abi Talib may Allah be pleased with him. He had lived in the prophet\'s home since childhood', 'source_text' => 'Iaitu Ali bin Abi Talib radhiyallahu \'anhu. Beliau telah tinggal di rumah Rasulullah sejak zaman kanak-kanaknya lagi,', 'order' => 21],
            ['start_time' => 179.12, 'end_time' => 185.44, 'target_text' => 'his heart pure and curious. One evening he saw the prophet peace be upon him and Khadijah may', 'source_text' => 'dengan hati yang suci bersih dan penuh rasa ingin tahu. Pada suatu petang, beliau melihat Rasulullah ﷺ dan Khadijah radhiyallahu \'anha', 'order' => 22],
            ['start_time' => 185.44, 'end_time' => 192.16, 'target_text' => 'Allah be pleased with her standing in prayer. When they finished he asked what\'s this oh Muhammad?', 'source_text' => 'sedang berdiri mendirikan solat. Sebaik sahaja mereka selesai, Ali bertanya: "Apakah ini wahai Muhammad?"', 'order' => 23],
            ['start_time' => 192.16, 'end_time' => 198.32, 'target_text' => 'The prophet peace be upon him replied this is the religion of Allah the worship of the one', 'source_text' => 'Rasulullah ﷺ menjawab lembut: "Inilah agama Allah, penyembahan kepada Tuhan Yang Maha Esa', 'order' => 24],
            ['start_time' => 198.32, 'end_time' => 205.52, 'target_text' => 'who created you. Ali, may Allah be pleased with him, spent the night thinking, his young mind', 'source_text' => 'yang telah menciptakan dirimu." Ali radhiyallahu \'anhu menghabiskan malam itu dengan berfikir, minda mudanya', 'order' => 25],
            ['start_time' => 205.52, 'end_time' => 213.36, 'target_text' => 'restless with awe. At dawn, he returned and said, "I testify that there is no god but Allah and that', 'source_text' => 'bergelora diselubungi rasa takjub. Menjelang waktu fajar, beliau kembali menemui baginda seraya bersaksi: "Aku bersaksi bahawa tiada Tuhan melainkan Allah, dan sesungguhnya', 'order' => 26],
            ['start_time' => 213.36, 'end_time' => 221.36, 'target_text' => 'you are the messenger of Allah." The first youth to embrace Islam and the beginning of a legacy of', 'source_text' => 'engkau adalah utusan Allah." Beliau merupakan remaja pertama memeluk Islam, menandakan bermulanya legasi keberanian', 'order' => 27],
            ['start_time' => 221.36, 'end_time' => 228.64, 'target_text' => 'courage. Then came Zhar, may Allah be pleased with him. The servant, the prophet peace be upon him,', 'source_text' => 'yang tiada tandingan. Kemudian datang pula Zaid bin Harithah radhiyallahu \'anhu. Hamba yang dimerdekakan oleh Rasulullah ﷺ,', 'order' => 28],
            ['start_time' => 228.64, 'end_time' => 234.72, 'target_text' => 'had freed and loved as a son. He too did not hesitate. The moment he heard the truth,', 'source_text' => 'dan amat disayangi baginda bagaikan anak sendiri. Beliau juga langsung tidak teragak-agak. Sebaik sahaja mendengar kebenaran dakwah itu,', 'order' => 29],
            ['start_time' => 234.72, 'end_time' => 241.52, 'target_text' => 'he said, "I will not choose anyone over you." His loyalty was deep, not of blood, but of faith.', 'source_text' => 'Zaid terus berkata: "Aku tidak akan memilih sesiapa pun mengatasi dirimu." Kesetiaannya sungguh mendalam, bukan kerana pertalian darah, sebaliknya ikatan iman.', 'order' => 30],
            ['start_time' => 241.52, 'end_time' => 247.84, 'target_text' => 'When Revelation later commanded that every man be called by his true father\'s name,', 'source_text' => 'Apabila wahyu Al-Quran kemudiannya memerintahkan agar setiap insan dipanggil dengan nama bapa kandung mereka,', 'order' => 31],
            ['start_time' => 247.84, 'end_time' => 256.4, 'target_text' => 'Allah honored Zade among all companions by naming him in the Quran, a sign of his nearness and', 'source_text' => 'Allah memuliakan Zaid di antara sekalian para sahabat dengan menyebut namanya secara khusus di dalam Al-Quran, tanda kehampiran darjat dan', 'order' => 32],
            ['start_time' => 256.4, 'end_time' => 264.08, 'target_text' => 'worth. Soon after the message reached the friend whose loyalty would shape the future of Islam,', 'source_text' => 'kemuliaannya. Tidak lama selepas itu, risalah dakwah sampai kepada seorang sahabat karib yang kesetiaannya bakal mencorakkan masa depan Islam,', 'order' => 33],
            ['start_time' => 264.08, 'end_time' => 271.04, 'target_text' => 'Abu Bakr Sadik, may Allah be pleased with him, a man known among Quraysh for kindness, wisdom', 'source_text' => 'iaitu Abu Bakr As-Siddiq radhiyallahu \'anhu, seorang tokoh yang terkenal di kalangan Quraisy kerana budi pekerti luhur, kebijaksanaan,', 'order' => 34],
            ['start_time' => 271.04, 'end_time' => 278.72, 'target_text' => 'and trust. When the prophet peace be upon him told him of the revelation, there was no pause,', 'source_text' => 'dan sifat amanahnya. Apabila Rasulullah ﷺ menceritakan kepadanya tentang wahyu yang diturunkan, langsung tiada jeda terhenti,', 'order' => 35],
            ['start_time' => 278.72, 'end_time' => 288.16, 'target_text' => 'no question. He simply said, "If he said it, it is the truth." His heart did not seek proof. His', 'source_text' => 'tiada sebarang keraguan. Abu Bakr hanya berkata: "Sekiranya beliau yang mengatakannya, maka sesungguhnya itulah kebenaran." Hatinya tidak menuntut dalil bukti. Rohnya', 'order' => 36],
            ['start_time' => 288.16, 'end_time' => 294.8, 'target_text' => 'soul already knew. And through him, Islam began to move from one heart to another,', 'source_text' => 'telah pun sedia mengerti. Dan melalui usaha gigih Abu Bakr, Islam mula menjalar dari satu sanubari ke sanubari yang lain,', 'order' => 37],
            ['start_time' => 294.8, 'end_time' => 308.32, 'target_text' => 'quietly, steadily, like light spreading before dawn. By Abu Bakr\'s effort, others joined', 'source_text' => 'secara tenang, mantap dan berterusan, laksana cahaya yang menyelinap merebak sebelum menyinsingnya fajar. Melalui usaha dakwah Abu Bakr, sahabat-sahabat lain mula menyertai,', 'order' => 38],
            ['start_time' => 308.32, 'end_time' => 314.88, 'target_text' => 'and may Allah be pleased with all of them. They were the earliest companions. the seeds', 'source_text' => 'semoga Allah meredai mereka sekaliannya. Merekalah para sahabat generasi terawal (As-Sabiqun Al-Awwalun), benih-benih keimanan', 'order' => 39],
            ['start_time' => 314.88, 'end_time' => 323.28, 'target_text' => 'of a nation yet to be born. Each one would later give everything wealth, comfort, safety for the', 'source_text' => 'bagi sebuah ummah agung yang bakal lahir. Setiap seorang daripada mereka kelak mengorbankan segala-galanya; harta kekayaan, keselesaan, dan keselamatan demi kalimah Allah.', 'order' => 40],
            ['start_time' => 323.28, 'end_time' => 330.8, 'target_text' => 'word of Allah. At that time, the call to Islam was still secret. The prophet peace be upon him would', 'source_text' => 'Pada saat itu, seruan dakwah kepada Islam masih dijalankan secara rahsia. Rasulullah ﷺ', 'order' => 41],
            ['start_time' => 330.8, 'end_time' => 337.76, 'target_text' => 'meet with the believers in silence away from the gaze of Quraysh. At night they would slip into the', 'source_text' => 'bertemu dengan orang-orang beriman secara senyap, jauh daripada pandangan pengawasan kaum Quraisy. Pada waktu malam, mereka menyusup ke kawasan', 'order' => 42],
            ['start_time' => 337.76, 'end_time' => 344.8, 'target_text' => 'valleys beyond the city where the stars shimmerred and the desert wind carried the rhythm of their', 'source_text' => 'lembah-lembah di luar kota Mekah, di mana bintang-bintang berkelip gemerlapan dan angin padang pasir membawa alunan irama', 'order' => 43],
            ['start_time' => 344.8, 'end_time' => 356.72, 'target_text' => 'prayers. There they stood shouldertosh shoulder man, woman, youth and freed slave equal before', 'source_text' => 'doa munajat mereka. Di sanalah mereka berdiri rapat bahu ke bahu; lelaki, wanita, anak muda, dan hamba yang dimerdekakan, semuanya setaraf', 'order' => 44],
            ['start_time' => 356.72, 'end_time' => 365.44, 'target_text' => 'their lord. In that small gathering the first ummah was born. In those nights of quiet devotion,', 'source_text' => 'di hadapan Tuhan mereka. Dalam perhimpunan kecil itulah lahirnya ummah Islam yang pertama. Pada malam-malam ibadah yang hening itu,', 'order' => 45],
            ['start_time' => 365.44, 'end_time' => 371.12, 'target_text' => 'the prophet peace be upon him led them in prayer. His voice trembling as the verses of the Quran', 'source_text' => 'Rasulullah ﷺ mengimami mereka dalam solat. Suara baginda bergetar sayu tatkala ayat-ayat Al-Quran', 'order' => 46],
            ['start_time' => 371.12, 'end_time' => 378.32, 'target_text' => 'flowed for the first time in congregation. The sound was gentle but powerful. A whisper of', 'source_text' => 'mengalir buat kali pertama dialunkan dalam solat berjemaah. Alunannya sungguh lembut namun amat perkasa. Suatu bisikan', 'order' => 47],
            ['start_time' => 378.32, 'end_time' => 386.64, 'target_text' => 'truth against the roar of centuries of falsehood. The world slept unaware. Yet the heavens watched', 'source_text' => 'kebenaran yang memecah ngauman kepalsuan berhala selama berabad-abad. Seisi dunia lena tanpa menyedari apa-apa. Namun pintu-pintu langit menyaksikan', 'order' => 48],
            ['start_time' => 386.64, 'end_time' => 400.08, 'target_text' => 'as Islam took its first breath. The Quran would later describe this purity of faith.', 'source_text' => 'tatkala Islam menarik nafas permulaannya. Al-Quran kelak merakamkan kesucian keimanan yang murni ini:', 'order' => 49],
            ['start_time' => 400.08, 'end_time' => 407.84, 'target_text' => 'Indeed, those who believe and do righteous deeds, their Lord will guide them by their faith. Even', 'source_text' => '"Sesungguhnya orang-orang yang beriman dan beramal soleh, Tuhan mereka akan memimpin mereka dengan sebab keimanan mereka." Malah', 'order' => 50],
            ['start_time' => 407.84, 'end_time' => 414.88, 'target_text' => 'those who did not yet believe, began to sense the change. Abu Talib, the prophet\'s uncle,', 'source_text' => 'mereka yang belum memeluk Islam sekali pun mula merasakan peredaran perubahan tersebut. Abu Talib, bapa saudara Nabi,', 'order' => 51],
            ['start_time' => 414.88, 'end_time' => 422.4, 'target_text' => 'though he never embraced Islam, protected him with unwavering love. When Qur began to murmur about', 'source_text' => 'sungguhpun tidak memeluk Islam, tetap melindungi baginda dengan kasih sayang yang tidak berbelah bahagi. Apabila pembesar Quraisy mula berbisik-bisik merungut mengenai', 'order' => 52],
            ['start_time' => 422.4, 'end_time' => 429.68, 'target_text' => 'this new message, Abu Talib\'s heart stood like a wall before them. His protection was a shield and', 'source_text' => 'risalah baharu ini, hati Abu Talib berdiri teguh laksana tembok benteng di hadapan mereka. Perlindungannya menjadi perisai ampuh dan', 'order' => 53],
            ['start_time' => 429.68, 'end_time' => 439.76, 'target_text' => 'through it the da continued. Days became weeks and weeks became months. The number of believers grew', 'source_text' => 'melaluinya seruan dakwah dapat diteruskan. Hari berganti minggu, dan minggu berganti bulan. Bilangan orang yang beriman bertambah', 'order' => 54],
            ['start_time' => 439.76, 'end_time' => 449.44, 'target_text' => 'quietly, carefully. Some were poor, others noble, but all were equal in their submission. For in', 'source_text' => 'secara senyap dan berhati-hati. Ada di antara mereka yang fakir miskin, ada yang bangsawan mulia, namun semuanya setaraf dalam ketundukan iman. Kerana', 'order' => 55],
            ['start_time' => 449.44, 'end_time' => 456.8, 'target_text' => 'this new faith, there was no pride in lineage, no power in wealth, only the light of belief. It was', 'source_text' => 'dalam agama baharu ini, tiada lagi kemegahan pada susur galur keturunan, tiada keistimewaan pada kekayaan harta, yang ada hanyalah nur keimanan. Inilah', 'order' => 56],
            ['start_time' => 456.8, 'end_time' => 462.48, 'target_text' => 'the beginning of a revolution, not of swords, but of hearts. The prophet, peace be upon him,', 'source_text' => 'permulaan sebuah revolusi kebangkitan, bukan dengan libasan pedang, sebaliknya sentuhan keinsafan sanubari. Baginda Rasulullah ﷺ', 'order' => 57],
            ['start_time' => 462.48, 'end_time' => 471.2, 'target_text' => 'would gather them in the home of Alam. May Allah be pleased with him. Near the hill of Safa, that', 'source_text' => 'mengumpulkan mereka di rumah sahabat baginda, Al-Arqam radhiyallahu \'anhu. Terletak berhampiran Bukit Safa, rumah yang serba', 'order' => 58],
            ['start_time' => 471.2, 'end_time' => 478.08, 'target_text' => 'humble house became the first school of Islam, a place where faith was nurtured and the Quran was', 'source_text' => 'sederhana itu menjadi madrasah pertama dalam Islam, tempat di mana benih iman disemai dan Al-Quran diajarkan secara berbisik penuh rahsia.', 'order' => 59],
            ['start_time' => 478.08, 'end_time' => 486.4, 'target_text' => 'taught in whispers. Every verse revealed was like rain falling upon dry land, reviving hearts long', 'source_text' => 'Setiap ayat yang diturunkan laksana titisan hujan rahmat yang membasahi bumi kontang, menghidupkan kembali sanubari yang sekian lama', 'order' => 60],
            ['start_time' => 486.4, 'end_time' => 494.32, 'target_text' => 'parched by ignorance. The night prayers continued, soft, secret, unbroken. And as the moon hung', 'source_text' => 'kering kontang akibat kejahilan. Solat malam mereka berterusan tanpa putus, berlangsung lembut dan rahsia. Dan tatkala bulan mengambang terang', 'order' => 61],
            ['start_time' => 494.32, 'end_time' => 499.68, 'target_text' => 'over Makkah, the believers would listen to the recitation of their prophet, may peace be upon', 'source_text' => 'menyinari kota Mekah, orang-orang beriman tekun mendengar alunan bacaan ayat suci daripada Rasulullah ﷺ.', 'order' => 62],
            ['start_time' => 499.68, 'end_time' => 508.8, 'target_text' => 'him. The words carried peace deeper than sleep, courage stronger than fear. They did not yet know', 'source_text' => 'Kalimah-kalimah wahyu itu membawa ketenteraman jiwa yang lebih mendalam daripada tidur, dan membina keberanian yang jauh lebih perkasa daripada rasa takut. Mereka belum pun mengetahui', 'order' => 63],
            ['start_time' => 508.8, 'end_time' => 517.52, 'target_text' => 'what trials awaited them, but they knew who their Lord was, and that was enough. And so in the quiet', 'source_text' => 'apakah ujian mehnah yang bakal menanti, namun mereka mengenali siapakah Tuhan mereka, dan itu sudah lebih daripada mencukupi. Maka di setiap sudut', 'order' => 64],
            ['start_time' => 517.52, 'end_time' => 526.64, 'target_text' => 'corners of Mecca, Islam grew unseen, unstoppable. The idols still stood in the Caba, but their time', 'source_text' => 'tersembunyi di kota Mekah, Islam berkembang mekar tanpa kelihatan dan tidak dapat disekat lagi. Berhala-berhala masih terpacak di Kaabah, namun era kebatilannya', 'order' => 65],
            ['start_time' => 526.64, 'end_time' => 533.2, 'target_text' => 'was ending. For now, the believers prayed in secret, but the echo of their faith reached', 'source_text' => 'kian menghampiri ke penghujung. Buat masa ini, orang-orang beriman masih bersolat secara sembunyi, namun gemaan keimanan mereka telah pun sampai', 'order' => 66],
            ['start_time' => 533.2, 'end_time' => 540.4, 'target_text' => 'the heavens. The light that began in the cave of Harrah was spreading from one heart to another', 'source_text' => 'ke pintu-pintu langit. Nur hidayah yang bermula di Gua Hira\' kini menjalar dari satu hati ke satu hati yang lain,', 'order' => 67],
            ['start_time' => 540.4, 'end_time' => 549.28, 'target_text' => 'until no darkness could contain it. And so the first hearts embraced Islam quietly, beautifully,', 'source_text' => 'sehingga tiada lagi kepekatan kegelapan yang mampu mengekangnya. Begitulah bagaimana generasi awal memeluk Islam dengan tenang, indah,', 'order' => 68],
            ['start_time' => 549.28, 'end_time' => 555.44, 'target_text' => 'and with certainty. They did not wait for miracles. They did not seek proofs. They believed', 'source_text' => 'dan penuh keyakinan yang teguh. Mereka tidak menunggu berlakunya mukjizat ganjil. Mereka tidak menuntut bukti-bukti fizikal. Mereka beriman', 'order' => 69],
            ['start_time' => 555.44, 'end_time' => 562.24, 'target_text' => 'because their hearts recognized the light. This is the lesson. When Allah opens the heart,', 'source_text' => 'kerana hati nurani mereka terus mengenali cahaya kebenaran hakiki. Inilah pengajarannya: Tatkala Allah membuka pintu hati seseorang hamba,', 'order' => 70],
            ['start_time' => 562.24, 'end_time' => 569.6, 'target_text' => 'the truth becomes clear, unshakable, unbreakable. In the next episode, inshallah, we will see how', 'source_text' => 'kebenaran itu menjadi amat jelas nyata, tidak dapat digoyahkan dan tidak dapat dipatahkan. Dalam episod seterusnya, insya-Allah, kita akan menyaksikan bagaimana', 'order' => 71],
            ['start_time' => 569.6, 'end_time' => 584.16, 'target_text' => 'this message begins to spread across Mecca. Soft at first, then unstoppable. Sah Muhammad.', 'source_text' => 'risalah agung ini mula tersebar ke seluruh pelusuk kota Mekah. Bermula secara lembut pada awalnya, kemudian menjadi arus yang tidak dapat disekat lagi. Sallallahu \'ala Muhammad ﷺ.', 'order' => 72],
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
