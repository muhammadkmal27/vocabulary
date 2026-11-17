<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo50Seeder extends Seeder
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

        // Special Bilingual Religious Video #50 (Siri 3 Ep.10): Ending Ramadan with Gratitude - Episode 10 - The Final Stretch - Mufti Menk
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'PG_4AyIrLzQ'],
            [
                'language_id'   => $english->id,
                'title'         => 'Ending Ramadan with Gratitude - Episode 10 - The Final Stretch - Mufti Menk',
                'thumbnail_url' => 'https://img.youtube.com/vi/PG_4AyIrLzQ/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 50,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.0, 'end_time' => 10.16, 'target_text' => 'assalamu alaykum As we come to the end of this month of Ramadan surely we should be grateful to', 'source_text' => 'Assalamu\'alaikum. Tatkala kita tiba di penghujung bulan Ramadan ini, sememangnya wajar untuk kita memanjatkan rasa syukur kepada', 'order' => 1],
            ['start_time' => 10.16, 'end_time' => 16.24, 'target_text' => 'Allah for allowing us to witness the month and for allowing us to get to this point towards', 'source_text' => 'Allah kerana mengizinkan kita menemui bulan ini dan membenarkan kita sampai ke detik ini menjelang', 'order' => 2],
            ['start_time' => 16.24, 'end_time' => 22.48, 'target_text' => 'the end of Ramadan And gratitude would mean we need to promise Allah that outside of Ramadan', 'source_text' => 'penghujung Ramadan. Dan erti kesyukuran itu menuntut kita berjanji kepada Allah bahawa di luar Ramadan kelak,', 'order' => 3],
            ['start_time' => 22.48, 'end_time' => 27.84, 'target_text' => 'we\'re going to be transformed people We\'re going to make sure we do not quit our prayer', 'source_text' => 'kita akan menjadi insan yang telah berubah jiwanya. Kita akan memastikan bahawa kita tidak sesekali meninggalkan solat,', 'order' => 4],
            ['start_time' => 27.84, 'end_time' => 34.72, 'target_text' => 'We do not quit meaning eating only halal We do not quit the changes we\'ve made I', 'source_text' => 'kita tidak meninggalkan amalan memakan hanya rezeki yang halal, dan tidak meninggalkan perubahan yang telah kita lakukan. Saya', 'order' => 5],
            ['start_time' => 34.72, 'end_time' => 42.32, 'target_text' => 'usually say in Ramadan when you have a laptop an iPad your phone if you don\'t', 'source_text' => 'sering berpesan pada bulan Ramadan: apabila anda memiliki komputer riba, iPad, atau telefon pintar, sekiranya anda tidak', 'order' => 6],
            ['start_time' => 42.32, 'end_time' => 51.76, 'target_text' => 'save the changes you actually lose all the work that you\'ve done on that file', 'source_text' => 'menyimpan perubahan tersebut (save changes), anda sebenarnya akan kehilangan segala penat lelah kerja yang telah anda laksanakan pada fail itu.', 'order' => 7],
            ['start_time' => 55.76, 'end_time' => 60.64, 'target_text' => 'So we\'ve worked for the whole month on this beautiful file Before you exit before you', 'source_text' => 'Maka kita telah bertungkus-lumus sepanjang bulan mengusahakan fail yang indah ini. Sebelum anda keluar, sebelum anda', 'order' => 8],
            ['start_time' => 60.64, 'end_time' => 66.72, 'target_text' => 'turn your laptop to the side or you close it or you put your iPad away save the changes so that', 'source_text' => 'menolak komputer riba ke tepi, menutupnya, atau menyimpan iPad anda, simpanlah perubahannya agar', 'order' => 9],
            ['start_time' => 66.72, 'end_time' => 71.52, 'target_text' => 'you know that I have achieved If you have not saved the changes you\'re going to have to start', 'source_text' => 'anda yakin bahawa daku telah mencapai kejayaan. Sekiranya anda tidak menyimpan perubahan itu, anda terpaksa bermula', 'order' => 10],
            ['start_time' => 71.52, 'end_time' => 78.4, 'target_text' => 'all over again So let\'s end Ramadan with gratitude to Allah Oh Allah I thank you for giving us such a', 'source_text' => 'dari awal semula. Oleh itu, marilah kita akhiri Ramadan dengan penuh kesyukuran kepada Allah: \'Ya Allah, daku bersyukur kepada-Mu kerana menganugerahi kami', 'order' => 11],
            ['start_time' => 78.4, 'end_time' => 84.88, 'target_text' => 'beautiful opportunity to worship you Except from us the Quran that we read every letter Multiply', 'source_text' => 'peluang yang begitu indah untuk menyembah-Mu. Terimalah daripada kami bacaan al-Quran bagi setiap hurufnya, ganda-gandakanlah', 'order' => 12],
            ['start_time' => 84.88, 'end_time' => 90.96, 'target_text' => 'the reward for us Except from us the forgiveness that we sought except from us the changes we made', 'source_text' => 'ganjaran pahalanya untuk kami. Terimalah permohonan keampunan yang kami pohon, terimalah perubahan yang telah kami lakukan', 'order' => 13],
            ['start_time' => 90.96, 'end_time' => 96.16, 'target_text' => 'to our dress code Except from us the fact that we turned away from that which we were not supposed', 'source_text' => 'pada etika pakaian kami. Terimalah hakikat bahawa kami telah berpaling daripada perkara yang tidak sepatutnya', 'order' => 14],
            ['start_time' => 96.16, 'end_time' => 102.32, 'target_text' => 'to listen to Except from us the fact that we heard more of the Quran We read and recited', 'source_text' => 'kami dengarkan. Terimalah hakikat bahawa kami lebih banyak mendengar al-Quran, kami membaca dan melantunkannya,', 'order' => 15],
            ['start_time' => 102.32, 'end_time' => 108.0, 'target_text' => 'and we listened and we repeated and we tried and we expanded our knowledge Except from us all that', 'source_text' => 'kami mendengar, mengulanginya, berusaha bersungguh-sungguh, serta memperluas ilmu pengetahuan kami. Terimalah daripada kami segala', 'order' => 16],
            ['start_time' => 108.0, 'end_time' => 113.76, 'target_text' => 'effort have mercy on us Allah has mercy on you when you try to please him by doing what he\'s', 'source_text' => 'daya usaha itu dan rahmatilah kami.\' Allah melimpahkan rahmat-Nya kepada anda apabila anda berusaha meraih keredaan-Nya dengan melaksanakan apa yang', 'order' => 17],
            ['start_time' => 113.76, 'end_time' => 118.64, 'target_text' => 'told you to do and when you try to please him by staying away from what he told you to stay away', 'source_text' => 'diperintahkan-Nya kepada anda, serta apabila anda berusaha mencari keredaan-Nya dengan menjauhi apa yang dilarang-Nya', 'order' => 18],
            ['start_time' => 118.64, 'end_time' => 126.4, 'target_text' => 'from With all humility we say "Oh Allah forgive us for our shortcomings in Ramadan." No matter how', 'source_text' => 'daripada anda. Dengan penuh kerendahan hati kita merayu, \'Ya Allah, ampunkanlah kami atas segala kekurangan kami sepanjang Ramadan.\' Betapa baik sekalipun', 'order' => 19],
            ['start_time' => 126.4, 'end_time' => 133.6, 'target_text' => 'well we did in Ramadan we are human We\'re bound to have had shortcomings May Allah forgive us', 'source_text' => 'amal yang kita lakukan pada bulan Ramadan, kita hanyalah manusia. Kita pasti tidak terlepas daripada kelemahan dan kekhilafan; semoga Allah mengampunkan kita.', 'order' => 20],
            ['start_time' => 133.6, 'end_time' => 139.12, 'target_text' => 'The little temper you might have had Sometimes you might have done something said something', 'source_text' => 'Kemarahan kecil yang mungkin pernah timbul, kadangkala anda mungkin terlanjur melakukan sesuatu atau menuturkan sesuatu kata,', 'order' => 21],
            ['start_time' => 139.12, 'end_time' => 145.52, 'target_text' => 'you may have overlooked something you might have overslept It happens in Ramadan Usually', 'source_text' => 'anda mungkin terlepas pandang sesuatu perkara, atau mungkin terlajak tidur. Ia lumrah berlaku pada bulan Ramadan. Biasanya', 'order' => 22],
            ['start_time' => 145.52, 'end_time' => 152.08, 'target_text' => 'once in Ramadan many families complain We miss sahur Don\'t worry you\'re not the only family', 'source_text' => 'sekurang-kurangnya sekali dalam Ramadan, ramai keluarga mengeluh: \'Kami terlepas sahur!\' Usah bimbang, anda bukanlah satu-satunya keluarga;', 'order' => 23],
            ['start_time' => 152.08, 'end_time' => 158.0, 'target_text' => 'A lot of families go through that One sahur usually you do miss It\'s just Allah\'s way or', 'source_text' => 'banyak keluarga turut mengalaminya. Biasanya anda memang akan terlepas satu waktu sahur. Itu adalah sebahagian daripada cara Allah atau', 'order' => 24],
            ['start_time' => 158.0, 'end_time' => 163.76, 'target_text' => 'it\'s just a human thing actually of testing us Allah\'s way of testing us to say it may happen', 'source_text' => 'hakikat sifat manusiawi sebenarnya dalam menguji kita, cara Allah menguji kita untuk membuktikan bahawa ia boleh berlaku.', 'order' => 25],
            ['start_time' => 163.76, 'end_time' => 169.84, 'target_text' => 'You\'re a human You might sleep over something Nonetheless we tried our best Oh Allah forgive', 'source_text' => 'Anda adalah seorang insan, anda mungkin terlena. Namun demikian, kita tetap telah mencuba sedaya upaya kita. Ya Allah, ampunkanlah', 'order' => 26],
            ['start_time' => 169.84, 'end_time' => 175.6, 'target_text' => 'us Accept it from us You know when Ibraimisam and his son Ismael built the Kaa they did it', 'source_text' => 'kami dan terimalah amalan ini daripada kami. Ketahuilah, tatkala Nabi Ibrahim AS dan puteranya Nabi Ismail AS membina Kaabah, mereka melaksanakannya', 'order' => 27],
            ['start_time' => 175.6, 'end_time' => 180.16, 'target_text' => 'upon the instruction of Allah And when they were done and they worshiped Allah one of the', 'source_text' => 'atas perintah wahyu Allah. Dan setelah mereka selesai dan beribadah kepada Allah, antara peribadi', 'order' => 28],
            ['start_time' => 180.16, 'end_time' => 189.28, 'target_text' => 'qualities of Ibrahimisam he always said "Oh Allah accept it from us and forgive our shortcomings', 'source_text' => 'mulia Nabi Ibrahim AS ialah baginda sentiasa berdoa: \'Wahai Tuhan kami, terimalah daripada kami dan ampunkanlah segala kekurangan kami.\'', 'order' => 29],
            ['start_time' => 193.84, 'end_time' => 199.2, 'target_text' => 'Look at the combination of the two You finished an act of worship Oh Allah accept it from us For', 'source_text' => 'Perhatikanlah gabungan kedua-dua doa ini: sebaik anda menyempurnakan sesuatu ibadah, anda berdoa, \'Ya Allah, terimalah daripada kami. Sesungguhnya', 'order' => 30],
            ['start_time' => 199.2, 'end_time' => 205.44, 'target_text' => 'indeed you are most hearing you are most knowing And oh Allah forgive us Grant us', 'source_text' => 'Engkau Maha Mendengar lagi Maha Mengetahui. Dan ya Allah, ampunkanlah kami. Kurniakanlah kepada kami', 'order' => 31],
            ['start_time' => 205.44, 'end_time' => 210.64, 'target_text' => 'a beautiful return to you Remember I told you and in one of the episodes we mentioned', 'source_text' => 'kepulangan taubat yang indah kepada-Mu.\' Ingatkah lagi apa yang pernah saya sampaikan dan dalam salah satu episod kita sebutkan', 'order' => 32],
            ['start_time' => 210.64, 'end_time' => 216.0, 'target_text' => 'the difference Toba is when you turn and change your whole life and is the seeking of forgiveness', 'source_text' => 'perbezaannya: Taubat adalah apabila anda berpaling dan merombak seluruh kehidupan anda, manakala istighfar ialah permohonan keampunan dosa.', 'order' => 33],
            ['start_time' => 216.0, 'end_time' => 222.88, 'target_text' => 'So oh Allah forgive us Forgive us and grant us a good return to you to your way Keep us', 'source_text' => 'Maka, ya Allah, ampunkanlah kami. Ampunkanlah kami dan kurniakanlah kami kepulangan yang baik kepada-Mu dan jalan-Mu. Tetapkanlah kami', 'order' => 34],
            ['start_time' => 222.88, 'end_time' => 231.68, 'target_text' => 'steadfast Generally could also refer to the seeking of the forgiveness of Allah subhanahu', 'source_text' => 'dalam keistiqamahan. Secara umumnya, ia juga merujuk kepada permohonan keampunan daripada Allah Subhanahu', 'order' => 35],
            ['start_time' => 231.68, 'end_time' => 241.12, 'target_text' => 'wa ta\'ala So why because you are the one who\'s off forgiving No matter how many times we\'ve', 'source_text' => 'Wata\'ala. Mengapakah demikian? Kerana Engkaulah Tuhan Yang Maha Pengampun. Tidak kira berapa kali pun kita', 'order' => 36],
            ['start_time' => 241.12, 'end_time' => 246.32, 'target_text' => 'lost the path you\'re always happy for us to come back You lost it a thousand times For as long as', 'source_text' => 'tersasar dari jalan yang lurus, Engkau sentiasa gembira menyambut kepulangan kami. Anda tersasar seribu kali sekalipun, selagi mana', 'order' => 37],
            ['start_time' => 246.32, 'end_time' => 252.56, 'target_text' => 'you came back a thousand and1 times you\'re good to go Alhamdulillah So always whenever you\'ve', 'source_text' => 'anda kembali berpaling pada kali ke-1001, anda selamat di sisi Allah, Alhamdulillah. Oleh itu, setiap kali anda', 'order' => 38],
            ['start_time' => 252.56, 'end_time' => 258.0, 'target_text' => 'faulted seek the forgiveness of Allah Oh Allah we seek your forgiveness for not being able to do as', 'source_text' => 'melakukan kesilapan, pohonlah keampunan Allah: \'Ya Allah, kami memohon keampunan-Mu kerana tidak berupaya beramal sebanyak', 'order' => 39],
            ['start_time' => 258.0, 'end_time' => 263.28, 'target_text' => 'much as we should have done during this month of Ramadan The little that we\'ve done Multiply', 'source_text' => 'mana yang sepatutnya kami laksanakan sepanjang bulan Ramadan ini. Amal yang sedikit yang kami lakukan ini, ganda-gandakanlah', 'order' => 40],
            ['start_time' => 263.28, 'end_time' => 270.0, 'target_text' => 'the reward for us and grant us a beautiful day of Eid Eid is a day of joy deserved by', 'source_text' => 'pahalanya untuk kami dan kurniakanlah kami hari raya Aidilfitri yang indah. Hari Raya adalah hari kegembiraan yang selayaknya diraih oleh', 'order' => 41],
            ['start_time' => 270.0, 'end_time' => 276.64, 'target_text' => 'those who sacrificed in Ramadan Those who did not sacrifice they don\'t deserve a day of joy', 'source_text' => 'mereka yang telah berkorban sepanjang Ramadan. Bagi mereka yang tidak berkorban, mereka tidak berhak menikmati hari kegembiraan tersebut.', 'order' => 42],
            ['start_time' => 276.64, 'end_time' => 282.48, 'target_text' => 'And sometimes what happens is on that day of joy we end up doing things that are displeasing to', 'source_text' => 'Dan kadangkala apa yang berlaku ialah pada hari kegembiraan itu, kita akhirnya melakukan perkara-perkara yang mengundang kemurkaan', 'order' => 43],
            ['start_time' => 282.48, 'end_time' => 289.52, 'target_text' => 'Allah as though we are no longer worshiping Allah That\'s not how it should be May Allah', 'source_text' => 'Allah, seolah-olah kita tidak lagi menyembah Allah. Bukan begitu keadaannya yang sebenar! Semoga Allah', 'order' => 44],
            ['start_time' => 289.52, 'end_time' => 296.88, 'target_text' => 'Almighty accept from us our good deeds our prayer Many of us have doneawi every night Some may have', 'source_text' => 'Maha Kuasa menerima daripada kita segala amal soleh dan solat kita. Ramai antara kita telah menunaikan solat tarawih setiap malam; sebahagiannya mungkin', 'order' => 45],
            ['start_time' => 296.88, 'end_time' => 301.04, 'target_text' => 'missed a night or two for whatever reason and either they were traveling or they were unwell', 'source_text' => 'terlepas satu atau dua malam atas sebab tertentu, sama ada kerana bermusafir, berasa kurang sihat,', 'order' => 46],
            ['start_time' => 301.04, 'end_time' => 307.04, 'target_text' => 'or fatigue whatever it might have been still we need to do better inshallah next time and we need', 'source_text' => 'atau keletihan, walau apa pun puncanya, kita tetap perlu beramal lebih baik insya-Allah pada masa akan datang, dan kita perlu', 'order' => 47],
            ['start_time' => 307.04, 'end_time' => 311.76, 'target_text' => 'to ask Allah\'s forgiveness for the shortcomings we\'ve had sometimes the concentration levels', 'source_text' => 'memohon keampunan Allah atas segala kekurangan yang berlaku; kadangkala tahap kekhusyukan kita', 'order' => 48],
            ['start_time' => 311.76, 'end_time' => 316.64, 'target_text' => 'were not there some of us were imams in the massagid we may have made a little mistake', 'source_text' => 'berkurangan, sebahagian kita menjadi imam di masjid-masjid dan kita mungkin melakukan sedikit kesilapan', 'order' => 49],
            ['start_time' => 316.64, 'end_time' => 322.0, 'target_text' => 'or two Allah will forgive may Allah forgive our shortcomings except from us the good that we\'ve', 'source_text' => 'atau dua. Allah Maha Pengampun; semoga Allah mengampunkan kelemahan kita dan menerima segala kebaikan yang telah kita', 'order' => 50],
            ['start_time' => 329.2, 'end_time' => 339.12, 'target_text' => 'May Allah Almighty truly grant us the sweetness of worshiping him in a way that keeps us worshiping', 'source_text' => 'lakukan. Semoga Allah SWT benar-benar mengurniakan kita kelazatan beribadah kepada-Nya dengan cara yang membuatkan kita sentiasa menyembah', 'order' => 51],
            ['start_time' => 339.12, 'end_time' => 344.0, 'target_text' => 'him again and again and again If you have sweetness in your salah you\'re there for the next', 'source_text' => 'dan beribadah kepada-Nya lagi, lagi, dan lagi. Sekiranya anda merasakan kelazatan dalam solat, anda pasti bersedia menanti solat', 'order' => 52],
            ['start_time' => 344.0, 'end_time' => 349.2, 'target_text' => 'one and the next one So ask Allah to give you the sweetness When you have sweetness the sweetness of', 'source_text' => 'seterusnya dan waktu berikutnya. Maka mintalah kepada Allah agar mengurniakan kelazatan itu. Apabila anda beroleh kelazatan itu, kelazatan', 'order' => 53],
            ['start_time' => 349.2, 'end_time' => 355.04, 'target_text' => 'dressing appropriately is such that you will not leave the home without proper dress code Male and', 'source_text' => 'menutup aurat dengan sempurna adalah sedemikian rupa sehingga anda tidak akan keluar rumah tanpa pakaian yang sopan, sama ada lelaki mahupun', 'order' => 54],
            ['start_time' => 355.04, 'end_time' => 362.16, 'target_text' => 'female When you are a person who enjoys praying or reading the Quran you have the sweetness of', 'source_text' => 'wanita. Apabila anda seorang yang menikmati solat atau membaca al-Quran, anda akan merasai kelazatan', 'order' => 55],
            ['start_time' => 362.16, 'end_time' => 367.44, 'target_text' => 'reading the Quran You know what it will bring you back to the Quran We spoke about building', 'source_text' => 'membaca al-Quran. Ketahuilah, ia akan sentiasa menarik anda kembali kepada al-Quran. Kita telah berbicara tentang pembinaan', 'order' => 56],
            ['start_time' => 367.44, 'end_time' => 372.96, 'target_text' => 'habits That habit is built I will go back again and again because I achieve a sweetness of it', 'source_text' => 'tabiat mulia: apabila tabiat itu terbina, daku akan kembali lagi dan lagi kerana daku merasai kelazatannya.', 'order' => 57],
            ['start_time' => 372.96, 'end_time' => 379.44, 'target_text' => 'The sweetness of iman is achieved by those who are connected to Allah Those who love for one another', 'source_text' => 'Kelazatan iman dinikmati oleh mereka yang hatinya terpaut kepada Allah; mereka yang mencintai untuk saudaranya', 'order' => 58],
            ['start_time' => 379.44, 'end_time' => 385.68, 'target_text' => 'what they love for themselves Those who really are bothered for the the the the broader benefit', 'source_text' => 'apa yang mereka cintai untuk diri mereka sendiri; mereka yang benar-benar mengambil berat demi maslahat dan manfaat yang lebih luas', 'order' => 59],
            ['start_time' => 385.68, 'end_time' => 392.88, 'target_text' => 'of the ummah Those who try to please Allah They love Allah and his messenger more than themselves', 'source_text' => 'bagi seluruh ummah; mereka yang berusaha meraih keredaan Allah, yang mencintai Allah dan Rasul-Nya melebihi diri mereka sendiri.', 'order' => 60],
            ['start_time' => 392.88, 'end_time' => 400.48, 'target_text' => 'They taste the sweetness of a lot of things It\'s called the sweetness of imaw A person who detests', 'source_text' => 'Mereka mengecap kelazatan pelbagai perkara; ia dinamakan kemanisan iman. Seseorang yang membenci', 'order' => 61],
            ['start_time' => 400.48, 'end_time' => 409.36, 'target_text' => 'to go back to ignorance A person who detests to go back to the ignorance they were in prior to being', 'source_text' => 'untuk kembali kepada kejahilan; seseorang yang amat membenci untuk kembali kepada lumpur kejahilan yang pernah mereka lalui sebelum', 'order' => 62],
            ['start_time' => 409.36, 'end_time' => 416.08, 'target_text' => 'guided to the goodness of Islam That person will taste the sweetness of you\'ve seen the darkness', 'source_text' => 'diberi petunjuk hidayah kepada keindahan Islam, insan itulah yang akan mengecap kelazatannya: anda telah melihat kegelapan,', 'order' => 63],
            ['start_time' => 416.08, 'end_time' => 422.4, 'target_text' => 'You appreciate the light This is what it is So show gratitude to Allah by asking him to give', 'source_text' => 'maka anda amat menghargai cahaya. Inilah hakikatnya! Oleh itu, tunjukkanlah kesyukuran kepada Allah dengan memohon agar Dia memberikan', 'order' => 64],
            ['start_time' => 422.4, 'end_time' => 428.48, 'target_text' => 'you the sweetness and grant you that sweetness of worship When you have the sweetness of fasting you', 'source_text' => 'anda kelazatan dan menganugerahi anda kemanisan ibadah. Apabila anda merasai kelazatan berpuasa, anda', 'order' => 65],
            ['start_time' => 428.48, 'end_time' => 435.44, 'target_text' => 'begin to fast beyond Ramadan 13th 14th 15th of every month you begin to fast the Mondays', 'source_text' => 'mula berpuasa di luar Ramadan: pada 13, 14, dan 15 hari bulan setiap bulan hijrah (Ayyamul Bidh), anda mula berpuasa hari Isnin', 'order' => 66],
            ['start_time' => 435.44, 'end_time' => 440.4, 'target_text' => 'and the Thursdays When you have the sweetness of salah you begin to pray your sunnah and you', 'source_text' => 'dan hari Khamis. Apabila anda mengecap kelazatan solat, anda mula mendirikan solat sunat rawatib dan', 'order' => 67],
            ['start_time' => 440.4, 'end_time' => 445.52, 'target_text' => 'add the nafil When you have the sweetness of the hajj you want to go for omrah so often When you', 'source_text' => 'menambah solat-solat nafilah. Apabila anda mengecap kelazatan ibadah haji, anda ingin menunaikan umrah sekerap mungkin. Apabila anda', 'order' => 68],
            ['start_time' => 445.52, 'end_time' => 451.2, 'target_text' => 'have the sweetness of zakat and charity you want to give beyond that even the general saddak So', 'source_text' => 'mengecap kelazatan zakat dan sedekah, anda ingin memberi melangkaui kewajipan itu, hatta sedekah umum sekalipun. Oleh itu,', 'order' => 69],
            ['start_time' => 451.2, 'end_time' => 455.44, 'target_text' => 'ask Allah to grant you the sweetness When you have the sweetness of your shahada you begin', 'source_text' => 'mohonlah kepada Allah agar mengurniakan kelazatan tersebut. Apabila anda memiliki kemanisan kalimah syahadah anda, anda mula', 'order' => 70],
            ['start_time' => 455.44, 'end_time' => 462.08, 'target_text' => 'to engage in allar and remembering Allah subhanahu wa ta\'ala in so many different', 'source_text' => 'melazimi zikir dan sentiasa mengingati Allah Subhanahu Wata\'ala dalam pelbagai cara', 'order' => 71],
            ['start_time' => 462.08, 'end_time' => 473.44, 'target_text' => 'ways There is none worthy of worship besides Allah subhanahu wa ta\'ala Him alone no partner', 'source_text' => 'yang berbeza: Tiada Tuhan yang berhak disembah melainkan Allah Subhanahu Wata\'ala semata-mata, tiada sekutu', 'order' => 72],
            ['start_time' => 473.44, 'end_time' => 483.52, 'target_text' => 'does he have To him belongs entire kingdom To him belongs all praise and indeed he is all', 'source_text' => 'bagi-Nya, bagi-Nyalah seluruh kerajaan alam semesta, bagi-Nyalah segala puji-pujian, dan sesungguhnya Dia Maha', 'order' => 73],
            ['start_time' => 483.52, 'end_time' => 490.24, 'target_text' => 'capable and all able able to do all things that is Allah You repeat the statements and repeat', 'source_text' => 'Kuasa lagi Maha Berupaya atas segala sesuatu; itulah Allah! Anda mengulang-ulang kalimah agung tersebut dan mengulanginya;', 'order' => 74],
            ['start_time' => 490.24, 'end_time' => 499.36, 'target_text' => 'the repetition of the is loved by Allah You can say subhan Allah 50 times or more in sujud You', 'source_text' => 'pengulangan zikir itu amat dicintai oleh Allah. Anda boleh melafazkan \'Subhanallah\' sebanyak 50 kali atau lebih ketika sujud; anda', 'order' => 75],
            ['start_time' => 499.36, 'end_time' => 503.68, 'target_text' => 'will enjoy it because you are repeating the praise of Allah one after the other', 'source_text' => 'akan benar-benar menikmatinya kerana anda mengulangi pujian ke atas Allah secara berturut-turut.', 'order' => 76],
            ['start_time' => 503.68, 'end_time' => 510.32, 'target_text' => 'That\'s how we show gratitude towards Allah when we enjoy the acts of worship May Allah Almighty', 'source_text' => 'Begitulah cara kita menzahirkan rasa syukur kepada Allah apabila kita menikmati kemanisan amal ibadah. Semoga Allah Yang Maha Kuasa', 'order' => 77],
            ['start_time' => 510.32, 'end_time' => 516.08, 'target_text' => 'grant us the sweetness of worshiping him and help us to continue even beyond Ramadan worshiping', 'source_text' => 'mengurniakan kita kelazatan menyembah-Nya dan membantu kita untuk terus istiqamah walau selepas berlalunya Ramadan dalam menyembah', 'order' => 78],
            ['start_time' => 516.08, 'end_time' => 527.36, 'target_text' => 'him', 'source_text' => 'dan beribadah kepada-Nya.', 'order' => 79],
            ['start_time' => 527.36, 'end_time' => 546.107, 'target_text' => 'for what', 'source_text' => 'atas segala kurniaan nikmat-Nya.', 'order' => 80],
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
