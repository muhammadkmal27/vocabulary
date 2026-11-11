<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo10Seeder extends Seeder
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

        // Special Bilingual Religious Video #10 (Siri 1 Ep.5): The Silence Before Revelation | Life of the Final Messenger ﷺ | Ep.5 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'xUqhH8gHdJw'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Silence Before Revelation | Life of the Final Messenger ﷺ | Ep.5 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/xUqhH8gHdJw/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 10,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.16, 'end_time' => 4.48, 'target_text' => 'The valleys of Mecca were filled with voices that called upon', 'source_text' => 'Lembah-lembah di Mekah bergema dengan suara-suara yang menyeru dan memuja', 'order' => 1],
            ['start_time' => 4.48, 'end_time' => 11.36, 'target_text' => 'idols of stone and wood. The guidance of Ibraim, may peace be upon him, was forgotten. Empires that', 'source_text' => 'berhala-berhala daripada batu dan kayu. Petunjuk ajaran Nabi Ibrahim \'alaihissalam telah pun dilupakan. Empayar-empayar yang', 'order' => 2],
            ['start_time' => 11.36, 'end_time' => 21.52, 'target_text' => 'had ruled for centuries were crumbling. The voice of truth was ready to be heard again.', 'source_text' => 'telah berkuasa selama berabad-abad mulai runtuh berantakan. Suara kebenaran kini bersiap sedia untuk diperdengarkan kembali.', 'order' => 3],
            ['start_time' => 21.52, 'end_time' => 27.92, 'target_text' => 'My beloved brothers and sisters, today we continue our journey through the life of Muhammad peace be', 'source_text' => 'Saudara-saudariku yang dikasihi, hari ini kita meneruskan penjelajahan menelusuri sirah kehidupan Nabi Muhammad ﷺ.', 'order' => 4],
            ['start_time' => 27.92, 'end_time' => 37.36, 'target_text' => 'upon him. A journey that unfolds with tenderness, patience, and divine precision. Before Revelation,', 'source_text' => 'Suatu perjalanan yang tersingkap dengan penuh kelembutan, kesabaran, dan ketetapan Ilahi yang begitu jitu. Sebelum turunnya wahyu,', 'order' => 5],
            ['start_time' => 37.36, 'end_time' => 44.64, 'target_text' => 'before the first word echoed through the cave, before the world would awaken to the Quran,', 'source_text' => 'sebelum kalimah pertama bergema di dalam gua, sebelum dunia tersedar bangkit menyambut nur Al-Quran,', 'order' => 6],
            ['start_time' => 44.64, 'end_time' => 51.52, 'target_text' => 'there was silence. Not the silence of emptiness, but the silence of preparation. The world had', 'source_text' => 'berlakulah satu keheningan. Bukan keheningan akibat kekosongan, sebaliknya keheningan persiapan jiwa. Dunia ketika itu telah', 'order' => 7],
            ['start_time' => 51.52, 'end_time' => 58.48, 'target_text' => 'strayed far from the message of Ibraim, may peace be upon him. Idols surrounded the Kaa.', 'source_text' => 'tersesat begitu jauh daripada risalah Nabi Ibrahim \'alaihissalam. Patung-patung berhala mengepung persekitaran Kaabah.', 'order' => 8],
            ['start_time' => 58.48, 'end_time' => 66.96, 'target_text' => 'Hearts were distant from their creator. Voices called upon storms and the sky remained quiet. Yet', 'source_text' => 'Sanubari manusia kian menjauh daripada Pencipta mereka. Suara-suara meratap memohon kepada ribut, namun langit tetap membisu. Namun begitu,', 'order' => 9],
            ['start_time' => 66.96, 'end_time' => 73.68, 'target_text' => 'within that silence, Allah was preparing a heart. A heart that would soon carry the final message', 'source_text' => 'di sebalik keheningan itu, Allah sedang mempersiapkan sebuah sanubari. Hati mulia yang tidak lama lagi akan menggalas risalah terakhir', 'order' => 10],
            ['start_time' => 73.68, 'end_time' => 82.08, 'target_text' => 'to mankind. A heart that sought truth while the world slept. A heart that climbed the mountain,', 'source_text' => 'buat seluruh umat manusia. Hati yang mendambakan kebenaran tatkala seisi dunia leka dibuai lena. Hati yang mendaki bukit,', 'order' => 11],
            ['start_time' => 82.08, 'end_time' => 90.08, 'target_text' => 'searching for the one who is never absent. Come with me. Let us enter the years just', 'source_text' => 'mencari Dia yang Maha Esa yang tidak pernah sekali pun tiada. Ayuh ikutilah saya. Marilah kita menelusuri tahun-tahun tepat', 'order' => 12],
            ['start_time' => 90.08, 'end_time' => 105.68, 'target_text' => 'before revelation. The years when the whisper of destiny was growing closer and closer.', 'source_text' => 'sebelum turunnya wahyu. Tahun-tahun di mana bisikan takdir Ilahi terasa semakin lama semakin hampir.', 'order' => 13],
            ['start_time' => 113.76, 'end_time' => 120.96, 'target_text' => 'In the years before Revelation, Arabia slept beneath a heavy silence. The valleys of Mecca', 'source_text' => 'Pada tahun-tahun menjelang penurunan wahyu, bumi Semenanjung Tanah Arab lena di bawah keheningan yang mencengkam. Lembah-lembah Mekah', 'order' => 14],
            ['start_time' => 120.96, 'end_time' => 128.48, 'target_text' => 'were filled with voices that called upon idols of stone and wood. Yet the hearts of men were empty.', 'source_text' => 'dipenuhi dengan seruan suara yang memuja berhala batu dan kayu. Namun begitu, sanubari manusia kosong kontang.', 'order' => 15],
            ['start_time' => 128.48, 'end_time' => 135.44, 'target_text' => 'The guidance of Ibraim, may peace be on him, was forgotten. And superstition replaced wisdom.', 'source_text' => 'Petunjuk ajaran Nabi Ibrahim \'alaihissalam kian dilupakan. Amalan khurafat dan tahyul telah menggantikan hikmah kebijaksanaan.', 'order' => 16],
            ['start_time' => 135.44, 'end_time' => 143.2, 'target_text' => 'The Cabba built for the worship of Allah alone had become a house of false gods. 360 statues', 'source_text' => 'Kaabah yang dibina khusus untuk menyembah Allah semata-mata telah dijadikan sarang tuhan-tuhan palsu. Sebanyak 360 patung berhala', 'order' => 17],
            ['start_time' => 143.2, 'end_time' => 150.08, 'target_text' => 'standing where truth once stood. Around it the people circled in ritual, but their souls were', 'source_text' => 'terpacak tegak di tempat di mana kebenaran tauhid pernah bertapak. Di sekelilingnya orang ramai bertawaf dalam upacara adat, namun roh jiwa mereka', 'order' => 18],
            ['start_time' => 150.08, 'end_time' => 159.6, 'target_text' => 'lost in darkness. Still amid the darkness there were hearts that searched for the unseen light.', 'source_text' => 'sesat tenggelam di dalam kegelapan. Namun di tengah kepekatan kegelapan itu, masih ada sanubari yang mencari cahaya yang tidak kelihatan.', 'order' => 19],
            ['start_time' => 159.6, 'end_time' => 165.36, 'target_text' => 'There were those who could no longer bear to bow before what they had carved with their own', 'source_text' => 'Terdapat segolongan insan yang tidak lagi sanggup sujud tunduk menyembah apa yang dipahat dengan tangan mereka sendiri.', 'order' => 20],
            ['start_time' => 165.36, 'end_time' => 174.96, 'target_text' => 'hands. Among them were a few who still whispered prayers to the one above the heavens. Men like Zb', 'source_text' => 'Antara mereka terdapat segelintir yang masih membisikkan doa kepada Tuhan Yang Maha Esa di atas langit. Insan-insan seperti Zaid bin \'Amr', 'order' => 21],
            ['start_time' => 174.96, 'end_time' => 182.8, 'target_text' => 'who refused to eat meat sacrificed to idols and no who studied the scriptures of the past waiting for', 'source_text' => 'yang enggan memakan daging sembelihan berhala, dan Waraqah yang mengkaji kitab-kitab suci terdahulu seraya menantikan', 'order' => 22],
            ['start_time' => 182.8, 'end_time' => 191.6, 'target_text' => 'the final prophet that the book had promised. Each of them felt a truth too heavy for words,', 'source_text' => 'kehadiran nabi terakhir seperti yang dijanjikan kitab. Setiap seorang daripada mereka merasai satu hakikat yang terlalu mendalam untuk diungkapkan dengan kata-kata,', 'order' => 23],
            ['start_time' => 191.6, 'end_time' => 199.28, 'target_text' => 'a certainty. And there was one among them who felt the same stirring but stronger than any', 'source_text' => 'suatu keyakinan yang teguh. Dan di kalangan mereka, ada seorang insan yang merasai gelora yang serupa namun jauh lebih kuat berbanding sesiapa', 'order' => 24],
            ['start_time' => 199.28, 'end_time' => 206.08, 'target_text' => 'other. Muhammad peace be upon him. He lived among his people but was not one of them. He', 'source_text' => 'pun yang lain. Iaitu Muhammad ﷺ. Baginda hidup di tengah-tengah kaumnya tetapi tidak pernah terjerumus mengikut cara hidup mereka. Baginda', 'order' => 25],
            ['start_time' => 206.08, 'end_time' => 212.64, 'target_text' => 'joined their gatherings but never their sins. He listened but his heart was somewhere higher,', 'source_text' => 'menyertai perhimpunan mereka namun tidak sekali-kali menyentuh dosa kemungkaran mereka. Baginda mendengar, namun hatinya tertaut pada darjat yang lebih tinggi,', 'order' => 26],
            ['start_time' => 212.64, 'end_time' => 218.16, 'target_text' => 'somewhere closer to the one who watches unseen. When others drank and gambled,', 'source_text' => 'di suatu ruang yang lebih dekat dengan Dia yang Maha Memerhati tanpa dapat dilihat. Tatkala orang lain mabuk meminum arak dan berjudi,', 'order' => 27],
            ['start_time' => 218.16, 'end_time' => 226.08, 'target_text' => 'he turned away. When they swore by false gods, his lips remained still. His silence carried a depth', 'source_text' => 'baginda memalingkan diri. Apabila mereka bersumpah dengan nama tuhan palsu, bibir baginda kekal diam terkunci. Keheningan baginda membawa keperibadian mendalam', 'order' => 28],
            ['start_time' => 226.08, 'end_time' => 235.52, 'target_text' => 'that made even the arrogant lower their gaze. He was now a husband, a father, a man whose honesty', 'source_text' => 'yang mampu membuatkan mereka yang sombong tunduk memandang ke bawah. Baginda kini seorang suami, seorang bapa, seorang lelaki yang kejujuran', 'order' => 29],
            ['start_time' => 235.52, 'end_time' => 242.96, 'target_text' => 'and gentleness had made him beloved to all. But within him grew a yearning, a need for solitude,', 'source_text' => 'dan kelembutan budi pekertinya menjadikannya amat disayangi oleh sekalian insan. Namun dalam dirinya bercambah satu kerinduan mendalam, satu keperluan untuk berkhalwat (menyendiri),', 'order' => 30],
            ['start_time' => 242.96, 'end_time' => 251.36, 'target_text' => 'for reflection, for nearness to something beyond the noise of Mecca. Sometimes he would walk beyond', 'source_text' => 'untuk bertafakur merenung hakikat, demi kehampiran diri kepada sesuatu yang melangkaui keriuhan kota Mekah. Kadang-kadang baginda berjalan jauh melepasi', 'order' => 31],
            ['start_time' => 251.36, 'end_time' => 260.24, 'target_text' => 'the hills until the city disappeared behind the dunes. There, under the desert sky, the wind', 'source_text' => 'bukit-bukau sehingga kota Mekah lenyap terlindung di sebalik bukit-bukit pasir. Di sana, di bawah naungan langit padang pasir, deruan angin', 'order' => 32],
            ['start_time' => 260.24, 'end_time' => 267.76, 'target_text' => 'would whisper through the sand, as if reciting secrets older than time. The world around him was', 'source_text' => 'berbisik lembut menyusuri pasir, seolah-olah mengalunkan rahsia-rahsia yang lebih purba daripada peredaran zaman. Dunia di sekeliling baginda sedang', 'order' => 33],
            ['start_time' => 267.76, 'end_time' => 275.04, 'target_text' => 'changing. The age of ignorance was reaching its end. The truth that had been veiled for centuries', 'source_text' => 'melalui fasa perubahan. Zaman jahiliah kian menghampiri ke penghujungnya. Kebenaran yang sekian lama terhijab selama berabad-abad', 'order' => 34],
            ['start_time' => 275.04, 'end_time' => 282.96, 'target_text' => 'was drawing near once more. The fortune tellers found their voices faltering. The jin who once', 'source_text' => 'kini semakin mendekat sekali lagi. Suara para tukang tilik nasib kian terketar-ketar kehilangan kata. Golongan jin yang dahulunya', 'order' => 35],
            ['start_time' => 282.96, 'end_time' => 289.6, 'target_text' => 'brought them whispers of the unseen were silenced. The ancient fires of Persia that had burned for', 'source_text' => 'membawakan bisikan perkara ghaib telah pun dibungkam dan dibisukan. Api suci purba Parsi yang membara marak selama', 'order' => 36],
            ['start_time' => 289.6, 'end_time' => 296.64, 'target_text' => 'generations went out. The temples trembled. And in the lands of Rome and Abbiscinia, monks and', 'source_text' => 'turun-temurun tiba-tiba terpadam. Kuil-kuil berhala bergoncang. Dan di tanah jajahan Rom dan Habsyah, para rahib paderi dan', 'order' => 37],
            ['start_time' => 296.64, 'end_time' => 305.92, 'target_text' => 'rabbis spoke in hushed tones about the signs that were appearing. Signs of the final messenger.', 'source_text' => 'pendeta Yahudi berbisik-bisik perlahan berbicara tentang tanda-tanda yang kian menjelma. Tanda-tanda kemunculan pesuruh terakhir.', 'order' => 38],
            ['start_time' => 305.92, 'end_time' => 311.92, 'target_text' => 'There beneath the ceiling of stone and sky. Muhammad peace be upon him would gaze at the', 'source_text' => 'Di sana, di bawah lindungan siling berbatu dan hamparan langit luas. Muhammad ﷺ menatap jauh ke arah', 'order' => 39],
            ['start_time' => 311.92, 'end_time' => 320.08, 'target_text' => 'horizon as dawn brushed the world with light. He spoke no words but his heart spoke endlessly.', 'source_text' => 'kaki langit tatkala cahaya fajar mula menyapu dunia dengan sinaran. Tiada kata yang terucap di bibirnya, namun hatinya bermunajat tanpa henti.', 'order' => 40],
            ['start_time' => 320.08, 'end_time' => 325.76, 'target_text' => 'He would stay for nights at a time lost in reflection. Sometimes his', 'source_text' => 'Baginda bermukim tinggal di sana selama beberapa malam berturut-turut, hanyut dalam renungan tafakur. Kadang-kadang', 'order' => 41],
            ['start_time' => 325.76, 'end_time' => 333.36, 'target_text' => 'gaze would linger on the sun\'s rise and he would feel the truth swelling within him', 'source_text' => 'pandangan baginda tertumpu lama pada terbitnya sang matahari, seraya merasakan kebenaran hakiki melimpah ruah mekar di dalam jiwanya', 'order' => 42],
            ['start_time' => 333.36, 'end_time' => 338.96, 'target_text' => 'that the world was not abandoned. That guidance would soon return the peace of', 'source_text' => 'bahawa dunia ini tidak sekali-kali dibiarkan terbiar. Bahawa petunjuk Ilahi pasti akan kembali menjelma; kedamaian', 'order' => 43],
            ['start_time' => 338.96, 'end_time' => 345.44, 'target_text' => 'the cave wrapped around him like a robe woven from silence. It was in those days', 'source_text' => 'gua itu menyelimuti tubuh baginda bagaikan sehelai jubah yang ditenun rapi daripada keheningan. Pada saat itulah', 'order' => 44],
            ['start_time' => 345.44, 'end_time' => 355.68, 'target_text' => 'that the Quran would later describe the contrast between darkness and the truth.', 'source_text' => 'Al-Quran pada kemudian harinya menggambarkan perbezaan ketara antara kegelapan batil dan cahaya kebenaran hakiki.', 'order' => 45],
            ['start_time' => 355.68, 'end_time' => 362.8, 'target_text' => 'There is no compulsion in religion. The right path has become distinct from error. He knew even', 'source_text' => '"Tidak ada paksaan dalam agama. Sesungguhnya telah jelas nyata jalan yang benar daripada kesesatan." Baginda menginsafi sungguhpun', 'order' => 46],
            ['start_time' => 362.8, 'end_time' => 371.44, 'target_text' => 'without revelation that truth never forces itself. It shines and those with open hearts see it. His', 'source_text' => 'sebelum turunnya wahyu bahawa kebenaran tidak pernah memaksakan dirinya. Ia bersinar terang dan mereka yang berhati celik pasti melihatnya.', 'order' => 47],
            ['start_time' => 371.44, 'end_time' => 378.88, 'target_text' => 'heart was open, vast like the desert itself and ready for what was to come. In the city below,', 'source_text' => 'Sanubari baginda terbuka luas, seluas hamparan padang pasir itu sendiri dan bersiap sedia untuk menghadapi apa yang bakal tiba. Di kota Mekah nun di bawah,', 'order' => 48],
            ['start_time' => 378.88, 'end_time' => 385.52, 'target_text' => 'some mocked the strange stillness that surrounded him. He dreams, they said. He isolates himself,', 'source_text' => 'sebahagian orang memperlekehkan keheningan ganjil yang menyelubungi diri baginda. "Dia hanya bermimpi," ejek mereka. "Dia mengasingkan dirinya,"', 'order' => 49],
            ['start_time' => 385.52, 'end_time' => 392.4, 'target_text' => 'but those closest to him, Khadijah, his wife, his rock, saw something sacred in', 'source_text' => 'namun insan yang paling akrab dengannya, Khadijah, isteri tercinta merangkap tunggak kekuatannya, melihat ada sesuatu yang suci dan agung di sebalik', 'order' => 50],
            ['start_time' => 392.4, 'end_time' => 400.08, 'target_text' => 'his solitude. When he returned from the mountain, his eyes carried a piece she could not describe.', 'source_text' => 'penyendirian khalwatnya. Setiap kali baginda pulang menuruni bukit, mata baginda memancarkan ketenangan mendamaikan yang tidak mampu digambarkan dengan kata-kata.', 'order' => 51],
            ['start_time' => 400.08, 'end_time' => 406.08, 'target_text' => 'She would prepare his food for the next journey. Her heart whispering prayers she did not yet', 'source_text' => 'Sayyidatina Khadijah setia menyediakan bekalan makanan untuk perjalanan seterusnya. Hatinya membisikkan doa-doa yang belum pun', 'order' => 52],
            ['start_time' => 406.08, 'end_time' => 415.36, 'target_text' => 'understand. Far beyond Arabia, the world trembled on its axis. Empires that had ruled for centuries', 'source_text' => 'dijangkau sepenuhnya. Jauh melangkaui Semenanjung Tanah Arab, dunia seakan bergoncang pada paksinya. Empayar-empayar yang bertakhta selama berabad-abad', 'order' => 53],
            ['start_time' => 415.36, 'end_time' => 422.48, 'target_text' => 'were crumbling. Hearts were wary of kings and gods that brought no peace. The voice of truth', 'source_text' => 'kian rapuh runtuh berantakan. Hati manusia sudah letih dan bosan dengan para raja dan tuhan-tuhan palsu yang langsung tidak membawa kedamaian. Suara kebenaran', 'order' => 54],
            ['start_time' => 422.48, 'end_time' => 430.32, 'target_text' => 'was ready to be heard again. The same truth that had been carried by Noah, Abraham, Moses,', 'source_text' => 'kini bersedia untuk didengari semula. Hakikat kebenaran sama yang pernah digalas oleh Nabi Nuh, Nabi Ibrahim, Nabi Musa,', 'order' => 55],
            ['start_time' => 430.32, 'end_time' => 437.92, 'target_text' => 'and Jesus, may peace be upon them. Allah was preparing the world for his final messenger, the', 'source_text' => 'dan Nabi Isa \'alaihimussalam. Allah sedang mempersiapkan dunia untuk menyambut pesuruh terakhir-Nya,', 'order' => 56],
            ['start_time' => 437.92, 'end_time' => 453.44, 'target_text' => 'seal of prophecy, the mercy of all creation. The Quran would later speak of that divine invitation.', 'source_text' => 'penutup sekalian para nabi, pembawa rahmat bagi seluruh alam semesta. Al-Quran kemudiannya berfirman mengenai seruan jemputan Ilahi itu:', 'order' => 57],
            ['start_time' => 453.44, 'end_time' => 459.44, 'target_text' => 'And Allah invites to the home of peace and guides whom he wills to a straight', 'source_text' => '"Dan Allah menyeru manusia ke Darussalam (negeri kedamaian), serta memimpin sesiapa yang dikehendaki-Nya ke jalan', 'order' => 58],
            ['start_time' => 459.44, 'end_time' => 467.28, 'target_text' => 'path. The silence of the cave was not empty. It was full, full of meaning, full of preparation,', 'source_text' => 'yang lurus." Keheningan di dalam gua itu bukanlah suatu kekosongan. Ia sarat terisi, sarat dengan makna hakiki, sarat dengan persiapan jiwa,', 'order' => 59],
            ['start_time' => 467.28, 'end_time' => 475.44, 'target_text' => 'of peace. Every night was a verse before revelation. Every sunrise was a promise', 'source_text' => 'dan penuh kedamaian. Setiap malam berlalu bagaikan sebuah ayat sebelum turunnya wahyu. Setiap terbit fajar adalah suatu janji pasti', 'order' => 60],
            ['start_time' => 475.44, 'end_time' => 483.04, 'target_text' => 'that the wait was ending. His heart trembled not with fear but with longing. And the angels,', 'source_text' => 'bahawa penantian panjang ini kian menuju ke penghujungnya. Hati baginda bergetar bukan kerana ketakutan, sebaliknya kerana kerinduan yang mendalam. Dan para malaikat,', 'order' => 61],
            ['start_time' => 483.04, 'end_time' => 489.68, 'target_text' => 'though unseen, were drawing near. Soon the heavens would open and light would touch the earth once', 'source_text' => 'sungguhpun tidak kelihatan dengan mata kasar, sedang menghampiri kian dekat. Tidak lama lagi pintu langit akan terbuka dan cahaya wahyu akan menyentuh bumi sekali', 'order' => 62],
            ['start_time' => 489.68, 'end_time' => 497.52, 'target_text' => 'more. But before that moment came, there was the stillness, the breath before the dawn,', 'source_text' => 'lagi. Namun sebelum saat agung itu tiba, terpancar satu keheningan, bagaikan hembusan nafas sebelum menyinsingnya fajar,', 'order' => 63],
            ['start_time' => 497.52, 'end_time' => 508.16, 'target_text' => 'the whisper before the word. The Quran would later echo that moment of purity and devotion.', 'source_text' => 'seumpama bisikan sebelum bergulirnya kalam firman. Al-Quran pada masa hadapan merakamkan detik kesucian dan ketundukan pengabdian itu:', 'order' => 64],
            ['start_time' => 513.2, 'end_time' => 520.08, 'target_text' => 'And none will be granted it except those who seek the pleasure of their Lord. And soon they', 'source_text' => '"Dan tiada yang dianugerahkan nikmat itu melainkan mereka yang mendambakan keredaan Tuhan mereka. Dan kelak mereka', 'order' => 65],
            ['start_time' => 520.08, 'end_time' => 526.24, 'target_text' => 'will be pleased. The night deepened. The prophet peace be upon him sat in the cave, eyes closed,', 'source_text' => 'pasti berpuas hati." Malam kian melabuhkan tirainya. Baginda Nabi ﷺ duduk di dalam gua, matanya terpejam rapat,', 'order' => 66],
            ['start_time' => 526.24, 'end_time' => 533.6, 'target_text' => 'heart awake. Below him, Makkah slept beneath the sky heavy with stars. And in that silence,', 'source_text' => 'namun sanubarinya sentiasa berjaga. Nun di bawah, kota Mekah lena beradu di bawah hamparan langit yang sarat dengan bintang-bintang. Dan dalam keheningan itu,', 'order' => 67],
            ['start_time' => 533.6, 'end_time' => 539.04, 'target_text' => 'the mountain of Hah stood witness to the whispers before the light. Allah was', 'source_text' => 'bukit Jabal Hira\' teguh berdiri menjadi saksi kepada bisikan-bisikan sebelum merebaknya cahaya nur. Allah sedang', 'order' => 68],
            ['start_time' => 539.04, 'end_time' => 546.88, 'target_text' => 'shaping him, not through miracles, yet through stillness, through nights beneath the stars,', 'source_text' => 'mendidik dan membentuk keperibadian baginda, bukan dengan mukjizat yang zahir pada saat itu, sebaliknya melalui keheningan, melalui malam-malam di bawah bintang-bintang,', 'order' => 69],
            ['start_time' => 546.88, 'end_time' => 553.6, 'target_text' => 'through the quiet voice inside the soul that longs for truth. In the next episode,', 'source_text' => 'melalui bisikan lembut di dalam sanubari yang amat mendambakan kebenaran sejati. Dalam episod seterusnya,', 'order' => 70],
            ['start_time' => 553.6, 'end_time' => 560.16, 'target_text' => 'inshallah, we will stand with him in the cave of Harah as the heavens open for', 'source_text' => 'insya-Allah, kita akan berdiri bersama baginda di Gua Hira\' tatkala pintu langit terbuka buat', 'order' => 71],
            ['start_time' => 560.16, 'end_time' => 566.96, 'target_text' => 'the final time. And the first word changes everything. Until then, may Allah open our', 'source_text' => 'kali yang terakhir. Dan kalimah pertama mengubah segala-galanya. Sehingga itu, semoga Allah membuka pintu', 'order' => 72],
            ['start_time' => 566.96, 'end_time' => 580.88, 'target_text' => 'hearts to guidance and allow us to walk gently in the footsteps of his beloved. Sah Allah Muhammad.', 'source_text' => 'hati kita kepada petunjuk dan mengizinkan kita menelusuri dengan lembut jejak langkah kekasih-Nya, Sallallahu \'ala Muhammad ﷺ.', 'order' => 73],
        ];

        $now = now();
        $rows = [];
        foreach ($subtitles as $sub) {
            $rows[] = [
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

        foreach (array_chunk($rows, 100) as $chunk) {
            DB::table('video_subtitles')->insert($chunk);
        }
    }
}
