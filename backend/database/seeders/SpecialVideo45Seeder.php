<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo45Seeder extends Seeder
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

        // Special Bilingual Religious Video #45 (Siri 3 Ep.05): Wiping the Slate Clean - Tawbah & Istighfar - Episode 5 - The Final Stretch - Mufti Menk
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'vtu7mc_hv4o'],
            [
                'language_id'   => $english->id,
                'title'         => 'Wiping the Slate Clean - Tawbah & Istighfar - Episode 5 - The Final Stretch - Mufti Menk',
                'thumbnail_url' => 'https://img.youtube.com/vi/vtu7mc_hv4o/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 45,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 7.12, 'end_time' => 11.68, 'target_text' => 'Seeking the forgiveness of Allah during the month of Ramadan is one of the most', 'source_text' => 'Memohon keampunan daripada Allah sepanjang bulan Ramadan merupakan salah satu', 'order' => 1],
            ['start_time' => 11.68, 'end_time' => 17.04, 'target_text' => 'important acts of worship one of the ideas of Ramadan is also seeking forgiveness and', 'source_text' => 'ibadah yang paling penting. Antara matlamat utama Ramadan juga adalah untuk meraih keampunan, dan', 'order' => 2],
            ['start_time' => 17.04, 'end_time' => 20.64, 'target_text' => 'that\'s why the prophet Muhammad peace be upon him says whoever fasts in', 'source_text' => 'sebab itulah junjungan Nabi Muhammad SAW bersabda: \'Barang siapa yang berpuasa di bulan', 'order' => 3],
            ['start_time' => 20.64, 'end_time' => 26.32, 'target_text' => 'Ramadan all their previous sins will be forgiven whoever stands', 'source_text' => 'Ramadan, akan diampunkan segala dosa-dosanya yang terdahulu\'. \'Barang siapa yang mendirikan solat malam', 'order' => 4],
            ['start_time' => 26.32, 'end_time' => 32.08, 'target_text' => 'in Ramadan in prayer it\'s the same thing whoever is standing', 'source_text' => 'di bulan Ramadan, hal yang serupa dijanjikan; sesiapa yang menghidupkan malam', 'order' => 5],
            ['start_time' => 32.08, 'end_time' => 36.56, 'target_text' => 'in all the previous sins are', 'source_text' => 'Lailatul Qadar, kesemua dosanya yang terdahulu turut', 'order' => 6],
            ['start_time' => 36.56, 'end_time' => 49.68, 'target_text' => 'forgiven so one of the objectives of Ramadan is to be able to achieve forgiveness which is closely', 'source_text' => 'diampunkan.\' Maka salah satu objektif teras Ramadan adalah untuk berupaya meraih keampunan, yang mana ia terhubung rapat', 'order' => 7],
            ['start_time' => 49.68, 'end_time' => 55.52, 'target_text' => 'connected to the mercy of Allah subhanahu wa ta\'ala my brothers my sisters today I want to look', 'source_text' => 'dengan limpahan rahmat Allah SWT. Wahai saudara dan saudariku sekalian, hari ini saya ingin meneliti', 'order' => 8],
            ['start_time' => 55.52, 'end_time' => 63.52, 'target_text' => 'at this issue of seeking forgiveness we have two words in the Arabic language and the difference', 'source_text' => 'perihal memohon keampunan ini. Di dalam bahasa Arab, kita mempunyai dua perkataan utama, dan perbezaan', 'order' => 9],
            ['start_time' => 63.52, 'end_time' => 70.16, 'target_text' => 'between the two is to seek the forgiveness of Allah from something you did and to seek the', 'source_text' => 'antara keduanya ialah: memohon keampunan Allah atas dosa yang pernah kalian lakukan, serta memohon', 'order' => 10],
            ['start_time' => 70.16, 'end_time' => 75.68, 'target_text' => 'forgiveness of Allah in order to earn closeness to Allah the prophet Muhammad peace be upon him', 'source_text' => 'keampunan Allah demi meraih kedekatan dengan Allah. Junjungan Nabi Muhammad SAW', 'order' => 11],
            ['start_time' => 75.68, 'end_time' => 82.48, 'target_text' => 'was not sinful he was protected by Allah totally he used to seek forgiveness every day to gain', 'source_text' => 'sama sekali tidak berdosa; baginda dipelihara sepenuhnya oleh Allah (maksum). Namun baginda tetap beristighfar setiap hari demi mendampingi', 'order' => 12],
            ['start_time' => 82.48, 'end_time' => 89.36, 'target_text' => 'closeness to Allah further meaning to become more and more closer to Allah subhanahu wa ta\'ala so', 'source_text' => 'dan mendekatkan diri lagi kepada Allah—iaitu menjadi semakin akrab dan dekat dengan Allah SWT. Maka', 'order' => 13],
            ['start_time' => 89.36, 'end_time' => 94.88, 'target_text' => 'the same applies to us on another level altogether because we are not the prophet of Allah subhanahu', 'source_text' => 'hal yang sama terpakai kepada kita pada tahap yang berbeza sama sekali, kerana kita bukanlah nabi Allah', 'order' => 14],
            ['start_time' => 94.88, 'end_time' => 100.24, 'target_text' => 'wa ta\'ala sallallahu alaihi wasallam but don\'t say I did nothing wrong why should I seek the', 'source_text' => 'SWT. Namun janganlah sesekali kalian berkata: \'Saya tidak buat sebarang salah, mengapa saya perlu memohon', 'order' => 15],
            ['start_time' => 100.24, 'end_time' => 105.6, 'target_text' => 'forgiveness of Allah keep seeking the forgiveness of Allah for things you know for things you don\'t', 'source_text' => 'keampunan daripada Allah?\' Teruskanlah beristighfar memohon ampun kepada Allah atas dosa-dosa yang kalian sedari mahupun yang tidak kalian ketahui;', 'order' => 16],
            ['start_time' => 105.6, 'end_time' => 111.76, 'target_text' => 'know because by seeking the forgiveness of Allah he will forgive you the first time that you sought', 'source_text' => 'kerana dengan memohon keampunan Allah, Dia telah mengampuni kalian pada kali pertama kalian beristighfar,', 'order' => 17],
            ['start_time' => 111.76, 'end_time' => 118.64, 'target_text' => 'the forgiveness all the other times you\'re just getting closer and closer and closer to Allah but', 'source_text' => 'manakala istighfar pada kali-kali berikutnya hanyalah menjadikan kalian semakin dekat, akrab, dan intim dengan Allah! Namun,', 'order' => 18],
            ['start_time' => 118.64, 'end_time' => 128.24, 'target_text' => 'there is a difference between the two is to seek forgiveness means to return to Allah let me give', 'source_text' => 'terdapat perbezaan nyata antara keduanya: Istighfar bererti memohon keampunan, manakala Taubat bererti kembali kepada Allah. Izinkan saya', 'order' => 19],
            ['start_time' => 128.24, 'end_time' => 133.2, 'target_text' => 'you an example a person has bad ways and habits they come and say "Oh Allah forgive me." Allah', 'source_text' => 'berikan satu contoh: seseorang yang mempunyai tabiat dan kelakuan buruk datang berdoa, \'Ya Allah ampunkanlah daku.\' Allah', 'order' => 20],
            ['start_time' => 133.2, 'end_time' => 138.08, 'target_text' => 'forgives them but they continue in their bad ways and habits and Allah forgives them when', 'source_text' => 'mengampuninya, namun dia masih berterusan mengulangi tabiat buruk tersebut; dan Allah mengampuninya lagi tatkala', 'order' => 21],
            ['start_time' => 138.08, 'end_time' => 144.96, 'target_text' => 'they seek forgiveness again but when they quit and they change their lives and they return to', 'source_text' => 'dia beristighfar semula. Namun apabila dia berhenti sepenuhnya, merombak kehidupannya, dan kembali ke', 'order' => 22],
            ['start_time' => 144.96, 'end_time' => 151.44, 'target_text' => 'the path of Allah that\'s called that\'s why in the Quran some of the messengers are recorded to have', 'source_text' => 'jalan Allah—itulah yang dinamakan Taubat! Sebab itulah di dalam al-Quran, sebahagian para rasul dirakamkan', 'order' => 23],
            ['start_time' => 151.44, 'end_time' => 162.4, 'target_text' => 'said "Oh my people seek the forgiveness of Allah and then change your lives to return to his path."', 'source_text' => 'menyeru: \'Wahai kaumku, beristighfarlah memohon keampunan Allah, kemudian bertaubatlah dengan mengubah hidupmu kembali ke jalan-Nya!\'', 'order' => 24],
            ['start_time' => 162.4, 'end_time' => 169.04, 'target_text' => 'That is what is the difference between the two is to seek forgiveness for the sins and is to change', 'source_text' => 'Itulah perbezaan antara keduanya: Istighfar adalah memohon keampunan atas dosa, manakala Taubat adalah mengubah', 'order' => 25],
            ['start_time' => 169.04, 'end_time' => 174.0, 'target_text' => 'your life and return to the path of Allah so when they say makeba what does that mean that means', 'source_text' => 'arah hidup kalian dan kembali ke jalan Allah. Maka apabila orang menyebut \'bertaubatlah\', apakah maksudnya? Maksudnya', 'order' => 26],
            ['start_time' => 174.0, 'end_time' => 181.52, 'target_text' => 'change your life when they say makear or seekar that means seek the forgiveness of Allah subhanahu', 'source_text' => 'ubahlah corak hidup kalian! Apabila mereka menyebut \'beristighfarlah\', itu bererti pohonlah keampunan daripada Allah', 'order' => 27],
            ['start_time' => 181.52, 'end_time' => 188.72, 'target_text' => 'wa ta\'ala the two come hand in hand toba andar now in Ramadan remember there are a few factors', 'source_text' => 'SWT. Kedua-duanya berjalan seiring: Taubat dan Istighfar. Kini di bulan Ramadan, ingatlah ada beberapa perkara utama', 'order' => 28],
            ['start_time' => 188.72, 'end_time' => 194.48, 'target_text' => 'you need to know it\'s the month of forgiveness if forgiveness is on sale you basically buy', 'source_text' => 'yang wajib kalian fahami: ini adalah bulan keampunan! Jika keampunan diibaratkan jualan potongan harga, kalian seumpama membeli', 'order' => 29],
            ['start_time' => 194.48, 'end_time' => 200.32, 'target_text' => '70 for the price of one if you\'re not going to buy it now you have wasted the whole year this', 'source_text' => '70 gandaan pada harga satu! Jika kalian tidak merebutnya sekarang, kalian telah mensia-siakan sepanjang tahun. Inilah', 'order' => 30],
            ['start_time' => 200.32, 'end_time' => 205.68, 'target_text' => 'is the month of forgiveness the prophet peace be upon him says "Destruction be upon the one', 'source_text' => 'bulan keampunan! Junjungan Nabi SAW bersabda: \'Celakalah dan amat rugilah bagi sesiapa', 'order' => 31],
            ['start_time' => 205.68, 'end_time' => 214.64, 'target_text' => 'who witnesses Ramadan and comes out of it without having achieved forgiveness." Ramadan destruction', 'source_text' => 'yang sempat menyaksi dan menemui Ramadan, namun keluar daripadanya tanpa beroleh pengampunan dosa!\' Kebinasaan buatnya!', 'order' => 32],
            ['start_time' => 214.64, 'end_time' => 221.68, 'target_text' => 'how can woe be upon the one what a loss to the one who exited Ramadan and they didn\'t achieve', 'source_text' => 'Alangkah malangnya dan alangkah ruginya bagi mereka yang melepasi Ramadan tetapi tidak meraih', 'order' => 33],
            ['start_time' => 221.68, 'end_time' => 227.2, 'target_text' => 'forgiveness so it\'s the month of forgiveness do not lose this opportunity seek the forgiveness', 'source_text' => 'keampunan. Maka ini adalah bulan keampunan, jangan sekali-kali melepaskan peluang emas ini! Pohonlah keampunan,', 'order' => 34],
            ['start_time' => 227.2, 'end_time' => 233.36, 'target_text' => 'be bold many times we\'re involved in sins oh Allah forgive me help me to change strengthen me so that', 'source_text' => 'beranikanlah diri! Sering kali kita terpalit dengan dosa: \'Ya Allah ampunkanlah daku, bantulah daku berubah, kuatkanlah daku agar', 'order' => 35],
            ['start_time' => 233.36, 'end_time' => 238.24, 'target_text' => 'I do the right thing strengthen me so I stay away from sin those are powerful duas powerful', 'source_text' => 'daku melakukan kebaikan, kuatkanlah daku agar daku menjauhi maksiat.\' Itu semua adalah doa-doa yang amat ampuh lagi berkuasa!', 'order' => 36],
            ['start_time' => 238.24, 'end_time' => 245.12, 'target_text' => 'supplications oh Allah make me strong to obey you and make me weak when it comes to sin so I don\'t', 'source_text' => '\'Ya Allah jadikanlah daku gagah untuk mentaati-Mu, dan jadikanlah daku lemah apabila berhadapan dengan maksiat agar daku tidak', 'order' => 37],
            ['start_time' => 245.12, 'end_time' => 251.12, 'target_text' => 'sin or make me strong to abstain from the sin all of these are beautiful duas but I tell you at the', 'source_text' => 'berdosa; atau kurniakanlah daku ketabahan untuk menahan diri daripada dosa.\' Semua itu adalah munajat yang indah. Tetapi saya katakan kepada kalian, di sudut', 'order' => 38],
            ['start_time' => 251.12, 'end_time' => 257.28, 'target_text' => 'back of your mind you think ah I might fall into this again i I I might not be jo genuine don\'t', 'source_text' => 'belakang minda kalian terdetik: \'Ah, aku mungkin terlanjur lagi nanti, taubatku ini mungkin tidak ikhlas.\' Jangan sesekali', 'order' => 39],
            ['start_time' => 257.28, 'end_time' => 264.16, 'target_text' => 'let those whisperings actually distract you from seeking forgiveness seek forgiveness be strong', 'source_text' => 'biarkan bisikan-bisikan itu memesongkan kalian daripada memohon ampun! Teruskan beristighfar, kuatkanlah semangat,', 'order' => 40],
            ['start_time' => 264.16, 'end_time' => 270.72, 'target_text' => 'have a resolve be focused and Allah will help you if sometime in the future you fell again Allah', 'source_text' => 'bulatkan azam, kekal fokus, dan Allah pasti akan menolong kalian. Sekiranya pada masa hadapan kalian tersungkur lagi, merayulah kepada Allah', 'order' => 41],
            ['start_time' => 270.72, 'end_time' => 276.64, 'target_text' => 'Almighty you seek his forgiveness again he will forgive you try your best by the will of Allah', 'source_text' => 'Yang Maha Perkasa; pohonlah keampunan-Nya sekali lagi, Dia pasti mengampuni kalian! Berusahalah sedaya upaya dengan izin Allah', 'order' => 42],
            ['start_time' => 276.64, 'end_time' => 283.28, 'target_text' => 'subhanahu wa ta\'ala and you will never regret so if you take a careful look at the Quran you\'ll', 'source_text' => 'SWT, dan kalian tidak akan pernah menyesal. Sekiranya kalian mengamati ayat-ayat al-Quran dengan teliti, kalian akan', 'order' => 43],
            ['start_time' => 283.28, 'end_time' => 288.96, 'target_text' => 'notice Allah says "Don\'t lose hope in my mercy." One of the things we do is we lose hope in his', 'source_text' => 'melihat Allah berfirman: \'Janganlah berputus asa daripada rahmat-Ku!\' Antara kesilapan yang sering kita lakukan ialah berputus asa terhadap rahmat', 'order' => 44],
            ['start_time' => 288.96, 'end_time' => 296.72, 'target_text' => 'mercy we go against the Quran allah says "Say oh my worshippers who have transgressed against', 'source_text' => 'dan kasih sayang-Nya; kita menyalahi al-Quran! Allah berfirman: \'Katakanlah: Wahai hamba-hamba-Ku yang telah melampaui batas terhadap', 'order' => 45],
            ['start_time' => 296.72, 'end_time' => 308.08, 'target_text' => 'themselves." Do not lose hope in the mercy of Allah what do we do we lose hope how do we lose', 'source_text' => 'diri mereka sendiri, janganlah kamu berputus asa daripada rahmat Allah!\' Namun apakah yang kita lakukan? Kita berputus asa! Bagaimanakah kita', 'order' => 46],
            ['start_time' => 308.08, 'end_time' => 313.92, 'target_text' => 'hope we say "I don\'t think Allah will forgive me i doubt I will be forgiven you know I\'m a', 'source_text' => 'berputus asa? Kita berkata: \'Aku rasa Allah takkan ampunkan dosaku, aku ragu-ragu sama ada aku diampunkan... aku ini orang jahat,', 'order' => 47],
            ['start_time' => 313.92, 'end_time' => 319.68, 'target_text' => 'bad person you know I\'ve committed so many sins." How dare you say that you\'re a human', 'source_text' => 'aku telah lakukan terlalu banyak maksiat.\' Sampai hati kalian berkata begitu? Kalian hanyalah seorang manusia,', 'order' => 48],
            ['start_time' => 319.68, 'end_time' => 325.12, 'target_text' => 'allah knows you you cannot doubt the mercy of Allah allah told you "Do not doubt." You\'re', 'source_text' => 'dan Allah amat mengenali kalian! Kalian tidak boleh meragui rahmat Allah; Allah telah berfirman kepada kalian: \'Jangan berputus asa!\' Tindakan kalian', 'order' => 49],
            ['start_time' => 325.12, 'end_time' => 329.84, 'target_text' => 'contradicting the Quran you\'re going against the verse of the Quran when Allah said "Do', 'source_text' => 'itu bercanggah dengan al-Quran, kalian menentang ayat al-Quran tatkala Allah telah menegaskan: \'Jangan', 'order' => 50],
            ['start_time' => 329.84, 'end_time' => 336.24, 'target_text' => 'not despair don\'t lose hope in my mercy." And here you are ex doing exactly what Allah told', 'source_text' => 'berputus asa daripada rahmat-Ku!\' Dan di sini kalian melakukan perkara yang ditegah oleh Allah', 'order' => 51],
            ['start_time' => 336.24, 'end_time' => 341.84, 'target_text' => 'you not to do that\'s a plot of Shayan that is a plan of the devil he\'s tuned our brains', 'source_text' => 'secara terang-terangan! Ketahuilah, itu adalah tipu daya Syaitan, jerangkap iblis! Dia telah memesongkan minda kita', 'order' => 52],
            ['start_time' => 341.84, 'end_time' => 348.16, 'target_text' => 'to thinking that Allah is someone who gets joy out of punishing us whereas the opposite is true', 'source_text' => 'sehingga menyangka seolah-olah Allah gembira mengazab kita; walhal hakikat yang sebaliknya adalah benar:', 'order' => 53],
            ['start_time' => 348.16, 'end_time' => 353.28, 'target_text' => 'allah gets joy out of us turning to him that\'s in the hadith that\'s in the Quran', 'source_text' => 'Allah amat suka dan gembira tatkala kita kembali bertaubat kepada-Nya! Hal ini termaktub di dalam hadis dan di dalam al-Quran.', 'order' => 54],
            ['start_time' => 353.28, 'end_time' => 359.76, 'target_text' => 'allah is happy when we turn to him but Allah is not going to get excited by punishing you and', 'source_text' => 'Allah gembira menyambut kepulangan hamba-Nya; Allah sama sekali tidak berhasrat atau berseronok untuk mengazab kalian', 'order' => 55],
            ['start_time' => 359.76, 'end_time' => 371.28, 'target_text' => 'I what is Allah going to do by punishing you what the Quran says what will Allah do by punishing you', 'source_text' => 'dan saya. Apakah keuntungan bagi Allah dengan mengazab kalian? Seperti yang ditegaskan al-Quran: Apakah yang Allah hendak lakukan dengan mengazab kalian', 'order' => 56],
            ['start_time' => 371.28, 'end_time' => 376.64, 'target_text' => 'if you\'re going to be thankful and you\'re going to believe allah never gets happy and excited when', 'source_text' => 'sekiranya kalian bersyukur dan beriman? Allah tidak pernah gembira tatkala', 'order' => 57],
            ['start_time' => 376.64, 'end_time' => 382.72, 'target_text' => 'someone is transgressing but rather he gets happy when someone is turning to him so when you say oh', 'source_text' => 'seseorang itu melakukan maksiat, sebaliknya Dia amat gembira apabila seseorang itu kembali bertaubat kepada-Nya. Maka apabila kalian merintih, \'Ya', 'order' => 58],
            ['start_time' => 382.72, 'end_time' => 391.36, 'target_text' => 'Allah forgive me and you were genuine one time everything is wiped out completely whatever you', 'source_text' => 'Allah ampunkanlah dosaku\' dengan penuh keikhlasan, pada detik itu juga segala dosa kalian dihapuskan sebersih-bersihnya! Apa jua dosa', 'order' => 59],
            ['start_time' => 391.36, 'end_time' => 400.16, 'target_text' => 'had in mind when you said oh Allah forgive me is gone it is literally out now Shayan might make you', 'source_text' => 'yang terlintas di fikiran tatkala kalian memohon ampun, semuanya telah lenyap dipadamkan. Kini Syaitan mungkin mencetuskan', 'order' => 60],
            ['start_time' => 400.16, 'end_time' => 405.76, 'target_text' => 'doubt and you know in Ramadan they say the shin are tied up but man has been tuned already pre-', 'source_text' => 'keraguan—dan seperti yang kalian tahu, pada bulan Ramadan syaitan-syaitan dirantai; namun manusia telah terbiasa sebelum', 'order' => 61],
            ['start_time' => 405.76, 'end_time' => 413.76, 'target_text' => 'Ramadan that Allah won\'t just forgive so easily allah forgives very easily and when I say this', 'source_text' => 'Ramadan dengan sangkaan bahawa Allah sukar mengampunkan. Hakikatnya, Allah mengampuni dengan amat mudah! Dan tatkala saya menyatakan hal ini,', 'order' => 62],
            ['start_time' => 413.76, 'end_time' => 419.44, 'target_text' => 'I\'m not belittling the sin to encourage you to sin again because you don\'t know upon which condition', 'source_text' => 'saya sama sekali tidak meremehkan dosa untuk mendorong kalian mengulanginya, kerana kalian tidak tahu dalam keadaan bagaimana', 'order' => 63],
            ['start_time' => 419.44, 'end_time' => 425.04, 'target_text' => 'you may die but I am telling you to give you hope in the mercy of Allah because we are living in a', 'source_text' => 'kalian bakal menghembuskan nafas terakhir; sebaliknya saya sampaikan ini untuk menyuntik harapan terhadap rahmat Allah, kerana kita kini hidup dalam', 'order' => 64],
            ['start_time' => 425.04, 'end_time' => 432.08, 'target_text' => 'hopeless world at the moment where everything is so negative the most positive thing is the mercy', 'source_text' => 'dunia yang penuh keputusasaan di mana segalanya sarat dengan kenegatifan. Perkara yang paling positif ialah rahmat', 'order' => 65],
            ['start_time' => 432.08, 'end_time' => 438.0, 'target_text' => 'of Allah and if you don\'t believe in it you will not be able to enjoy your days on earth but if you', 'source_text' => 'dan kasih sayang Allah; dan jika kalian tidak meyakininya, kalian tidak akan dapat menikmati hari-hari kehidupan di dunia. Sebaliknya jika kalian', 'order' => 66],
            ['start_time' => 438.0, 'end_time' => 444.8, 'target_text' => 'believe in the mercy of Allah and you try to look into ways of achieving it then you are correct in', 'source_text' => 'yakin terhadap rahmat Allah dan berusaha mencari jalan meraihnya, maka benarlah hubungan kalian', 'order' => 67],
            ['start_time' => 444.8, 'end_time' => 450.32, 'target_text' => 'your relationship with Allah that should not prod you to do something sinful and say Allah', 'source_text' => 'dengan Allah. Namun keyakinan itu tidak wajar mendorong kalian melakukan dosa lalu berdalih: \'Alah, Allah kan', 'order' => 68],
            ['start_time' => 450.32, 'end_time' => 455.04, 'target_text' => 'is forgiving you know some people say let me do this now i heard from the sheh that Allah is very', 'source_text' => 'Maha Pengampun!\' Ada segelintir orang berkata: \'Biar aku buat maksiat ini dulu, aku dengar daripada syeikh tadi bahawa Allah amat', 'order' => 69],
            ['start_time' => 455.04, 'end_time' => 461.52, 'target_text' => 'forgiving it\'s okay he\'ll forgive me no we will never do that but we will always try to achieve', 'source_text' => 'Maha Pengampun, nanti Dia ampunkanlah aku\'—jangan, kita tidak akan sesekali bersikap begitu! Namun kita sentiasa berusaha meraih', 'order' => 70],
            ['start_time' => 461.52, 'end_time' => 466.8, 'target_text' => 'the mercy of Allah have hope in Allah think good about Allah think good about the hereafter you', 'source_text' => 'rahmat Allah, bersangka baik terhadap Allah, meletakkan harapan kepada-Nya, dan berfikiran positif terhadap akhirat; nescaya kalian', 'order' => 71],
            ['start_time' => 466.8, 'end_time' => 472.8, 'target_text' => 'will make it to Jenna we have a concern we are worried we do have an element of fear but that', 'source_text' => 'akan sampai ke Syurga! Kita memang ada rasa bimbang, kita ada rasa khuatir, kita ada perasaan takut; tetapi perasaan', 'order' => 72],
            ['start_time' => 472.8, 'end_time' => 479.84, 'target_text' => 'fear should not overpower the hope that we have never we have a balance of the two in a way that', 'source_text' => 'takut itu tidak boleh sesekali mengatasi harapan yang kita semaikan! Kita perlu mengimbangi kedua-duanya sedemikian rupa sehingga', 'order' => 73],
            ['start_time' => 479.84, 'end_time' => 487.52, 'target_text' => 'the hope outweighs element of fear and if there is any fear it should be directed in the correct way', 'source_text' => 'harapan mendahului rasa takut; dan sekiranya ada perasaan takut, ia wajar disalurkan ke landasan yang betul:', 'order' => 74],
            ['start_time' => 487.52, 'end_time' => 495.2, 'target_text' => 'to say this is fear fear of what fear to spoil the relationship I have with Allah that\'s what', 'source_text' => 'yakni takut akan apa? Takut merosakkan hubungan akrab yang kita miliki dengan Allah! Itulah intipati', 'order' => 75],
            ['start_time' => 495.2, 'end_time' => 501.12, 'target_text' => 'it is it\'s a fear that\'s born out of love i love Allah so much that I don\'t want to earn his wroth', 'source_text' => 'sebenarnya: rasa takut yang lahir daripada rasa cinta yang mendalam! Aku amat mencintai Allah sehingga aku tidak sanggup mengundang kemurkaan-Nya,', 'order' => 76],
            ['start_time' => 501.12, 'end_time' => 506.96, 'target_text' => 'i don\'t want to him to be angry with me so I seek the forgiveness of Allah and I make', 'source_text' => 'aku tidak rela Dia murka terhadapku. Justeru aku sentiasa memohon keampunan daripada Allah dan aku berpegang', 'order' => 77],
            ['start_time' => 506.96, 'end_time' => 513.36, 'target_text' => 'sure that I understand Allah will forgive me especially during these days of forgiveness', 'source_text' => 'teguh bahawa Allah pasti mengampuniku, terutamanya pada hari-hari keampunan ini.', 'order' => 78],
            ['start_time' => 513.36, 'end_time' => 519.12, 'target_text' => 'seek the forgiveness of Allah every single day and you\'ll never go wrong these are the', 'source_text' => 'Beristighfarlah memohon keampunan Allah pada setiap hari, nescaya kalian tidak akan rugi. Inilah', 'order' => 79],
            ['start_time' => 519.12, 'end_time' => 525.52, 'target_text' => 'most blessed days of Ramadan don\'t doubt Allah don\'t doubt Allah worship Allah with conviction', 'source_text' => 'hari-hari yang paling diberkati di bulan Ramadan. Jangan ragui Allah! Jangan sangsi terhadap Allah! Sembahlah Allah dengan penuh keyakinan,', 'order' => 80],
            ['start_time' => 525.52, 'end_time' => 533.2, 'target_text' => 'and Allah Almighty will open your doors we\'re human beings do your best in worship and don\'t', 'source_text' => 'nescaya Allah Yang Maha Perkasa akan membuka luas pintu-pintu rahmat buat kalian. Kita insan biasa; lakukanlah ibadah yang terbaik dan usah', 'order' => 81],
            ['start_time' => 533.2, 'end_time' => 538.48, 'target_text' => 'doubt whether Allah has accepted it or not inshallah he has accepted it let\'s move on', 'source_text' => 'ragu-ragu sama ada Allah telah menerimanya ataupun tidak. Insya-Allah Dia telah menerimanya! Marilah kita beralih', 'order' => 82],
            ['start_time' => 538.48, 'end_time' => 544.24, 'target_text' => 'to the next acts of worship and let\'s continue in our lives may Allah almighty make it easy for us', 'source_text' => 'kepada amalan ibadah yang seterusnya dan meneruskan langkah kehidupan kita. Semoga Allah Yang Maha Perkasa mempermudahkan urusan kita', 'order' => 83],
            ['start_time' => 544.24, 'end_time' => 549.2, 'target_text' => 'so that we exit this month of Ramadan this final stretch is made in a way that we can', 'source_text' => 'agar tatkala kita melangkah keluar daripada bulan Ramadan ini—pecutan akhir ini dilalui sedemikian rupa agar kita dapat', 'order' => 84],
            ['start_time' => 549.2, 'end_time' => 556.56, 'target_text' => 'come out totally forgiven and we would have benefited from this lovely month of Ramadan', 'source_text' => 'keluar dalam keadaan dosa diampunkan sepenuhnya, serta beroleh manfaat agung daripada bulan Ramadan yang penuh keberkatan ini.', 'order' => 85],
        ];

        // Bulk insert in chunks of 100 for maximum performance and atomicity
        $now = now();
        $chunks = array_chunk($subtitles, 100);
        foreach ($chunks as $chunk) {
            $insertData = [];
            foreach ($chunk as $item) {
                $insertData[] = [
                    'id'          => (string) Str::uuid(),
                    'video_id'    => $video->id,
                    'start_time'  => $item['start_time'],
                    'end_time'    => $item['end_time'],
                    'target_text' => $item['target_text'],
                    'source_text' => $item['source_text'],
                    'order'       => $item['order'],
                    'created_at'  => $now,
                    'updated_at'  => $now,
                ];
            }
            DB::table('video_subtitles')->insert($insertData);
        }
    }
}
