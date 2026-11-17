<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo43Seeder extends Seeder
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

        // Special Bilingual Religious Video #43 (Siri 3 Ep.03): Avoid Spiritual Burnout - Episode 3 - The Final Stretch - Mufti Menk
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'MuGN25xKrYA'],
            [
                'language_id'   => $english->id,
                'title'         => 'Avoid Spiritual Burnout - Episode 3 - The Final Stretch - Mufti Menk',
                'thumbnail_url' => 'https://img.youtube.com/vi/MuGN25xKrYA/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 43,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 4.96, 'end_time' => 11.199, 'target_text' => 'Assalamu alaykum we want to look at how we can maximize the benefit during these', 'source_text' => 'Assalamu\'alaikum. Kita ingin melihat bagaimana kita boleh memaksimumkan manfaat dan ganjaran sepanjang hari-hari ini', 'order' => 1],
            ['start_time' => 11.2, 'end_time' => 16.079, 'target_text' => 'days but remaining consistent one of the mistakes we make is when Ramadan', 'source_text' => 'dengan kekal istiqamah dan konsisten; salah satu kesilapan lazim yang sering kita lakukan adalah sebaik sahaja Ramadan', 'order' => 2],
            ['start_time' => 16.08, 'end_time' => 20.319, 'target_text' => 'starts we\'re in the masjid as soon as the moon is cited and the masid is packed and', 'source_text' => 'bermula, kita memenuhi masjid sebaik sahaja anak bulan kelihatan, masjid menjadi penuh sesak dan melimpah ruah,', 'order' => 3],
            ['start_time' => 20.32, 'end_time' => 28.559, 'target_text' => 'everyone is there doing ibada Quran all of this is amazing but what happens sometimes', 'source_text' => 'semua orang berada di sana menunaikan ibadah, membaca al-Quran; semua ini memang menakjubkan, namun apa yang sering berlaku selepas itu?', 'order' => 4],
            ['start_time' => 28.56, 'end_time' => 35.679, 'target_text' => 'we suffer burnout because we overdo things and then we can\'t keep up with that pace ramadan', 'source_text' => 'Kadangkala kita mengalami kelesuan jiwa (burnout) kerana kita terlalu memaksa diri secara melampau pada awalnya, lalu kita tidak mampu mengekalkan rentak tersebut; Ramadan', 'order' => 5],
            ['start_time' => 35.68, 'end_time' => 41.279, 'target_text' => 'is like a marathon when you start running you make sure your focus is on the last 10', 'source_text' => 'ini ibarat larian maraton, tatkala anda mula berlari, pastikan tumpuan dan tenaga anda disimpan untuk 10', 'order' => 6],
            ['start_time' => 41.28, 'end_time' => 54.319, 'target_text' => 'nights so Subhan Allah i know we\'re talking a little bit late in the day because we\'re already', 'source_text' => 'malam terakhir; maka SubhanAllah, saya sedar kita membincangkan perkara ini agak lewat sedikit kerana kita kini sudah pun', 'order' => 7],
            ['start_time' => 54.32, 'end_time' => 61.759, 'target_text' => 'in the last 10 nights but if you look at Ramadan and you ask yourself what am I meant to achieve', 'source_text' => 'berada dalam 10 malam terakhir; namun jika anda melihat Ramadan dan bertanya pada diri sendiri: apakah matlamat sebenar yang ingin aku capai?', 'order' => 8],
            ['start_time' => 61.76, 'end_time' => 69.519, 'target_text' => 'by this it\'s the end that needs to be powerful and potent in Islam your deeds are judged by how they', 'source_text' => 'Sebenarnya fasa penutuplah yang mesti paling bertenaga dan berkuasa; dalam Islam, setiap amalan dinilai berdasarkan bagaimana pengakhirannya;', 'order' => 9],
            ['start_time' => 69.52, 'end_time' => 75.919, 'target_text' => 'ended so even in life if you were very pious at the beginning of your life and you lost it towards', 'source_text' => 'bahkan dalam kehidupan ini, sekiranya anda seorang yang amat soleh pada awal usia namun anda tersasar dan hanyut pada penghujung hayat,', 'order' => 10],
            ['start_time' => 75.92, 'end_time' => 81.839, 'target_text' => 'the end Allah will judge you based on the ending similarly if you were not a good person at the', 'source_text' => 'maka Allah akan menghakimi anda berdasarkan detik pengakhiran anda; begitu juga sebaliknya, jika anda seorang yang kurang baik pada', 'order' => 11],
            ['start_time' => 81.84, 'end_time' => 87.839, 'target_text' => 'beginning and you committed sins when you sought forgiveness and changed your life Allah judges you', 'source_text' => 'permulaan hidup dan banyak melakukan dosa, tatkala anda memohon keampunan dan mengubah haluan hidup anda, Allah menilai anda', 'order' => 12],
            ['start_time' => 87.84, 'end_time' => 95.599, 'target_text' => 'by your repentance and not by your sin so where did the repentance come in at the end or not at', 'source_text' => 'berdasarkan taubat anda dan bukan lagi berdasarkan dosa-dosa silam anda; maka di manakah taubat itu hadir? Di penghujung hayat atau tidak?', 'order' => 13],
            ['start_time' => 95.6, 'end_time' => 101.119, 'target_text' => 'the end if it came in at the end good news to you but if it did not come in at the end you need to', 'source_text' => 'Sekiranya taubat itu hadir di penghujung hayat, berita gembira buat anda! Namun jika ia belum hadir, anda perlu segera', 'order' => 14],
            ['start_time' => 101.12, 'end_time' => 107.679, 'target_text' => 'do better that\'s why we are here talking about Ramadan let it end well if you have done well', 'source_text' => 'memperbaiki diri; sebab itulah kita berada di sini membicarakan tentang Ramadan: biarlah ia berakhir dengan husnul khatimah; jika amalan anda telah baik,', 'order' => 15],
            ['start_time' => 107.68, 'end_time' => 114.479, 'target_text' => 'don\'t lose the consistency and the focus and if you have not done well guess what it\'s never too', 'source_text' => 'jangan sesekali kehilangan keistiqamahan dan fokus anda; dan sekiranya amalan anda masih belum memuaskan, ketahuilah bahawa belum terlambat sama sekali;', 'order' => 16],
            ['start_time' => 114.48, 'end_time' => 120.159, 'target_text' => 'late those of you who might have wasted the first days of Ramadan or even as we entered the last', 'source_text' => 'bagi anda yang mungkin telah mensia-siakan hari-hari awal Ramadan atau bahkan tatkala kita mula melangkah masuk ke dalam 10', 'order' => 17],
            ['start_time' => 120.16, 'end_time' => 127.039, 'target_text' => '10 nights you wasted it this is a message to say it\'s not too late come please come for your sake', 'source_text' => 'malam terakhir ini anda masih terlalai, ini adalah mesej peringatan bahawa belum terlewat: marilah kembali, demi kebaikan diri anda sendiri,', 'order' => 18],
            ['start_time' => 127.04, 'end_time' => 132.079, 'target_text' => 'for the sake of Allah for the sake of the ummah let\'s come together and make this happen this is', 'source_text' => 'demi Allah dan demi maruah ummah, marilah kita bangkit bersama-sama merebut peluang ini; inilah', 'order' => 19],
            ['start_time' => 132.08, 'end_time' => 138.159, 'target_text' => 'the month of Ramadan the last 10 nights the most powerful the most amazing you may never ever see', 'source_text' => 'bulan Ramadan, fasa 10 malam terakhir yang paling berkuasa dan menakjubkan, di mana anda mungkin tidak akan berpeluang lagi melihat', 'order' => 20],
            ['start_time' => 138.16, 'end_time' => 142.799, 'target_text' => 'another Ramadan this might be the last night that you\'re ever going to witness have you thought of', 'source_text' => 'Ramadan yang akan datang; malam ini mungkin merupakan malam terakhir yang sempat anda saksikan di dunia, pernahkah anda terfikir', 'order' => 21],
            ['start_time' => 142.8, 'end_time' => 148.559, 'target_text' => 'that so Allah says you will be judged based on how you ended the deed you ended your life you', 'source_text' => 'tentang hakikat itu? Maka Allah menegaskan bahawa anda akan dinilai berdasarkan bagaimana anda mengakhiri amalan anda, bagaimana anda mengakhiri hidup anda, dan bagaimana', 'order' => 22],
            ['start_time' => 148.56, 'end_time' => 154.399, 'target_text' => 'ended Ramadan and so on ramadan is coming to an end make the most if you were to burn out right', 'source_text' => 'anda mengakhiri Ramadan anda; kini Ramadan semakin menghampiri penghujungnya, manfaatkanlah sepenuhnya; sekiranya anda lesu dan terbakar semangat', 'order' => 23],
            ['start_time' => 154.4, 'end_time' => 159.439, 'target_text' => 'at the beginning and then you just suddenly you know flop and you\'re no longer interested people', 'source_text' => 'pada awal-awal lagi lalu tiba-tiba anda tersungkur rebah dan tidak lagi berminat untuk beribadah; hakikatnya ramai orang', 'order' => 24],
            ['start_time' => 159.44, 'end_time' => 163.999, 'target_text' => 'do this a lot of the times i see in the Masaajid a lot of the people are there at the beginning and', 'source_text' => 'melakukan kesilapan ini, sering kali saya perhatikan di masjid-masjid: ramai jemaah hadir berduyun-duyun pada permulaan,', 'order' => 25],
            ['start_time' => 164.0, 'end_time' => 169.679, 'target_text' => 'then towards the second week of Ramadan the masids are empty and it\'s a fact and then coming up', 'source_text' => 'namun menjelang minggu kedua Ramadan, saf masjid mulai kosong dan lengang, itu adalah satu hakikat; dan apabila tiba', 'order' => 26],
            ['start_time' => 169.68, 'end_time' => 175.519, 'target_text' => 'towards the end it starts picking up again let\'s make sure that we pick up in a beautiful way no', 'source_text' => 'menghampiri penghujung, jemaah mula meningkat semula; maka marilah kita pastikan kita bangkit semula dengan cara yang indah tanpa', 'order' => 27],
            ['start_time' => 175.52, 'end_time' => 184.239, 'target_text' => 'burnout the best of deeds are those that are done regularly even if there are little that\'s a hadith', 'source_text' => 'mengalami kelesuan rohani; sebaik-baik amalan adalah amalan yang dilakukan secara berterusan (istiqamah) walaupun ia sedikit, itulah sabda', 'order' => 28],
            ['start_time' => 184.24, 'end_time' => 188.799, 'target_text' => 'of the prophet sallallahu alaihi wasallam so remember Allah loves the deeds that are done', 'source_text' => 'Rasulullah Sallallahu \'Alaihi Wasallam; maka ingatlah, Allah amat mencintai amalan yang dikerjakan', 'order' => 29],
            ['start_time' => 188.8, 'end_time' => 195.999, 'target_text' => 'regularly consistency He is more loved by Allah subhanahu wa ta\'ala than having done everything', 'source_text' => 'secara berterusan; keistiqamahan itu jauh lebih dicintai oleh Allah Subhanahu Wa Ta\'ala berbanding anda melakukan segala-galanya dalam satu malam', 'order' => 30],
            ['start_time' => 196.0, 'end_time' => 201.279, 'target_text' => 'one night and then you forgot Allah for the other whole for the rest of the month allah says that\'s', 'source_text' => 'lalu anda melupakan Allah untuk sepanjang baki hari dalam bulan tersebut; Allah menegaskan bahawa bukan itu yang dicintai-Nya;', 'order' => 31],
            ['start_time' => 201.28, 'end_time' => 206.959, 'target_text' => 'not what I love what I love is even if it is little but make sure it\'s every day because Allah', 'source_text' => 'apa yang Allah cintai adalah amalan yang berterusan walaupun sedikit, tetapi pastikan ia dilakukan setiap hari; kerana Allah yang', 'order' => 32],
            ['start_time' => 206.96, 'end_time' => 213.839, 'target_text' => 'created us he knows that this type of consistency is what will help you as a human being and as a', 'source_text' => 'menciptakan kita, Dia Maha Mengetahui bahawa keistiqamahan sebeginilah yang benar-benar akan membina diri anda sebagai seorang manusia dan mukmin sejati;', 'order' => 33],
            ['start_time' => 213.84, 'end_time' => 219.359, 'target_text' => 'believer take a look at your body you need to eat a little but a few times consistently right', 'source_text' => 'lihatlah kepada keperluan tubuh badan fizikal anda: anda perlu makan sedikit demi sedikit tetapi secara konsisten beberapa kali sehari, bukan?', 'order' => 34],
            ['start_time' => 219.36, 'end_time' => 223.759, 'target_text' => 'you can\'t just eat a whole pile today and for one week you don\'t eat in 2 three days time', 'source_text' => 'Anda tidak boleh memakan timbunan makanan yang banyak pada hari ini lalu anda tidak makan langsung selama seminggu; dalam tempoh dua tiga hari,', 'order' => 35],
            ['start_time' => 223.76, 'end_time' => 228.639, 'target_text' => 'you probably will need the hospital you\'ll be hospitalized because you have to eat a little', 'source_text' => 'anda pasti terpaksa dihantar ke hospital dan dimasukkan ke wad kerana lumrah tubuh memerlukan zat makanan sedikit demi sedikit', 'order' => 36],
            ['start_time' => 228.64, 'end_time' => 236.159, 'target_text' => 'every day similarly when you do you read a portion of the Quran every day you do somear every day', 'source_text' => 'pada setiap hari; begitu jugalah halnya dengan rohani: anda membaca sebahagian ayat al-Quran setiap hari, anda membasahi lidah dengan zikir setiap hari;', 'order' => 37],
            ['start_time' => 236.16, 'end_time' => 241.839, 'target_text' => 'similarly your your ibada your salah your prayer Allah has stretched it out five times a day every', 'source_text' => 'demikian juga ibadah solat fardu anda: Allah telah menyusunnya merentasi lima waktu sehari semalam pada setiap', 'order' => 38],
            ['start_time' => 241.84, 'end_time' => 246.479, 'target_text' => 'day you can\'t say you know what I\'m going to pray so much for one week and then for four weeks I\'m', 'source_text' => 'hari; anda tidak boleh berkata: \'Saya mahu bersolat sebanyak-banyaknya selama seminggu dan selepas itu selama empat minggu saya mahu', 'order' => 39],
            ['start_time' => 246.48, 'end_time' => 251.199, 'target_text' => 'going to give it a break allah says that\'s not acceptable you can\'t do that you must do it when', 'source_text' => 'berehat daripada solat\', Allah menegaskan itu tidak boleh diterima sama sekali! Anda tidak boleh berbuat demikian; anda wajib melaksanakannya mengikut', 'order' => 40],
            ['start_time' => 251.2, 'end_time' => 256.719, 'target_text' => 'we tell you how we tell you how much we tell you and everything needs to happen according to his', 'source_text' => 'ketetapan yang Kami perintahkan kepada kamu, mengikut cara dan sukatan yang Kami tetapkan, dan segalanya mestilah berjalan menepati', 'order' => 41],
            ['start_time' => 256.72, 'end_time' => 261.999, 'target_text' => 'will the same happens in the month of Ramadan there are so many health benefits that we have', 'source_text' => 'kehendak syariat-Nya; perkara yang sama berlaku dalam bulan Ramadan: terdapat begitu banyak manfaat kesihatan jasmani yang belum pun', 'order' => 42],
            ['start_time' => 262.0, 'end_time' => 268.479, 'target_text' => 'not even started talking about for this month of fasting but with that there is also contentment', 'source_text' => 'sempat kita huraikan berkenaan hikmah ibadah puasa ini, namun di samping itu ia turut membawa ketenangan jiwa,', 'order' => 43],
            ['start_time' => 268.48, 'end_time' => 275.279, 'target_text' => 'spirituality connection with Allah forgiveness mercy so many more uh benefits that you will reap', 'source_text' => 'peningkatan spiritual, hubungan yang rapat dengan Allah, keampunan dosa, limpahan rahmat, serta pelbagai lagi kelebihan yang akan anda tuai', 'order' => 44],
            ['start_time' => 275.28, 'end_time' => 283.039, 'target_text' => 'by being consistent in this worship of Allah subhanahu wa ta\'ala so remember set yourself', 'source_text' => 'dengan bersikap istiqamah dalam memperhambakan diri kepada Allah Subhanahu Wa Ta\'ala; oleh itu ingatlah, tetapkanlah', 'order' => 45],
            ['start_time' => 283.04, 'end_time' => 289.679, 'target_text' => 'a beautiful goal set yourself something that you want to do every day I\'m going to read one portion', 'source_text' => 'satu sasaran matlamat yang indah untuk diri anda, tetapkan sesuatu amalan yang mampu anda lakukan secara konsisten setiap hari: \'Aku akan membaca satu juzuk', 'order' => 46],
            ['start_time' => 289.68, 'end_time' => 294.559, 'target_text' => 'of the Quran some of us are very good at reading some of us are not so good some of us are half', 'source_text' => 'al-Quran\'; sesetengah daripada kita amat lancar membaca al-Quran, sesetengahnya pula kurang mahir, sebahagian kita adalah penghafaz al-Quran,', 'order' => 47],
            ['start_time' => 294.56, 'end_time' => 299.279, 'target_text' => 'some of us are not half is meaning you memorized the Quran memorized portions of it and some of', 'source_text' => 'manakala sebahagian lagi bukan hafiz iaitu mereka menghafal surah-surah tertentu sahaja, dan ada dalam kalangan', 'order' => 48],
            ['start_time' => 299.28, 'end_time' => 306.319, 'target_text' => 'us have not even learned Arabic so based on how long it\'s going to take you set yourself a time', 'source_text' => 'kita yang belum pun berpeluang mempelajari bahasa Arab; maka berdasarkan berapa banyak masa yang anda perlukan, tetapkanlah jadual khusus:', 'order' => 49],
            ['start_time' => 306.32, 'end_time' => 312.399, 'target_text' => 'i\'m going to spend 1 hour with the Quran every day beautiful whether you\'ve completed the Quran', 'source_text' => '\'Aku akan memperuntukkan masa 1 jam bersama al-Quran setiap hari\', sungguh indah; sama ada anda sempat mengkhatamkan 30 juzuk al-Quran', 'order' => 50],
            ['start_time' => 312.4, 'end_time' => 318.159, 'target_text' => 'or not actually becomes irrelevant to a degree why I say to a degree is because those who can', 'source_text' => 'atau tidak, pada tahap tertentu ia bukan lagi ukuran mutlak; mengapa saya katakan pada tahap tertentu? Kerana bagi sesiapa yang', 'order' => 51],
            ['start_time' => 318.16, 'end_time' => 322.239, 'target_text' => 'read the Quran should try to finish the Quran in the month of Ramadan without a doubt and I want', 'source_text' => 'mampu dan lancar membaca al-Quran, wajarlah dia berusaha mengkhatamkan al-Quran dalam bulan Ramadan tanpa ragu-ragu; dan saya ingin', 'order' => 52],
            ['start_time' => 322.24, 'end_time' => 327.279, 'target_text' => 'to give you one other point of benefit for those who cannot read the Quran properly in the month', 'source_text' => 'berkongsi satu lagi tip manfaat yang amat bernilai bagi mereka yang belum mahir membaca al-Quran dengan fasih di dalam bulan', 'order' => 53],
            ['start_time' => 327.28, 'end_time' => 334.719, 'target_text' => 'of Ramadan even though you have not been able to complete the entire Quran in this month of Ramadan', 'source_text' => 'Ramadan ini: walaupun anda mungkin belum berupaya membaca dan mengkhatamkan keseluruhan al-Quran sendiri pada bulan ini,', 'order' => 54],
            ['start_time' => 334.72, 'end_time' => 341.359, 'target_text' => 'at least listen to the whole Quran that you can definitely do so remember this for all of you the', 'source_text' => 'sekurang-kurangnya dengarkanlah keseluruhan bacaan al-Quran 30 juzuk, perkara itu pasti mampu anda lakukan; maka ingatlah pesanan ini untuk anda semua,', 'order' => 55],
            ['start_time' => 341.36, 'end_time' => 346.479, 'target_text' => 'reverts the new Muslims the people who don\'t know Arabic the people who can\'t read Quran I\'ve given', 'source_text' => 'para mualaf, saudara baharu kita, mereka yang belum menguasai bahasa Arab, serta mereka yang belum lancar membaca al-Quran, saya berikan', 'order' => 56],
            ['start_time' => 346.48, 'end_time' => 353.919, 'target_text' => 'you a beautiful bonus of learning today what is it if you cannot complete the entire Quran in the', 'source_text' => 'anda satu bonus pembelajaran yang begitu bermakna hari ini: apakah dia? Sekiranya anda belum mampu mengkhatamkan keseluruhan al-Quran', 'order' => 57],
            ['start_time' => 353.92, 'end_time' => 360.479, 'target_text' => 'Arabic language reading it do you know what the next best thing is to listen to a reciter who has', 'source_text' => 'dalam bahasa Arab dengan membacanya sendiri, tahukah anda pilihan terbaik yang setaraf dengannya? Iaitu dengarkanlah qari yang mempunyai', 'order' => 58],
            ['start_time' => 360.48, 'end_time' => 370.559, 'target_text' => 'clear recitation and listen to at least the entire Quran once in Ramadan try also to mimic the words', 'source_text' => 'bacaan yang jelas dan tartil, serta dengarkanlah sekurang-kurangnya keseluruhan al-Quran itu sekali sepanjang Ramadan; cubalah turut meniru sebutan ayat-ayat tersebut,', 'order' => 59],
            ['start_time' => 370.56, 'end_time' => 378.319, 'target_text' => 'so as they\'re saying and you\'re saying you\'re getting a double reward a reward for listening', 'source_text' => 'di mana tatkala qari membaca dan anda turut menggerakkan bibir menyebutnya, anda beroleh dua ganjaran pahala serentak: ganjaran pahala mendengar', 'order' => 60],
            ['start_time' => 378.32, 'end_time' => 385.199, 'target_text' => 'every letter and a reward for trying to read with the person who is reading imagine so many people', 'source_text' => 'setiap huruf ayat suci, dan ganjaran pahala berusaha membaca bersama-sama qari yang sedang mengalunkannya; bayangkan, ramai orang', 'order' => 61],
            ['start_time' => 385.2, 'end_time' => 391.359, 'target_text' => 'say I can\'t do much don\'t be a negative person make it positive i can\'t read so inshallah I\'m', 'source_text' => 'mengeluh: \'Saya tidak mampu buat banyak perkara\', jangan bersikap negatif, jadikanlah ia positif: \'Aku belum lancar membaca, maka insya-Allah aku', 'order' => 62],
            ['start_time' => 391.36, 'end_time' => 396.079, 'target_text' => 'going to listen and I\'m going to make sure that I do as best as I can but with the listening I\'m', 'source_text' => 'akan mendengar dan memastikan aku berusaha sebaik mungkin; namun di samping mendengar, aku', 'order' => 63],
            ['start_time' => 396.08, 'end_time' => 402.879, 'target_text' => 'going to try and lip sync and read with the the recer you know people do this with songs on Tik', 'source_text' => 'akan cuba menyelaraskan gerak bibir (lip-sync) dan membaca bersama qari tersebut\'; anda tahu, ramai anak muda melakukan perkara ini mengikut lagu-lagu di TikTok,', 'order' => 64],
            ['start_time' => 402.88, 'end_time' => 408.719, 'target_text' => 'Tok can you imagine people do this with things they\'ve never ever heard before in their lives', 'source_text' => 'dapatkah anda bayangkan? Orang ramai sanggup melakukan ini untuk perkara-perkara yang belum pernah mereka dengar seumur hidup mereka,', 'order' => 65],
            ['start_time' => 408.72, 'end_time' => 414.959, 'target_text' => 'words of songs that are so vulgar sometimes and our brothers and sisters learn them they', 'source_text' => 'lirik lagu yang kadangkala mengandungi kata-kata kotor dan lucah, namun anak-anak kita mempelajarinya,', 'order' => 66],
            ['start_time' => 414.96, 'end_time' => 421.439, 'target_text' => 'memorize them they spend hours and then they take a video of themselves mimicking moving their lips', 'source_text' => 'menghafalnya, meluangkan masa berjam-jam, kemudian merakam video diri mereka menggerakkan bibir', 'order' => 67],
            ['start_time' => 421.44, 'end_time' => 428.479, 'target_text' => 'exactly in sync with those words of the song come on i need to do this with the Quran i will not do', 'source_text' => 'tepat selari dengan setiap bait lirik lagu tersebut; ayuhlah, kita sepatutnya melakukan usaha sebegitu untuk al-Quran! Jangan sesekali kita habiskan', 'order' => 68],
            ['start_time' => 428.48, 'end_time' => 434.639, 'target_text' => 'it with something that is displeasing to Allah i will invest my time my effort my energy and in', 'source_text' => 'masa untuk perkara yang mengundang kemurkaan Allah; sebaliknya aku akan melaburkan masa, tenaga, dan kekuatanku untuk Kalamullah; dan sepanjang', 'order' => 69],
            ['start_time' => 434.64, 'end_time' => 440.319, 'target_text' => 'these last 10 nights you will have a multiplied reward if any one of those nights happens to be', 'source_text' => '10 malam terakhir ini, anda akan meraih ganjaran pahala yang digandakan; sekiranya salah satu daripada malam-malam ini bertepatan—', 'order' => 70],
            ['start_time' => 440.32, 'end_time' => 448.399, 'target_text' => 'and it will be the night of decree your reward will be multiplied 83.3 years of worship so it\'s', 'source_text' => 'dan ia pasti berlaku—dengan malam Lailatulqadar, maka pahala amalan anda akan digandakan menyamai 83.3 tahun ibadah; seolah-olah', 'order' => 71],
            ['start_time' => 448.4, 'end_time' => 454.879, 'target_text' => 'like you did this for 83 years consistently that\'s the reward of Allah that\'s why Allah says when', 'source_text' => 'anda telah melakukan amalan ini secara istiqamah selama 83 tahun tanpa henti! Itulah kurniaan pahala Allah; sebab itulah Allah berfirman bahawa apabila', 'order' => 72],
            ['start_time' => 454.88, 'end_time' => 460.72, 'target_text' => 'you have worshiped in the night of decree it\'s inshallah forgiveness that\'s what you achieve', 'source_text' => 'anda beribadah pada malam Lailatulqadar, ganjarannya insya-Allah adalah pengampunan dosa sepenuhnya, itulah matlamat yang anda capai', 'order' => 73],
            ['start_time' => 462.16, 'end_time' => 469.122, 'target_text' => 'paradise may Allah grant that to us i pray that we can be consistent', 'source_text' => 'menuju syurga; semoga Allah mengurniakan syurga kepada kita semua, dan saya berdoa agar kita sentiasa diberi kekuatan untuk terus istiqamah.', 'order' => 74],
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
