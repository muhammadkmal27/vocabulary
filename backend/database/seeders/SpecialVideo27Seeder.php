<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo27Seeder extends Seeder
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

        // Special Bilingual Religious Video #27 (Siri 1 Ep.22): The Slander of A’ishah (RA) | Life of the Final Messenger ﷺ | Ep.22 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'EuyDY1bKkpk'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Slander of A’ishah (RA) | Life of the Final Messenger ﷺ | Ep.22 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/EuyDY1bKkpk/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 27,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.56, 'end_time' => 7.52, 'target_text' => 'A quarrel broke out between an immigrant servant and an Ansari man. "If you are innocent,', 'source_text' => 'Pertelingkahan tercetus antara seorang pembantu kaum Muhajirin dan seorang lelaki Ansar. "Sekiranya engkau tidak bersalah,', 'order' => 1],
            ['start_time' => 7.52, 'end_time' => 13.6, 'target_text' => 'Allah will declare your innocence." The Prophet\'s household, peace be upon him, was purified by', 'source_text' => 'nescaya Allah sendiri yang akan membersihkan kesucianmu." Ahli bait Nabi ﷺ telah disucikan oleh', 'order' => 2],
            ['start_time' => 13.6, 'end_time' => 22.96, 'target_text' => 'the very words of the Quran, verses recited until the end of time. My beloved brothers and sisters,', 'source_text' => 'kalimah-kalimah al-Quran, ayat-ayat yang dibaca hingga ke akhir zaman. Saudara dan saudariku yang dikasihi,', 'order' => 3],
            ['start_time' => 22.96, 'end_time' => 30.8, 'target_text' => 'not every storm comes from outside. Some rise quietly from the unseen corners of the heart.', 'source_text' => 'bukan setiap taufan datang merempuh dari luar. Ada badai yang bangkit senyap-senyap dari sudut hati yang tersembunyi.', 'order' => 4],
            ['start_time' => 30.8, 'end_time' => 37.44, 'target_text' => 'After trials of war and betrayal, Medina stood strong on the outside. But a different', 'source_text' => 'Setelah mengharungi badai peperangan dan pengkhianatan, Madinah tampak teguh di luar. Namun suatu ujian', 'order' => 5],
            ['start_time' => 37.44, 'end_time' => 44.56, 'target_text' => 'test was beginning within. There were those who walked among the believers, prayed beside them,', 'source_text' => 'yang berbeza mula menyelinap dari dalam. Terdapat golongan yang berjalan bersama orang-orang beriman, solat di samping mereka,', 'order' => 6],
            ['start_time' => 44.56, 'end_time' => 50.96, 'target_text' => 'spoke words of faith with their tongues, yet their hearts held a different truth.', 'source_text' => 'mengucapkan kalimah-kalimah iman dengan lidah mereka, namun sanubari mereka menyembunyikan kepalsuan.', 'order' => 7],
            ['start_time' => 51.68, 'end_time' => 60.32, 'target_text' => 'This is the story of whispers, of doubt, of pride concealed beneath false humility. And', 'source_text' => 'Inilah kisah tentang bisikan fitnah, keraguan, dan keangkuhan yang berselindung di sebalik kepura-puraan. Namun', 'order' => 8],
            ['start_time' => 60.32, 'end_time' => 66, 'target_text' => 'through it all, the Messenger of Allah, peace be upon him, remained steady, guiding his', 'source_text' => 'sepanjang ujian ini, Rasulullah ﷺ kekal tenang dan tabah, membimbing', 'order' => 9],
            ['start_time' => 66, 'end_time' => 73.84, 'target_text' => 'ummah with patience, grace, and unwavering trust in Allah. So come with me to the moment', 'source_text' => 'umatnya dengan kesabaran, keagungan budi, dan tawakal yang tidak berbelah bahagi kepada Allah. Maka hayutilah saat', 'order' => 10],
            ['start_time' => 73.84, 'end_time' => 89.36, 'target_text' => 'when the unseen became clearer and the hearts of people began to reveal who they truly were.', 'source_text' => 'tatkala rahsia hati tersingkap nyata dan sanubari manusia mula menzahirkan hakikat diri mereka yang sebenar.', 'order' => 11],
            ['start_time' => 96.88, 'end_time' => 104.32, 'target_text' => 'The sun had risen gently over the valleys of a quiet place soon to echo with history. It was', 'source_text' => 'Matahari terbit menyinari lurah kawasan hening yang bakal bergema dengan peristiwa bersejarah. Detik itu berlaku', 'order' => 12],
            ['start_time' => 104.32, 'end_time' => 110.72, 'target_text' => 'in the sixth year after Hijrah when the Messenger of Allah peace be upon him marched against Banu al-Mustaliq.', 'source_text' => 'pada tahun keenam Hijrah tatkala Rasulullah ﷺ memimpin bala tentera menuju ke perkampungan Bani al-Mustaliq.', 'order' => 13],
            ['start_time' => 110.72, 'end_time' => 118.72, 'target_text' => 'Reports had reached him that they were gathering to strike Medina. The Prophet', 'source_text' => 'Berita telah sampai kepada baginda bahawa mereka sedang berhimpun untuk menyerang Madinah. Maka Nabi ﷺ', 'order' => 14],
            ['start_time' => 118.72, 'end_time' => 124.32, 'target_text' => 'peace be upon him appointed Abu Dharr, may Allah be pleased with him, to watch', 'source_text' => 'melantik Abu Dharr al-Ghifari RA untuk menjaga kota Madinah,', 'order' => 15],
            ['start_time' => 124.32, 'end_time' => 136.64, 'target_text' => 'over the city and set forth. The leader of Banu al-Mustaliq was al-Harith, father of Juwayriyah. They met by', 'source_text' => 'lalu baginda berangkat mara. Pemimpin Bani al-Mustaliq ialah al-Harith, bapa kepada Juwairiyah. Mereka bertembung di', 'order' => 16],
            ['start_time' => 136.64, 'end_time' => 145.36, 'target_text' => 'a well near al-Muraysi\'. When battle broke out, Allah granted victory to His Messenger. The enemy was defeated,', 'source_text' => 'kawasan mata air al-Muraisi\'. Apabila pertempuran meletus, Allah mengurniakan kemenangan kepada Rasul-Nya. Musuh ditewaskan,', 'order' => 17],
            ['start_time' => 145.36, 'end_time' => 151.92, 'target_text' => 'their warriors slain, their women and children taken captive, and their wealth returned as', 'source_text' => 'pahlawan mereka terbunuh, kaum wanita dan kanak-kanak dijadikan tawanan, dan harta mereka diambil sebagai', 'order' => 18],
            ['start_time' => 151.92, 'end_time' => 162.16, 'target_text' => 'spoils of war. Among the captives was a noble woman, Juwayriyah bint al-Harith. She was intelligent,', 'source_text' => 'harta rampasan perang. Antara tawanan itu ialah seorang wanita bangsawan yang mulia, Juwairiyah bint al-Harith. Beliau seorang yang bijaksana,', 'order' => 19],
            ['start_time' => 162.16, 'end_time' => 172.4, 'target_text' => 'dignified, and carried herself with grace even in captivity. She fell into the share of Thabit ibn Qays.', 'source_text' => 'bermaruah tinggi, dan membawa dirinya dengan penuh keanggunan walau dalam tawanan. Beliau jatuh ke dalam bahagian Thabit ibn Qais.', 'order' => 20],
            ['start_time' => 172.4, 'end_time' => 177.92, 'target_text' => 'Wanting her freedom, she came to the Prophet peace be upon him and said softly, "Oh Messenger', 'source_text' => 'Inginkan kebebasannya, beliau menghadap Nabi ﷺ seraya berkata dengan lemah lembut, "Wahai Rasulullah,', 'order' => 21],
            ['start_time' => 177.92, 'end_time' => 187.04, 'target_text' => 'of Allah, I am Juwayriyah bint al-Harith, daughter of the leader of my people. Misfortune has touched me as', 'source_text' => 'sesungguhnya aku Juwairiyah bint al-Harith, anak kepada pemimpin kaumku. Kemusnahan telah menimpaku sebagaimana', 'order' => 22],
            ['start_time' => 187.04, 'end_time' => 193.92, 'target_text' => 'you see. I have written a contract to free myself. Will you help me?" The Prophet peace be upon him', 'source_text' => 'yang tuan saksikan. Aku telah membuat perjanjian tebus diri (*mukatabah*) untuk membebaskan diriku. Sudikah tuan membantuku?" Nabi ﷺ', 'order' => 23],
            ['start_time' => 193.92, 'end_time' => 200.56, 'target_text' => 'looked at her with mercy and said, "Shall I offer you something better?" "What is it, O Messenger', 'source_text' => 'memandangnya dengan penuh belas kasihan lalu bersabda, "Mahukah kamu jika aku tawarkan sesuatu yang lebih baik?" "Apakah itu, wahai Rasulullah?"', 'order' => 24],
            ['start_time' => 200.56, 'end_time' => 211.12, 'target_text' => 'of Allah?" she asked. "I will pay your ransom and marry you." She accepted. The news spread among the', 'source_text' => 'tanya beliau. Baginda bersabda, "Aku jelaskan tebusanmu dan menikahimu." Beliau bersetuju. Berita itu segera tersebar dalam kalangan', 'order' => 25],
            ['start_time' => 211.12, 'end_time' => 218.08, 'target_text' => 'Muslims: The Messenger of Allah has married Juwayriyah, daughter of the chief of Banu al-Mustaliq. At once,', 'source_text' => 'kaum muslimin: Rasulullah ﷺ telah memperisterikan Juwairiyah, anak ketua Bani al-Mustaliq! Maka serta-merta', 'order' => 26],
            ['start_time' => 218.08, 'end_time' => 225.2, 'target_text' => 'the companions released every captive from her tribe, saying they are now in-laws of the Prophet', 'source_text' => 'para sahabat membebaskan setiap tawanan daripada kabilahnya seraya berkata, mereka kini adalah kerabat besan kepada Rasulullah ﷺ.', 'order' => 27],
            ['start_time' => 225.2, 'end_time' => 233.44, 'target_text' => 'peace be upon him. Over a 100 families were freed that day, a mercy greater than any sword could', 'source_text' => 'Lebih daripada 100 buah keluarga dibebaskan pada hari itu, satu rahmat yang jauh lebih besar daripada apa yang mampu dicapai oleh pedang.', 'order' => 28],
            ['start_time' => 233.44, 'end_time' => 240.32, 'target_text' => 'bring. \'A\'ishah, may Allah be pleased with her, would later say, "I have never seen a woman', 'source_text' => 'Sayyidatina Aisyah RA kemudiannya berkata, "Aku belum pernah melihat seorang wanita yang', 'order' => 29],
            ['start_time' => 240.32, 'end_time' => 247.84, 'target_text' => 'bring more blessing to her people than Juwayriyah, may Allah be pleased with her." As the army returned,', 'source_text' => 'membawa barakah yang begitu besar kepada kaumnya melebihi Juwairiyah RA." Ketika bala tentera dalam perjalanan pulang,', 'order' => 30],
            ['start_time' => 247.84, 'end_time' => 257.04, 'target_text' => 'tensions flared. A quarrel broke out between an immigrant servant and an Ansari man. Both', 'source_text' => 'ketegangan tercetus. Perbalahan berlaku antara seorang pembantu kaum Muhajirin dan seorang lelaki Ansar. Kedua-duanya', 'order' => 31],
            ['start_time' => 257.04, 'end_time' => 264.96, 'target_text' => 'called for help from their respective groups: "Oh immigrants!" and "Oh Ansar!" The Prophet peace be upon', 'source_text' => 'melaungkan seruan asabiyyah kepada kaum masing-masing: "Wahai kaum Muhajirin!" dan "Wahai kaum Ansar!" Nabi ﷺ', 'order' => 32],
            ['start_time' => 264.96, 'end_time' => 274.48, 'target_text' => 'him heard of it and said, "Leave this call, for it is a call of Jahiliyyah ignorance." Among the hypocrites,', 'source_text' => 'mendengarnya lantas bersabda, "Tinggalkanlah seruan itu, kerana ia adalah seruan jahiliah yang amat busuk!" Di pihak munafik,', 'order' => 33],
            ['start_time' => 274.48, 'end_time' => 284.32, 'target_text' => 'Abdullah ibn Ubayy stirred resentment: "They have crowded us in our own city. When we return to Medina,', 'source_text' => 'Abdullah ibn Ubayy meniup api permusuhan: "Mereka menyempitkan kita di negeri kita sendiri. Demi Allah, apabila kita kembali ke Madinah kelak,', 'order' => 34],
            ['start_time' => 284.32, 'end_time' => 290.96, 'target_text' => 'the honored will drive out the humble." Young Zayd ibn Arqam heard these words and rushed to the Prophet peace', 'source_text' => 'golongan yang mulia pasti akan mengusir golongan yang hina." Zayd ibn Arqam yang masih muda mendengar ucapan ini lalu bergegas kepada Nabi ﷺ', 'order' => 35],
            ['start_time' => 290.96, 'end_time' => 297.6, 'target_text' => 'be upon him to report them. When confronted, Abdullah ibn Ubayy swore that he had said nothing.', 'source_text' => 'untuk melaporkannya. Apabila dipanggil menghadap, Abdullah ibn Ubayy bersumpah bohong bahawa dia tidak pernah mengucapkannya.', 'order' => 36],
            ['start_time' => 297.6, 'end_time' => 304.96, 'target_text' => 'Some doubted Zayd until revelation cleared his name. When the Prophet peace be upon', 'source_text' => 'Ada yang meragui Zayd sehinggalah turun wahyu membenarkannya. Apabila Nabi ﷺ', 'order' => 37],
            ['start_time' => 304.96, 'end_time' => 310.32, 'target_text' => 'him learned of this, he quietly ordered the army to march through the heat of the day,', 'source_text' => 'mengetahui perkara ini, baginda dengan bijaksana mengarahkan pasukan mara berjalan mengharungi terik siang,', 'order' => 38],
            ['start_time' => 310.32, 'end_time' => 316, 'target_text' => 'denying rest so that no one could dwell on the slander. The people walked under the', 'source_text' => 'tanpa henti berehat supaya tiada sesiapa yang sempat menyebarkan fitnah dan hasutan. Orang ramai terus berjalan di bawah', 'order' => 39],
            ['start_time' => 316, 'end_time' => 324.56, 'target_text' => 'scorching sun, too weary to gossip, a mercy in disguise. As the caravan neared Medina, \'A\'ishah,', 'source_text' => 'panas terik, terlalu letih untuk bergosip — satu hikmah terselindung. Tatkala kafilah menghampiri Madinah, Sayyidatina Aisyah RA,', 'order' => 40],
            ['start_time' => 324.56, 'end_time' => 329.92, 'target_text' => 'may Allah be pleased with her, who had accompanied the Prophet peace be upon him on this expedition,', 'source_text' => 'yang menemani Nabi ﷺ dalam ekspedisi ini,', 'order' => 41],
            ['start_time' => 329.92, 'end_time' => 336.4, 'target_text' => 'left the camp briefly to search for a necklace she had lost. When she returned,', 'source_text' => 'keluar sebentar dari kawasan khemah untuk mencari kalungnya yang hilang tercicir. Apabila beliau kembali,', 'order' => 42],
            ['start_time' => 336.4, 'end_time' => 342.64, 'target_text' => 'the caravan had moved, thinking she was still inside her curtained hawdaj.', 'source_text' => 'kafilah telah pun beredar, menyangka beliau masih berada di dalam haudaj bertutup di atas untanya.', 'order' => 43],
            ['start_time' => 342.64, 'end_time' => 350.4, 'target_text' => 'Left behind in the desert, she waited patiently until Safwan, may Allah be pleased with him,', 'source_text' => 'Ketinggalan bersendirian di padang pasir, beliau menunggu dengan sabar sehinggalah Safwan ibn al-Mu\'attal RA,', 'order' => 44],
            ['start_time' => 350.4, 'end_time' => 360.48, 'target_text' => 'who had lagged behind the army, found her asleep beneath the stars. Recognizing her, he said,', 'source_text' => 'yang bertugas di belakang bala tentera, menemuinya sedang tertidur di bawah langit malam. Sebaik mengenalinya, beliau mengucap:', 'order' => 45],
            ['start_time' => 360.48, 'end_time' => 367.68, 'target_text' => '"To Allah we belong, and unto Him is our return — the wife of the Messenger of Allah!"', 'source_text' => '"Inna lillahi wa inna ilayhi raji\'un — isteri Rasulullah!"', 'order' => 46],
            ['start_time' => 367.68, 'end_time' => 376.64, 'target_text' => 'He lowered his camel. She mounted and they rode in silence until they rejoined the army at dawn. But', 'source_text' => 'Beliau merendahkan untanya. Aisyah pun menaiki unta itu dan mereka bergerak dalam diam sehinggalah bertemu semula pasukan pada waktu subuh. Namun', 'order' => 47],
            ['start_time' => 376.64, 'end_time' => 385.36, 'target_text' => 'when they arrived, whispers began. The hypocrites found their weapon. A slander took flight like wildfire.', 'source_text' => 'setibanya mereka, bisikan fitnah mula bertiup. Golongan munafik menjumpai senjata mereka. Fitnah jahat merebak deras bagai api membakar lalang.', 'order' => 48],
            ['start_time' => 385.36, 'end_time' => 392.88, 'target_text' => 'When the army reached Medina, the rumors deepened. \'A\'ishah, may Allah be pleased with her,', 'source_text' => 'Setibanya bala tentera di Madinah, desas-desus semakin marak. Sayyidatina Aisyah RA', 'order' => 49],
            ['start_time' => 392.88, 'end_time' => 399.6, 'target_text' => 'fell ill, unaware of what was being said. The Prophet peace be upon him was gentle', 'source_text' => 'jatuh sakit, langsung tidak mengetahui apa yang sedang diperkatakan orang. Nabi ﷺ tetap berlembut', 'order' => 50],
            ['start_time' => 399.6, 'end_time' => 411.12, 'target_text' => 'yet distant, awaiting revelation. When she learned of the rumor from Umm Mistah, she wept bitterly. Days passed.', 'source_text' => 'namun agak menjauhkan diri sambil menanti wahyu. Tatkala beliau mengetahui fitnah tersebut daripada Ummu Mistah, beliau menangis teresak-esak. Hari demi hari berlalu.', 'order' => 51],
            ['start_time' => 411.12, 'end_time' => 418.96, 'target_text' => 'Her parents wept with her. The Prophet peace be upon him came to her and said, "Oh \'A\'ishah,', 'source_text' => 'Kedua-dua ibu bapanya turut menangis bersamanya. Lalu Nabi ﷺ datang menemuinya seraya bersabda, "Wahai Aisyah,', 'order' => 52],
            ['start_time' => 418.96, 'end_time' => 424.4, 'target_text' => 'if you are innocent, Allah will declare your innocence. But if you have done wrong,', 'source_text' => 'sekiranya engkau tidak bersalah, nescaya Allah akan membersihkan kesucianmu. Namun jika engkau terlanjur,', 'order' => 53],
            ['start_time' => 424.4, 'end_time' => 432.08, 'target_text' => 'then repent to Allah, for He accepts repentance." She said through her tears, "By Allah, I know', 'source_text' => 'maka bertaubatlah kepada Allah, kerana Dia menerima taubat." Aisyah berkata dalam linangan air mata, "Demi Allah, aku tahu', 'order' => 54],
            ['start_time' => 432.08, 'end_time' => 437.6, 'target_text' => 'you have heard the tale until it has settled in your heart. If I tell you I am innocent,', 'source_text' => 'kalian telah mendengar berita ini sehingga ia tersemat di hati kalian. Jika aku katakan aku tidak bersalah,', 'order' => 55],
            ['start_time' => 437.6, 'end_time' => 443.68, 'target_text' => 'and Allah knows I am, you will not believe me. If I admit to something I did not do,', 'source_text' => 'sedangkan Allah mengetahui bahawa aku suci, kalian tidak akan mempercayaiku. Jika aku mengakui sesuatu yang tidak pernah aku lakukan,', 'order' => 56],
            ['start_time' => 443.68, 'end_time' => 451.36, 'target_text' => 'you will believe me. I will say as the father of Yusuf, may peace be upon him, said:', 'source_text' => 'kalian pula akan mempercayaiku. Maka tiada yang dapat kukatakan melainkan sebagaimana ucapan ayahanda Nabi Yusuf AS:', 'order' => 57],
            ['start_time' => 455.52, 'end_time' => 463.04, 'target_text' => '"So patience is beautiful, and Allah is the one sought for help against what you describe." The', 'source_text' => '"Maka bersabar itu lebih indah, dan Allah jualah tempat memohon pertolongan terhadap apa yang kalian sifatkan."', 'order' => 58],
            ['start_time' => 463.04, 'end_time' => 469.68, 'target_text' => 'Prophet peace be upon him sat awaiting what Allah would reveal. Then the state of revelation came', 'source_text' => 'Nabi ﷺ duduk menanti apa yang bakal diwahyukan oleh Allah. Tiba-tiba suasana penurunan wahyu menyelubungi', 'order' => 59],
            ['start_time' => 469.68, 'end_time' => 478.72, 'target_text' => 'over him: a heaviness upon his blessed body, sweat beaded like pearls upon his forehead.', 'source_text' => 'baginda: terasa berat pada jasad baginda yang mulia, peluh mengalir bagai butiran mutiara di dahi baginda.', 'order' => 60],
            ['start_time' => 478.72, 'end_time' => 485.84, 'target_text' => 'Even in the cool of the morning, when he rose, his face shone with relief: "Rejoice,', 'source_text' => 'Walaupun dalam suasana pagi yang dingin, tatkala baginda sedar, wajah baginda berseri-seri penuh kelegaan: "Bergembiralah,', 'order' => 61],
            ['start_time' => 485.84, 'end_time' => 498.48, 'target_text' => 'O \'A\'ishah! By Allah, Allah has declared your innocence!" Then he recited:', 'source_text' => 'wahai Aisyah! Demi Allah, sesungguhnya Allah telah membersihkan kesucianmu!" Lalu baginda membaca ayat wahyu:', 'order' => 62],
            ['start_time' => 498.48, 'end_time' => 504.88, 'target_text' => '"Indeed, those who came with the lie are a group among you. Do not think it bad for you; rather,', 'source_text' => '"Sesungguhnya orang-orang yang membawa berita dusta itu adalah segolongan daripada kalangan kamu. Janganlah kamu menyangka ia buruk bagi kamu; bahkan', 'order' => 63],
            ['start_time' => 504.88, 'end_time' => 515.84, 'target_text' => 'it is good for you." Those who spread the slander — Mistah, Hamnah, and Hassan among others — were each', 'source_text' => 'ia adalah baik bagi kamu." Mereka yang menyebarkan fitnah tersebut — Mistah, Hamnah, Hassan dan lain-lain — masing-masing', 'order' => 64],
            ['start_time' => 515.84, 'end_time' => 525.2, 'target_text' => 'punished with 80 lashes. And the hypocrite, though spared judgment in this world, was condemned', 'source_text' => 'dikenakan sebatan hudud sebanyak 80 kali. Manakala ketua munafik, walaupun terlepas hukuman dunia, telah dilaknat keras', 'order' => 65],
            ['start_time' => 525.2, 'end_time' => 533.04, 'target_text' => 'by Allah\'s words. Abu Bakr, may Allah be pleased with him, who had been financially supporting Mistah,', 'source_text' => 'dalam firman Allah. Abu Bakr as-Siddiq RA, yang selama ini menanggung nafkah Mistah yang miskin,', 'order' => 66],
            ['start_time' => 534, 'end_time' => 548.56, 'target_text' => 'swore to cut him off until Allah revealed:', 'source_text' => 'bersumpah untuk menghentikan bantuan tersebut sehinggalah Allah menurunkan ayat:', 'order' => 67],
            ['start_time' => 548.56, 'end_time' => 555.36, 'target_text' => '"Let not those of virtue among you swear to withhold help from their relatives and the needy."', 'source_text' => '"Dan janganlah orang-orang yang mempunyai kelebihan serta kelapangan di antara kamu bersumpah tidak mahu memberi bantuan kepada kaum kerabat dan orang-orang miskin."', 'order' => 68],
            ['start_time' => 555.36, 'end_time' => 563.2, 'target_text' => 'He wept and said, "By Allah, I love that Allah should forgive me," and resumed his charity to', 'source_text' => 'Abu Bakr menangis seraya berkata, "Demi Allah, sesungguhnya aku amat suka sekiranya Allah mengampuniku," lalu beliau menyambung semula sedekahnya kepada', 'order' => 69],
            ['start_time' => 563.2, 'end_time' => 568.96, 'target_text' => 'Mistah, may Allah be pleased with them all. When \'A\'ishah, may Allah be pleased with her,', 'source_text' => 'Mistah, semoga Allah meredhai mereka sekalian. Tatkala Sayyidatina Aisyah RA', 'order' => 70],
            ['start_time' => 568.96, 'end_time' => 576.48, 'target_text' => 'heard her vindication, she said calmly, "By Allah, I will not rise to him in thanks; I', 'source_text' => 'mendengar pembebasan kesuciannya, beliau berkata dengan tenang, "Demi Allah, aku tidak akan bangun berterima kasih kepadanya;', 'order' => 71],
            ['start_time' => 576.48, 'end_time' => 584, 'target_text' => 'will thank only Allah." And the revelation of Surah an-Nur restored peace to Medina, exposing', 'source_text' => 'aku hanya akan memuji dan bersyukur kepada Allah semata-mata." Dan penurunan Surah an-Nur mengembalikan ketenangan ke Madinah, menyingkap', 'order' => 72],
            ['start_time' => 584, 'end_time' => 592.56, 'target_text' => 'hypocrisy, purifying hearts, and proving that Allah defends the honor of those who are sincere.', 'source_text' => 'belang kaum munafik, menyucikan hati-hati yang beriman, dan membuktikan bahawa Allah sentiasa membela maruah orang-orang yang ikhlas.', 'order' => 73],
            ['start_time' => 592.56, 'end_time' => 599.04, 'target_text' => 'The Prophet\'s household, peace be upon him, was purified by the very words of the Quran, verses', 'source_text' => 'Ahli bait Rasulullah ﷺ telah dibersihkan oleh firman suci al-Quran, ayat-ayat', 'order' => 74],
            ['start_time' => 599.04, 'end_time' => 607.44, 'target_text' => 'recited until the end of time. Beyond Medina, a new path was opening — a journey not of battle,', 'source_text' => 'yang sentiasa dibaca hingga ke hari kiamat. Di luar Madinah, satu lembaran baharu mula terbuka — suatu perjalanan bukan untuk berperang,', 'order' => 75],
            ['start_time' => 607.44, 'end_time' => 614.4, 'target_text' => 'but of treaty, a moment that would appear as loss to some, yet would become one of the', 'source_text' => 'melainkan perjanjian damai. Detik yang disangka suatu kerugian oleh sesetengah pihak, namun menjadi salah satu', 'order' => 76],
            ['start_time' => 614.4, 'end_time' => 621.52, 'target_text' => 'greatest victories in the history of Islam. In the next episode, insha\'Allah, we walk toward the', 'source_text' => 'kemenangan teragung dalam sejarah Islam. Dalam episod seterusnya, insya-Allah, kita akan menuju ke', 'order' => 77],
            ['start_time' => 621.52, 'end_time' => 636.72, 'target_text' => 'valley of al-Hudaybiyyah where patience would open a door the sword could not. Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'lembah Hudaibiyyah, tatkala kesabaran membuka pintu yang tidak mampu dibuka oleh bilah pedang. Selawat dan salam ke atas Nabi Muhammad dan seluruh keluarga serta sahabat baginda.', 'order' => 78],
        ];

        $records = [];
        foreach ($subtitles as $sub) {
            $records[] = [
                'id'          => (string) Str::uuid(),
                'video_id'    => $video->id,
                'start_time'  => $sub['start_time'],
                'end_time'    => $sub['end_time'],
                'target_text' => $sub['target_text'],
                'source_text' => $sub['source_text'],
                'order'       => $sub['order'],
                'created_at'  => now(),
                'updated_at'  => now(),
            ];
        }

        foreach (array_chunk($records, 50) as $chunk) {
            DB::table('video_subtitles')->insert($chunk);
        }
    }
}
