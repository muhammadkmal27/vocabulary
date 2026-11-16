<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo41Seeder extends Seeder
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

        // Special Bilingual Religious Video #41 (Siri 3 Ep.01): The Power of the Last 10 Nights - Episode 1 - The Final Stretch - Mufti Menk
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'GdxpXf9LUQY'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Power of the Last 10 Nights - Episode 1 - The Final Stretch - Mufti Menk',
                'thumbnail_url' => 'https://img.youtube.com/vi/GdxpXf9LUQY/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 41,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 7.12, 'end_time' => 14.239, 'target_text' => 'Welcome to the final stretch as we approach the last 10 nights of Ramadan the most exciting times', 'source_text' => 'Selamat datang ke pecutan terakhir (The Final Stretch) tatkala kita menghampiri 10 malam terakhir Ramadan, saat-saat yang paling dinanti dan mengujakan', 'order' => 1],
            ['start_time' => 14.24, 'end_time' => 20.079, 'target_text' => 'for this beautiful month of Ramadan and Allah subhanahu wa ta\'ala has favored us imagine if', 'source_text' => 'dalam bulan Ramadan yang penuh keberkatan ini, dan Allah Subhanahu Wa Ta\'ala telah melimpahkan kurniaan-Nya kepada kita; bayangkan sekiranya', 'order' => 2],
            ['start_time' => 20.08, 'end_time' => 25.639, 'target_text' => 'these 10 nights were actually at the beginning of Ramadan it would be such an anti-climax as', 'source_text' => '10 malam kemuncak ini diletakkan pada permulaan Ramadan, ia pasti terasa hambar dan hilang momentumnya tatkala', 'order' => 3],
            ['start_time' => 25.64, 'end_time' => 33.119, 'target_text' => 'we ended Ramadan but Allah Almighty in his Divine wisdom has designed a beautiful month', 'source_text' => 'kita mengakhiri Ramadan, namun Allah Yang Maha Kuasa dengan kebijaksanaan ilahi-Nya telah mengatur bulan yang indah ini', 'order' => 4],
            ['start_time' => 33.12, 'end_time' => 40.119, 'target_text' => 'of Ramadan in a way that when we started we were all energetic energized we had a beautiful plan', 'source_text' => 'sedemikian rupa, di mana pada awalnya kita semua begitu bersemangat, bertenaga, dan memiliki perancangan ibadah yang hebat,', 'order' => 5],
            ['start_time' => 40.12, 'end_time' => 46.519, 'target_text' => 'and we started so so beautifully with a lot of strength dedication and focus and as the days', 'source_text' => 'serta kita memulakannya dengan amat baik berbekalkan kekuatan, iltizam yang tinggi, dan fokus yang jitu; namun setelah hari demi hari', 'order' => 6],
            ['start_time' => 46.52, 'end_time' => 53.239, 'target_text' => 'passed sadly as human beings what did we do we became a little bit more relaxed and so Allah says', 'source_text' => 'berlalu, lumrah kita sebagai manusia yang lemah, kita mulai leka dan kendur semangat, lantas Allah Yang Maha Pengasih berfirman:', 'order' => 7],
            ['start_time' => 53.24, 'end_time' => 58.599, 'target_text' => 'we are giving you the last 10 nights you enter them and inshallah you get to that Finish Line in', 'source_text' => 'Kami kurniakan kepada kamu 10 malam terakhir ini, masukilah ia dan insya-Allah kamu akan melangkah ke garisan penamat dengan', 'order' => 8],
            ['start_time' => 58.6, 'end_time' => 65.639, 'target_text' => 'a amazing way where you\'ve maximized the benefit of this beautiful month of Ramadan so what should', 'source_text' => 'cara yang luar biasa, di mana kamu dapat memaksimumkan ganjaran bulan Ramadan yang indah ini; maka apakah yang wajar', 'order' => 9],
            ['start_time' => 65.64, 'end_time' => 73.839, 'target_text' => 'we do during these last 10 nights as we approach them the first thing you and I need to do is to', 'source_text' => 'kita lakukan sepanjang 10 malam terakhir ini tatkala kita menyambutnya? Perkara pertama yang wajib anda dan saya lakukan adalah', 'order' => 10],
            ['start_time' => 73.84, 'end_time' => 89.919, 'target_text' => 'renew our intentions how do I renew an intention I have to go back and ask myself why am I fasting', 'source_text' => 'memperbaharui niat kita; bagaimanakah cara memperbaharui niat? Saya perlu kembali merenung dan bertanya kepada diri sendiri: mengapakah aku berpuasa?', 'order' => 11],
            ['start_time' => 89.92, 'end_time' => 90.639, 'target_text' => '[Nasheed]', 'source_text' => '[Alunan Nasyid]', 'order' => 12],
            ['start_time' => 90.64, 'end_time' => 98.079, 'target_text' => 'I\'m fasting not to lose weight not to regain my body shape no I\'m fasting for the pleasure', 'source_text' => 'Aku berpuasa bukan semata-mata untuk mengurangkan berat badan atau membentuk semula tubuh fizikal, tidak sama sekali; aku berpuasa demi meraih keredaan', 'order' => 13],
            ['start_time' => 98.08, 'end_time' => 107.239, 'target_text' => 'of Allah primarily in order to achieve taqwa which is the correct relationship with Allah', 'source_text' => 'Allah Ta\'ala terutamanya bagi membina ketakwaan yang hakiki, iaitu ikatan hubungan yang benar dan erat bersama Allah,', 'order' => 14],
            ['start_time' => 107.24, 'end_time' => 113.999, 'target_text' => 'to be able to fear his wroth to be able to love doing what he\'s asked me to do to be able to love', 'source_text' => 'agar kita gerun akan kemurkaan-Nya, mencintai segala perintah yang disuruh-Nya, serta berasa lapang dada untuk', 'order' => 15],
            ['start_time' => 114.0, 'end_time' => 120.039, 'target_text' => 'staying away what he\'s asked me to stay away from when I haven\'t eaten I haven\'t eaten out of the', 'source_text' => 'menjauhi segala larangan yang dicegah-Nya; tatkala aku menahan lapar, aku tidak makan semata-mata kerana rasa cinta', 'order' => 16],
            ['start_time' => 120.04, 'end_time' => 126.279, 'target_text' => 'love of Allah when I\'ve eaten I\'ve eaten out of the love of Allah and this is why I tell people', 'source_text' => 'kepada Allah, dan apabila aku berbuka makan, aku makan juga kerana cinta kepada Allah; inilah sebabnya saya selalu berpesan', 'order' => 17],
            ['start_time' => 126.28, 'end_time' => 132.079, 'target_text' => 'especially the women in their menstral cycle when they say I can\'t fast I say it\'s not about fasting', 'source_text' => 'khususnya kepada kaum wanita semasa dalam haid apabila mereka mengeluh: \'Saya tidak boleh berpuasa\', saya tegaskan bahawa ia bukan sekadar tentang puasa semata-mata,', 'order' => 18],
            ['start_time' => 132.08, 'end_time' => 137.999, 'target_text' => 'it\'s about obeying Allah\'s instruction the reward is achieved when you obey Allah\'s instruction', 'source_text' => 'tetapi hakikatnya adalah tentang mentaati perintah Allah; ganjaran pahala diraih apabila anda tunduk mematuhi arahan Allah,', 'order' => 19],
            ['start_time' => 138.0, 'end_time' => 143.439, 'target_text' => 'whether he tells you to eat or not to eat whether he tells you to do or not to do and this should', 'source_text' => 'sama ada Dia memerintahkan anda untuk makan atau menahan diri, sama ada Dia menyuruh anda beramal atau berehat; dan kefahaman ini wajar', 'order' => 20],
            ['start_time' => 143.44, 'end_time' => 150.119, 'target_text' => 'seep through with all other acts of worship that\'s amazing so number one we renew our intention', 'source_text' => 'meresap ke dalam seluruh amal ibadah kita yang lain, sungguh luar biasa; maka langkah pertama ialah kita memperbaharui niat kita:', 'order' => 21],
            ['start_time' => 150.12, 'end_time' => 154.879, 'target_text' => 'I\'m doing it for the sake of Allah oh Allah help me through the last 10 nights in a way', 'source_text' => '\'Aku beribadah ikhlas kerana Allah; ya Allah, bantulah daku menghidupkan 10 malam terakhir ini dengan sebaik-baiknya,', 'order' => 22],
            ['start_time' => 154.88, 'end_time' => 159.599, 'target_text' => 'that I benefit that I change my life that you are pleased with me that if I were to', 'source_text' => 'agar daku beroleh manfaat, agar hidupku berubah menjadi lebih baik, agar Engkau reda kepadaku, dan sekiranya daku ditakdirkan', 'order' => 23],
            ['start_time' => 159.6, 'end_time' => 164.639, 'target_text' => 'leave this world I leave it in a way that you are happy with me and I can earn your mercy', 'source_text' => 'meninggalkan dunia fana ini, daku pergi dalam keadaan Engkau meredai diriku dan daku beroleh limpahan rahmat-Mu,', 'order' => 24],
            ['start_time' => 164.64, 'end_time' => 172.359, 'target_text' => 'so that I can get Jannah and that\'s why the most powerful prayer to pray in these nights', 'source_text' => 'sehingga daku layak memasuki syurga-Mu\'; dan sebab itulah doa yang paling mustajab dan agung untuk diamalkan pada malam-malam ini', 'order' => 25],
            ['start_time' => 172.36, 'end_time' => 181.959, 'target_text' => 'is you love to forgive so forgive me you achieve forgiveness through the mercy of Allah you will', 'source_text' => 'ialah: \'Ya Allah, sesungguhnya Engkau Maha Pemaaf dan mencintai kemaafan, maka maafkanlah daku\'; anda meraih keampunan melalui rahmat Allah, dan anda', 'order' => 26],
            ['start_time' => 181.96, 'end_time' => 186.719, 'target_text' => 'achieve Paradise through the mercy of Allah subhanahu wa tala as well so this is something', 'source_text' => 'akan mengecapi syurga juga melalui rahmat Allah Subhanahu Wa Ta\'ala; maka ini merupakan satu pedoman yang', 'order' => 27],
            ['start_time' => 186.72, 'end_time' => 192.519, 'target_text' => 'very powerful if you look at the verses that have mentioned the month of Ramadan the reason', 'source_text' => 'teramat berkuasa; jika anda meneliti ayat-ayat suci al-Quran yang menyebut tentang kewajipan bulan Ramadan, tujuan utama', 'order' => 28],
            ['start_time' => 192.52, 'end_time' => 199.199, 'target_text' => 'that Allah has prescribed this month and he only says in order that you achieve ta develop your', 'source_text' => 'mengapa Allah memfardukan ibadah puasa bulan ini adalah agar kamu beroleh takwa, iaitu memperkukuh', 'order' => 29],
            ['start_time' => 199.2, 'end_time' => 203.799, 'target_text' => 'relationship with Allah by fulfilling his commands staying away from the prohibitions', 'source_text' => 'hubungan anda dengan Allah melalui pelaksanaan segala perintah-Nya serta menjauhi segala larangan-Nya.', 'order' => 30],
            ['start_time' => 203.8, 'end_time' => 211.559, 'target_text' => 'also there is a Surah, Surah Al Qadr where Allah mentions the night of decree being in the last 10', 'source_text' => 'Selain itu, terdapat sebuah surah khas iaitu Surah Al-Qadr, di mana Allah menyebut tentang malam kemuliaan (Lailatulqadar) yang berada dalam 10', 'order' => 31],
            ['start_time' => 211.56, 'end_time' => 217.919, 'target_text' => 'nights of Ramadan so the Surah does not mention the exact night but it says in Ramadan Allah', 'source_text' => 'malam terakhir Ramadan; surah tersebut tidak menyatakan tarikh malamnya secara tepat, namun ia menegaskan bahawa di dalam Ramadan, Allah', 'order' => 32],
            ['start_time' => 217.92, 'end_time' => 226.239, 'target_text' => 'says that there is a night of decree in fact the Quran in that particular Surah doesn\'t', 'source_text' => 'menurunkan Lailatulqadar; bahkan al-Quran di dalam surah tersebut tidak secara khusus', 'order' => 33],
            ['start_time' => 226.24, 'end_time' => 232.119, 'target_text' => 'mention that it is in Ramadan but we know it\'s in Ramadan right and Allah says it is better', 'source_text' => 'menyebut perkataan Ramadan, tetapi kita sedia maklum ia berlaku pada bulan Ramadan, bukan? Dan Allah berfirman bahawa ia lebih baik', 'order' => 34],
            ['start_time' => 232.12, 'end_time' => 240.039, 'target_text' => 'than a thousand months months if you were to make a quick calculation it is actually 83.3', 'source_text' => 'daripada seribu bulan; jika anda membuat kiraan pantas secara matematik, seribu bulan itu sebenarnya menyamai 83.3', 'order' => 35],
            ['start_time' => 240.04, 'end_time' => 247.919, 'target_text' => 'years approximately 83 years so if you were to engage in worship for one night and you happened', 'source_text' => 'tahun, atau kira-kira 83 tahun lebih; maka sekiranya anda beribadah bersungguh-sungguh pada satu malam tersebut dan amalan anda bertepatan', 'order' => 36],
            ['start_time' => 247.92, 'end_time' => 254.559, 'target_text' => 'to have that night of decree as that particular night you have a multiplied reward for everything', 'source_text' => 'dengan Lailatulqadar, anda akan dikurniakan ganjaran yang digandakan melangkaui batas bagi setiap amal', 'order' => 37],
            ['start_time' => 254.56, 'end_time' => 260.279, 'target_text' => 'you did you read Quan it\'s as though you read it for 83.333.. years you gave a charity as though', 'source_text' => 'yang anda kerjakan: jika anda membaca al-Quran, ia seolah-olah anda membacanya berterusan selama 83.3 tahun; jika anda bersedekah, ia seumpama', 'order' => 38],
            ['start_time' => 260.28, 'end_time' => 266.399, 'target_text' => 'you\'ve given it perpetually for 83.33.. years you did some Adhkar it\'s as though you did dhikr for', 'source_text' => 'anda menginfakkan harta tanpa henti selama 83.3 tahun; jika anda membasahi lidah dengan zikir, ia seperti anda berzikir selama', 'order' => 39],
            ['start_time' => 266.4, 'end_time' => 273.319, 'target_text' => '83.3 years and that\'s why the Hadith says whoever stands in prayer on the night of decree it\'s as', 'source_text' => '83.3 tahun; sebab itulah hadis baginda ﷺ menegaskan: sesiapa yang mendirikan solat pada malam Lailatulqadar dengan penuh keimanan, ia seolah-olah', 'order' => 40],
            ['start_time' => 273.32, 'end_time' => 280.119, 'target_text' => 'though they\'ve stood forever for a lifetime and they will be forgiven they will be forgiven all', 'source_text' => 'mereka beribadah sepanjang hayat dan segala dosa-dosa mereka yang terdahulu akan diampunkan sepenuhnya;', 'order' => 41],
            ['start_time' => 280.12, 'end_time' => 286.399, 'target_text' => 'their previous sins and whoever has fasted on that particular day Allah grants them a reward', 'source_text' => 'diampunkan segala dosa mereka yang lalu, dan sesiapa yang berpuasa dengan penuh keikhlasan, Allah mengurniakan pahala yang amat besar,', 'order' => 42],
            ['start_time' => 286.4, 'end_time' => 292.279, 'target_text' => 'and the last 10 nights is very unique it\'s different from the first 20 and who decided', 'source_text' => 'dan keistimewaan 10 malam terakhir ini amat unik, ia berbeza sama sekali daripada 20 malam pertama; dan siapakah yang menetapkan', 'order' => 43],
            ['start_time' => 292.28, 'end_time' => 296.959, 'target_text' => 'it\'s going to be different Allah subhanahu wa taala we\'re coming towards the end of Ramadan', 'source_text' => 'perbezaan kelebihan ini? Allah Subhanahu Wa Ta\'ala yang menentukannya; kita kini semakin menghampiri penghujung Ramadan,', 'order' => 44],
            ['start_time' => 296.96, 'end_time' => 303.559, 'target_text' => 'and there is the greatest likelihood of the night of decree being one of those particular night so', 'source_text' => 'dan kebarangkalian tertinggi untuk bertemu dengan Lailatulqadar adalah pada salah satu malam daripada 10 malam tersebut; maka', 'order' => 45],
            ['start_time' => 303.56, 'end_time' => 311.759, 'target_text' => 'every act of worship you do on this particular night is Multiplied for 83 and A2 years almost', 'source_text' => 'setiap amalan soleh yang anda lakukan pada malam tersebut akan digandakan pahalanya menyamai hampir 83 tahun setengah,', 'order' => 46],
            ['start_time' => 311.76, 'end_time' => 317.599, 'target_text' => 'Subhan Allah 83.3 to be a little bit more precise in fact 33 okay for those who are a little bit', 'source_text' => 'SubhanAllah, tepatnya 83.33 tahun bagi perkiraan yang lebih terperinci, khas untuk mereka yang gemarkan ketepatan,', 'order' => 47],
            ['start_time' => 317.6, 'end_time' => 324.399, 'target_text' => 'OCD MashaAllah may Allah Almighty grant us the ability to witness the night may Allah Almighty', 'source_text' => 'masya-Allah; semoga Allah Yang Maha Kuasa mengurniakan kita rezeki untuk menemui malam tersebut, semoga Allah Yang Maha Pemurah', 'order' => 48],
            ['start_time' => 324.4, 'end_time' => 329.64, 'target_text' => 'help us to search for the night what is meant by searching for the night searching for the night by', 'source_text' => 'membantu kita memburu dan mencari malam tersebut; apakah yang dimaksudkan dengan memburu Lailatulqadar? Ia bermaksud memburunya dengan', 'order' => 49],
            ['start_time' => 330.44, 'end_time' => 336.919, 'target_text' => 'every single day doing something extra for the sake of Allah with the idea that one of these', 'source_text' => 'melakukan amalan tambahan setiap hari ikhlas kerana Allah, berpegang kepada keyakinan bahawa salah satu daripada', 'order' => 50],
            ['start_time' => 336.92, 'end_time' => 346.159, 'target_text' => 'nights is going to be the last meaning is going to be and when we say remember is taken from', 'source_text' => 'malam-malam ini adalah malam yang dimaksudkan, iaitu Lailatulqadar; dan apabila kita menyebut perkataan \'al-Qadr\', ingatlah ia diambil daripada', 'order' => 51],
            ['start_time' => 346.16, 'end_time' => 357.599, 'target_text' => 'the decree the and it\'s also taken from so the power the power of Allah indeed and the means', 'source_text' => 'makna ketetapan takdir, dan ia juga diambil daripada perkataan \'al-Qudrah\' iaitu kekuasaan mutlak Allah, serta bermaksud', 'order' => 52],
            ['start_time' => 357.6, 'end_time' => 363.039, 'target_text' => 'the destiny we will talk about that in another episode but for now what we need to remember', 'source_text' => 'penentuan masa depan (destini); kita akan bincangkan perincian itu dalam episod lain, namun buat masa ini apa yang perlu kita ingat', 'order' => 53],
            ['start_time' => 363.04, 'end_time' => 369.319, 'target_text' => 'is become serious be serious regarding these beautiful nights because if we haven\'t done', 'source_text' => 'adalah bersungguh-sungguhlah, pasang tekad yang serius terhadap malam-malam yang indah ini; kerana sekiranya kita rasa amalan kita masih kurang', 'order' => 54],
            ['start_time' => 369.32, 'end_time' => 376.119, 'target_text' => 'well enough in the first 20 here Allah\'s giving you a bonus to say 10 more nights let\'s go for', 'source_text' => 'pada 20 malam yang pertama, kini Allah mengurniakan peluang keemasan bonus 10 malam lagi: ayuh kita bangkit melipatgandakan amalan,', 'order' => 55],
            ['start_time' => 376.12, 'end_time' => 383.199, 'target_text' => 'it they have greater value it reminds me of a football match to a degree to a certain extent', 'source_text' => 'kerana nilainya jauh lebih bernilai; situasi ini mengingatkan saya kepada satu perlawanan bola sepak pada tahap tertentu,', 'order' => 56],
            ['start_time' => 383.2, 'end_time' => 389.719, 'target_text' => 'because if you haven\'t scored at the beginning and you\'re about to draw to the 90 minutes the last', 'source_text' => 'kerana jika pasukan anda belum menjaringkan sebarang gol pada awalnya dan perlawanan hampir tamat 90 minit, maka 10 minit', 'order' => 57],
            ['start_time' => 389.72, 'end_time' => 395.039, 'target_text' => '10 minutes are very exciting with everyone cheering you on and you\'re running from one', 'source_text' => 'terakhir adalah detik yang paling mendebarkan, dengan sorakan para penyokong yang membakar semangat tatkala anda berlari dari satu', 'order' => 58],
            ['start_time' => 395.04, 'end_time' => 400.119, 'target_text' => 'side to the other because you have to make a difference before the whistle is blown if you', 'source_text' => 'sudut padang ke sudut yang lain kerana anda mesti mencipta kemenangan sebelum wisel penamat ditiupkan pengadil; sekiranya anda', 'order' => 59],
            ['start_time' => 400.12, 'end_time' => 405.839, 'target_text' => 'have scored one goal You\'ve Won even by one goal you still got the cup but if you haven\'t', 'source_text' => 'berjaya menjaringkan walau satu gol, anda dinobatkan sebagai pemenang; walau satu gol perbezaan, piala kejuaraan tetap menjadi milik anda; namun jika anda tidak', 'order' => 60],
            ['start_time' => 405.84, 'end_time' => 411.279, 'target_text' => 'done much Subhan Allah all that cheering and all that running around in the last few minutes was', 'source_text' => 'berbuat apa-apa, SubhanAllah, segala sorakan padu dan larian bertenaga pada minit-minit akhir itu akhirnya menjadi sia-sia;', 'order' => 61],
            ['start_time' => 411.28, 'end_time' => 419.599, 'target_text' => 'all wasted Ramadan is a much higher example so great because it\'s not a play it\'s not a game', 'source_text' => 'namun Ramadan adalah perumpamaan yang jauh lebih agung dan mulia, kerana ia bukanlah sebuah permainan mahupun sukan semata-mata,', 'order' => 62],
            ['start_time' => 419.6, 'end_time' => 425.279, 'target_text' => 'but we\'ve only drawn an example for people on Earth today to say towards the end of something', 'source_text' => 'tetapi kita sekadar membuat analogi mudah untuk difahami manusia hari ini, iaitu menjelang saat akhir sesuatu usaha,', 'order' => 63],
            ['start_time' => 425.28, 'end_time' => 429.799, 'target_text' => 'make sure you\'ve scored the goal make sure you got what you\'re are supposed to be getting you', 'source_text' => 'pastikan anda berjaya menjaringkan matlamat anda, pastikan anda meraih apa yang sepatutnya anda capai; anda', 'order' => 64],
            ['start_time' => 429.8, 'end_time' => 435.199, 'target_text' => 'have uh played for you know 70 minutes 20 minutes remaining what are you going to do you\'re still', 'source_text' => 'telah beraksi selama 70 minit dan hanya tinggal 20 minit berbaki, apakah tindakan anda sekiranya kedudukan masih terikat', 'order' => 65],
            ['start_time' => 435.2, 'end_time' => 440.559, 'target_text' => 'zero zero or you still one one you have to make sure you\'re going to do something unique and keep', 'source_text' => 'seri 0-0 atau 1-1? Anda mesti memastikan anda melakukan sesuatu yang luar biasa dan terus berjuang,', 'order' => 66],
            ['start_time' => 440.56, 'end_time' => 446.359, 'target_text' => 'going keep going don\'t give up you will definitely get that night by the will of Allah subhanahu wa', 'source_text' => 'teruskan mara, jangan berputus asa, anda pasti akan menemui malam kemuliaan itu dengan izin Allah Subhanahu Wa', 'order' => 67],
            ['start_time' => 446.36, 'end_time' => 451.519, 'target_text' => 'ta\'ala you will get that night and just like if you keep going with football you will score that', 'source_text' => 'Ta\'ala, anda pasti meraih keberkatan malam tersebut; dan sebagaimana jika anda tidak berhenti mencuba dalam sukan, anda pasti menjaringkan', 'order' => 68],
            ['start_time' => 451.52, 'end_time' => 456.519, 'target_text' => 'goal by the will of Allah subhanahu wa ta\'ala and if I always give an example when the moon is not', 'source_text' => 'gol kemenangan dengan izin Allah Subhanahu Wa Ta\'ala; dan saya sering memberi contoh apabila anak bulan Syawal belum', 'order' => 69],
            ['start_time' => 456.52, 'end_time' => 461.519, 'target_text' => 'cited it\'s like we going to you know what they call the penalty shootout let\'s leave football', 'source_text' => 'kelihatan pada hari ke-29, ia ibarat kita melangkah ke penentuan sepakan penalti; namun marilah kita ketepikan analogi bola sepak ini,', 'order' => 70],
            ['start_time' => 461.52, 'end_time' => 467.479, 'target_text' => 'aside let\'s talk more seriously make the most of these nights W the final stretch is the most', 'source_text' => 'marilah kita berbicara dengan lebih serius: manfaatkanlah sepenuhnya malam-malam ini, demi Allah pecutan terakhir inilah fasa yang paling', 'order' => 71],
            ['start_time' => 467.48, 'end_time' => 473.519, 'target_text' => 'important if you have missed out on this you\'ve missed out on everything and if you\'ve gained', 'source_text' => 'kritis; jika anda terlepas peluang keemasan ini, anda terlepas segala-galanya; tetapi jika anda berjaya meraih keberkatan', 'order' => 72],
            ['start_time' => 473.52, 'end_time' => 479.639, 'target_text' => 'this even if you\'ve lost in the first few days of Ramadan you still will win the pleasure of Allah', 'source_text' => 'malam ini, walaupun anda mungkin sedikit ketinggalan pada awal Ramadan, anda tetap akan memenangi keredaan Allah', 'order' => 73],
            ['start_time' => 479.64, 'end_time' => 509.439, 'target_text' => 'the connection with Allah subhanahu wa ta\'ala may Allah grant us all goodness', 'source_text' => 'dan merapatkan hubungan yang kukuh dengan Allah Subhanahu Wa Ta\'ala; semoga Allah mengurniakan kebaikan kepada kita semua.', 'order' => 74],
            ['start_time' => 509.44, 'end_time' => 510.092, 'target_text' => '[Nasheed]', 'source_text' => '[Alunan Nasyid Penutup]', 'order' => 75],
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
