<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo42Seeder extends Seeder
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

        // Special Bilingual Religious Video #42 (Siri 3 Ep.02): Seeking Laylatul Qadr - Episode 2 - The Final Stretch - Mufti Menk
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => '2hS9znm69Us'],
            [
                'language_id'   => $english->id,
                'title'         => 'Seeking Laylatul Qadr - Episode 2 - The Final Stretch - Mufti Menk',
                'thumbnail_url' => 'https://img.youtube.com/vi/2hS9znm69Us/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 42,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 4.48, 'end_time' => 10.239, 'target_text' => 'Assalamu alaykum in this episode of the final stretch we\'d like to look at how to maximize', 'source_text' => 'Assalamu\'alaikum. Dalam episod \'The Final Stretch\' (Pecutan Terakhir) kali ini, kita ingin meneliti bagaimana cara memaksimumkan', 'order' => 1],
            ['start_time' => 10.24, 'end_time' => 16.839, 'target_text' => 'I and worship in these last 10 nights firstly we need to be motivated we need', 'source_text' => 'ibadah dan ketaatan sepanjang 10 malam terakhir ini; pertama sekali, kita perlu mempunyai motivasi yang tinggi, kita perlu', 'order' => 2],
            ['start_time' => 16.84, 'end_time' => 21.559, 'target_text' => 'to be motivated you need to have good company you need to have people around you who think', 'source_text' => 'sentiasa bermotivasi; anda memerlukan sahabat yang baik, anda memerlukan orang di sekeliling anda yang mempunyai fikiran', 'order' => 3],
            ['start_time' => 21.56, 'end_time' => 35.159, 'target_text' => 'similar and if you\'re on your own you need to make sure that you have listened to something', 'source_text' => 'dan matlamat yang serupa; dan sekiranya anda bersendirian, anda perlu memastikan bahawa anda mendengar pengisian ilmu yang bermanfaat', 'order' => 4],
            ['start_time' => 35.16, 'end_time' => 40.639, 'target_text' => 'or keep yourself occupied in something that is definitely going to motivate you and it\'s going', 'source_text' => 'atau menyibukkan diri dengan perkara yang pasti akan memberi motivasi kepada anda dan mampu', 'order' => 5],
            ['start_time' => 40.64, 'end_time' => 45.999, 'target_text' => 'to give you that push that you need because we are human beings if we\'re not pushed we', 'source_text' => 'memberikan dorongan yang anda perlukan; kerana kita ini manusia biasa, jika kita tidak didorong, kita', 'order' => 6],
            ['start_time' => 46.0, 'end_time' => 51.519, 'target_text' => 'won\'t be able to be uh productive the way we are supposed to be many of us need a', 'source_text' => 'tidak akan mampu menjadi produktif sebagaimana yang sepatutnya; ramai dalam kalangan kita memerlukan sedikit', 'order' => 7],
            ['start_time' => 51.52, 'end_time' => 57.479, 'target_text' => 'push once you start rolling alhamdulillah so there are so many things we could do number', 'source_text' => 'dorongan permulaan, dan sebaik sahaja momentum itu bermula, alhamdulillah; maka terdapat begitu banyak amalan yang boleh kita lakukan; pertama sekali,', 'order' => 8],
            ['start_time' => 57.48, 'end_time' => 62.719, 'target_text' => 'one this is the month of revelation of the Quran and Allah Almighty speaks about it he', 'source_text' => 'ini adalah bulan penurunan al-Quran dan Allah Yang Maha Kuasa berfirman mengenainya, Dia', 'order' => 9],
            ['start_time' => 62.72, 'end_time' => 71.039, 'target_text' => 'says we have revealed the Quran in there is an explanation to that which we will get to in a', 'source_text' => 'berfirman: \'Sesungguhnya Kami telah menurunkannya (al-Quran) pada malam kemuliaan\'; terdapat huraian mendalam tentang ayat itu yang akan kita bincangkan dalam', 'order' => 10],
            ['start_time' => 71.04, 'end_time' => 80.439, 'target_text' => 'different episode but Allah Almighty also says Ramadan the month of Ramadan is the month in', 'source_text' => 'episod yang lain; namun Allah Yang Maha Kuasa turut berfirman: \'Bulan Ramadan yang padanya diturunkan al-Quran\', iaitu bulan', 'order' => 11],
            ['start_time' => 80.44, 'end_time' => 86.319, 'target_text' => 'which the Quran was revealed so there is a great importance given to the Quran in the month of', 'source_text' => 'di mana al-Quran mula diturunkan; maka keutamaan yang teramat besar diberikan kepada al-Quran di dalam bulan', 'order' => 12],
            ['start_time' => 86.32, 'end_time' => 92.719, 'target_text' => 'Ramadan if you\'re not going to push yourself and build the habit of reading Quran then you\'re not', 'source_text' => 'Ramadan; sekiranya anda tidak memaksa diri anda dan membina tabiat membaca al-Quran, maka anda tidak', 'order' => 13],
            ['start_time' => 92.72, 'end_time' => 98.599, 'target_text' => 'going to achieve anything if you take a look at the prophet Muhammad Sallallahu alayhi wa sallam', 'source_text' => 'akan mencapai apa-apa kejayaan yang bermakna; jika anda meneliti sirah Nabi Muhammad Sallallahu \'Alaihi Wasallam,', 'order' => 14],
            ['start_time' => 98.6, 'end_time' => 106.399, 'target_text' => 'the Quran was revealed over a period of 23 years but every year in Ramadan Jibril used to come to', 'source_text' => 'al-Quran diturunkan secara berperingkat sepanjang tempoh 23 tahun, namun pada setiap tahun dalam bulan Ramadan, Malaikat Jibril \'Alaihissalam datang menemui', 'order' => 15],
            ['start_time' => 106.4, 'end_time' => 112.519, 'target_text' => 'the prophet sallallahu alaihi wasallam to revise whatever was revealed and so they would revise', 'source_text' => 'Nabi Sallallahu \'Alaihi Wasallam untuk bertadarus dan menyemak semula setiap ayat yang telah diturunkan, lalu mereka berdua mengulang semak', 'order' => 16],
            ['start_time' => 112.52, 'end_time' => 119.959, 'target_text' => 'it together and the last year when the Quran was revealed almost in totality they revised it twice', 'source_text' => 'al-Quran bersama-sama; dan pada tahun terakhir hayat baginda tatkala al-Quran telah sempurna keseluruhannya, mereka mengulang semak sebanyak dua kali;', 'order' => 17],
            ['start_time' => 119.96, 'end_time' => 125.159, 'target_text' => 'it made him a generous person all the great qualities that were already there of the Prophet', 'source_text' => 'amalan ini menjadikan baginda seorang insan yang paling pemurah; segala sifat terpuji yang sememangnya ada pada diri Rasulullah', 'order' => 18],
            ['start_time' => 125.16, 'end_time' => 131.199, 'target_text' => 'sallallahu alaihi wasallam shown even more in the month of Ramadan are your good qualities going to', 'source_text' => 'Sallallahu \'Alaihi Wasallam terserlah dengan lebih berseri-seri dalam bulan Ramadan; adakah sifat-sifat kebaikan anda turut', 'order' => 19],
            ['start_time' => 131.2, 'end_time' => 138.679, 'target_text' => 'shine are you going to control yourself because Ramadan is all about Sabr Ramadan is a month of', 'source_text' => 'akan bersinar? Adakah anda bersedia mengawal hawa nafsu anda? Kerana Ramadan itu pada hakikatnya adalah tentang kesabaran; Ramadan adalah bulan', 'order' => 20],
            ['start_time' => 138.68, 'end_time' => 145.199, 'target_text' => 'sabr it is a month of patience patience when it comes to staying away from food and drink we all', 'source_text' => 'kesabaran; ia adalah madrasah kesabaran, sabar dalam menahan diri daripada makan dan minum sebagaimana yang kita semua', 'order' => 21],
            ['start_time' => 145.2, 'end_time' => 151.679, 'target_text' => 'know staying away from bad habits completely staying away from Bad character conduct from', 'source_text' => 'maklum, sabar dalam meninggalkan tabiat buruk sepenuhnya, sabar menjauhi akhlak yang keji, serta menjauhi', 'order' => 22],
            ['start_time' => 151.68, 'end_time' => 158.839, 'target_text' => 'values and morals that are unacceptable we stay away from them Ramadan is the month of sa to train', 'source_text' => 'nilai-nilai moral yang tidak bermaruah; kita menjauhkan diri daripadanya; Ramadan adalah bulan sabar untuk melatih diri', 'order' => 23],
            ['start_time' => 158.84, 'end_time' => 164.559, 'target_text' => 'us for the rest of the year in order to achieve the pleasure of Allah subhanahu wa ta\'ala you must', 'source_text' => 'kita bagi menghadapi baki 11 bulan yang seterusnya demi meraih keredaan Allah Subhanahu Wa Ta\'ala, anda wajib melakukannya;', 'order' => 24],
            ['start_time' => 164.56, 'end_time' => 170.079, 'target_text' => 'do it if you\'re staying away from the Haram that you\'ve been doing throughout the year I promise', 'source_text' => 'jika anda mampu menahan diri daripada perkara haram yang pernah anda lakukan sepanjang tahun, saya berjanji kepada anda,', 'order' => 25],
            ['start_time' => 170.08, 'end_time' => 175.679, 'target_text' => 'you in this final stretch you need to promise yourself and promise Allah subhanahu wa ta\'ala', 'source_text' => 'dalam pecutan terakhir ini anda perlu berjanji pada diri sendiri dan berikrar kepada Allah Subhanahu Wa Ta\'ala,', 'order' => 26],
            ['start_time' => 175.68, 'end_time' => 183.319, 'target_text' => 'that you will abstain from it even outside inside the month of Ramadan if you can do this then', 'source_text' => 'bahawa anda akan terus menjauhinya walaupun di luar bulan Ramadan; sekiranya anda mampu melakukan ini, maka', 'order' => 27],
            ['start_time' => 183.32, 'end_time' => 190.999, 'target_text' => 'you\'ve achieved so much you will maximize a lot of the productivity that you can achieve from this', 'source_text' => 'anda telah mencapai kejayaan yang amat besar; anda akan memaksimumkan sebahagian besar produktiviti yang boleh anda raih daripada', 'order' => 28],
            ['start_time' => 191.0, 'end_time' => 196.879, 'target_text' => 'particular month let\'s take a look at the Quran we spoke about building a habit we have an app known', 'source_text' => 'bulan yang penuh keberkatan ini; mari kita lihat kembali tentang al-Quran, kita berbicara tentang membina tabiat, kini kita mempunyai aplikasi seperti', 'order' => 29],
            ['start_time' => 196.88, 'end_time' => 203.399, 'target_text' => 'as the Quranly app it\'s one of the apps that help you building that habit of the Quran of reading', 'source_text' => 'aplikasi Quranly; ia adalah salah satu aplikasi pintar yang membantu anda membina rutin harian membaca', 'order' => 30],
            ['start_time' => 203.4, 'end_time' => 209.559, 'target_text' => 'the Quran because verse by verse you click on it it multiplies the rewards for you it shows you how', 'source_text' => 'al-Quran, kerana ayat demi ayat yang anda baca dan klik, ia mengira ganjaran pahala yang digandakan untuk anda, ia menunjukkan', 'order' => 31],
            ['start_time' => 209.56, 'end_time' => 215.399, 'target_text' => 'much you\'re going to get on an ordinary day in Ramadan it\'s multiplied even more and it keeps', 'source_text' => 'berapa banyak pahala yang anda peroleh pada hari biasa, manakala di dalam Ramadan ia digandakan lebih banyak lagi; dan aplikasi ini terus', 'order' => 32],
            ['start_time' => 215.4, 'end_time' => 220.119, 'target_text' => 'pushing you to read another verse and another verse and another verse and it gives you options', 'source_text' => 'mendorong anda untuk membaca ayat seterusnya, dan ayat seterusnya, serta ayat seterusnya; ia turut menyediakan pilihan', 'order' => 33],
            ['start_time' => 220.12, 'end_time' => 226.479, 'target_text' => 'to compare with your loved ones and and others in your circle perhaps that\'s one way of building a', 'source_text' => 'untuk anda berkongsi dan membandingkan kemajuan bersama orang tersayang dan rakan taulan dalam lingkaran anda; mungkin itu salah satu cara membina', 'order' => 34],
            ['start_time' => 226.48, 'end_time' => 233.239, 'target_text' => 'habit of reading the Quran similarly build a habit of being charitable so we have so many', 'source_text' => 'tabiat istiqamah membaca al-Quran; begitu juga, binalah tabiat suka bersedekah; kita mempunyai begitu banyak', 'order' => 35],
            ['start_time' => 233.24, 'end_time' => 239.919, 'target_text' => 'options when you give then truly you are wealthy some people amass millions they are not charitable', 'source_text' => 'peluang untuk menyumbang; tatkala anda memberi, pada hakikatnya itulah saat anda benar-benar kaya; sesetengah orang mengumpul jutaan harta tetapi kedekut bersedekah,', 'order' => 36],
            ['start_time' => 239.92, 'end_time' => 245.799, 'target_text' => 'the only wealth that will benefit you ever is that which you have spent either youve spent it', 'source_text' => 'sedangkan satu-satunya harta yang benar-benar memberi manfaat kepada anda buat selama-lamanya adalah apa yang telah anda infakkan; sama ada anda belanjakan', 'order' => 37],
            ['start_time' => 245.8, 'end_time' => 251.559, 'target_text' => 'on a good cause on yourself and your family or better than that you\'ve given it in charity no', 'source_text' => 'pada jalan kebaikan untuk diri dan keluarga anda, atau yang lebih utama daripada itu, anda sedekahkan kepada mereka yang memerlukan; tiada', 'order' => 38],
            ['start_time' => 251.56, 'end_time' => 256.759, 'target_text' => 'other wealth will actually benefit you if you\'ve given the wealth and you\'ve spent it it will help', 'source_text' => 'harta lain yang benar-benar akan memberi manfaat kepada anda di akhirat kelak; jika anda menginfakkan harta itu pada jalan Allah, ia pasti membela', 'order' => 39],
            ['start_time' => 256.76, 'end_time' => 263.479, 'target_text' => 'you if you haven\'t it won\'t so to maximize the use of these last 10 nights be charitable give', 'source_text' => 'anda; namun jika anda menyimpannya, ia tidak akan membantu; maka untuk memaksimumkan manfaat 10 malam terakhir ini, jadilah seorang yang dermawan, berikanlah', 'order' => 40],
            ['start_time' => 263.48, 'end_time' => 268.719, 'target_text' => 'a charity every night read a portion of the Quran every night do some Vick and remembrance of Allah', 'source_text' => 'sedekah pada setiap malam, bacalah sebahagian daripada ayat al-Quran pada setiap malam, basahilah lidah dengan zikir mengingati Allah', 'order' => 41],
            ['start_time' => 268.72, 'end_time' => 276.359, 'target_text' => 'every night go to the Masid early do your read perhaps spend some time between and if you can', 'source_text' => 'pada setiap malam, pergilah ke masjid lebih awal, dirikanlah solat berjemaah, luangkan masa beriktikaf antara waktu solat sekiranya anda mampu;', 'order' => 42],
            ['start_time' => 276.36, 'end_time' => 282.519, 'target_text' => 'for the last 10 nights only you might want to have your supper after tarawi it\'s only an option you', 'source_text' => 'dan khusus untuk 10 malam terakhir ini sahaja, anda mungkin memilih untuk menikmati makan malam selepas solat tarawih; itu hanyalah satu pilihan,', 'order' => 43],
            ['start_time' => 282.52, 'end_time' => 287.599, 'target_text' => 'are allowed to have it before for those of us who get hungry and those of us who love our food it\'s', 'source_text' => 'anda tetap dibenarkan makan sebelum tarawih bagi mereka yang berasa lapar dan menggemari hidangan makanan, ia adalah', 'order' => 44],
            ['start_time' => 287.6, 'end_time' => 293.559, 'target_text' => 'permissible to eat don\'t forget to say Bismillah many people you know they they open their fast', 'source_text' => 'harus untuk dimakan; jangan lupa membaca Bismillah; anda tahu, ramai orang yang berbuka puasa', 'order' => 45],
            ['start_time' => 293.56, 'end_time' => 298.879, 'target_text' => 'without even saying bah without even making a Dua you\'ve got to say oh Allah forgive me oh Allah', 'source_text' => 'tanpa membaca Bismillah dan tanpa memanjatkan doa; anda sepatutnya berdoa: \'Ya Allah ampunkanlah daku, ya Allah', 'order' => 46],
            ['start_time' => 298.88, 'end_time' => 304.519, 'target_text' => 'grant me oh bless me oh Allah not just me but my family not just my family but the um not just', 'source_text' => 'kurniakanlah daku rezeki, ya Allah berkatilah daku; ya Allah bukan untuk diriku sahaja tetapi juga keluargaku, bukan keluargaku sahaja tetapi seluruh umat Islam, dan bukan', 'order' => 47],
            ['start_time' => 304.52, 'end_time' => 310.399, 'target_text' => 'the um but Humanity at large so many of these duas just prior to opening your fast be conscious of it', 'source_text' => 'umat Islam sahaja bahkan seluruh umat manusia sejagat\'; begitu banyak doa mustajab tepat sebelum anda berbuka puasa, hayatilah ia', 'order' => 48],
            ['start_time' => 310.4, 'end_time' => 317.679, 'target_text' => 'in the last 10 nights make Dua a lot of it meaning supplicate to Allah a lot and also what you must', 'source_text' => 'sepanjang 10 malam terakhir ini; perbanyakkanlah doa, berdoalah bersungguh-sungguh memohon kepada Allah; dan satu lagi perkara yang wajib', 'order' => 49],
            ['start_time' => 317.68, 'end_time' => 324.879, 'target_text' => 'do is make sure you make peace with those whom you are at war with especially family members I say', 'source_text' => 'anda lakukan adalah pastikan anda berdamai dengan sesiapa yang sedang anda bermusuhan, terutamanya sesama ahli keluarga; saya', 'order' => 50],
            ['start_time' => 324.88, 'end_time' => 331.719, 'target_text' => 'War but what I mean is misunderstandings uh people whom we\'ve had arguments with don\'t argue control', 'source_text' => 'sebut \'bermusuhan\', namun apa yang saya maksudkan adalah perselisihan faham, mereka yang pernah bertengkar dengan kita; jangan berbalah lagi, kawal', 'order' => 51],
            ['start_time' => 331.72, 'end_time' => 337.359, 'target_text' => 'yourself make sure you build your habit come out go out of your way to ensure that you\'ve actually', 'source_text' => 'emosi diri anda; pastikan anda membina peribadi yang baik, berusahalah sedaya upaya untuk memastikan bahawa anda benar-benar', 'order' => 52],
            ['start_time' => 337.36, 'end_time' => 342.599, 'target_text' => 'maximize the use of these last 10 nights they are nights where the Hearts are softened people are', 'source_text' => 'memaksimumkan manfaat 10 malam terakhir ini; ia adalah malam-malam di mana pintu hati dilembutkan, orang ramai', 'order' => 53],
            ['start_time' => 342.6, 'end_time' => 349.599, 'target_text' => 'looking forward to I and worship this is how you do it becoming conscious of Allah understanding', 'source_text' => 'begitu rindu untuk mendirikan ibadah; begitulah caranya: sentiasa sedar akan keagungan Allah, menghayati', 'order' => 54],
            ['start_time' => 349.6, 'end_time' => 356.559, 'target_text' => 'the value of every single night and if you were to extend your worship for all of these nights', 'source_text' => 'nilai kemuliaan setiap satu malam; dan sekiranya anda meluaskan ibadah anda sepanjang kesemua 10 malam ini,', 'order' => 55],
            ['start_time' => 356.56, 'end_time' => 363.119, 'target_text' => 'not just the odd ones you will definitely catch the night of decree and that final stretch will', 'source_text' => 'bukan hanya memilih malam-malam ganjil sahaja, anda pasti akan menemui malam Lailatulqadar, dan pecutan terakhir itu', 'order' => 56],
            ['start_time' => 363.12, 'end_time' => 369.919, 'target_text' => 'become so much more meaningful than it would have been had you only chosen some of the nights it\'s', 'source_text' => 'akan menjadi jauh lebih bermakna berbanding jika anda hanya memilih beberapa malam tertentu sahaja; ia adalah', 'order' => 57],
            ['start_time' => 369.92, 'end_time' => 375.239, 'target_text' => 'a habit because we are human beings some people select the 27th night they say we are going to', 'source_text' => 'satu tabiat manusia, kerana lumrah kita sesetengah orang hanya memilih malam ke-27, mereka berkata: \'Kami hanya akan', 'order' => 58],
            ['start_time' => 375.24, 'end_time' => 384.799, 'target_text' => 'go in worship on that night what if Le was on the 21st 23rd what if it was the 29th so yes as much', 'source_text' => 'beribadah bersungguh-sungguh pada malam tersebut\'; bagaimana sekiranya Lailatulqadar jatuh pada malam ke-21 atau ke-23? Bagaimana pula jika malam ke-29? Benar,', 'order' => 59],
            ['start_time' => 384.8, 'end_time' => 391.959, 'target_text' => 'as the Hadith says it is most likely to be one of the ordin from the last 10 nights of Ramadan', 'source_text' => 'walaupun hadis nabi menyatakan bahawa ia paling berkemungkinan berlaku pada salah satu malam ganjil daripada 10 malam terakhir Ramadan,', 'order' => 60],
            ['start_time' => 391.96, 'end_time' => 401.439, 'target_text' => 'and more likely from the second half which means 27 29 perhaps 25 but it does not say that it will', 'source_text' => 'dan lebih berkemungkinan pada separuh kedua iaitu malam ke-27, 29, atau 25; namun hadis tidak pernah menafikan bahawa ia', 'order' => 61],
            ['start_time' => 401.44, 'end_time' => 408.599, 'target_text' => 'not be even an even night are you aware of that so it could be any of those nights even or odd more', 'source_text' => 'tidak boleh berlaku pada malam genap; adakah anda sedar akan hakikat itu? Maka ia boleh berlaku pada mana-mana malam, sama ada genap mahupun ganjil;', 'order' => 62],
            ['start_time' => 408.6, 'end_time' => 414.559, 'target_text' => 'likely odd more likely does not mean that it\'s not going to be one of the even night it could', 'source_text' => 'kebarangkalian malam ganjil lebih tinggi, namun lebih tinggi tidak bermakna ia mustahil berlaku pada malam genap; ia boleh', 'order' => 63],
            ['start_time' => 414.56, 'end_time' => 419.52, 'target_text' => 'be many people don\'t know this and many people actually don\'t even think about it Subhan Allah', 'source_text' => 'berlaku bila-bila masa; ramai orang tidak mengetahui hakikat ini dan ramai juga yang tidak pernah memikirkannya, SubhanAllah;', 'order' => 64],
            ['start_time' => 420.04, 'end_time' => 427.359, 'target_text' => 'so if you were to use the last 10 nights all of them you definitely have caught Allah grants', 'source_text' => 'maka sekiranya anda menghidupkan keseluruhan 10 malam terakhir tanpa tinggal satu malam pun, anda pasti beroleh Lailatulqadar; Allah mengurniakan', 'order' => 65],
            ['start_time' => 427.36, 'end_time' => 435.359, 'target_text' => 'you worship as though you\'ve worried for 83.3 years can you imagine how powerful that is in', 'source_text' => 'pahala ibadah kepada anda seolah-olah anda beribadah selama 83.3 tahun, dapatkah anda bayangkan betapa dahsyatnya ganjaran tersebut?', 'order' => 66],
            ['start_time' => 435.36, 'end_time' => 444.279, 'target_text' => 'this episode we discussed how to maximize the use of this season the final stretch and I hope we\'ve', 'source_text' => 'Dalam episod ini kita telah membincangkan bagaimana cara memaksimumkan musim pecutan terakhir ini, dan saya berharap kita semua', 'order' => 67],
            ['start_time' => 444.28, 'end_time' => 449.839, 'target_text' => 'benefited from what has been said because indeed it is something that I would love to achieve', 'source_text' => 'dapat mengambil manfaat daripada apa yang telah disampaikan; kerana sesungguhnya ia adalah matlamat yang amat saya dambakan,', 'order' => 68],
            ['start_time' => 449.84, 'end_time' => 456.399, 'target_text' => 'you would love to achieve I want to exit the month of Ramadan in a way that my life is transformed I', 'source_text' => 'dan anda juga pasti ingin mencapainya; saya mahu melangkah keluar daripada bulan Ramadan dalam keadaan hidup saya benar-benar berubah;', 'order' => 69],
            ['start_time' => 456.4, 'end_time' => 462.279, 'target_text' => 'want to be there for my brothers my sisters I want to try to be charitable I want to try to', 'source_text' => 'saya mahu sentiasa menyantuni saudara dan saudari saya, saya mahu berusaha menjadi seorang yang dermawan, saya mahu berusaha', 'order' => 70],
            ['start_time' => 462.28, 'end_time' => 468.159, 'target_text' => 'read the Quran I want to try to fast correctly even outside of Ramadan I want to fast a little', 'source_text' => 'membaca dan menghayati al-Quran, saya mahu berusaha berpuasa dengan sempurna walaupun di luar bulan Ramadan, saya mahu berpuasa', 'order' => 71],
            ['start_time' => 468.16, 'end_time' => 476.479, 'target_text' => 'bit more the voluntary fasts It\'s amazing And if you build this habit Ramadan is a habit building', 'source_text' => 'sedikit lagi iaitu puasa-puasa sunat, sungguh menakjubkan; dan jika anda membina rutin ini, Ramadan adalah bulan membina tabiat', 'order' => 72],
            ['start_time' => 476.48, 'end_time' => 484.479, 'target_text' => 'month without a doubt because if you to push yourself for one month Allah will help you through', 'source_text' => 'tanpa sebarang keraguan; kerana jika anda sanggup memaksa diri anda berdisiplin selama sebulan, Allah akan membantu anda mengharungi', 'order' => 73],
            ['start_time' => 484.48, 'end_time' => 490.679, 'target_text' => 'the rest of the 11 months if you are serious about transformation in the month of Ramadan you will be', 'source_text' => 'baki 11 bulan yang lain; sekiranya anda bersungguh-sungguh mahukan perubahan dalam bulan Ramadan, anda pasti akan', 'order' => 74],
            ['start_time' => 490.68, 'end_time' => 495.319, 'target_text' => 'transformed but if you just look at it as a month where I\'m going to put away all Haram as soon', 'source_text' => 'berubah; tetapi jika anda hanya memandangnya sebagai bulan sementara di mana: \'Aku simpan semua maksiat, sebaik sahaja anak bulan Syawal', 'order' => 75],
            ['start_time' => 495.32, 'end_time' => 499.599, 'target_text' => 'as the Moon is cited I\'m going to get everything back and we\'re going to be back to where we were', 'source_text' => 'kelihatan, aku akan ulangi semula segala dosa lama dan kita kembali kepada tabiat asal\', maka anda sebenarnya mensia-siakan masa anda;', 'order' => 76],
            ['start_time' => 499.6, 'end_time' => 505.027, 'target_text' => 'you\'ve wasted your time may Allah Almighty forgive all of us and grant us goodness', 'source_text' => 'semoga Allah Yang Maha Berkuasa mengampunkan dosa kita semua dan mengurniakan kebaikan kepada kita, Ameen.', 'order' => 77],
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
