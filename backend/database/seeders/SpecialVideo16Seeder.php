<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo16Seeder extends Seeder
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

        // Special Bilingual Religious Video #16 (Siri 1 Ep.11): The Night of Ascension | Life of the Final Messenger ﷺ | Ep.11 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'EiuTxK2MbAo'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Night of Ascension | Life of the Final Messenger ﷺ | Ep.11 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/EiuTxK2MbAo/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 16,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.08, 'end_time' => 6.959, 'target_text' => 'The prophet peace be upon him journeyed through the night sky until he reached Alud, the city of', 'source_text' => 'Nabi ﷺ telah diperjalankan merentasi kegelapan malam sehingga baginda tiba di Baitul Maqdis (Al-Quds), kota para', 'order' => 1],
            ['start_time' => 6.96, 'end_time' => 18.239, 'target_text' => 'prophets. From there he ascended through the seven heavens. In each of them a prophet welcomed him.', 'source_text' => 'nabi. Dari sanalah baginda diangkat naik menembusi tujuh petala langit. Di setiap lapisan langit, seorang nabi menyambut kedatangan baginda.', 'order' => 2],
            ['start_time' => 18.24, 'end_time' => 24.319, 'target_text' => 'My beloved brothers and sisters, tonight we step into a moment unlike any other in human', 'source_text' => 'Saudara-saudariku yang dikasihi, malam ini kita melangkah ke suatu detik yang tiada tandingannya dalam sejarah umat', 'order' => 3],
            ['start_time' => 24.32, 'end_time' => 31.039, 'target_text' => 'history. A moment when the veil between the heavens and the earth opened. A moment when', 'source_text' => 'manusia. Suatu detik ketika hijab pemisah antara langit dan bumi disingkapkan. Suatu detik ketika', 'order' => 4],
            ['start_time' => 31.04, 'end_time' => 37.839, 'target_text' => 'sorrow was lifted with divine nearness. A moment when the heart of Muhammad peace be upon him was', 'source_text' => 'kesedihan diangkat dengan kehampiran Ilahi. Suatu detik ketika sanubari Nabi Muhammad ﷺ', 'order' => 5],
            ['start_time' => 37.84, 'end_time' => 44.959, 'target_text' => 'taken beyond time, beyond space, beyond the boundaries of this world. Before this night,', 'source_text' => 'dibawa melangkaui dimensi masa, melangkaui ruang, dan melepasi batas alam fana ini. Sebelum malam yang agung ini,', 'order' => 6],
            ['start_time' => 44.96, 'end_time' => 50.719, 'target_text' => 'the prophet peace be upon him had endured loss upon loss. The passing of Khadijah,', 'source_text' => 'Nabi ﷺ telah menempuh deretan ujian kehilangan demi kehilangan. Pemergian Sayyidatina Khadijah,', 'order' => 7],
            ['start_time' => 50.72, 'end_time' => 56.959, 'target_text' => 'may peace be upon her, the heart that sheltered him. The passing of Abu Talib,', 'source_text' => 'semoga kesejahteraan ke atasnya, insan yang menjadi tempat baginda berteduh menenangkan hati. Pemergian Abu Talib,', 'order' => 8],
            ['start_time' => 56.96, 'end_time' => 64.719, 'target_text' => 'the protector who stood by him, and the pain of Tif where stones met compassion. Pain had', 'source_text' => 'bapa saudara pelindung yang sentiasa setia membela baginda, serta keperitan peristiwa di Taif tatkala lemparan batu disambut dengan belas kasihan. Kesakitan telah', 'order' => 9],
            ['start_time' => 64.72, 'end_time' => 70.559, 'target_text' => 'reached its peak. But when the heart of a prophet is tested, Allah responds with', 'source_text' => 'mencapai kemuncaknya. Namun apabila sanubari seorang nabi diuji sebegitu hebat, Allah membalasnya dengan', 'order' => 10],
            ['start_time' => 70.56, 'end_time' => 77.359, 'target_text' => 'mercy beyond imagination. Tonight, we are not just telling a story. We are stepping into the', 'source_text' => 'rahmat yang melangkaui batas khayalan. Malam ini, kita bukan sekadar menyingkap sebuah penceritaan. Kita sedang melangkah masuk ke dalam', 'order' => 11],
            ['start_time' => 77.36, 'end_time' => 85.199, 'target_text' => 'night. The heavens welcomed the beloved peace be upon him. So come with me. Let your hearts', 'source_text' => 'malam itu. Seluruh penghuni langit menyambut kekasih Allah ﷺ. Ayuh ikutilah saya. Biarkan sanubari kalian', 'order' => 12],
            ['start_time' => 85.2, 'end_time' => 101.04, 'target_text' => 'soften. Let your spirit rise. For we are about to witness a journey no human eye has ever seen.', 'source_text' => 'menjadi lembut. Biarkan jiwa kalian bangkit merasainya. Kerana kita bakal menyaksikan sebuah perjalanan agung yang tidak pernah disaksikan oleh mata manusia.', 'order' => 13],
            ['start_time' => 107.76, 'end_time' => 112.799, 'target_text' => 'The year was heavy with loss. Khadijah, may Allah be pleased with her,', 'source_text' => 'Tahun itu sarat dengan kedukaan dan kehilangan. Sayyidatina Khadijah radiallahu \'anha,', 'order' => 14],
            ['start_time' => 112.8, 'end_time' => 120.559, 'target_text' => 'the prophet\'s beloved wife, his first believer, his companion in every trial,', 'source_text' => 'isteri tercinta Nabi ﷺ, insan pertama yang beriman, dan teman setia baginda dalam setiap ujian getir,', 'order' => 15],
            ['start_time' => 120.56, 'end_time' => 126.879, 'target_text' => 'had returned to her Lord. Not long after, Abu Talib, his uncle and protector,', 'source_text' => 'telah kembali ke pangkuan Tuhannya. Tidak lama selepas itu, Abu Talib, bapa saudara merangkap pelindungnya,', 'order' => 16],
            ['start_time' => 126.88, 'end_time' => 134.479, 'target_text' => 'also passed away. Makkah once merely harsh now turned hostile. Stones struck', 'source_text' => 'turut menghembuskan nafas terakhir. Kota Mekah yang dahulunya hanya kasar, kini bertukar menjadi amat memusuhi. Lemparan batu menghujani', 'order' => 17],
            ['start_time' => 134.48, 'end_time' => 140.879, 'target_text' => 'his blessed head. Dust was thrown upon his shoulders. Yet his heart remained patient,', 'source_text' => 'kepala baginda yang mulia. Debu dan kotoran dihamburkan ke atas bahu baginda. Namun sanubari baginda tetap teguh bersabar,', 'order' => 18],
            ['start_time' => 140.88, 'end_time' => 155.279, 'target_text' => 'his eyes lifted to the sky in remembrance. These were the days the Quran described.', 'source_text' => 'pandangannya mendongak ke langit bermunajat mengingati Allah. Inilah hari-hari getir yang diabadikan oleh Al-Quran:', 'order' => 19],
            ['start_time' => 155.28, 'end_time' => 159.999, 'target_text' => 'Proclaim what you are commanded and turn away from the polytheists. Indeed,', 'source_text' => '"Sampaikanlah secara terang-terangan apa yang diperintahkan kepadamu dan berpalinglah daripada orang musyrik. Sesungguhnya', 'order' => 20],
            ['start_time' => 160.0, 'end_time' => 165.839, 'target_text' => 'we are sufficient for you against those who mock. Seeking hearts that would listen,', 'source_text' => 'Kami memelihara kamu daripada kejahatan orang yang memperolok-olokkanmu." Demi mencari jiwa-jiwa yang sudi mendengar,', 'order' => 21],
            ['start_time' => 165.84, 'end_time' => 171.439, 'target_text' => 'the prophet peace be upon him left Makkah for the city of T, hoping its people might receive', 'source_text' => 'Nabi ﷺ berangkat meninggalkan Mekah menuju ke kota Taif, mengharapkan penduduknya menyambut', 'order' => 22],
            ['start_time' => 171.44, 'end_time' => 177.439, 'target_text' => 'his message with compassion. But they mocked him, sent their slaves and children to chase', 'source_text' => 'seruan dakwahnya dengan belas ihsan. Namun mereka menghina baginda, menghasut hamba-hamba dan kanak-kanak untuk mengejar', 'order' => 23],
            ['start_time' => 177.44, 'end_time' => 184.559, 'target_text' => 'him from the streets. Stones cut his feet until blood filled his sandals. Exhausted,', 'source_text' => 'dan mengusir baginda dari jalanan. Balingan batu melukakan kaki baginda sehingga darah membasahi capalnya. Dalam keadaan keletihan yang amat,', 'order' => 24],
            ['start_time' => 184.56, 'end_time' => 197.12, 'target_text' => 'he sought refuge beneath the shade of a wall and raised his hands to the heavens.', 'source_text' => 'baginda berteduh di bawah naungan sebatang tembok kebun lalu menadah tangannya ke langit.', 'order' => 25],
            ['start_time' => 204.4, 'end_time' => 211.199, 'target_text' => 'Oh Allah, to you I complain of my weakness, my lack of means, and my humiliation before', 'source_text' => '"Ya Allah, kepada-Mu aku mengadukan kelemahanku, kekurangan upayaku, dan kehinaanku di hadapan', 'order' => 26],
            ['start_time' => 211.2, 'end_time' => 217.439, 'target_text' => 'people. You are the most merciful of those who show mercy. You are the Lord of the oppressed.', 'source_text' => 'pandangan manusia. Engkaulah Yang Maha Pengasih dari segala yang mengasihani. Engkaulah Tuhan sekalian orang yang tertindas,', 'order' => 27],
            ['start_time' => 217.44, 'end_time' => 225.919, 'target_text' => 'You are my Lord. To you I submit until you are pleased. At that moment, unseen mercy descended.', 'source_text' => 'dan Engkaulah Tuhanku. Kepada-Mu aku menyerahkan diri sepenuhnya sehingga Engkau redha." Pada saat itulah, rahmat yang tidak terlihat telah turun.', 'order' => 28],
            ['start_time' => 225.92, 'end_time' => 233.199, 'target_text' => 'A cloud shaded him. And from it came Jirel, may peace be upon him, calling, "Oh Muhammad,', 'source_text' => 'Sekepal awan menaungi baginda. Dan dari celahnya muncullah Malaikat Jibril \'alaihissalam menyeru: "Wahai Muhammad,', 'order' => 29],
            ['start_time' => 233.2, 'end_time' => 239.839, 'target_text' => 'Allah has heard what your people have said to you and how they have rejected you. Here is the angel', 'source_text' => 'Allah telah mendengar apa yang dikatakan oleh kaummu kepadamu dan bagaimana mereka menolakmu. Bersamaku ini adalah malaikat', 'order' => 30],
            ['start_time' => 239.84, 'end_time' => 245.839, 'target_text' => 'of the mountains. Command him and he will crush them." But the prophet peace be upon him said,', 'source_text' => 'penjaga gunung-ganang. Perintahkanlah dia, nescaya dia akan menghempapkan gunung ke atas mereka." Namun Nabi ﷺ menjawab:', 'order' => 31],
            ['start_time' => 245.84, 'end_time' => 251.519, 'target_text' => '"No, I hope that from their descendants will come those who worship Allah alone."', 'source_text' => '"Jangan, bahkan aku berharap agar dari keturunan mereka kelak lahir mereka yang menyembah Allah semata-mata."', 'order' => 32],
            ['start_time' => 251.52, 'end_time' => 258.479, 'target_text' => 'As he lay near the Cabba, the heavens opened with a light unseen before. Giil awoke him and said,', 'source_text' => 'Tatkala baginda berbaring di sisi Kaabah, pintu-pintu langit terbuka dengan cahaya yang tidak pernah disaksikan sebelumnya. Jibril mengejutkan baginda seraya berkata:', 'order' => 33],
            ['start_time' => 258.48, 'end_time' => 266.239, 'target_text' => '"Oh Muhammad, arise." And so began the greatest of journeys,', 'source_text' => '"Wahai Muhammad, bangkitlah." Maka bermulalah pengembaraan yang teragung,', 'order' => 34],
            ['start_time' => 266.24, 'end_time' => 283.679, 'target_text' => 'the night journey and the ascension. The Quran records it. Subhan Allah.', 'source_text' => 'peristiwa Israk dan Mikraj. Al-Quran telah merakamkannya, Subhanallah:', 'order' => 35],
            ['start_time' => 283.68, 'end_time' => 290.079, 'target_text' => 'Glory be to him who took his servant by night from the sacred mosque to the farthest mosque', 'source_text' => '"Maha Suci Allah yang telah memperjalankan hamba-Nya pada suatu malam dari Masjidil Haram ke Masjidil Aqsa', 'order' => 36],
            ['start_time' => 290.08, 'end_time' => 296.399, 'target_text' => 'whose surroundings we have blessed to show him of our signs. Indeed he is all hearing', 'source_text' => 'yang telah Kami berkati sekelilingnya, untuk Kami perlihatkan kepadanya sebahagian daripada tanda-tanda kebesaran Kami. Sesungguhnya Dia Maha Mendengar', 'order' => 37],
            ['start_time' => 296.4, 'end_time' => 303.439, 'target_text' => 'the allseeing. Riding upon Al- Bak, a creature white and radiant, swifter than lightning,', 'source_text' => 'lagi Maha Melihat." Mengenderai Buraq, makhluk putih yang bersinar indah, meluncur lebih pantas daripada kilat,', 'order' => 38],
            ['start_time' => 303.44, 'end_time' => 309.439, 'target_text' => 'the prophet peace be upon him, journeyied through the night sky until he reached Alud,', 'source_text' => 'Nabi ﷺ merentas kegelapan langit malam sehingga tiba di Baitul Maqdis,', 'order' => 39],
            ['start_time' => 309.44, 'end_time' => 318.879, 'target_text' => 'the city of prophets. There he led all of them, Adam, N, Ibraim, Musa, Isa, may peace be upon them', 'source_text' => 'kota para nabi. Di sana baginda mengimami solat kesemua nabi: Adam, Nuh, Ibrahim, Musa, Isa, \'alaihimussalam', 'order' => 40],
            ['start_time' => 318.88, 'end_time' => 328.799, 'target_text' => 'all, in prayer. Time itself stood still as every messenger bore witness to the seal of prophethood.', 'source_text' => 'sekeliannya. Waktu seakan terhenti tatkala setiap rasul menjadi saksi kepada penutup sekalian para nabi.', 'order' => 41],
            ['start_time' => 328.8, 'end_time' => 335.519, 'target_text' => 'From there he ascended through the seven heavens. In each of them a prophet welcomed him. Adam,', 'source_text' => 'Dari situ baginda diangkat menembusi tujuh petala langit. Di setiap lapisan langit, seorang nabi menyambut kedatangannya: Nabi Adam,', 'order' => 42],
            ['start_time' => 335.52, 'end_time' => 343.279, 'target_text' => 'then Issa and Yaha, then Ysef, Idris, Harun, and Musa, and finally Ibraim, may peace be upon', 'source_text' => 'kemudian Nabi Isa dan Nabi Yahya, disusuli Nabi Yusuf, Nabi Idris, Nabi Harun, dan Nabi Musa, dan akhirnya Nabi Ibrahim \'alaihimus-', 'order' => 43],
            ['start_time' => 343.28, 'end_time' => 350.639, 'target_text' => 'them all, seated with his back to Alb Mahm, the house visited by 70,000 angels daily,', 'source_text' => 'salam, yang duduk bersandar di Baitul Ma\'mur, baitullah di langit yang diziarahi oleh 70,000 malaikat setiap hari', 'order' => 44],
            ['start_time' => 350.64, 'end_time' => 358.879, 'target_text' => 'never to return. Beyond them all stood the Sidra Maha, the tree of the utmost boundary', 'source_text' => 'dan tidak pernah berpatah kembali. Melepasi kesemuanya berdirilah Sidratul Muntaha, pohon di batas tertinggi yang mutlak', 'order' => 45],
            ['start_time' => 358.88, 'end_time' => 366.559, 'target_text' => 'where no creation may pass. There the light of the divine filled the horizon and the veil lifted', 'source_text' => 'di mana tiada makhluk yang boleh melintasinya. Di sanalah nur keagungan Ilahi memenuhi segenap ufuk dan hijab tersingkap', 'order' => 46],
            ['start_time' => 366.56, 'end_time' => 373.199, 'target_text' => 'for the beloved peace be upon him. 50 prayers were prescribed but through Musa may peace be', 'source_text' => 'buat kekasih-Nya ﷺ. Sebanyak 50 waktu solat telah difardukan, namun atas nasihat Nabi Musa \'alaihissalam,', 'order' => 47],
            ['start_time' => 373.2, 'end_time' => 382.079, 'target_text' => 'upon him reduced to five. Yet each carrying the reward of 50, it was the gift of mercy,', 'source_text' => 'ia dikurangkan menjadi lima waktu. Namun setiap satunya membawa ganjaran pahala 50 waktu; itulah hadiah rahmat Ilahi,', 'order' => 48],
            ['start_time' => 382.08, 'end_time' => 390.4, 'target_text' => 'a covenant between Allah and his servants that would remain until the end of time. The Quran says', 'source_text' => 'suatu perjanjian suci antara Allah dan para hamba-Nya yang kekal hingga ke akhir zaman. Firman Allah di dalam Al-Quran:', 'order' => 49],
            ['start_time' => 395.04, 'end_time' => 401.279, 'target_text' => 'And we did not make the vision which we showed you except as a trial for the people. When the', 'source_text' => '"Dan tiadalah Kami jadikan penglihatan yang telah Kami perlihatkan kepadamu melainkan sebagai ujian bagi manusia." Apabila', 'order' => 50],
            ['start_time' => 401.28, 'end_time' => 406.319, 'target_text' => 'morning came, the prophet peace be upon him told the people of his journey. Qurayshes laughed in', 'source_text' => 'waktu pagi menjelma, Nabi ﷺ mengkhabarkan kepada orang ramai tentang perjalanan agungnya. Kaum Quraisy ketawa mengejek penuh', 'order' => 51],
            ['start_time' => 406.32, 'end_time' => 413.439, 'target_text' => 'disbelief. A journey to Jerusalem and back in the single night. But when he described', 'source_text' => 'kekufuran dan keraguan: sebuah perjalanan ke Baitul Maqdis dan kembali semula hanya dalam satu malam! Namun tatkala baginda memperincikan', 'order' => 52],
            ['start_time' => 413.44, 'end_time' => 420.559, 'target_text' => 'the details of the city, its doors, its windows, its pillars, those who had seen it fell silent,', 'source_text' => 'setiap butiran kota itu—pintu-pintunya, tingkap-tingkapnya, tiang-tiangnya—mereka yang pernah ke sana terdiam membisu,', 'order' => 53],
            ['start_time' => 420.56, 'end_time' => 427.119, 'target_text' => 'still they mocked. Yet among them, Abu Bakr, may Allah be pleased with him, stood firm and said,', 'source_text' => 'namun sebahagian besar tetap mencemuh. Tetapi di antara mereka, Abu Bakar As-Siddiq radiallahu \'anhu berdiri teguh dan berkata:', 'order' => 54],
            ['start_time' => 427.12, 'end_time' => 436.799, 'target_text' => '"If he said it, he has spoken the truth." And from that day, he was called, the truthful one. Thus', 'source_text' => '"Jika sekiranya baginda yang mengatakannya, maka sesungguhnya baginda telah berkata benar." Dan sejak hari itu, beliau digelar As-Siddiq (yang membenarkan kebenaran). Demikianlah,', 'order' => 55],
            ['start_time' => 436.8, 'end_time' => 442.959, 'target_text' => 'from the depths of sorrow Allah raised his prophet peace be upon him to the highest of heavens to', 'source_text' => 'dari jurang kesedihan yang amat dalam, Allah mengangkat darjat nabi-Nya ﷺ ke martabat langit tertinggi bagi', 'order' => 56],
            ['start_time' => 442.96, 'end_time' => 454.319, 'target_text' => 'show him that after hardship comes ease. The Quran would later remind him and all who believe.', 'source_text' => 'memperlihatkan kepadanya bahawa sesudah kesulitan pasti ada kemudahan. Al-Quran kelak memperingatkan baginda dan sekalian orang beriman:', 'order' => 57],
            ['start_time' => 454.32, 'end_time' => 460.799, 'target_text' => 'So surely with hardship comes ease. Indeed with hardship comes ease. He', 'source_text' => '"Maka sesungguhnya bersama kesulitan ada kemudahan. Sesungguhnya bersama kesulitan ada kemudahan." Baginda', 'order' => 58],
            ['start_time' => 460.8, 'end_time' => 465.68, 'target_text' => 'returned to Mecca that night, his heart filled with light. The heavens had opened.', 'source_text' => 'kembali ke kota Mekah pada malam tersebut dengan sanubari yang dipenuhi nur keimanan. Pintu-pintu langit telah terbuka.', 'order' => 59],
            ['start_time' => 466.4, 'end_time' => 472.079, 'target_text' => 'The command had been given. The prophet peace be upon him was now ready to carry the message', 'source_text' => 'Perintah agung telah pun diamanahkan. Kini Nabi ﷺ telah bersedia untuk membawa risalah suci ini', 'order' => 60],
            ['start_time' => 472.08, 'end_time' => 481.039, 'target_text' => 'beyond Arabia. The night that began in sorrow had ended in ascension. And the dawn of victory was', 'source_text' => 'melangkaui batas Semenanjung Tanah Arab. Malam yang bermula dengan kepiluan telah berakhir dengan mikraj kemuliaan. Dan fajar kemenangan kian', 'order' => 61],
            ['start_time' => 481.04, 'end_time' => 489.279, 'target_text' => 'near. And so the messenger of Allah peace be upon him returned from the heavens carrying a gift for', 'source_text' => 'menjelang tiba. Maka pulanglah Rasulullah ﷺ dari alam malakut membawa hadiah teragung buat', 'order' => 62],
            ['start_time' => 489.28, 'end_time' => 498.719, 'target_text' => 'every believer until the end of time. prayer not as a ritual but as a meeting, a moment of', 'source_text' => 'setiap orang yang beriman hingga ke akhir zaman: solat—bukan sekadar ritual, tetapi pertemuan suci, saat', 'order' => 63],
            ['start_time' => 498.72, 'end_time' => 507.119, 'target_text' => 'nearness, a doorway between earth and the divine. The night of ascension was not just a miracle.', 'source_text' => 'kehampiran rohani, dan jambatan penghubung antara hamba di bumi dengan Pencipta Yang Maha Esa. Malam mikraj bukan sekadar mukjizat.', 'order' => 64],
            ['start_time' => 507.12, 'end_time' => 517.039, 'target_text' => 'It was a reminder that when the world wounds the heart, Allah lifts it. When support fades, Allah', 'source_text' => 'Ia adalah peringatan abadi bahawa tatkala dunia melukai hatimu, Allah yang akan mengangkatnya. Tatkala sokongan manusia lenyap, Allah', 'order' => 65],
            ['start_time' => 517.04, 'end_time' => 526.879, 'target_text' => 'holds you. When the path feels heavy, Allah opens the sky. And though many in Makkah mocked, there', 'source_text' => 'yang akan memeliharamu. Tatkala liku perjalanan terasa berat, Allah membukakan pintu langit buatmu. Dan biarpun ramai di Mekah mengejek, masih ada', 'order' => 66],
            ['start_time' => 526.88, 'end_time' => 535.439, 'target_text' => 'were hearts elsewhere. Soft hearts, open hearts, ready to believe. In the next episode, inshallah,', 'source_text' => 'jiwa-jiwa di tempat lain—jiwa yang lembut, sanubari yang terbuka luas, bersedia untuk beriman. Dalam episod seterusnya, insya-Allah,', 'order' => 67],
            ['start_time' => 535.44, 'end_time' => 546.08, 'target_text' => 'we witness the seeds of a new beginning. A city prepared to embrace the light. Sah Muhammad.', 'source_text' => 'kita bakal menyaksikan benih-benih permulaan era baharu: sebuah kota yang dipersiapkan untuk menyambut sinar hidayah. Selawat ke atas Nabi Muhammad ﷺ.', 'order' => 68],
        ];

        foreach (array_chunk($subtitles, 100) as $chunk) {
            $records = [];
            foreach ($chunk as $item) {
                $records[] = [
                    'id'          => (string) Str::uuid(),
                    'video_id'    => $video->id,
                    'start_time'  => $item['start_time'],
                    'end_time'    => $item['end_time'],
                    'target_text' => $item['target_text'],
                    'source_text' => $item['source_text'],
                    'order'       => $item['order'],
                    'created_at'  => now(),
                    'updated_at'  => now(),
                ];
            }
            DB::table('video_subtitles')->insert($records);
        }
    }
}
