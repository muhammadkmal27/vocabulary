<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo47Seeder extends Seeder
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

        // Special Bilingual Religious Video #47 (Siri 3 Ep.07): Balancing Worship, Work and Family - Episode 7 - The Final Stretch - Mufti Menk
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'Mto6kv1Vv9k'],
            [
                'language_id'   => $english->id,
                'title'         => 'Balancing Worship, Work and Family - Episode 7 - The Final Stretch - Mufti Menk',
                'thumbnail_url' => 'https://img.youtube.com/vi/Mto6kv1Vv9k/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 47,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 3.96, 'end_time' => 5.9, 'target_text' => 'Assalamu alaykum.', 'source_text' => 'Assalamu\'alaikum.', 'order' => 1],
            ['start_time' => 6.0, 'end_time' => 11.34, 'target_text' => 'It\'s not easy to balance work, worship, and family in the month of Ramadan.', 'source_text' => 'Bukanlah suatu perkara yang mudah untuk mengimbangi antara kerjaya, ibadah, dan keluarga di bulan Ramadan;', 'order' => 2],
            ['start_time' => 11.44, 'end_time' => 14.539, 'target_text' => 'More so in the last 10 nights of Ramadan.', 'source_text' => 'apatah lagi pada 10 malam terakhir Ramadan.', 'order' => 3],
            ['start_time' => 14.639, 'end_time' => 22.38, 'target_text' => 'But as human beings, we have responsibilities and we will be rewarded for everything we do in terms of what we are supposed', 'source_text' => 'Namun sebagai manusia, kita memikul tanggungjawab, dan kita akan diberi ganjaran pahala atas segala apa yang kita laksanakan berpandukan amanah', 'order' => 4],
            ['start_time' => 22.48, 'end_time' => 23.339, 'target_text' => 'to be doing.', 'source_text' => 'yang sepatutnya kita tunaikan.', 'order' => 5],
            ['start_time' => 23.439, 'end_time' => 25.099, 'target_text' => 'We have to get up.', 'source_text' => 'Kita perlu bangun tidur;', 'order' => 6],
            ['start_time' => 25.199, 'end_time' => 26.86, 'target_text' => 'Sometimes we have a school run.', 'source_text' => 'kadang-kadang kita perlu menghantar anak-anak ke sekolah;', 'order' => 7],
            ['start_time' => 26.96, 'end_time' => 36.139, 'target_text' => 'Sometimes we have to go to work and we may not have slept well because we had to get up for we may not have had a rest.', 'source_text' => 'ada kalanya kita perlu keluar bekerja dalam keadaan kurang tidur kerana terpaksa bangun bersahur dan tidak sempat berehat.', 'order' => 8],
            ['start_time' => 36.239, 'end_time' => 37.5, 'target_text' => 'We have to work.', 'source_text' => 'Kita tetap perlu bekerja;', 'order' => 9],
            ['start_time' => 37.6, 'end_time' => 40.54, 'target_text' => 'We are staying away from food and drink.', 'source_text' => 'kita menahan lapar dan dahaga;', 'order' => 10],
            ['start_time' => 40.64, 'end_time' => 42.139, 'target_text' => 'We have to come back from work.', 'source_text' => 'kita perlu pulang daripada tempat kerja;', 'order' => 11],
            ['start_time' => 42.239, 'end_time' => 44.7, 'target_text' => 'We have to pray while we\'re at work.', 'source_text' => 'kita perlu menunaikan solat semasa di tempat kerja;', 'order' => 12],
            ['start_time' => 44.8, 'end_time' => 47.1, 'target_text' => 'We have to perhaps prepare for ifar.', 'source_text' => 'barangkali kita perlu menyediakan juadah berbuka puasa;', 'order' => 13],
            ['start_time' => 47.2, 'end_time' => 48.779, 'target_text' => 'We might have to go to the masid.', 'source_text' => 'kita mungkin perlu bergegas ke masjid;', 'order' => 14],
            ['start_time' => 48.879, 'end_time' => 49.979, 'target_text' => 'Come back.', 'source_text' => 'kemudian pulang semula ke rumah...', 'order' => 15],
            ['start_time' => 50.079, 'end_time' => 50.86, 'target_text' => 'All of this.', 'source_text' => 'Semua kesibukan ini:', 'order' => 16],
            ['start_time' => 50.96, 'end_time' => 52.06, 'target_text' => 'Take it in your stride.', 'source_text' => 'hadapi dan laluilah ia dengan tenang dan berlapang dada;', 'order' => 17],
            ['start_time' => 52.16, 'end_time' => 53.979, 'target_text' => 'You will be rewarded for it.', 'source_text' => 'kalian pasti akan diganjari pahala kerananya!', 'order' => 18],
            ['start_time' => 54.079, 'end_time' => 57.66, 'target_text' => 'Don\'t overdo one and neglect the others.', 'source_text' => 'Jangan berlebih-lebihan pada satu bahagian sehingga mengabaikan bahagian yang lain.', 'order' => 19],
            ['start_time' => 57.76, 'end_time' => 60.06, 'target_text' => 'If you have to work, you have to work.', 'source_text' => 'Jika kalian perlu bekerja, tunaikanlah kerja kalian;', 'order' => 20],
            ['start_time' => 60.16, 'end_time' => 62.86, 'target_text' => 'If you have family, you have to fulfill their rights.', 'source_text' => 'jika kalian memiliki keluarga, kalian wajib memenuhi hak-hak mereka.', 'order' => 21],
            ['start_time' => 62.96, 'end_time' => 65.98, 'target_text' => 'And sometimes it is compulsory.', 'source_text' => 'Malah kadang-kadang hal itu adalah wajib (fardu);', 'order' => 22],
            ['start_time' => 66.08, 'end_time' => 68.78, 'target_text' => 'Certain things are upon you.', 'source_text' => 'perkara-perkara tertentu memang terletak di atas bahu kalian,', 'order' => 23],
            ['start_time' => 68.88, 'end_time' => 69.9, 'target_text' => 'You have to do it.', 'source_text' => 'kalian wajib melaksanakannya.', 'order' => 24],
            ['start_time' => 70.0, 'end_time' => 74.44, 'target_text' => 'If you are not going to do it, who is going to do it?', 'source_text' => 'Sekiranya bukan kalian yang melaksanakannya, siapakah lagi yang akan melakukannya?', 'order' => 25],
            ['start_time' => 80.88, 'end_time' => 90.699, 'target_text' => 'You know, one of the most amazing things uh Allah Almighty always speaks about being charitable and he always speaks about', 'source_text' => 'Tahukah kalian, antara perkara paling menakjubkan: Allah Yang Maha Perkasa sentiasa menyeru agar kita bersedekah, dan Dia menegaskan perihal', 'order' => 26],
            ['start_time' => 90.799, 'end_time' => 96.14, 'target_text' => 'being charitable at home and then the relatives and the circle becomes bigger and bigger.', 'source_text' => 'bersedekah bermula dari rumah tangga sendiri, kemudian kepada kaum kerabat, dan bulatan itu berkembang semakin luas.', 'order' => 27],
            ['start_time' => 96.24, 'end_time' => 106.46, 'target_text' => 'If you look at uh putting a morsel of food in the mouth of your spouse, that hadith that speaks about it saying that that\'s', 'source_text' => 'Sekiranya kalian melihat hadis tentang menyuapkan sesuap makanan ke mulut pasangan kalian, hadis itu menegaskan bahawa perbuatan tersebut', 'order' => 28],
            ['start_time' => 106.56, 'end_time' => 113.339, 'target_text' => 'a charity is so powerful because to put a morosel of food, you need to have the morul of food.', 'source_text' => 'merupakan sedekah yang amat agung! Kerana untuk menyuapkan sesuap makanan, kalian perlu ada makanan itu terlebih dahulu.', 'order' => 29],
            ['start_time' => 113.439, 'end_time' => 116.22, 'target_text' => 'To get that morel of food, you need to go out and earn.', 'source_text' => 'Untuk memperoleh makanan tersebut, kalian perlu keluar mencari nafkah;', 'order' => 30],
            ['start_time' => 116.32, 'end_time' => 120.699, 'target_text' => 'To earn, you need to work and you\'re going to need to bring back some money and go and purchase.', 'source_text' => 'untuk mencari nafkah, kalian perlu bekerja, membawa pulang wang rezeki, dan pergi membelinya.', 'order' => 31],
            ['start_time' => 120.799, 'end_time' => 122.379, 'target_text' => 'So, it\'s a whole thing.', 'source_text' => 'Jadi ia adalah satu rantaian yang lengkap;', 'order' => 32],
            ['start_time' => 122.479, 'end_time' => 125.74, 'target_text' => 'All of that together makes the charity.', 'source_text' => 'kesemua usaha itu bersama-sama membentuk pahala sedekah.', 'order' => 33],
            ['start_time' => 125.84, 'end_time' => 127.42, 'target_text' => 'So it\'s not easy.', 'source_text' => 'Maka ia bukanlah perkara mudah.', 'order' => 34],
            ['start_time' => 127.52, 'end_time' => 129.659, 'target_text' => 'But some people think this is Ramadan.', 'source_text' => 'Namun ada segelintir orang berfikir: \'Ini bulan Ramadan,', 'order' => 35],
            ['start_time' => 129.759, 'end_time' => 133.499, 'target_text' => 'Let me just switch off completely and engage in ibada.', 'source_text' => 'biarlah aku tinggalkan segala-galanya dan hanya beribadah semata-mata.\'', 'order' => 36],
            ['start_time' => 133.599, 'end_time' => 134.62, 'target_text' => 'Hang on.', 'source_text' => 'Tunggu dahulu!', 'order' => 37],
            ['start_time' => 134.72, 'end_time' => 135.42, 'target_text' => 'Hang on.', 'source_text' => 'Bertenang sebentar!', 'order' => 38],
            ['start_time' => 135.52, 'end_time' => 137.18, 'target_text' => 'That is also ibada.', 'source_text' => 'Tanggungjawab itu juga adalah ibadah;', 'order' => 39],
            ['start_time' => 137.28, 'end_time' => 139.18, 'target_text' => 'Going to work is also ibada.', 'source_text' => 'keluar bekerja mencari nafkah juga adalah ibadah;', 'order' => 40],
            ['start_time' => 139.28, 'end_time' => 141.34, 'target_text' => 'Looking after your family is also ibada.', 'source_text' => 'menjaga dan menguruskan keluarga juga adalah ibadah!', 'order' => 41],
            ['start_time' => 141.44, 'end_time' => 143.26, 'target_text' => 'These are different types of ibada.', 'source_text' => 'Ini semua adalah cabang-cabang ibadah yang berbeza.', 'order' => 42],
            ['start_time' => 143.36, 'end_time' => 148.38, 'target_text' => 'So are you switching off one or two ibada to just do one other ibada and so on.', 'source_text' => 'Adakah kalian sanggup mengabaikan satu atau dua ibadah semata-mata untuk menumpukan kepada satu bentuk ibadah yang lain?', 'order' => 43],
            ['start_time' => 148.48, 'end_time' => 154.859, 'target_text' => 'It\'s different if you\'re an imam of the masid and you need to dedicate more time for the Quran because you have to lead the', 'source_text' => 'Keadaannya berbeza jika kalian seorang imam masjid yang perlu memperuntukkan lebih banyak masa untuk al-Quran kerana perlu memimpin', 'order' => 44],
            ['start_time' => 154.959, 'end_time' => 160.38, 'target_text' => 'prayers or something and you want to dedicate a little bit more time but still have some time for your family.', 'source_text' => 'solat berjemaah; kalian mahu peruntukkan lebih masa tetapi tetap perlu meluangkan masa untuk keluarga.', 'order' => 45],
            ['start_time' => 160.48, 'end_time' => 161.58, 'target_text' => 'Set aside a portion.', 'source_text' => 'Peruntukkanlah sebahagian masa.', 'order' => 46],
            ['start_time' => 161.68, 'end_time' => 164.46, 'target_text' => 'Your work has to happen whether you like it or not.', 'source_text' => 'Tugas kerja kalian tetap perlu berjalan, sama ada kalian suka atau tidak;', 'order' => 47],
            ['start_time' => 164.56, 'end_time' => 167.499, 'target_text' => 'Maybe in your lunch break you can do something constructive.', 'source_text' => 'barangkali pada waktu rehat tengah hari, kalian boleh lakukan sesuatu yang membina;', 'order' => 48],
            ['start_time' => 167.599, 'end_time' => 169.74, 'target_text' => 'You can read some Quran a little bit more.', 'source_text' => 'kalian boleh membaca al-Quran lebih sedikit.', 'order' => 49],
            ['start_time' => 169.84, 'end_time' => 175.82, 'target_text' => 'Maybe for example, you might want to ask those whom you work for or if it\'s your own business, it\'s a little bit different', 'source_text' => 'Mungkin juga kalian boleh memohon kepada majikan kalian—atau jika itu perniagaan kalian sendiri, keadaannya lebih fleksibel—', 'order' => 50],
            ['start_time' => 175.92, 'end_time' => 178.779, 'target_text' => 'to to adjust your timing to make it a bit more suitable.', 'source_text' => 'untuk menyelaraskan jadual waktu kerja supaya lebih bersesuaian.', 'order' => 51],
            ['start_time' => 178.879, 'end_time' => 180.94, 'target_text' => 'They may and they may not.', 'source_text' => 'Mereka mungkin bersetuju dan mungkin juga tidak.', 'order' => 52],
            ['start_time' => 181.04, 'end_time' => 189.499, 'target_text' => 'So navigating through all of that is part of your designed acts of worship by Allah for you.', 'source_text' => 'Maka mengemudi segala liku-liku tersebut adalah sebahagian daripada reka bentuk ibadah yang telah Allah aturkan khusus buat kalian.', 'order' => 53],
            ['start_time' => 189.599, 'end_time' => 191.1, 'target_text' => 'Don\'t run away from it.', 'source_text' => 'Jangan lari daripadanya!', 'order' => 54],
            ['start_time' => 191.2, 'end_time' => 192.219, 'target_text' => 'Take it in your stride.', 'source_text' => 'Hadapilah ia dengan tenang dan tabah;', 'order' => 55],
            ['start_time' => 192.319, 'end_time' => 193.74, 'target_text' => 'Do it to the best of your ability.', 'source_text' => 'laksanakannya dengan sebaik-baik keupayaan kalian.', 'order' => 56],
            ['start_time' => 193.84, 'end_time' => 197.18, 'target_text' => 'Ramadan is a month where you will suffer fatigue.', 'source_text' => 'Ramadan adalah bulan di mana kalian pasti mengalami keletihan;', 'order' => 57],
            ['start_time' => 197.28, 'end_time' => 198.38, 'target_text' => 'You will be tired.', 'source_text' => 'kalian akan berasa letih;', 'order' => 58],
            ['start_time' => 198.48, 'end_time' => 205.98, 'target_text' => 'you might not be healthy, your immune system might drop a little bit and sometimes if you know how to manage it, it becomes', 'source_text' => 'kalian mungkin kurang sihat, sistem imun tubuh mungkin menurun sedikit; namun jika kalian tahu cara menguruskannya, ia menjadi', 'order' => 59],
            ['start_time' => 206.08, 'end_time' => 207.26, 'target_text' => 'so much easier.', 'source_text' => 'jauh lebih mudah!', 'order' => 60],
            ['start_time' => 207.36, 'end_time' => 213.34, 'target_text' => 'Unfortunately, in some countries during some seasons, the fast is very long.', 'source_text' => 'Malangnya, di sesetengah negara pada musim-musim tertentu, tempoh berpuasa adalah amat panjang.', 'order' => 61],
            ['start_time' => 213.44, 'end_time' => 213.84, 'target_text' => 'You know what?', 'source_text' => 'Tetapi tahukah kalian?', 'order' => 62],
            ['start_time' => 213.92, 'end_time' => 215.18, 'target_text' => 'You\'re going to have to fast.', 'source_text' => 'Kalian tetap wajib berpuasa;', 'order' => 63],
            ['start_time' => 215.28, 'end_time' => 217.02, 'target_text' => 'That\'s part of Allah\'s plan.', 'source_text' => 'itu adalah sebahagian daripada ketentuan Allah.', 'order' => 64],
            ['start_time' => 217.12, 'end_time' => 220.62, 'target_text' => 'And if you fast, you have to know how to do it, what to eat.', 'source_text' => 'Dan jika kalian berpuasa, kalian wajib tahu cara menguruskannya dan memilih makanan yang betul.', 'order' => 65],
            ['start_time' => 220.72, 'end_time' => 228.94, 'target_text' => 'I have found that the less you eat in Ramadan, the more energized you are and the less hungry you actually feel.', 'source_text' => 'Secara peribadi saya dapati: semakin sedikit kalian makan di bulan Ramadan, semakin bertenaga tubuh kalian dan semakin kurang rasa lapar yang kalian rasai!', 'order' => 66],
            ['start_time' => 229.04, 'end_time' => 235.26, 'target_text' => 'And when you want to fill yourself with everything and you haven\'t thought about how you\'re going to eat, what you\'re putting', 'source_text' => 'Sebaliknya apabila kalian mahu menyumbat perut dengan segala jenis makanan tanpa memikirkan adab pemakanan, apa yang masuk', 'order' => 67],
            ['start_time' => 235.36, 'end_time' => 240.059, 'target_text' => 'first into your mouth, what you\'re putting next into your mouth, then you cannot manage it.', 'source_text' => 'dahulu ke dalam mulut dan apa yang menyusul kemudian, maka kalian tidak akan mampu menguruskan kesihatan kalian.', 'order' => 68],
            ['start_time' => 240.159, 'end_time' => 242.46, 'target_text' => 'So, let\'s talk about what you\'re going to put in your mouth.', 'source_text' => 'Mari kita bincangkan apa yang wajar kalian masukkan ke dalam mulut.', 'order' => 69],
            ['start_time' => 242.56, 'end_time' => 247.58, 'target_text' => 'Do you know it\'s a sunnah to break your fast with water and some dates?', 'source_text' => 'Tahukah kalian bahawa sunnah berbuka puasa adalah dengan air dan beberapa biji kurma?', 'order' => 70],
            ['start_time' => 247.68, 'end_time' => 248.859, 'target_text' => 'Water and dates.', 'source_text' => 'Air dan kurma!', 'order' => 71],
            ['start_time' => 248.959, 'end_time' => 256.22, 'target_text' => 'What we do, we have water and dates, but with that we have fries, we have pastries, we have savories.', 'source_text' => 'Tetapi apa yang kita lakukan? Kita ambil air dan kurma, namun bersama-sama dengannya ada kentang goreng, pastri, dan aneka kuih bergoreng berminyak—', 'order' => 72],
            ['start_time' => 256.32, 'end_time' => 259.5, 'target_text' => 'The most unhealthy things to put in your mouth.', 'source_text' => 'makanan yang paling tidak sihat untuk disumbat ke dalam mulut!', 'order' => 73],
            ['start_time' => 259.6, 'end_time' => 266.5, 'target_text' => 'We put it as soon as we open our fast as though we have to just, you know, become', 'source_text' => 'Kita telan kesemuanya sebaik sahaja waktu berbuka tiba, seolah-olah kita terpaksa menjadi', 'order' => 74],
            ['start_time' => 266.6, 'end_time' => 267.5, 'target_text' => 'glutton.', 'source_text' => 'gelojoh dan pelahap;', 'order' => 75],
            ['start_time' => 267.6, 'end_time' => 272.78, 'target_text' => 'I mean, and we have to pack ourselves so much so we cannot even get up for.', 'source_text' => 'maksud saya, kita memadatkan perut sehingga kita tidak berdaya pun untuk bangkit solat maghrib!', 'order' => 76],
            ['start_time' => 272.88, 'end_time' => 281.74, 'target_text' => 'A few days ago, I was thinking when I was opening my fast that imagine we stayed hungry all day, 13 to 14 hours depending', 'source_text' => 'Beberapa hari lalu saya terfikir semasa berbuka puasa: bayangkan kita menahan lapar sepanjang hari, selama 13 hingga 14 jam bergantung', 'order' => 77],
            ['start_time' => 281.84, 'end_time' => 284.539, 'target_text' => 'on where you are, a little bit more, a little bit less.', 'source_text' => 'kepada tempat tinggal kalian, mungkin lebih atau kurang sedikit;', 'order' => 78],
            ['start_time' => 284.639, 'end_time' => 288.06, 'target_text' => 'And in 2 or 3 minutes, we\'re already full.', 'source_text' => 'namun dalam masa dua atau tiga minit sahaja, kita sebenarnya sudah kenyang!', 'order' => 79],
            ['start_time' => 288.16, 'end_time' => 292.06, 'target_text' => '2 or 3 minutes, we already this belly is full.', 'source_text' => 'Hanya 2 atau 3 minit, perut ini sudah terasa penuh.', 'order' => 80],
            ['start_time' => 292.16, 'end_time' => 296.22, 'target_text' => 'You\'re getting up for and you\'re standing there thinking, I can\'t really have much more.', 'source_text' => 'Kalian bangkit untuk solat maghrib dan berdiri sambil berfikir: \'Aku sebenarnya sudah tak mampu makan banyak lagi.', 'order' => 81],
            ['start_time' => 296.32, 'end_time' => 301.02, 'target_text' => 'I just had a glass of water, some dates, a little bit of yogurt maybe with some bread.', 'source_text' => 'Aku cuma minum segelas air, beberapa biji kurma, sedikit yogurt mungkin bersama sedikit roti.', 'order' => 82],
            ['start_time' => 301.12, 'end_time' => 301.98, 'target_text' => 'Subhan Allah.', 'source_text' => 'SubhanAllah!', 'order' => 83],
            ['start_time' => 302.08, 'end_time' => 302.94, 'target_text' => 'And look what happened.', 'source_text' => 'Dan lihatlah apa yang berlaku:', 'order' => 84],
            ['start_time' => 303.04, 'end_time' => 303.74, 'target_text' => 'I\'m full.', 'source_text' => 'Aku sudah kenyang!\'', 'order' => 85],
            ['start_time' => 303.84, 'end_time' => 305.34, 'target_text' => 'So what was that all about?', 'source_text' => 'Jadi untuk apa segala pembaziran itu?', 'order' => 86],
            ['start_time' => 305.44, 'end_time' => 308.539, 'target_text' => 'We put up so much food and we order so much.', 'source_text' => 'Kita hidangkan terlalu banyak makanan dan kita memesan secara berlebihan.', 'order' => 87],
            ['start_time' => 308.639, 'end_time' => 313.659, 'target_text' => 'Sometimes if we\'re ordering because we\'re ordering with our eyes, that\'s what it is.', 'source_text' => 'Kadang-kadang kita memesan dengan nafsu mata kita; itulah puncanya!', 'order' => 88],
            ['start_time' => 313.759, 'end_time' => 316.14, 'target_text' => 'The minute you see it and you\'re excited, that\'s it.', 'source_text' => 'Sebaik sahaja memandangnya kita berasa teruja, tetapi hakikatnya', 'order' => 89],
            ['start_time' => 316.24, 'end_time' => 317.58, 'target_text' => 'You can\'t really eat much.', 'source_text' => 'kalian tidak mampu memakannya banyak pun.', 'order' => 90],
            ['start_time' => 317.68, 'end_time' => 318.86, 'target_text' => 'Don\'t waste food.', 'source_text' => 'Jangan membazir makanan!', 'order' => 91],
            ['start_time' => 318.96, 'end_time' => 320.86, 'target_text' => 'Have less in Ramadan.', 'source_text' => 'Makanlah secara bersederhana di bulan Ramadan.', 'order' => 92],
            ['start_time' => 320.96, 'end_time' => 327.5, 'target_text' => 'I know we\'re in the final stretch but that does not mean we should not listen to this advice and start putting it into practice', 'source_text' => 'Saya tahu kita kini berada di fasa pecutan akhir, namun itu tidak bererti kita tidak wajar mendengar nasihat ini dan mula mengamalkannya', 'order' => 93],
            ['start_time' => 327.6, 'end_time' => 337.819, 'target_text' => 'even for next Ramadan or whenever we fast the early morning meal it\'s a sunnah but it\'s not a sunnah to eat so much what did', 'source_text' => 'untuk Ramadan akan datang atau bila-bila masa sahaja kita berpuasa. Bersahur adalah sunnah, tetapi makan secara berlebihan bukanlah sunnah! Apakah yang', 'order' => 94],
            ['start_time' => 337.919, 'end_time' => 346.379, 'target_text' => 'the prophet sallallahu alaihi wasallam have again dates water a little bit of low GI what we would call today low GI food', 'source_text' => 'dijamah oleh Rasulullah SAW? Kurma, air, dan sedikit makanan berindeks glisemik rendah (*low GI*);', 'order' => 95],
            ['start_time' => 346.479, 'end_time' => 352.06, 'target_text' => 'a little bit of it and you\'re done you\'re ready to go for the rest of the day by the will of Allah subhanahu wa ta\'ala the', 'source_text' => 'sedikit sahaja dan selesai—kalian cergas bersedia mengharungi sepanjang hari dengan izin Allah SWT.', 'order' => 96],
            ['start_time' => 352.16, 'end_time' => 359.98, 'target_text' => 'minute you\'re going to pack yourself with so much of food you mess up your health in the month of Ramadan so looking after', 'source_text' => 'Sebaik sahaja kalian menyumbat perut dengan terlalu banyak makanan, kalian merosakkan kesihatan sendiri di bulan Ramadan. Maka menjaga', 'order' => 97],
            ['start_time' => 360.08, 'end_time' => 369.3, 'target_text' => 'your health your work your family your worship you need to strike the correct balance make sure you don\'t spend too much time', 'source_text' => 'kesihatan, kerjaya, keluarga, dan ibadah—kalian perlu mencapai keseimbangan yang tepat. Pastikan kalian tidak menghabiskan terlalu banyak masa', 'order' => 98],
            ['start_time' => 369.4, 'end_time' => 378.7, 'target_text' => 'preparing the meals some of the men blackmail some of the women and they say you get such a great reward to prepare the meals', 'source_text' => 'menyediakan juadah di dapur. Sebahagian kaum lelaki memanipulasi kaum wanita dengan berkata: \'Awak dapat pahala yang sangat besar jika sediakan makanan,', 'order' => 99],
            ['start_time' => 378.8, 'end_time' => 381.099, 'target_text' => 'and you get more reward than reading the Quran.', 'source_text' => 'bahkan pahalanya lebih besar daripada membaca al-Quran!\'', 'order' => 100],
            ['start_time' => 381.199, 'end_time' => 387.98, 'target_text' => 'I heard someone say, "I was told you get a bigger reward than Hajj." And I\'m thinking, "Whoa, where did they blackmail these', 'source_text' => 'Saya pernah mendengar seseorang berkata: \'Saya diberitahu pahalanya lebih besar daripada ibadah Haji!\' Saya terfikir: \'Dari manakah mereka mereka-reka kata untuk memperdayakan', 'order' => 101],
            ['start_time' => 388.08, 'end_time' => 390.86, 'target_text' => 'people from?" No, you have a good meal.', 'source_text' => 'orang ini?\' Tidak! Kalian sediakan makanan yang berkhasiat;', 'order' => 102],
            ['start_time' => 390.96, 'end_time' => 392.539, 'target_text' => 'Mashallah, you do get a reward.', 'source_text' => 'masya-Allah, kalian sememangnya beroleh ganjaran pahala;', 'order' => 103],
            ['start_time' => 392.639, 'end_time' => 393.9, 'target_text' => 'Indeed, you get a massive reward.', 'source_text' => 'malah kalian meraih pahala yang amat besar!', 'order' => 104],
            ['start_time' => 394.0, 'end_time' => 400.86, 'target_text' => 'Whoever is going to prepare the meal because preparing the meal, you get a reward for all those who have fasted and they\'re', 'source_text' => 'Sesiapa sahaja yang menyediakan makanan berbuka puasa akan mendapat ganjaran pahala sebanyak pahala orang-orang yang berpuasa', 'order' => 105],
            ['start_time' => 400.96, 'end_time' => 403.34, 'target_text' => 'going to break their fast with that meal.', 'source_text' => 'yang menjamu selera dengan hidangan tersebut!', 'order' => 106],
            ['start_time' => 403.44, 'end_time' => 411.099, 'target_text' => 'So that\'s a bonus just for you to know that if you\'ve prepared anar and they have anar by something you have given you get', 'source_text' => 'Maka itu adalah ganjaran tambahan: jika kalian menyediakan iftar dan mereka berbuka puasa dengan hidangan yang kalian sediakan, kalian memperoleh', 'order' => 107],
            ['start_time' => 411.199, 'end_time' => 413.659, 'target_text' => 'a full reward for their fasts.', 'source_text' => 'pahala penuh puasa mereka.', 'order' => 108],
            ['start_time' => 413.759, 'end_time' => 420.379, 'target_text' => 'So the person who prepared the meal gets a reward for about 10 people fasting 20 people fasting more sometimes less.', 'source_text' => 'Maka orang yang memasak juadah itu mendapat pahala 10 orang yang berpuasa, 20 orang yang berpuasa, atau lebih lagi!', 'order' => 109],
            ['start_time' => 420.479, 'end_time' => 421.26, 'target_text' => 'That\'s the bonus.', 'source_text' => 'Itulah keistimewaannya.', 'order' => 110],
            ['start_time' => 421.36, 'end_time' => 426.06, 'target_text' => 'And I tell you when I said this to some some of the men started saying we\'re going to cook.', 'source_text' => 'Dan saya beritahu kalian: apabila saya kongsikan hal ini, sebahagian kaum lelaki terus berkata: \'Mulai hari ini kami pula yang akan memasak!\'', 'order' => 111],
            ['start_time' => 426.16, 'end_time' => 427.58, 'target_text' => 'Good news right?', 'source_text' => 'Berita baik, bukan?', 'order' => 112],
            ['start_time' => 427.68, 'end_time' => 431.34, 'target_text' => 'May Allah Allah almighty make it easy for all of us.', 'source_text' => 'Semoga Allah Yang Maha Perkasa mempermudahkan urusan kita semua.', 'order' => 113],
            ['start_time' => 431.44, 'end_time' => 433.58, 'target_text' => 'But the point I\'m raising is you do get a reward.', 'source_text' => 'Namun intipati yang ingin saya tegaskan: kalian sememangnya beroleh pahala,', 'order' => 114],
            ['start_time' => 433.68, 'end_time' => 436.62, 'target_text' => 'But you have to set aside a time for Quran.', 'source_text' => 'tetapi kalian tetap wajib memperuntukkan masa untuk al-Quran!', 'order' => 115],
            ['start_time' => 436.72, 'end_time' => 440.46, 'target_text' => 'Set aside a time for try and have a little bit of a timet.', 'source_text' => 'Peruntukkanlah masa dan usahakanlah memiliki jadual waktu harian;', 'order' => 116],
            ['start_time' => 440.56, 'end_time' => 441.58, 'target_text' => 'Have a routine.', 'source_text' => 'wujudkanlah rutin yang tersusun!', 'order' => 117],
            ['start_time' => 441.68, 'end_time' => 442.939, 'target_text' => 'Allah loves it.', 'source_text' => 'Allah amat menyukainya.', 'order' => 118],
            ['start_time' => 443.039, 'end_time' => 443.74, 'target_text' => 'Have a routine.', 'source_text' => 'Wujudkan satu rutin harian:', 'order' => 119],
            ['start_time' => 443.84, 'end_time' => 445.74, 'target_text' => 'Every day I\'m going to do this this.', 'source_text' => '\'Setiap hari aku akan laksanakan perkara ini dan ini.\'', 'order' => 120],
            ['start_time' => 445.84, 'end_time' => 447.099, 'target_text' => 'I was talking to a friend of mine.', 'source_text' => 'Saya pernah berbual dengan seorang sahabat saya;', 'order' => 121],
            ['start_time' => 447.199, 'end_time' => 453.18, 'target_text' => 'He told me uh when I have a routine and I know what I\'m going to do, I achieve so much because I have this lesson.', 'source_text' => 'beliau memberitahu saya: \'Apabila saya ada rutin dan tahu apa yang hendak dilakukan, saya mencapai begitu banyak kejayaan kerana saya ada pengajian ini,', 'order' => 122],
            ['start_time' => 453.28, 'end_time' => 454.7, 'target_text' => 'I want to listen to this lecture.', 'source_text' => 'saya mahu mendengar ceramah ini,', 'order' => 123],
            ['start_time' => 454.8, 'end_time' => 456.3, 'target_text' => 'I will listen to this series.', 'source_text' => 'saya akan ikuti siri ini,', 'order' => 124],
            ['start_time' => 456.4, 'end_time' => 457.9, 'target_text' => 'I will read this much Quran.', 'source_text' => 'saya akan membaca sekian banyak al-Quran,', 'order' => 125],
            ['start_time' => 458.0, 'end_time' => 460.379, 'target_text' => 'I will uh do this much here.', 'source_text' => 'saya akan lakukan sekian banyak zikir dan doa di sini;', 'order' => 126],
            ['start_time' => 460.479, 'end_time' => 461.74, 'target_text' => 'when I go to work, I\'ll do this.', 'source_text' => 'apabila ke tempat kerja, saya lakukan ini,', 'order' => 127],
            ['start_time' => 461.84, 'end_time' => 464.46, 'target_text' => 'I\'ve got this to do, that to do, and that\'s my day.', 'source_text' => 'saya ada tugasan ini dan itu untuk diselesaikan, dan itulah pengisian hari saya.\'', 'order' => 128],
            ['start_time' => 464.56, 'end_time' => 467.42, 'target_text' => 'So, you have a focus around that routine.', 'source_text' => 'Maka kalian mempunyai fokus yang jelas berteraskan rutin tersebut.', 'order' => 129],
            ['start_time' => 467.52, 'end_time' => 471.499, 'target_text' => 'You may sometimes change a little bit here and there, but generally that\'s the focus.', 'source_text' => 'Kalian mungkin mengubahnya sedikit di sana sini sekali-sekala, namun secara keseluruhannya itulah fokus kalian.', 'order' => 130],
            ['start_time' => 471.599, 'end_time' => 472.86, 'target_text' => 'Allah loves it.', 'source_text' => 'Allah amat menyukainya.', 'order' => 131],
            ['start_time' => 472.96, 'end_time' => 477.659, 'target_text' => 'And when you have that beautiful routine, you will be able to achieve so much more.', 'source_text' => 'Dan tatkala kalian memiliki rutin yang indah itu, kalian akan berupaya mencapai jauh lebih banyak kejayaan!', 'order' => 132],
            ['start_time' => 477.759, 'end_time' => 486.3, 'target_text' => 'And you will be able to strike the right balance between your work, your health, your eating, your family, your worship.', 'source_text' => 'Serta kalian akan berupaya mengimbangi secara saksama antara kerjaya, kesihatan, pemakanan, keluarga, dan ibadah kalian;', 'order' => 133],
            ['start_time' => 486.4, 'end_time' => 492.3, 'target_text' => 'everything comes into focus and you give each one the portion that it deserves.', 'source_text' => 'segalanya tersusun kemas dan kalian memberikan setiap pihak hak yang selayaknya.', 'order' => 134],
            ['start_time' => 492.4, 'end_time' => 499.18, 'target_text' => 'Bearing in mind that regarding worship, the bonus is all of the other things that are done, if they are done with the correct', 'source_text' => 'Dengan menyedari bahawa dari sudut ibadah, keistimewaannya ialah: segala urusan lain yang kalian laksanakan—sekiranya dilakukan dengan niat', 'order' => 135],
            ['start_time' => 499.28, 'end_time' => 504.7, 'target_text' => 'intention, they are all acts of worship that you will be rewarded for.', 'source_text' => 'yang ikhlas dan betul—semuanya dikira sebagai amal ibadah yang kalian bakal raih pahala kerananya!', 'order' => 136],
            ['start_time' => 504.8, 'end_time' => 509.659, 'target_text' => 'May Allah Almighty multiply our rewards during these days of Ramadan.', 'source_text' => 'Semoga Allah Yang Maha Perkasa melipatgandakan ganjaran kita sepanjang hari-hari Ramadan ini.', 'order' => 137],
            ['start_time' => 509.759, 'end_time' => 514.519, 'target_text' => 'This final stretch is indeed something we need to take seriously.', 'source_text' => 'Pecutan fasa akhir ini sememangnya suatu amanah yang wajib kita ambil berat.', 'order' => 138],
            ['start_time' => 517.839, 'end_time' => 519.639, 'target_text' => 'Muhammad.', 'source_text' => 'Dan selawat ke atas Nabi Muhammad SAW.', 'order' => 139],
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
