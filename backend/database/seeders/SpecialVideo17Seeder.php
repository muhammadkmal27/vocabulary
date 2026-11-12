<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo17Seeder extends Seeder
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

        // Special Bilingual Religious Video #17 (Siri 1 Ep.12): The Pledge of ʿAqabah | Life of the Final Messenger ﷺ | Ep.12 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'KrzPe8NrRd4'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Pledge of ʿAqabah | Life of the Final Messenger ﷺ | Ep.12 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/KrzPe8NrRd4/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 17,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.32, 'end_time' => 9.02, 'target_text' => 'Yet, every year during the pilgrimage season, the prophet, peace be upon him, would walk among the tents of the tribes, alone,', 'source_text' => 'Namun, setiap tahun ketika musim haji, Nabi SAW akan berjalan di celah khemah-khemah kabilah, bersendirian,', 'order' => 1],
            ['start_time' => 9.12, 'end_time' => 16.54, 'target_text' => 'dusty, and patient, saying, "Oh people, say la ilaha illallah, and you will succeed.', 'source_text' => 'berdebu, dan penuh sabar, bersabda, "Wahai sekalian manusia, ucapkanlah la ilaha illallah, nescaya kamu akan berjaya.', 'order' => 2],
            ['start_time' => 16.64, 'end_time' => 19.7, 'target_text' => 'Your place of refuge has been shown to me.', 'source_text' => 'Tempat hijrahmu telah diperlihatkan kepadaku.', 'order' => 3],
            ['start_time' => 19.8, 'end_time' => 26.9, 'target_text' => 'A land of palm trees between two volcanic ridges." That land was Medina.', 'source_text' => 'Bumi pohon kurma di antara dua permatang gunung berapi." Bumi itu ialah Madinah.', 'order' => 4],
            ['start_time' => 27, 'end_time' => 34.9, 'target_text' => 'My beloved brothers and sisters, after years of hardship in Mecca, years of patience, wounds, loss, and struggle, the message', 'source_text' => 'Saudara-saudariku yang dikasihi, setelah bertahun-tahun dalam kepayahan di Mekah, bertahun penuh kesabaran, luka, kehilangan, dan perjuangan, seruan', 'order' => 5],
            ['start_time' => 35, 'end_time' => 40.18, 'target_text' => 'of Islam now begins to move in a new direction.', 'source_text' => 'Islam kini mula melangkah ke arah yang baharu.', 'order' => 6],
            ['start_time' => 40.28, 'end_time' => 44.02, 'target_text' => 'For every night of grief, Allah places a dawn.', 'source_text' => 'Bagi setiap malam kedukaan, Allah jadikan fajar menyusul.', 'order' => 7],
            ['start_time' => 44.12, 'end_time' => 48.74, 'target_text' => 'And after every trial, he opens a door that no one expected.', 'source_text' => 'Dan selepas setiap ujian, Dia membuka pintu yang tidak disangka oleh sesiapapun.', 'order' => 8],
            ['start_time' => 48.84, 'end_time' => 56.3, 'target_text' => 'Far from Mecca, in a city of palms and open sky, there were hearts quietly waiting.', 'source_text' => 'Jauh dari Mekah, di sebuah kota pohon kurma dan langit terbuka, ada hati-hati yang sedang menanti dalam senyap.', 'order' => 9],
            ['start_time' => 56.4, 'end_time' => 58.94, 'target_text' => 'Hearts unburdened by pride.', 'source_text' => 'Hati-hati yang bebas daripada keangkuhan.', 'order' => 10],
            ['start_time' => 59.04, 'end_time' => 63.06, 'target_text' => 'Hearts that recognize truth the moment they heard it.', 'source_text' => 'Hati-hati yang mengenali kebenaran sebaik sahaja mereka mendengarnya.', 'order' => 11],
            ['start_time' => 63.16, 'end_time' => 70.94, 'target_text' => 'Hearts prepared by Allah long before they ever heard the name Muhammad, peace be upon him.', 'source_text' => 'Hati-hati yang dipersiapkan oleh Allah lama sebelum mereka pernah mendengar nama Muhammad SAW.', 'order' => 12],
            ['start_time' => 71.04, 'end_time' => 73.9, 'target_text' => 'This is the beginning of Medina.', 'source_text' => 'Inilah permulaan Madinah.', 'order' => 13],
            ['start_time' => 74, 'end_time' => 80.38, 'target_text' => 'Not the city of power, not the city of victory, not yet, but the city of faith.', 'source_text' => 'Bukan kota kekuasaan, bukan kota kemenangan, belum lagi, tetapi kota keimanan.', 'order' => 14],
            ['start_time' => 80.48, 'end_time' => 87.38, 'target_text' => 'So, come with me to the gathering beneath the night sky, where sincere hearts said, "We believe.', 'source_text' => 'Maka marilah bersamaku ke pertemuan di bawah langit malam, di mana hati-hati yang ikhlas berkata, "Kami beriman.', 'order' => 15],
            ['start_time' => 87.48, 'end_time' => 88.74, 'target_text' => 'We will stand with you.', 'source_text' => 'Kami akan berdiri bersamamu.', 'order' => 16],
            ['start_time' => 88.84, 'end_time' => 90.02, 'target_text' => 'We will protect you.', 'source_text' => 'Kami akan melindungimu.', 'order' => 17],
            ['start_time' => 90.12, 'end_time' => 92.8, 'target_text' => 'We will love you."', 'source_text' => 'Kami akan menyayangimu."', 'order' => 18],
            ['start_time' => 105.04, 'end_time' => 107.78, 'target_text' => 'The years in Mecca grew darker.', 'source_text' => 'Tahun-tahun di Mekah kian bertambah kelam.', 'order' => 19],
            ['start_time' => 107.88, 'end_time' => 115.46, 'target_text' => 'Quraysh had rejected every call, wealth, power, mercy, even truth itself.', 'source_text' => 'Kaum Quraisy telah menolak setiap seruan—kekayaan, kuasa, belas kasihan, malahan kebenaran itu sendiri.', 'order' => 20],
            ['start_time' => 115.56, 'end_time' => 124.22, 'target_text' => 'Yet, every year during the pilgrimage season, the prophet, peace be upon him, would walk among the tents of the tribes, alone,', 'source_text' => 'Namun, setiap tahun ketika musim haji, Nabi SAW akan berjalan di celah khemah-khemah kabilah, bersendirian,', 'order' => 21],
            ['start_time' => 124.32, 'end_time' => 134.94, 'target_text' => 'dusty, and patient, saying, "Oh people, say la ilaha illallah and you will succeed." He would stand before every delegation,', 'source_text' => 'berdebu, dan penuh sabar, bersabda, "Wahai sekalian manusia, ucapkanlah la ilaha illallah nescaya kamu akan berjaya." Baginda berdiri di hadapan setiap utusan,', 'order' => 22],
            ['start_time' => 135.04, 'end_time' => 146.22, 'target_text' => 'Banu Amir, Banu Hanifa, Banu Kalb, Banu Abdillah, calling them to Allah, seeking only protection to deliver his message.', 'source_text' => 'Bani Amir, Bani Hanifah, Bani Kalb, Bani Abdillah, menyeru mereka kepada Allah, hanya mengharapkan perlindungan untuk menyampaikan risalah Baginda.', 'order' => 23],
            ['start_time' => 146.32, 'end_time' => 156.26, 'target_text' => 'Some mocked, some turned away, and some said, "If we supported you, would the rule be ours after you?" He replied, "The matter', 'source_text' => 'Ada yang mengejek, ada yang berpaling, dan ada yang berkata, "Jika kami menyokongmu, adakah tampuk pemerintahan ini milik kami selepaspun?" Baginda menjawab, "Urusan itu', 'order' => 24],
            ['start_time' => 156.36, 'end_time' => 157.54, 'target_text' => 'belongs to Allah.', 'source_text' => 'milik Allah semata-mata.', 'order' => 25],
            ['start_time' => 157.64, 'end_time' => 166.7, 'target_text' => 'He grants it to whom he wills." So, they refused, and the messenger, peace be upon him, walked on, his heart heavy, but steadfast.', 'source_text' => 'Dia mengurniakannya kepada sesiapa yang Dia kehendaki." Maka mereka menolak, lalu Rasulullah SAW meneruskan langkah, hatinya berat, namun tetap teguh.', 'order' => 26],
            ['start_time' => 166.8, 'end_time' => 174.74, 'target_text' => 'Then, one year at Mina, he met six men from Yathrib, the city of palm trees and scattered tribes.', 'source_text' => 'Kemudian, pada suatu tahun di Mina, Baginda bertemu enam orang lelaki dari Yathrib, kota pohon kurma dan kabilah yang berpecah-belah.', 'order' => 27],
            ['start_time' => 174.84, 'end_time' => 176.859, 'target_text' => 'They were of Al-Khazraj.', 'source_text' => 'Mereka daripada kaum Al-Khazraj.', 'order' => 28],
            ['start_time' => 176.959, 'end_time' => 185.22, 'target_text' => 'He spoke to them of the one God, of the prophets before him, and of the coming of the hour.', 'source_text' => 'Baginda berbicara kepada mereka tentang Tuhan Yang Maha Esa, tentang para nabi terdahulu, dan tentang kedatangan hari kiamat.', 'order' => 29],
            ['start_time' => 185.32, 'end_time' => 187.58, 'target_text' => 'They listened in silence.', 'source_text' => 'Mereka mendengar dalam keheningan.', 'order' => 30],
            ['start_time' => 187.68, 'end_time' => 192.74, 'target_text' => 'And they had heard the Jews of their city say, "A prophet is about to appear.', 'source_text' => 'Dan mereka pernah mendengar kaum Yahudi di kota mereka berkata, "Seorang nabi bakal muncul tidak lama lagi.', 'order' => 31],
            ['start_time' => 192.84, 'end_time' => 199.52, 'target_text' => 'We will follow him and defeat you as Ad and Iram were destroyed."', 'source_text' => 'Kami akan mengikutnya dan membinasakan kamu sebagaimana kaum Aad dan Iram dibinasakan."', 'order' => 32],
            ['start_time' => 199.92, 'end_time' => 203.22, 'target_text' => 'When they heard his words, their hearts trembled.', 'source_text' => 'Tatkala mendengar kata-kata Baginda, hati mereka bergetar.', 'order' => 33],
            ['start_time' => 203.32, 'end_time' => 208.5, 'target_text' => 'They said, "By Allah, this is the prophet the Jews have been speaking of.', 'source_text' => 'Mereka berkata, "Demi Allah, inilah nabi yang sering diperkatakan oleh kaum Yahudi itu.', 'order' => 34],
            ['start_time' => 208.6, 'end_time' => 213.38, 'target_text' => 'Let them not reach him before us." And so, they believed.', 'source_text' => 'Jangan biarkan mereka mendahului kita kepadanya." Dan begitulah, mereka terus beriman.', 'order' => 35],
            ['start_time' => 213.48, 'end_time' => 221.7, 'target_text' => 'They returned to Yathrib carrying the light of Islam, spreading it until not a house remained among the Ansar except that', 'source_text' => 'Mereka kembali ke Yathrib membawa cahaya Islam, menyebarkannya sehingga tiada satu rumah pun dalam kalangan kaum Ansar melainkan', 'order' => 36],
            ['start_time' => 221.8, 'end_time' => 226.82, 'target_text' => 'it heard the name of Allah and his messenger, peace be upon him.', 'source_text' => 'telah mendengar nama Allah dan Rasul-Nya SAW.', 'order' => 37],
            ['start_time' => 226.92, 'end_time' => 235.58, 'target_text' => 'The following year, 12 men of Yathrib came secretly by night to the valley of al-Aqabah and pledged their faith.', 'source_text' => 'Pada tahun berikutnya, 12 orang lelaki Yathrib datang secara rahsia pada waktu malam ke lembah Aqabah dan berbai\'ah atas keimanan mereka.', 'order' => 38],
            ['start_time' => 235.68, 'end_time' => 242.1, 'target_text' => 'Ubadah ibn al-Samit, may Allah be pleased with him, said, "We pledged to the messenger of Allah, peace be upon him, that we', 'source_text' => 'Ubadah ibn al-Samit RA menceritakan, "Kami berbai\'ah kepada Rasulullah SAW bahawa kami', 'order' => 39],
            ['start_time' => 242.2, 'end_time' => 250.46, 'target_text' => 'would not associate anything with Allah, nor steal, nor commit adultery, nor kill our children, nor bring falsehood, nor disobey', 'source_text' => 'tidak akan mempersekutukan Allah dengan sesuatu pun, tidak mencuri, tidak berzina, tidak membunuh anak-anak kami, tidak membuat fitnah dusta, dan tidak menderhaka', 'order' => 40],
            ['start_time' => 250.56, 'end_time' => 252.3, 'target_text' => 'him in what is right.', 'source_text' => 'kepadanya dalam perkara yang makruf.', 'order' => 41],
            ['start_time' => 252.4, 'end_time' => 256.66, 'target_text' => 'If we fulfilled it, paradise would be ours."', 'source_text' => 'Jika kami memenuhinya, syurgalah ganjaran buat kami."', 'order' => 42],
            ['start_time' => 256.76, 'end_time' => 264.9, 'target_text' => 'They returned home and the prophet, peace be upon him, sent with them Mus\'ab ibn Umayr, may Allah be pleased with him, the', 'source_text' => 'Mereka pulang ke kampung halaman dan Nabi SAW mengutus bersama mereka Mus\'ab ibn Umayr RA, seorang', 'order' => 43],
            ['start_time' => 265, 'end_time' => 271.54, 'target_text' => 'gentle teacher of Quran, to teach them the book and call others to Islam.', 'source_text' => 'guru Al-Quran yang lemah lembut, untuk mengajarkan kitabullah dan menyeru orang lain kepada Islam.', 'order' => 44],
            ['start_time' => 271.64, 'end_time' => 279.46, 'target_text' => 'In the house of As\'ad ibn Zurarah, may Allah be pleased with him, the call of prayer echoed in Yathrib for the first time.', 'source_text' => 'Di rumah As\'ad ibn Zurarah RA, seruan azan bergema di Yathrib buat kali yang pertama.', 'order' => 45],
            ['start_time' => 279.56, 'end_time' => 286.94, 'target_text' => 'Men gathered, women listened from their courtyards, faith spread faster than wind among the date palms.', 'source_text' => 'Kaum lelaki berkumpul, kaum wanita mendengar dari halaman rumah mereka, keimanan tersebar lebih pantas daripada hembusan angin di celah pepohon kurma.', 'order' => 46],
            ['start_time' => 287.04, 'end_time' => 292.54, 'target_text' => 'Mus\'ab ibn Umayr, may Allah be pleased with him, led the first Jumu\'ah prayer ever held.', 'source_text' => 'Mus\'ab ibn Umayr RA mengimamkan solat Jumaat yang pertama pernah didirikan.', 'order' => 47],
            ['start_time' => 292.64, 'end_time' => 294.819, 'target_text' => '40 believers gathered in Yathrib.', 'source_text' => '40 orang beriman berhimpun di Yathrib.', 'order' => 48],
            ['start_time' => 294.919, 'end_time' => 301.74, 'target_text' => 'They prayed beneath the shade of the palms, thanking Allah for the gift of light after darkness.', 'source_text' => 'Mereka bersolat di bawah naungan pohon kurma, memanjatkan syukur kepada Allah atas nikmat cahaya selepas kegelapan.', 'order' => 49],
            ['start_time' => 301.84, 'end_time' => 310.14, 'target_text' => 'Among the first to accept Islam through Mus\'ab ibn Umayr, may Allah be pleased with him, were Sa\'d ibn Mu\'adh and Usayd ibn', 'source_text' => 'Antara orang terawal memeluk Islam melalui Mus\'ab ibn Umayr RA ialah Sa\'d ibn Mu\'adh dan Usayd ibn', 'order' => 50],
            ['start_time' => 310.24, 'end_time' => 315.5, 'target_text' => 'Hudayr, may Allah be pleased with them, the leaders of Banu Abd al-Ashhal.', 'source_text' => 'Hudayr RA, iaitu para pemimpin Bani Abdil Asyhal.', 'order' => 51],
            ['start_time' => 315.6, 'end_time' => 322.58, 'target_text' => 'When they believed, their people followed them and by evening not a home remained without a Muslim.', 'source_text' => 'Apabila mereka beriman, kaum mereka turut mengikut mereka, dan menjelang petang tiada lagi sebuah rumah pun tanpa orang Islam.', 'order' => 52],
            ['start_time' => 322.68, 'end_time' => 325.5, 'target_text' => 'The Quran\'s promise was unfolding.', 'source_text' => 'Janji Al-Quran kian menjadi kenyataan.', 'order' => 53],
            ['start_time' => 325.6, 'end_time' => 329.26, 'target_text' => 'Idha ja\'a nasrullahi wal fath.', 'source_text' => 'Idha ja\'a nasrullahi wal fath (Apabila datang pertolongan Allah dan kemenangan).', 'order' => 54],
            ['start_time' => 329.36, 'end_time' => 332.62, 'target_text' => 'When the help of Allah comes and victory.', 'source_text' => 'Apabila datang pertolongan Allah dan kemenangan.', 'order' => 55],
            ['start_time' => 332.72, 'end_time' => 342.38, 'target_text' => 'A year later, during the pilgrimage, 73 men and two women from Yathrib came again quietly under the cover of night.', 'source_text' => 'Setahun kemudian, ketika musim haji, 73 orang lelaki dan dua orang wanita dari Yathrib datang lagi secara senyap di bawah kegelapan malam.', 'order' => 56],
            ['start_time' => 342.48, 'end_time' => 346.9, 'target_text' => 'They gathered in the valley, hearts trembling with awe and courage.', 'source_text' => 'Mereka berhimpun di lembah itu, hati mereka bergetar penuh takzim dan keberanian.', 'order' => 57],
            ['start_time' => 347, 'end_time' => 354.7, 'target_text' => 'The prophet, peace be upon him met them accompanied by his uncle Al Abbas who said, "Muhammad is honored among his people.', 'source_text' => 'Nabi SAW menemui mereka dengan ditemani bapa saudaranya Al-Abbas yang berkata, "Muhammad amat dihormati dalam kalangan kaumnya.', 'order' => 58],
            ['start_time' => 354.8, 'end_time' => 357.38, 'target_text' => 'If you will truly protect him, take him.', 'source_text' => 'Jika kamu benar-benar akan melindunginya, bawalah dia bersama kamu.', 'order' => 59],
            ['start_time' => 357.48, 'end_time' => 365.5, 'target_text' => 'If not, leave him now." They replied, "We will protect you as we protect our own families." The prophet peace be upon him', 'source_text' => 'Jika tidak, tinggalkanlah dia sekarang." Mereka menjawab, "Kami akan melindungimu sebagaimana kami melindungi keluarga kami sendiri." Nabi SAW', 'order' => 60],
            ['start_time' => 365.6, 'end_time' => 372.18, 'target_text' => 'recited the Quran calling them to Allah and they pledged their lives to defend the truth.', 'source_text' => 'membacakan Al-Quran, menyeru mereka kepada Allah, dan mereka berbai\'ah menyerahkan jiwa raga demi mempertahankan kebenaran.', 'order' => 61],
            ['start_time' => 372.28, 'end_time' => 375.38, 'target_text' => 'This was the covenant that would shape the world.', 'source_text' => 'Inilah perjanjian setia yang bakal mencorakkan masa depan dunia.', 'order' => 62],
            ['start_time' => 375.48, 'end_time' => 378.26, 'target_text' => 'The covenant of faith and brotherhood.', 'source_text' => 'Perjanjian keimanan dan persaudaraan.', 'order' => 63],
            ['start_time' => 378.36, 'end_time' => 383.38, 'target_text' => 'He chose from them 12 leaders Nuba to guide their people.', 'source_text' => 'Baginda memilih daripada kalangan mereka 12 orang pemimpin (nuqaba\') untuk memimpin kaum mereka.', 'order' => 64],
            ['start_time' => 383.48, 'end_time' => 389.1, 'target_text' => 'Among them Obada ibn Samit, Asad ibn Zurara and Sa\'d ibn Obada.', 'source_text' => 'Antara mereka ialah \'Ubadah ibn al-Samit, As\'ad ibn Zurarah, dan Sa\'d ibn \'Ubadah.', 'order' => 65],
            ['start_time' => 389.2, 'end_time' => 390.98, 'target_text' => 'May Allah be pleased with them.', 'source_text' => 'Semoga Allah meredai mereka semua.', 'order' => 66],
            ['start_time' => 391.08, 'end_time' => 394.76, 'target_text' => 'Tears filled the valley as they whispered,', 'source_text' => 'Air mata berlinangan di lembah itu tatkala mereka berbisik,', 'order' => 67],
            ['start_time' => 396.84, 'end_time' => 405.14, 'target_text' => '"We pledged to hear and to obey." As dawn broke, the sound of Quraysh\'s footsteps echoed in the distance.', 'source_text' => '"Kami berbai\'ah untuk mendengar dan taat patuh." Tatkala fajar menyingsing, derap langkah kaum Quraisy bergema di kejauhan.', 'order' => 68],
            ['start_time' => 405.24, 'end_time' => 407.26, 'target_text' => 'But the pledge was sealed.', 'source_text' => 'Namun ikrar bai\'ah telah pun termeterai.', 'order' => 69],
            ['start_time' => 407.36, 'end_time' => 410.3, 'target_text' => 'The messenger peace be upon him now had a home.', 'source_text' => 'Rasulullah SAW kini mempunyai sebuah tempat berteduh.', 'order' => 70],
            ['start_time' => 410.4, 'end_time' => 416.66, 'target_text' => 'Soon he would say to his companions, "Your place of refuge has been shown to me.', 'source_text' => 'Kelak Baginda akan bersabda kepada para sahabatnya, "Tempat hijrahmu telah diperlihatkan kepadaku.', 'order' => 71],
            ['start_time' => 416.76, 'end_time' => 423.62, 'target_text' => 'A land of palm trees between two volcanic ridges." That land was Medina.', 'source_text' => 'Bumi pohon kurma di antara dua permatang gunung berapi." Bumi itu ialah Madinah.', 'order' => 72],
            ['start_time' => 423.72, 'end_time' => 429.1, 'target_text' => 'The seeds had been sown and the garden of faith was about to bloom.', 'source_text' => 'Benih-benih telah disemai dan taman keimanan bakal berbunga mekar.', 'order' => 73],
            ['start_time' => 429.2, 'end_time' => 431.52, 'target_text' => 'The Quran says,', 'source_text' => 'Al-Quran menyatakan,', 'order' => 74],
            ['start_time' => 437.48, 'end_time' => 444.44, 'target_text' => '"Whoever migrates for the sake of Allah will find on earth many places of refuge and and abundance.', 'source_text' => '"Sesiapa yang berhijrah pada jalan Allah nescaya akan mendapati di muka bumi ini tempat perlindungan yang luas dan rezeki yang melimpah-ruah.', 'order' => 75],
            ['start_time' => 455.12, 'end_time' => 456.94, 'target_text' => 'And he united their hearts.', 'source_text' => 'Dan Dialah yang menyatupadukan hati-hati mereka.', 'order' => 76],
            ['start_time' => 457.04, 'end_time' => 464.62, 'target_text' => 'If you had spent all that is in the earth, you could not have united them, but Allah united them.', 'source_text' => 'Walaupun kamu membelanjakan segala apa yang ada di bumi, nescaya kamu tidak dapat menyatukan hati mereka, tetapi Allah telah menyatukan mereka.', 'order' => 77],
            ['start_time' => 464.72, 'end_time' => 466.52, 'target_text' => 'Lee', 'source_text' => 'Supaya', 'order' => 78],
            ['start_time' => 476.96, 'end_time' => 485.38, 'target_text' => 'That Allah may forgive you what preceded of your fault and what will follow and complete his favor upon you and guide you', 'source_text' => 'Allah mengampuni dosamu yang telah lalu dan yang terkemudian serta menyempurnakan nikmat-Nya ke atasmu dan memimpinmu', 'order' => 79],
            ['start_time' => 485.48, 'end_time' => 487.26, 'target_text' => 'to a straight path.', 'source_text' => 'ke jalan yang lurus.', 'order' => 80],
            ['start_time' => 487.36, 'end_time' => 489.38, 'target_text' => 'And so the seeds were planted.', 'source_text' => 'Maka benih-benih harapan telah pun disemai.', 'order' => 81],
            ['start_time' => 489.48, 'end_time' => 497.38, 'target_text' => 'A pledge beneath the stars, hands joined in sincerity, tears of hope falling into the soil of destiny.', 'source_text' => 'Satu ikrar di bawah taburan bintang, tautan tangan penuh keikhlasan, titisan air mata harapan membasahi bumi takdir.', 'order' => 82],
            ['start_time' => 497.48, 'end_time' => 500.46, 'target_text' => 'Islam now had a home waiting.', 'source_text' => 'Islam kini mempunyai tempat berteduh yang sedia menanti.', 'order' => 83],
            ['start_time' => 500.56, 'end_time' => 504.14, 'target_text' => 'A place where the believers would be welcomed with open arms.', 'source_text' => 'Sebuah tempat di mana orang-orang beriman akan disambut dengan tangan terbuka.', 'order' => 84],
            ['start_time' => 504.24, 'end_time' => 507.9, 'target_text' => 'But to reach it, there was a journey yet to be taken.', 'source_text' => 'Namun untuk mencapainya, ada sebuah perjalanan yang masih perlu diharungi.', 'order' => 85],
            ['start_time' => 508, 'end_time' => 510.14, 'target_text' => 'The journey of Hijrah.', 'source_text' => 'Perjalanan agung peristiwa Hijrah.', 'order' => 86],
            ['start_time' => 510.24, 'end_time' => 518.22, 'target_text' => 'In the next episode inshallah, we will walk with the messenger of Allah, peace be upon him, as he steps into the night guided', 'source_text' => 'Dalam episod akan datang insya-Allah, kita akan melangkah bersama Rasulullah SAW, tatkala Baginda menempuh malam yang gelap dengan bimbingan', 'order' => 87],
            ['start_time' => 518.32, 'end_time' => 522.48, 'target_text' => 'by the one who never abandons his servants.', 'source_text' => 'Tuhan yang tidak pernah sesekali meninggalkan hamba-hamba-Nya.', 'order' => 88],
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
