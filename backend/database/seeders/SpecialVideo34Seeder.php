<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo34Seeder extends Seeder
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

        // Special Bilingual Religious Video #34 (Siri 1 Ep.29): The Year of Delegations | Life of the Final Messenger ﷺ | Ep.29 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'ziRT5GhtgvY'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Year of Delegations | Life of the Final Messenger ﷺ | Ep.29 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/ziRT5GhtgvY/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 34,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.0, 'end_time' => 5.6, 'target_text' => 'They came in groups proclaiming the Shahada, one after another,', 'source_text' => 'Mereka berduyun-duyun datang mengikrarkan Syahadah, satu demi satu kabilah,', 'order' => 1],
            ['start_time' => 5.6, 'end_time' => 12.24, 'target_text' => 'the city that once sheltered a small group of believers, now welcomed nations.', 'source_text' => 'kota yang dahulunya hanya menaungi sekelompok kecil orang beriman, kini menyambut ketibaan bangsa-bangsa.', 'order' => 2],
            ['start_time' => 12.24, 'end_time' => 15.68, 'target_text' => 'Bismillahir Rahmanir Rahim, my beloved brothers and sisters,', 'source_text' => 'Bismillahir Rahmanir Rahim. Saudara dan saudariku yang dikasihi,', 'order' => 3],
            ['start_time' => 15.68, 'end_time' => 19.68, 'target_text' => 'after years of struggle, patience and steadfastness,', 'source_text' => 'setelah bertahun-tahun menempuh perjuangan, kesabaran, dan keteguhan iman,', 'order' => 4],
            ['start_time' => 19.68, 'end_time' => 22.48, 'target_text' => 'a new chapter began in the life of this Ummah.', 'source_text' => 'lembaran baharu bermula dalam lembaran sejarah umat ini.', 'order' => 5],
            ['start_time' => 23.28, 'end_time' => 27.92, 'target_text' => 'Tribes and leaders now journeyed to Medina, not for war, but for truth.', 'source_text' => 'Kabilah-kabilah dan para pemimpin kini bermusafir menuju ke Madinah, bukan untuk berperang, tetapi demi mencari kebenaran.', 'order' => 6],
            ['start_time' => 28.56, 'end_time' => 32.56, 'target_text' => 'This was \'Am al-Wufud, the year of delegations.', 'source_text' => 'Inilah dia \'Amul Wufud, iaitu Tahun Delegasi (Rombongan Utusan).', 'order' => 7],
            ['start_time' => 33.76, 'end_time' => 39.28, 'target_text' => 'So come with me, to the days when hearts began to return to the light.', 'source_text' => 'Maka marilah bersama saya, menelusuri hari-hari ketika hati-hati manusia mula kembali kepada cahaya petunjuk.', 'order' => 8],
            ['start_time' => 39.28, 'end_time' => 58.08, 'target_text' => 'The desert roads filled with riders from every direction.', 'source_text' => 'Laluan-laluan padang pasir dipenuhi oleh para penunggang kuda dan unta dari segenap pelosok arah.', 'order' => 9],
            ['start_time' => 58.88, 'end_time' => 64.64, 'target_text' => 'The call that once echoed alone from Makkah, now reached every corner of Arabia.', 'source_text' => 'Seruan dakwah yang dahulunya bergema sendirian dari Makkah, kini sampai ke setiap penjuru Semenanjung Tanah Arab.', 'order' => 10],
            ['start_time' => 65.6, 'end_time' => 71.36, 'target_text' => 'The year nine after Hijrah, known as \'Am al-Wufud, the year of delegations.', 'source_text' => 'Tahun kesembilan selepas Hijrah, yang masyhur dikenali sebagai \'Amul Wufud, Tahun Rombongan Utusan.', 'order' => 11],
            ['start_time' => 72.08, 'end_time' => 76.24, 'target_text' => 'When the Messenger of Allah, peace be upon him, returned from Tabuk,', 'source_text' => 'Tatkala Rasulullah ﷺ kembali dari ekspedisi Tabuk,', 'order' => 12],
            ['start_time' => 76.24, 'end_time' => 81.92, 'target_text' => 'and the idols of Makkah had fallen, the tribes no longer waited, from Najd to Yemen,', 'source_text' => 'dan berhala-berhala kota Makkah telah pun diruntuhkan, kabilah-kabilah tidak lagi berlengah, dari Najad hingga ke Yaman,', 'order' => 13],
            ['start_time' => 82.64, 'end_time' => 84.24, 'target_text' => 'from Bahrain to the north.', 'source_text' => 'dari Bahrain hingga ke sempadan utara.', 'order' => 14],
            ['start_time' => 84.88, 'end_time' => 89.84, 'target_text' => 'They came in groups proclaiming the Shahada, one after another.', 'source_text' => 'Mereka datang berbondong-bondong mengikrarkan kalimah Syahadah, satu demi satu.', 'order' => 15],
            ['start_time' => 90.48, 'end_time' => 93.04, 'target_text' => 'It was the fulfilment of the Divine verse.', 'source_text' => 'Ia adalah pembuktian dan penyempurnaan kepada firman Ilahi yang agung.', 'order' => 16],
            ['start_time' => 93.36, 'end_time' => 113.2, 'target_text' => 'When the victory of Allah has come and the conquest, and you see the people entering the religion of Allah in crowds,', 'source_text' => 'Apabila telah datang pertolongan Allah dan kemenangan, dan engkau melihat manusia masuk ke dalam agama Allah secara beramai-ramai,', 'order' => 17],
            ['start_time' => 113.2, 'end_time' => 117.52, 'target_text' => 'then glorify the praises of your Lord and seek His forgiveness.', 'source_text' => 'maka bertasbihlah dengan memuji Tuhanmu dan pohonlah keampunan kepada-Nya.', 'order' => 18],
            ['start_time' => 118.32, 'end_time' => 122.32, 'target_text' => 'Among the first to arrive were the eloquent men of Banu Tamim.', 'source_text' => 'Antara rombongan terawal yang tiba ialah tokoh-tokoh Banu Tamim yang petah berbicara.', 'order' => 19],
            ['start_time' => 123.2, 'end_time' => 128.56, 'target_text' => 'They rode into Medina with pride, shouting from behind the apartments of the Prophet,', 'source_text' => 'Mereka menunggang masuk ke Madinah dengan penuh kemegahan, berseru lantang dari balik bilik kediaman Baginda Nabi ﷺ,', 'order' => 20],
            ['start_time' => 128.56, 'end_time' => 129.68, 'target_text' => 'peace be upon him.', 'source_text' => 'semoga selawat dan salam tercurah ke atasnya.', 'order' => 21],
            ['start_time' => 129.68, 'end_time' => 135.28, 'target_text' => 'O Muhammad come out to us, their loud voices disturbed the Prophet, peace be upon him.', 'source_text' => '"Wahai Muhammad, keluarlah kepada kami!" Suara mereka yang lantang mengganggu ketenangan Nabi ﷺ.', 'order' => 22],
            ['start_time' => 135.28, 'end_time' => 141.12, 'target_text' => 'And so was revealed the verse, those who call you from behind the chambers,', 'source_text' => 'Lalu diturunkanlah ayat suci: Sesungguhnya orang-orang yang memanggilmu dari luar bilik-bilik kediamanmu,', 'order' => 23],
            ['start_time' => 141.12, 'end_time' => 143.12, 'target_text' => 'most of them do not reason.', 'source_text' => 'kebanyakan mereka tidak menggunakan akal fikirannya.', 'order' => 24],
            ['start_time' => 143.52, 'end_time' => 146.72, 'target_text' => 'They came to boast their poets and their leaders,', 'source_text' => 'Mereka datang untuk bermegah-megah dengan para penyair dan pemimpin mereka,', 'order' => 25],
            ['start_time' => 146.72, 'end_time' => 151.52, 'target_text' => 'but when their orator spoke, the Prophet, peace be upon him, allowed', 'source_text' => 'namun apabila pemidato mereka selesai berucap, Nabi ﷺ mengizinkan', 'order' => 26],
            ['start_time' => 151.52, 'end_time' => 154.32, 'target_text' => 'Thabit ibn Qays ibn Shammas to reply.', 'source_text' => 'Thabit bin Qais bin Shammas RA untuk tampil membalas hujah.', 'order' => 27],
            ['start_time' => 154.32, 'end_time' => 161.76, 'target_text' => 'His words carried the light of faith, until Banu Tamim realized that honour was no longer', 'source_text' => 'Kata-katanya sarat dengan cahaya keimanan, sehingga Banu Tamim menyedari bahawa kemuliaan bukan lagi', 'order' => 28],
            ['start_time' => 161.76, 'end_time' => 165.12, 'target_text' => 'in lineage or tribe, but in obedience to Allah.', 'source_text' => 'pada susur galur keturunan atau kabilah, sebaliknya pada ketaatan mutlak kepada Allah.', 'order' => 29],
            ['start_time' => 165.12, 'end_time' => 170.32, 'target_text' => 'They embraced Islam and the Prophet, peace be upon him, honored them with gifts.', 'source_text' => 'Mereka akhirnya memeluk Islam dan Baginda Nabi ﷺ memuliakan mereka dengan pelbagai hadiah kurniaan.', 'order' => 30],
            ['start_time' => 171.28, 'end_time' => 173.52, 'target_text' => 'Soon came \'Amir ibn al-Tufayl,', 'source_text' => 'Tidak lama selepas itu tibalah \'Amir bin al-Tufail,', 'order' => 31],
            ['start_time' => 174.56, 'end_time' => 180.24, 'target_text' => 'and Arbad ibn Qays, both plotting to harm the Messenger of Allah, peace be upon him.', 'source_text' => 'bersama Arbad bin Qais, kedua-duanya berniat jahat merancang tipu daya untuk mencederakan Rasulullah ﷺ.', 'order' => 32],
            ['start_time' => 180.88, 'end_time' => 185.52, 'target_text' => 'As \'Amir distracted him in conversation, Arbad reached for his sword,', 'source_text' => 'Ketika \'Amir mengalih perhatian Baginda dengan perbualan, Arbad menghunus tangannya ke arah pedang,', 'order' => 33],
            ['start_time' => 186.16, 'end_time' => 188.88, 'target_text' => 'but his hand froze, the plot failed.', 'source_text' => 'namun tangannya tiba-tiba kaku terkunci, dan rancangan jahat mereka gagal total.', 'order' => 34],
            ['start_time' => 189.44, 'end_time' => 193.44, 'target_text' => 'And as they left the Prophet, peace be upon him, supplicated: O Allah,', 'source_text' => 'Dan tatkala mereka beredar pulang, Nabi ﷺ berdoa: "Ya Allah,', 'order' => 35],
            ['start_time' => 193.44, 'end_time' => 195.6, 'target_text' => 'suffice me against them as You will.', 'source_text' => 'cukuplah Engkau melindungiku daripada kejahatan mereka menurut kehendak-Mu."', 'order' => 36],
            ['start_time' => 196.32, 'end_time' => 201.04, 'target_text' => 'Lightning struck Arbad on the road, and a plague fell upon \'Amir.', 'source_text' => 'Petir halilintar menyambar Arbad di pertengahan jalan, dan wabak penyakit maut menimpa \'Amir.', 'order' => 37],
            ['start_time' => 202.32, 'end_time' => 207.76, 'target_text' => 'From Banu Sa\'d, came a single man, Dimam ibn Tha\'labah, bold and truth-seeking.', 'source_text' => 'Daripada kabilah Banu Sa\'d, datang seorang lelaki bernama Dimam bin Tha\'labah, seorang yang tegas dan pencari kebenaran sejati.', 'order' => 38],
            ['start_time' => 208.4, 'end_time' => 211.84, 'target_text' => 'He tied his camel outside the mosque and asked directly,', 'source_text' => 'Beliau menambat untanya di luar masjid lalu bertanya secara terus-terang,', 'order' => 39],
            ['start_time' => 211.84, 'end_time' => 214.24, 'target_text' => 'which of you is the son of \'Abd al-Muttalib?', 'source_text' => '"Siapakah antara kamu cucu cicit kepada Abdul Muttalib?"', 'order' => 40],
            ['start_time' => 214.88, 'end_time' => 217.12, 'target_text' => 'I am, the Prophet, peace be upon him replied.', 'source_text' => '"Akulah orangnya," jawab Baginda Nabi ﷺ.', 'order' => 41],
            ['start_time' => 217.76, 'end_time' => 223.52, 'target_text' => 'Dimam then swore by Allah and asked one by one about the commandments of faith,', 'source_text' => 'Dimam kemudian bersumpah demi Allah dan bertanyakan satu demi satu tentang ketetapan perintah iman,', 'order' => 42],
            ['start_time' => 223.52, 'end_time' => 228.72, 'target_text' => 'prayer, fasting, Zakah, Hajj, to each of them the Prophet answered truthfully.', 'source_text' => 'solat, puasa, zakat, dan haji; setiap satunya dijawab oleh Nabi ﷺ dengan sejujur-jujurnya.', 'order' => 43],
            ['start_time' => 228.72, 'end_time' => 235.04, 'target_text' => 'Dimam declared, I bear witness that there is no god but Allah and that you are the Messenger of Allah.', 'source_text' => 'Dimam lantas mengisytiharkan: "Aku bersaksi bahawa tiada Tuhan melainkan Allah dan sesungguhnya engkau adalah utusan Allah!"', 'order' => 44],
            ['start_time' => 236.0, 'end_time' => 241.84, 'target_text' => 'Then came the delegation of \'Abd al-Qays, led by Al-Jarud ibn \'Amr,', 'source_text' => 'Kemudian tiba pula rombongan utusan Abdul Qais yang dipimpin oleh Al-Jarud bin \'Amr,', 'order' => 45],
            ['start_time' => 241.84, 'end_time' => 243.44, 'target_text' => 'a Christian who embraced Islam.', 'source_text' => 'seorang tokoh beragama Nasrani yang terbuka hatinya memeluk Islam.', 'order' => 46],
            ['start_time' => 244.4, 'end_time' => 248.56, 'target_text' => 'He asked for guidance on faith and the pillars of worship.', 'source_text' => 'Beliau memohon bimbingan tentang asas-asas keimanan dan rukun-rukun ibadah.', 'order' => 47],
            ['start_time' => 248.56, 'end_time' => 254.08, 'target_text' => 'The Prophet, peace be upon him, instructed them to preserve their faith amid idol worshipers,', 'source_text' => 'Nabi ﷺ memerintahkan mereka agar memelihara iman di tengah-tengah masyarakat penyembah berhala,', 'order' => 48],
            ['start_time' => 254.08, 'end_time' => 256.48, 'target_text' => 'and to forbid wine and usury.', 'source_text' => 'serta mengharamkan arak dan amalan riba.', 'order' => 49],
            ['start_time' => 256.48, 'end_time' => 261.36, 'target_text' => 'They returned as messengers of truth to the eastern tribes of Bahrain.', 'source_text' => 'Mereka pulang sebagai duta kebenaran kepada kabilah-kabilah timur di wilayah Bahrain.', 'order' => 50],
            ['start_time' => 262.32, 'end_time' => 265.2, 'target_text' => 'Among those who came were Banu Hanifah.', 'source_text' => 'Antara mereka yang turut hadir ialah kabilah Banu Hanifah,', 'order' => 51],
            ['start_time' => 266.32, 'end_time' => 269.6, 'target_text' => 'In whose ranks stood Musaylimah, the liar.', 'source_text' => 'yang di dalam barisan mereka berdirinya Musailamah, si pendusta celik.', 'order' => 52],
            ['start_time' => 270.16, 'end_time' => 274.64, 'target_text' => 'He pretended to believe, but envied the Prophet, peace be upon him.', 'source_text' => 'Dia berpura-pura beriman, tetapi menyimpan hasad dengki yang amat mendalam terhadap Nabi ﷺ.', 'order' => 53],
            ['start_time' => 274.72, 'end_time' => 278.24, 'target_text' => 'When he returned to Yamamah, he claimed Prophethood,', 'source_text' => 'Apabila pulang semula ke Yamamah, dia mendakwa dirinya seorang nabi,', 'order' => 54],
            ['start_time' => 278.24, 'end_time' => 284.64, 'target_text' => 'imitating the Qur\'an with false rhymes, his lies spread, until after the Prophet\'s death,', 'source_text' => 'meniru gaya bahasa Al-Quran dengan sajak-sajak palsu; penipuannya tersebar, sehinggalah selepas kewafatan Nabi ﷺ,', 'order' => 55],
            ['start_time' => 284.64, 'end_time' => 287.76, 'target_text' => 'when Musaylimah was destroyed by the believers of Yamamah.', 'source_text' => 'apabila Musailamah akhirnya ditumpaskan oleh orang-orang beriman di bumi Yamamah.', 'order' => 56],
            ['start_time' => 288.72, 'end_time' => 295.52, 'target_text' => 'From Tayy came their chief, Zayd al-Khayl, known for his bravery and noble heart.', 'source_text' => 'Dari kabilah Tayy\' pula datang ketua mereka, Zaid al-Khail, yang terkenal dengan keberanian dan kemuliaan hatinya.', 'order' => 57],
            ['start_time' => 295.52, 'end_time' => 300.56, 'target_text' => 'When he met the Prophet, peace be upon him, he embraced Islam wholeheartedly.', 'source_text' => 'Tatkala beliau bertemu Nabi ﷺ, beliau memeluk Islam dengan sepenuh jiwa raganya.', 'order' => 58],
            ['start_time' => 300.56, 'end_time' => 307.12, 'target_text' => 'The Prophet renamed him Zayd al-Khayr, Zayd of goodness, and granted him land and honor.', 'source_text' => 'Baginda Nabi menukar namanya kepada Zaid al-Khair (Zaid Kebajikan), serta mengurniakan tanah dan penghormatan kepadanya.', 'order' => 59],
            ['start_time' => 307.12, 'end_time' => 312.24, 'target_text' => 'He returned to his people, spreading faith, and the Prophet, peace be upon him said,', 'source_text' => 'Beliau pulang kepada kaumnya menyebarkan seruan iman, dan Nabi ﷺ bersabda,', 'order' => 60],
            ['start_time' => 312.24, 'end_time' => 318.16, 'target_text' => 'if Zayd is saved from the fever of Medina, he will be among the best of men.', 'source_text' => '"Sekiranya Zaid terselamat daripada demam panas Madinah, nescaya dia tergolong dalam kalangan sebaik-baik insan."', 'order' => 61],
            ['start_time' => 318.8, 'end_time' => 323.44, 'target_text' => 'He passed away on his journey home, his name forever remembered with virtue.', 'source_text' => 'Beliau menghembuskan nafas terakhir dalam perjalanan pulangnya, namun namanya kekal harum dikenang dengan segala kebajikan.', 'order' => 62],
            ['start_time' => 323.76, 'end_time' => 333.28, 'target_text' => 'The noble \'Adi, son of the generous Hatim al-Ta\'i, fled north when the Muslims approached.', 'source_text' => 'Tokoh mulia \'Adi, putera kepada dermawan masyhur Hatim al-Ta\'i, melarikan diri ke utara tatkala tentera Islam menghampiri.', 'order' => 63],
            ['start_time' => 334.8, 'end_time' => 339.52, 'target_text' => 'But his sister was taken to Medina and freed by the Prophet, peace be upon him.', 'source_text' => 'Namun saudara perempuannya dibawa ke Madinah lalu dibebaskan dengan ihsan oleh Baginda Nabi ﷺ.', 'order' => 64],
            ['start_time' => 340.16, 'end_time' => 344.0, 'target_text' => 'She returned and told him, this man is truly a prophet.', 'source_text' => 'Dia pulang kepada \'Adi dan berkata kepadanya: "Sesungguhnya lelaki ini benar-benar seorang Nabi utusan Allah."', 'order' => 65],
            ['start_time' => 344.88, 'end_time' => 348.88, 'target_text' => '\'Adi traveled to Medina and found the Prophet, peace be upon him,', 'source_text' => '\'Adi pun bermusafir ke Madinah lalu mendapati Nabi ﷺ,', 'order' => 66],
            ['start_time' => 348.88, 'end_time' => 354.16, 'target_text' => 'sitting humbly amongst his companions. The Messenger invited him to faith and said:', 'source_text' => 'sedang duduk dengan penuh rendah diri bersama para sahabatnya. Baginda mengajak beliau kepada keimanan seraya bersabda:', 'order' => 67],
            ['start_time' => 354.16, 'end_time' => 360.4, 'target_text' => 'perhaps you withhold because you see the poverty of the believers. Soon a time will come,', 'source_text' => '"Mungkin engkau enggan menerima Islam kerana melihat kemiskinan hidup orang-orang beriman. Kelak akan tiba suatu zaman,', 'order' => 68],
            ['start_time' => 360.4, 'end_time' => 364.4, 'target_text' => 'when wealth will overflow so that no one will accept charity.', 'source_text' => 'apabila harta kekayaan melimpah-ruah sehinggakan tiada seorang pun yang mahu menerima sedekah."', 'order' => 69],
            ['start_time' => 365.2, 'end_time' => 373.04, 'target_text' => '\'Adi later testified, two of his prophecies have come true, and the third will surely come.', 'source_text' => '\'Adi kelak bersaksi: "Dua daripada tanda kenabian Baginda telah menjadi kenyataan, dan tanda yang ketiga pasti akan berlaku."', 'order' => 70],
            ['start_time' => 374.0, 'end_time' => 379.68, 'target_text' => 'From the tribes of Murad came Farwah ibn Musayk, a former chieftain of Kindah.', 'source_text' => 'Daripada kabilah Murad, datang Farwah bin Musaik, mantan pembesar kabilah Kindah.', 'order' => 71],
            ['start_time' => 379.68, 'end_time' => 383.92, 'target_text' => 'He accepted Islam and was appointed by the Prophet, peace be upon him,', 'source_text' => 'Beliau menerima Islam lalu dilantik oleh Baginda Nabi ﷺ', 'order' => 72],
            ['start_time' => 383.92, 'end_time' => 387.92, 'target_text' => 'to collect charity from his people and their neighbours in Yemen.', 'source_text' => 'untuk mengutip zakat daripada kaumnya serta para jiran tetangga mereka di Yaman.', 'order' => 73],
            ['start_time' => 387.92, 'end_time' => 394.4, 'target_text' => 'Then came \'Amr ibn Ma\'dikarib, a brave but proud warrior of Zubayd.', 'source_text' => 'Kemudian tiba pula \'Amr bin Ma\'dikarib, seorang pahlawan yang gagah berani namun berbangga diri dari kabilah Zubaid.', 'order' => 74],
            ['start_time' => 394.4, 'end_time' => 400.48, 'target_text' => 'He had first refused the Prophet\'s call, but his heart later softened and he embraced Islam.', 'source_text' => 'Pada mulanya beliau menolak seruan Nabi, namun hatinya kemudiannya lembut terkesan lalu beliau memeluk Islam.', 'order' => 75],
            ['start_time' => 400.64, 'end_time' => 406.32, 'target_text' => 'Finally came Al-Ash\'ath ibn Qays, with 80 horsemen of Kindah.', 'source_text' => 'Akhir sekali tiba Al-Ash\'ath bin Qais, bersama 80 orang penunggang kuda terbilang dari kabilah Kindah.', 'order' => 76],
            ['start_time' => 407.04, 'end_time' => 412.88, 'target_text' => 'They had once ruled as kings, but now stood before the Prophet of Allah, peace be upon him,', 'source_text' => 'Dahulunya mereka memerintah laksana raja-raja, namun kini berdiri di hadapan Rasulullah ﷺ,', 'order' => 77],
            ['start_time' => 412.88, 'end_time' => 418.96, 'target_text' => 'humbled and submitting. By the end of the year, all Arabia had heard the message.', 'source_text' => 'dalam keadaan penuh tunduk patuh dan menyerah diri. Menjelang penghujung tahun itu, seluruh Semenanjung Arab telah mendengar seruan risalah Islam.', 'order' => 78],
            ['start_time' => 419.68, 'end_time' => 424.8, 'target_text' => 'Tribes that once fought each other, now stood shoulder to shoulder in prayer.', 'source_text' => 'Kabilah-kabilah yang dahulunya saling berperang bermusuhan, kini berdiri bahu-membahu dalam satu saf solat.', 'order' => 79],
            ['start_time' => 424.8, 'end_time' => 428.16, 'target_text' => 'The final mission was complete, as Allah had promised.', 'source_text' => 'Misi terakhir Baginda telah pun terlaksana sempurna, sebagaimana yang telah dijanjikan oleh Allah.', 'order' => 80],
            ['start_time' => 429.2, 'end_time' => 433.36, 'target_text' => 'And you see the people entering the religion of Allah in crowds.', 'source_text' => 'Dan engkau melihat manusia berduyun-duyun masuk ke dalam agama Allah.', 'order' => 81],
            ['start_time' => 434.72, 'end_time' => 440.56, 'target_text' => 'And so the message of Islam spread, not by force, but by truth, the city that once', 'source_text' => 'Maka dengan itulah risalah Islam tersebar luas, bukan dengan mata pedang, sebaliknya melalui kebenaran; kota yang dahulunya', 'order' => 82],
            ['start_time' => 440.56, 'end_time' => 444.88, 'target_text' => 'sheltered a small group of believers, now welcomed nations.', 'source_text' => 'hanya menaungi sekelompok kecil orang beriman, kini menyambut kedatangan bangsa-bangsa.', 'order' => 83],
            ['start_time' => 446.56, 'end_time' => 452.16, 'target_text' => 'In the next episode insha\'Allah, we stand beside the Messenger, peace be upon him on the day of', 'source_text' => 'Dalam episod seterusnya insya-Allah, kita akan berdiri bersama Rasulullah ﷺ pada hari', 'order' => 84],
            ['start_time' => 452.16, 'end_time' => 465.12, 'target_text' => '\'Arafah, where he delivered words to guide this Ummah until the last day, sallallahu \'ala Muhammad.', 'source_text' => '\'Arafah, di mana Baginda menyampaikan pesanan abadi bagi membimbing umat ini hingga ke hari kiamat. Selawat dan salam ke atas junjungan Muhammad ﷺ.', 'order' => 85],
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
