<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo35Seeder extends Seeder
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

        // Special Bilingual Religious Video #35 (Siri 1 Ep.30): The Farewell Pilgrimage | Life of the Final Messenger ﷺ | Ep.30 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'Ie8ebDeH7ck'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Farewell Pilgrimage | Life of the Final Messenger ﷺ | Ep.30 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/Ie8ebDeH7ck/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 35,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.0, 'end_time' => 4.8, 'target_text' => 'For I do not know if I shall meet you again after this year in this place.', 'source_text' => '"Kerana sesungguhnya aku tidak tahu sama ada aku akan dapat bertemu lagi dengan kamu selepas tahun ini di tempat ini."', 'order' => 1],
            ['start_time' => 6.32, 'end_time' => 14.8, 'target_text' => 'The companions wept, the earth felt different, the sky felt heavy, and our hearts,', 'source_text' => 'Para sahabat menangis teresak-esak, bumi terasa begitu berbeza, langit seakan suram membendung duka, dan sanubari kita,', 'order' => 2],
            ['start_time' => 15.6, 'end_time' => 18.32, 'target_text' => 'even now, feel that moment.', 'source_text' => 'sehingga ke saat ini, masih dapat merasakan kegetiran detik tersebut.', 'order' => 3],
            ['start_time' => 20.88, 'end_time' => 24.4, 'target_text' => 'Bismillahir Rahmanir Rahim, my beloved brothers and sisters,', 'source_text' => 'Bismillahir Rahmanir Rahim. Saudara dan saudariku yang dikasihi,', 'order' => 4],
            ['start_time' => 24.4, 'end_time' => 31.92, 'target_text' => 'every story has a beginning and every journey has an end, but some lives do not end when the', 'source_text' => 'setiap kisah ada permulaannya dan setiap perjalanan ada noktah akhirnya, namun ada kehidupan yang tidak pernah berakhir apabila', 'order' => 5],
            ['start_time' => 31.92, 'end_time' => 39.76, 'target_text' => 'heartbeat stops. Some lives continue in every heart they touched, every soul they guided,', 'source_text' => 'degupan jantung terhenti. Sebahagian insan terus hidup dalam setiap sanubari yang pernah mereka sentuh, setiap jiwa yang mereka bimbing,', 'order' => 6],
            ['start_time' => 39.76, 'end_time' => 46.16, 'target_text' => 'every tear shed in love. Today we walk with the Messenger of Allah, peace be upon him,', 'source_text' => 'dan setiap titisan air mata yang mengalir kerana cinta. Hari ini kita melangkah bersama Rasulullah ﷺ,', 'order' => 7],
            ['start_time' => 46.16, 'end_time' => 54.16, 'target_text' => 'in his final days in this world. Not as a king, nor a conqueror, but as a teacher, a father,', 'source_text' => 'pada hari-hari terakhir Baginda di dunia yang fana ini. Bukan sebagai seorang raja, mahupun penakluk, tetapi sebagai seorang guru, seorang bapa,', 'order' => 8],
            ['start_time' => 54.16, 'end_time' => 61.68, 'target_text' => 'a friend, whose heart never stopped caring for his Ummah. We stand beside him at \'Arafah,', 'source_text' => 'seorang sahabat karib, yang sanubarinya tidak pernah berhenti menyayangi umatnya. Kita berdiri di samping Baginda di bumi Arafah,', 'order' => 9],
            ['start_time' => 61.68, 'end_time' => 68.48, 'target_text' => 'where his voice trembled not with weakness, but with love, where he left us words to carry', 'source_text' => 'di mana suaranya bergetar bukan kerana kelemahan, sebaliknya sarat dengan kasih sayang, di mana Baginda menitipkan pesanan untuk kita pegang teguh', 'order' => 10],
            ['start_time' => 68.48, 'end_time' => 88.96, 'target_text' => 'until the last day. The sun of Dhul-Qi\'dah, in the 10th year of Hijrah,', 'source_text' => 'sehingga ke hari kiamat. Mentari bulan Zulkaedah, pada tahun kesepuluh Hijrah,', 'order' => 11],
            ['start_time' => 88.96, 'end_time' => 95.2, 'target_text' => 'glowed above Madinah. The Messenger of Allah, peace be upon him, called his companions:', 'source_text' => 'menyinari kota Madinah. Rasulullah ﷺ lantas menyeru para sahabat Baginda:', 'order' => 12],
            ['start_time' => 95.2, 'end_time' => 101.2, 'target_text' => 'Prepare for the pilgrimage. It would be his first and last Hajj after the Hijrah,', 'source_text' => '"Bersiap-sedialah untuk menunaikan haji." Ia bakal menjadi ibadah haji pertama dan terakhir Baginda selepas peristiwa Hijrah,', 'order' => 13],
            ['start_time' => 101.2, 'end_time' => 110.88, 'target_text' => 'the Farewell Pilgrimage, Hajjat al-Wada\'. Over 100,000 believers answered the call. He appointed', 'source_text' => 'iaitu Haji Perpisahan (Hajjatul Wada\'). Lebih daripada 100,000 orang beriman menyahut seruan agung tersebut. Baginda melantik', 'order' => 14],
            ['start_time' => 110.88, 'end_time' => 117.36, 'target_text' => 'Abu Dujanah as governor of Madinah and set out five nights before the end of Dhul-Qi\'dah.', 'source_text' => 'Abu Dujanah RA sebagai pemangku gabenor Madinah lalu berangkat keluar lima malam sebelum berakhirnya bulan Zulkaedah.', 'order' => 15],
            ['start_time' => 118.16, 'end_time' => 122.8, 'target_text' => 'The Prophet, peace be upon him, brought with him his sacrificial animals, the Hady,', 'source_text' => 'Baginda Nabi ﷺ membawa bersama haiwan korban sembelihannya (al-Hadyu),', 'order' => 16],
            ['start_time' => 123.36, 'end_time' => 130.0, 'target_text' => 'and declared the intention of Hajj and \'Umrah together. Most companions did likewise,', 'source_text' => 'lalu berniat ihram bagi ibadah Haji dan Umrah secara serentak (Qiran). Kebanyakan para sahabat turut melakukan hal yang sama,', 'order' => 17],
            ['start_time' => 130.96, 'end_time' => 135.36, 'target_text' => 'but those without sacrifice were ordered to exit Ihram after \'Umrah.', 'source_text' => 'namun mereka yang tidak membawa haiwan korban diperintahkan untuk bertahallul (keluar daripada ihram) selepas selesai Umrah (Tamattu\').', 'order' => 18],
            ['start_time' => 136.16, 'end_time' => 142.88, 'target_text' => '\'A\'ishah, may Allah be pleased with her, became ill and wept. The Prophet, peace be upon him, said:', 'source_text' => 'Sayidatina \'Aisyah RA didatangi haid lalu menangis sedih. Maka Nabi ﷺ bersabda menenangkannya:', 'order' => 19],
            ['start_time' => 142.88, 'end_time' => 149.68, 'target_text' => 'This is what Allah has decreed for the daughters of Adam. She would later complete her \'Umrah', 'source_text' => '"Sesungguhnya perkara ini adalah ketetapan yang telah Allah takdirkan ke atas anak-anak perempuan Adam." Beliau kelak menyempurnakan Umrahnya', 'order' => 20],
            ['start_time' => 149.68, 'end_time' => 156.16, 'target_text' => 'from Tan\'im after the Hajj. \'Ali, may Allah be pleased with him, returned from Yemen,', 'source_text' => 'bermula dari miqat Tan\'im selepas selesai amalan Haji. Saidina \'Ali RA pula kembali daripada bertugas di Yaman,', 'order' => 21],
            ['start_time' => 156.16, 'end_time' => 161.44, 'target_text' => 'bringing spoils and sacrificial animals, and joined the Prophet, peace be upon him, at Makkah.', 'source_text' => 'dengan membawa harta rampasan serta haiwan korban, lalu bergabung bersama Nabi ﷺ di kota suci Makkah.', 'order' => 22],
            ['start_time' => 161.44, 'end_time' => 167.2, 'target_text' => 'He found Fatimah, may Allah be pleased with her, adorned in fine clothes. He objected,', 'source_text' => 'Beliau mendapati Sayidatina Fatimah RA telah bertahallul dan mengenakan pakaian celupan yang cantik. Beliau menegur hal itu,', 'order' => 23],
            ['start_time' => 167.2, 'end_time' => 173.12, 'target_text' => 'and she said: My father ordered us to exit Ihram. The Prophet, peace be upon him, reassured \'Ali,', 'source_text' => 'lalu Fatimah menjelaskan: "Ayahandaku yang memerintahkan kami bertahallul." Baginda Nabi ﷺ kemudian mententeramkan \'Ali RA:', 'order' => 24],
            ['start_time' => 173.12, 'end_time' => 176.88, 'target_text' => 'may Allah be pleased with him: You remain in the same state as I am.', 'source_text' => 'semoga Allah meredhainya: "Kekalkanlah niat ihrammu sebagaimana niat ihram yang telah aku lafazkan."', 'order' => 25],
            ['start_time' => 177.84, 'end_time' => 182.4, 'target_text' => 'On the 9th of Dhul-Hijjah, the Messenger, peace be upon him, stood at \'Arafat,', 'source_text' => 'Pada 9 Zulhijjah, Rasulullah ﷺ berdiri di padang wukuf \'Arafah,', 'order' => 26],
            ['start_time' => 182.4, 'end_time' => 188.32, 'target_text' => 'upon his camel Qaswa\', and addressed the crowds: O people, listen to me.', 'source_text' => 'di atas unta tunggangannya bernama al-Qaswa\', lalu berkhutbah menyampaikan amanat kepada khalayak ramai: "Wahai manusia, dengarlah kata-kataku!', 'order' => 27],
            ['start_time' => 188.32, 'end_time' => 192.64, 'target_text' => 'For I do not know if I shall meet you again after this year in this place.', 'source_text' => 'Kerana sesungguhnya aku tidak tahu sama ada aku akan dapat bertemu lagi dengan kamu selepas tahun ini di tempat ini."', 'order' => 28],
            ['start_time' => 193.76, 'end_time' => 199.84, 'target_text' => 'Your blood and your property are sacred to you like the sanctity of this day, this month,', 'source_text' => '"Sesungguhnya darah dan harta benda kamu adalah haram dan suci bagi kamu laksana kesucian hari ini, bulan ini,', 'order' => 29],
            ['start_time' => 199.84, 'end_time' => 207.36, 'target_text' => 'and this city. Return the trusts to their owners, do not wrong one another. All interest or', 'source_text' => 'dan kota suci ini. Kembalikanlah amanah kepada pemiliknya, janganlah kamu menzalimi antara satu sama lain. Segala bentuk amalan riba', 'order' => 30],
            ['start_time' => 207.36, 'end_time' => 214.8, 'target_text' => 'riba is abolished. The interest of Al-\'Abbas ibn \'Abd al-Muttalib is abolished. Beware of Satan', 'source_text' => 'telah dihapuskan sama sekali! Riba bapa saudaraku Al-\'Abbas bin Abdul Muttalib telah terbatal sepenuhnya. Berwaspadalah terhadap godaan syaitan', 'order' => 31],
            ['start_time' => 214.8, 'end_time' => 220.48, 'target_text' => 'regarding your religion. Fear Allah regarding women; you took them as a trust from Allah.', 'source_text' => 'dalam urusan agamamu. Bertaqwalah kepada Allah dalam melayan kaum wanita; sesungguhnya kamu mengambil mereka sebagai amanah daripada Allah."', 'order' => 32],
            ['start_time' => 221.36, 'end_time' => 227.28, 'target_text' => 'Then he raised his voice: I leave among you two things, the Book of Allah and the Sunnah of His', 'source_text' => 'Kemudian Baginda meninggikan suaranya seraya berpesan: "Aku tinggalkan kepada kamu dua perkara, Kitabullah (Al-Quran) dan Sunnah', 'order' => 33],
            ['start_time' => 227.28, 'end_time' => 234.0, 'target_text' => 'Prophet; if you hold fast to them, you will never go astray. As the sun set upon \'Arafat,', 'source_text' => 'Nabi-Nya; sekiranya kamu berpegang teguh kepada kedua-duanya, nescaya kamu tidak akan sesat selama-lamanya!" Tatkala matahari terbenam di ufuk \'Arafah,', 'order' => 34],
            ['start_time' => 234.0, 'end_time' => 240.64, 'target_text' => 'revelation descended: This day I have perfected for you your religion, completed My favor upon you,', 'source_text' => 'turunlah wahyu terakhir yang agung: "Pada hari ini telah Aku sempurnakan untukmu agamamu, dan telah Aku cukupkan nikmat-Ku kepadamu,', 'order' => 35],
            ['start_time' => 240.64, 'end_time' => 246.24, 'target_text' => 'and chosen for you Islam as your religion. Al-yawma akmaltu lakum deenakum,', 'source_text' => 'dan telah Aku redhai Islam itu menjadi agamamu." (Al-yawma akmaltu lakum deenakum,', 'order' => 36],
            ['start_time' => 246.24, 'end_time' => 250.64, 'target_text' => 'wa atmamtu \'alaykum ni\'mati, wa radeetu lakumu al-Islama deena.', 'source_text' => 'wa atmamtu \'alaykum ni\'mati, wa radeetu lakumu al-Islama deena).', 'order' => 37],
            ['start_time' => 251.28, 'end_time' => 257.52, 'target_text' => '\'Umar, may Allah be pleased with him, wept and said: Nothing after perfection remains, but decline.', 'source_text' => 'Saidina \'Umar RA menangis tersedu-sedu seraya berkata: "Tiada lagi yang tinggal selepas suatu kesempurnaan melainkan penurunan (perpisahan)."', 'order' => 38],
            ['start_time' => 258.32, 'end_time' => 263.28, 'target_text' => 'When the Prophet, peace be upon him, finished his rituals, he stood at Mina and said:', 'source_text' => 'Tatkala Baginda Nabi ﷺ menyempurnakan segala manasik hajinya, Baginda berdiri di Mina lalu bersabda:', 'order' => 39],
            ['start_time' => 263.28, 'end_time' => 270.48, 'target_text' => 'O people, have I conveyed the message? They replied: Yes! He raised his hands to the sky and said', 'source_text' => '"Wahai manusia, adakah aku telah menyampaikan risalah ini?" Para sahabat serentak menjawab: "Ya, benar!" Baginda mengangkat tangannya ke langit lalu bersabda', 'order' => 40],
            ['start_time' => 270.48, 'end_time' => 278.16, 'target_text' => 'thrice: O Allah, bear witness! He returned to Madinah and sent the army of Usamah ibn', 'source_text' => 'sebanyak tiga kali: "Ya Allah, saksikanlah!" Baginda pulang ke Madinah lalu menyiapkan bala tentera di bawah pimpinan Usamah bin', 'order' => 41],
            ['start_time' => 278.16, 'end_time' => 286.56, 'target_text' => 'Zayd towards Al-Sham, preparing the nation for its mission beyond Arabia. Soon after, he fell ill,', 'source_text' => 'Zaid menuju ke bumi Syam, mempersiapkan umat bagi menggalas risalah melangkaui Semenanjung Arab. Tidak lama selepas itu Baginda jatuh gering,', 'order' => 42],
            ['start_time' => 287.28, 'end_time' => 293.28, 'target_text' => 'the illness in which he would return to his Lord. This was the pilgrimage of completion,', 'source_text' => 'kesakitan yang menandakan kepulangannya ke hadrat Ilahi. Inilah ibadah haji kesempurnaan agama,', 'order' => 43],
            ['start_time' => 293.92, 'end_time' => 301.12, 'target_text' => 'mercy and farewell. At \'Arafat, he sealed the mission of Prophethood, and in his final', 'source_text' => 'rahmat keabadian, dan perpisahan yang menghibakan. Di padang \'Arafah Baginda memeterai tugas kenabian, dan dalam amanat terakhirnya', 'order' => 44],
            ['start_time' => 301.12, 'end_time' => 307.44, 'target_text' => 'supplication was a message for every heart: Let those present convey to those absent,', 'source_text' => 'terselit suatu pesanan suci buat sanubari setiap insan: "Hendaklah mereka yang hadir menyampaikan kepada mereka yang tidak hadir,', 'order' => 45],
            ['start_time' => 308.08, 'end_time' => 313.04, 'target_text' => 'perhaps the one who hears it later will understand it better than those who hear it now.', 'source_text' => 'semoga orang yang mendengarnya kelak akan lebih memahaminya berbanding mereka yang mendengarnya pada hari ini."', 'order' => 46],
            ['start_time' => 313.84, 'end_time' => 322.16, 'target_text' => 'And so, the noblest of all creation returned to the One who sent him. The house was quiet.', 'source_text' => 'Maka dengan itulah, semulia-mulia ciptaan makhluk kembali ke pangkuan Pencipta yang mengutuskannya. Rumah Baginda hening sunyi.', 'order' => 47],
            ['start_time' => 323.04, 'end_time' => 334.0, 'target_text' => 'The world slowed, angels filled the air as his blessed soul was lifted, gently, beautifully,', 'source_text' => 'Dunia seakan terhenti, para malaikat memenuhi angkasa tatkala roh sucinya yang diberkati diangkat perlahan-lahan, dengan penuh kelembutan, keindahan,', 'order' => 48],
            ['start_time' => 334.72, 'end_time' => 342.0, 'target_text' => 'peacefully. He left this world with the words: O Allah, the Highest Companion!', 'source_text' => 'dan kedamaian abadi. Baginda meninggalkan dunia ini dengan kalimah terakhirnya: "Ya Allah, pertemukanlah daku dengan Teman Yang Tertinggi (ar-Rafiq al-A\'la)!"', 'order' => 49],
            ['start_time' => 342.88, 'end_time' => 352.32, 'target_text' => 'The companions wept, the earth felt different, the sky felt heavy, and our hearts,', 'source_text' => 'Para sahabat menangis pilu, bumi terasa begitu asing, langit seakan kelam membendung hiba, dan sanubari kita,', 'order' => 50],
            ['start_time' => 353.12, 'end_time' => 361.92, 'target_text' => 'even now, feel that moment. But this was not the end. For the light he brought,', 'source_text' => 'sehingga ke hari ini, masih merasai detik sayu perpisahan itu. Namun ini bukanlah suatu penamat. Kerana cahaya petunjuk yang dibawanya,', 'order' => 51],
            ['start_time' => 362.56, 'end_time' => 369.04, 'target_text' => 'did not leave with him. It lives in every prayer, every act of mercy, every heart that whispers:', 'source_text' => 'tidak pernah lenyap bersama pemergiannya. Cahaya itu terus mekar hidup dalam setiap solat, setiap amalan rahmah, dan setiap sanubari yang berbisik:', 'order' => 52],
            ['start_time' => 369.04, 'end_time' => 377.36, 'target_text' => 'La ilaha illallah, Muhammadur Rasulullah. May Allah gather us with him at Al-Kawthar, where there is no', 'source_text' => '"La ilaha illallah, Muhammadur Rasulullah." Semoga Allah menghimpunkan kita bersama Baginda di telaga Al-Kautsar, di mana tiada lagi', 'order' => 53],
            ['start_time' => 377.36, 'end_time' => 384.96, 'target_text' => 'farewell, only light. Sallallahu \'alayhi wa sallam.', 'source_text' => 'perpisahan melainkan limpahan cahaya keabadian. Selawat dan salam ke atas junjungan Nabi Muhammad ﷺ.', 'order' => 54],
        ];

        foreach ($subtitles as $subtitle) {
            VideoSubtitle::create([
                'id'          => (string) Str::uuid(),
                'video_id'    => $video->id,
                'start_time'  => $subtitle['start_time'],
                'end_time'    => $subtitle['end_time'],
                'target_text' => $subtitle['target_text'],
                'source_text' => $subtitle['source_text'],
                'order'       => $subtitle['order'],
            ]);
        }
    }
}
