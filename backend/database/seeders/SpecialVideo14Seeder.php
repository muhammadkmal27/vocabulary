<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo14Seeder extends Seeder
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

        // Special Bilingual Religious Video #14 (Siri 1 Ep.9): The Migration to Abyssinia | Life of the Final Messenger ﷺ | Ep.9 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'qMmn1Lqh95M'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Migration to Abyssinia | Life of the Final Messenger ﷺ | Ep.9 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/qMmn1Lqh95M/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 14,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.64, 'end_time' => 10.08, 'target_text' => 'They sent after them two men and Abdullahn Ab. But in the courts of the neg, the messengers', 'source_text' => 'Kaum musyrikin menghantar mengejar mereka dua orang utusan, iaitu \'Amr bin Al-\'As dan Abdullah bin Abi Rabi\'ah. Namun di balairung istana Raja Najashi, para utusan Islam', 'order' => 1],
            ['start_time' => 10.08, 'end_time' => 16.64, 'target_text' => 'stood before the king. We believed in him and we followed. The king listened in silence,', 'source_text' => 'berdiri tegak di hadapan baginda raja. "Kami beriman dengannya dan kami mengikutinya." Baginda raja mendengar dengan penuh hening,', 'order' => 2],
            ['start_time' => 16.64, 'end_time' => 24.88, 'target_text' => 'his eyes softening. Rahman, my beloved brothers and sisters, today we witness a chapter written', 'source_text' => 'kedua-dua matanya mula melembut sayu. Dengan nama Allah Yang Maha Pemurah, saudara-saudariku yang dikasihi, hari ini kita menyaksikan sebuah babak sejarah yang terpahat', 'order' => 3],
            ['start_time' => 24.88, 'end_time' => 31.44, 'target_text' => 'in tears, patience, and unwavering faith. When the light of Islam began to spread,', 'source_text' => 'dengan titisan air mata, kesabaran yang luar biasa, dan keimanan yang tidak berbelah bahagi. Tatkala nur Islam mula merebak mekar,', 'order' => 4],
            ['start_time' => 31.44, 'end_time' => 38.4, 'target_text' => 'it did not spread into open arms, it spread into resistance, hostility, and cruelty. Yet,', 'source_text' => 'ia tidak disambut dengan tangan terbuka, sebaliknya ia berdepan dengan tentangan sengit, permusuhan ketara, dan kezaliman yang kejam. Namun begitu,', 'order' => 5],
            ['start_time' => 38.4, 'end_time' => 45.52, 'target_text' => 'even amidst suffering, their hearts remained firm. For they knew that Allah sees every tear,', 'source_text' => 'walau di tengah-tengah keperitan seksaan, sanubari orang-orang beriman kekal teguh tidak berganjak. Kerana mereka meyakini bahawa Allah melihat setiap titisan air mata,', 'order' => 6],
            ['start_time' => 45.52, 'end_time' => 51.36, 'target_text' => 'hears every whispered prayer, and never abandons those who stand for truth. But', 'source_text' => 'mendengar setiap rintihan doa yang dibisikkan, dan tidak akan sekali-kali mensia-siakan sesiapa yang berdiri tegak membela kebenaran. Namun', 'order' => 7],
            ['start_time' => 51.36, 'end_time' => 57.52, 'target_text' => 'sometimes even the bravest hearts need refuge. And so the prophet peace be upon him in his', 'source_text' => 'kadang-kala jiwa yang paling berani sekalipun memerlukan tempat untuk berlindung. Maka baginda Nabi ﷺ dengan penuh rahmah dan kasih sayangnya', 'order' => 8],
            ['start_time' => 57.52, 'end_time' => 65.12, 'target_text' => 'mercy guided his followers to a place of justice. Abessia ruled by a king who did', 'source_text' => 'membimbing para pengikutnya ke sebuah bumi yang sarat dengan keadilan. Iaitu bumi Habsyah (Abyssinia) yang diperintah oleh seorang raja yang tidak', 'order' => 9],
            ['start_time' => 65.12, 'end_time' => 79.76, 'target_text' => 'not oppress. This was the first migration. Not a migration of fear but a migration of faith.', 'source_text' => 'sesekali menzalimi sesiapa pun. Inilah peristiwa Hijrah yang pertama. Bukan penghijrahan kerana ketakutan, sebaliknya penghijrahan demi menyelamatkan keimanan.', 'order' => 10],
            ['start_time' => 86.88, 'end_time' => 94.32, 'target_text' => 'The persecution in Mecca had grown unbearable. The believers were mocked, beaten, starved,', 'source_text' => 'Penindasan dan kezaliman di kota Mekah menjadi semakin tidak tertanggung. Orang-orang beriman diejek, dipukul diseksa, dikebulurkan tanpa makanan,', 'order' => 11],
            ['start_time' => 94.32, 'end_time' => 101.04, 'target_text' => 'and dragged through the dust of the streets. Yet their voices never broke, and their hearts never', 'source_text' => 'dan diheret merentasi debu jalanan yang membakar. Namun suara keimanan mereka tidak pernah pudar, dan sanubari mereka tidak sesekali', 'order' => 12],
            ['start_time' => 101.04, 'end_time' => 107.28, 'target_text' => 'turned back. For every wound they bore, faith only deepened. The prophet peace be upon him', 'source_text' => 'berpaling ke belakang. Bagi setiap luka kecederaan yang mereka tanggung, keimanan mereka menjadi semakin mendalam. Baginda Rasulullah ﷺ', 'order' => 13],
            ['start_time' => 107.28, 'end_time' => 112.96, 'target_text' => 'watched their suffering with a heart heavy with compassion. He could not yet command them to', 'source_text' => 'memerhatikan penderitaan para sahabatnya dengan hati yang sarat dengan belas kasihan. Baginda belum lagi diperintahkan oleh Allah untuk', 'order' => 14],
            ['start_time' => 112.96, 'end_time' => 121.68, 'target_text' => 'fight, nor could he shield them from cruelty. But the mercy of Allah was near. One night he', 'source_text' => 'berperang menentang mereka, dan belum mampu melindungi mereka daripada kekejaman musuh. Namun rahmat pertolongan Allah amatlah hampir. Pada suatu malam, baginda', 'order' => 15],
            ['start_time' => 121.68, 'end_time' => 129.44, 'target_text' => 'gathered the companions and said softly, "There is a land across the sea, a land ruled by a just king', 'source_text' => 'mengumpulkan para sahabat seraya bersabda dengan lembut: "Sesungguhnya ada sebuah negeri di seberang lautan, sebuah negeri yang diperintah oleh seorang raja yang adil', 'order' => 16],
            ['start_time' => 129.44, 'end_time' => 138.48, 'target_text' => 'who wrongs no one. Go there and stay until Allah grants you relief. It was Abbisinia, Al-Habasha,', 'source_text' => 'yang tidak menzalimi sesiapa pun di bawah naungannya. Pergilah ke sana dan menetaplah sehinggalah Allah mengurniakan kelapangan kepada kamu." Negeri itu adalah Habsyah (Al-Habasyah),', 'order' => 17],
            ['start_time' => 138.48, 'end_time' => 148.16, 'target_text' => 'a land of distant mountains and rivers ruled by a Christian king known as Anashi. And so began the', 'source_text' => 'sebuah negeri yang permai dengan banjaran bukit dan sungai-sungai yang diperintah oleh seorang raja Kristian yang berhati mulia, yang dikenali sebagai An-Najashi. Maka bermulalah', 'order' => 18],
            ['start_time' => 148.16, 'end_time' => 154.24, 'target_text' => 'first migration in the path of Allah. Under the veil of night, small groups of believers slipped', 'source_text' => 'penghijrahan pertama di jalan Allah. Di bawah lindungan tirai kegelapan malam, kumpulan-kumpulan kecil kaum mukmin menyusup keluar', 'order' => 19],
            ['start_time' => 154.24, 'end_time' => 160.56, 'target_text' => 'out of Mecca, men, women, and children, leaving behind their homes, their trade, and all they', 'source_text' => 'meninggalkan kota Mekah; kaum lelaki, wanita, dan anak-anak kecil, meninggalkan rumah kediaman mereka, perniagaan mereka, dan segala yang', 'order' => 20],
            ['start_time' => 160.56, 'end_time' => 167.76, 'target_text' => 'knew. Among them were mann, may Allah be pleased with him, and his wife, may Allah be pleased with', 'source_text' => 'mereka miliki. Antara mereka ialah Sayyidina Uthman bin Affan radhiyallahu \'anhu dan isterinya, Sayyidatina Ruqayyah radhiyallahu', 'order' => 21],
            ['start_time' => 167.76, 'end_time' => 172.96, 'target_text' => 'her, the daughter of the prophet, peace be upon him. The prophet peace be upon him raised his', 'source_text' => '\'anha, puteri tercinta Rasulullah ﷺ. Baginda Nabi ﷺ menadah kedua-dua belah tangannya berdoa seraya bersabda:', 'order' => 22],
            ['start_time' => 172.96, 'end_time' => 179.52, 'target_text' => 'hands and said, "They are the first to migrate in the cause of Allah after Ibraim and Luth. May', 'source_text' => '"Mereka berdua adalah orang pertama yang berhijrah di jalan Allah selepas zaman Nabi Ibrahim dan Nabi Lut." Semoga', 'order' => 23],
            ['start_time' => 179.52, 'end_time' => 186.8, 'target_text' => 'Allah be pleased with them. As they crossed the Red Sea, the wind carried their prayer over the', 'source_text' => 'Allah meredai mereka sekaliannya. Tatkala mereka belayar menyeberangi Laut Merah, hembusan angin membawa alunan doa munajat mereka merentasi', 'order' => 24],
            ['start_time' => 186.8, 'end_time' => 196.72, 'target_text' => 'waves. Behind them, Horesha\'s fury burned like a storm. Ahead of them, the mercy of Allah awaited.', 'source_text' => 'gelombang lautan. Di belakang mereka, kemarahan kaum Quraisy membakar marak laksana ribut taufan. Namun di hadapan mereka, rahmat pertolongan Allah sedang menanti.', 'order' => 25],
            ['start_time' => 196.72, 'end_time' => 205.92, 'target_text' => 'They had lost everything. Yet they felt richer than kings. The Quran would one day speak of them.', 'source_text' => 'Mereka telah kehilangan segala harta duniawi, namun jiwa mereka berasa jauh lebih kaya berbanding para raja. Al-Quran kelak merakamkan kisah kemuliaan mereka:', 'order' => 26],
            ['start_time' => 205.92, 'end_time' => 214.88, 'target_text' => 'Those', 'source_text' => '"Dan orang-orang', 'order' => 27],
            ['start_time' => 214.88, 'end_time' => 222.24, 'target_text' => 'who immigrated for Allah after being wronged, we will surely settle them in a good place in', 'source_text' => 'yang berhijrah kerana Allah sesudah mereka dizalimi, Kami pasti akan menempatkan mereka di tempat yang baik di', 'order' => 28],
            ['start_time' => 222.24, 'end_time' => 230.24, 'target_text' => 'this world. But the reward of the hereafter is greater. If only they knew. When Quraysh learned', 'source_text' => 'dunia ini. Dan sesungguhnya pahala hari akhirat itu jauh lebih besar, sekiranya mereka mengetahui." Apabila kaum Quraisy mendapat tahu', 'order' => 29],
            ['start_time' => 230.24, 'end_time' => 238.32, 'target_text' => 'of the migration, their pride ignited. They have escaped. They said and found refuge with a foreign', 'source_text' => 'mengenai penghijrahan rahsia ini, keangkuhan mereka marak menyala. "Mereka telah melepaskan diri!" jerit pembesar Quraisy, "dan mencari perlindungan dengan seorang raja', 'order' => 30],
            ['start_time' => 238.32, 'end_time' => 251.36, 'target_text' => 'king. They sent after them two men and Abdullahn Ab who each laden with gifts of leather and gold', 'source_text' => 'asing!" Kaum musyrikin segera menghantar dua orang perunding licik, iaitu \'Amr bin Al-\'As dan Abdullah bin Abi Rabi\'ah, dengan sarat membawa pelbagai hadiah barangan kulit dan emas', 'order' => 31],
            ['start_time' => 251.36, 'end_time' => 259.92, 'target_text' => 'for the courtiers of the neg. They were to demand that the Muslims be handed back. But in the courts', 'source_text' => 'untuk disogokkan kepada para pembesar istana Raja Najashi. Mereka mendesak agar orang-orang Islam diserahkan kembali ke Mekah. Namun di dalam balairung', 'order' => 32],
            ['start_time' => 259.92, 'end_time' => 267.6, 'target_text' => 'of the negsengers stood before the king and his bishops. Oh king, said Amra, some foolish youths', 'source_text' => 'istana Raja Najashi, para utusan Islam berdiri tegak di hadapan baginda raja dan para uskupnya. \'Amr bin Al-\'As memulakan hasutan: "Wahai tuanku raja, sesungguhnya beberapa orang pemuda bodoh', 'order' => 33],
            ['start_time' => 267.6, 'end_time' => 273.92, 'target_text' => 'from our people have abandoned their religion and they have not entered yours. They have brought', 'source_text' => 'daripada kaum kami telah meninggalkan agama nenek moyang mereka, namun mereka tidak pula memeluk agama tuanku. Mereka membawa', 'order' => 34],
            ['start_time' => 273.92, 'end_time' => 281.92, 'target_text' => 'a new belief unknown to us and to you. Send them back with us for their people know them best. The', 'source_text' => 'satu ajaran baharu yang langsung tidak dikenali oleh kami mahupun tuanku. Serahkanlah mereka kembali kepada kami, kerana kaum mereka lebih mengenali mereka." Para', 'order' => 35],
            ['start_time' => 281.92, 'end_time' => 290.16, 'target_text' => 'courtiers nodded, their hands heavy with the gifts of Qur. But the negus, a man of justice, said,', 'source_text' => 'pembesar istana mengangguk-angguk bersetuju, tangan mereka sarat menggenggam hadiah sogokan Quraisy. Namun Raja Najashi, seorang raja yang berpegang teguh pada keadilan, menegaskan:', 'order' => 36],
            ['start_time' => 290.16, 'end_time' => 299.28, 'target_text' => '"No, I will not hand him over unless I hear from them myself." And so the believers were summoned.', 'source_text' => '"Tidak! Demi Allah, beta tidak akan menyerahkan mereka melainkan setelah beta mendengar sendiri hujah daripada mulut mereka." Maka orang-orang beriman pun dipanggil mengadap.', 'order' => 37],
            ['start_time' => 299.28, 'end_time' => 307.6, 'target_text' => 'They entered the court weary but composed, their faces bright with the serenity of faith. Talib,', 'source_text' => 'Mereka melangkah masuk ke dalam balairung istana dalam keadaan letih musafir namun tetap tenang berwibawa, wajah mereka berseri-seri dengan nur ketenteraman iman. Sayyidina Ja\'far bin Abi', 'order' => 38],
            ['start_time' => 307.6, 'end_time' => 314.96, 'target_text' => 'may Allah be pleased with him, stepped forward. as their spokesman. The king asked, "What is this', 'source_text' => 'Talib radhiyallahu \'anhu melangkah ke hadapan sebagai jurucakap bagi pihak kaum mukmin. Baginda raja bertanya: "Apakah agama ini yang menyebabkan kamu sanggup meninggalkan kaum kamu?"', 'order' => 39],
            ['start_time' => 314.96, 'end_time' => 321.92, 'target_text' => 'religion for which you have left your people?" Jaffar, may Allah be pleased with him, replied,', 'source_text' => 'Sayyidina Ja\'far radhiyallahu \'anhu menjawab dengan penuh hikmah:', 'order' => 40],
            ['start_time' => 321.92, 'end_time' => 327.84, 'target_text' => '"Oh king, we were a people of ignorance. We worshiped idols, ate the flesh of the dead,', 'source_text' => '"Wahai tuanku raja, sesungguhnya dahulunya kami adalah kaum yang tenggelam dalam kejahilan. Kami menyembah berhala, memakan bangkai,', 'order' => 41],
            ['start_time' => 327.84, 'end_time' => 334.08, 'target_text' => 'and committed shameful acts. The strong among us, oppressed the weak. Then Allah sent us a', 'source_text' => 'dan melakukan pelbagai kekejian dan maksiat. Orang yang kuat di kalangan kami menindas dan menzalimi golongan yang lemah. Sehinggalah Allah mengutuskan kepada kami seorang rasul', 'order' => 42],
            ['start_time' => 334.08, 'end_time' => 340.64, 'target_text' => 'man whose lineage, truthfulness, and trust we all knew. He called us to worship Allah alone and to', 'source_text' => 'yang kami kenali keturunannya yang mulia, kejujurannya, amanahnya, dan kesucian peribadinya. Baginda menyeru kami supaya menyembah Allah Yang Maha Esa dan', 'order' => 43],
            ['start_time' => 340.64, 'end_time' => 347.2, 'target_text' => 'abandon the idols of our ancestors. He commanded us to speak the truth, to honor ties of kinship,', 'source_text' => 'meninggalkan batu-batu berhala yang disembah oleh nenek moyang kami. Baginda memerintahkan kami supaya berkata benar, menyambung tali silaturahim,', 'order' => 44],
            ['start_time' => 347.2, 'end_time' => 352.96, 'target_text' => 'to care for the neighbor and the orphan, and to keep away from all that is unlawful. We believed', 'source_text' => 'berbuat baik kepada jiran tetangga dan anak-anak yatim, serta menjauhi segala perkara yang diharamkan. Maka kami mempercayainya', 'order' => 45],
            ['start_time' => 352.96, 'end_time' => 360.8, 'target_text' => 'in him and we followed. The king listened in silence, his eyes softening. "Do you have with', 'source_text' => 'dan kami mengikut ajarannya." Baginda raja mendengar dengan penuh khusyuk, kedua-dua matanya mula bergenang sayu. "Adakah engkau membawa bersama-samamu', 'order' => 46],
            ['start_time' => 360.8, 'end_time' => 366.96, 'target_text' => 'you anything from what he brought from your lord?" he asked. Jaffar, may Allah be pleased with him,', 'source_text' => 'sebarang wahyu yang diturunkan daripada Tuhanmu?" tanya baginda raja. Sayyidina Ja\'far radhiyallahu \'anhu', 'order' => 47],
            ['start_time' => 366.96, 'end_time' => 385.12, 'target_text' => 'nodded and recited the verses revealed about Miam and Isa, Mary and Jesus, may peace be upon them.', 'source_text' => 'mengangguk seraya mengalunkan bacaan ayat-ayat suci Al-Quran daripada surah Maryam mengenai Maryam dan Nabi Isa \'alaihissalam:', 'order' => 48],
            ['start_time' => 385.12, 'end_time' => 407.84, 'target_text' => 'for', 'source_text' => '"Kaf Ha Ya \'Ain Sad...', 'order' => 49],
            ['start_time' => 407.84, 'end_time' => 415.04, 'target_text' => 'and mentioned in the book Mary when she withdrew from her family to a place toward the east. She', 'source_text' => 'Dan ceritakanlah peristiwa Maryam di dalam Al-Quran, tatkala dia mengasingkan diri daripada keluarganya ke suatu tempat di sebelah timur.', 'order' => 50],
            ['start_time' => 415.04, 'end_time' => 422.48, 'target_text' => 'took a veil apart from them and we sent to her our spirit and he appeared to her as a man in all', 'source_text' => 'Lalu dia memasang tirai hijab untuk melindungi dirinya daripada mereka; kemudian Kami mengutuskan kepadanya roh Kami (Malaikat Jibril), lalu menjelma di hadapannya sebagai seorang manusia yang sempurna kejadiannya.', 'order' => 51],
            ['start_time' => 422.48, 'end_time' => 430.64, 'target_text' => 'respects. She said, "I seek refuge in the most merciful from you if you fear Allah." He said,', 'source_text' => 'Maryam berkata: \'Sesungguhnya aku berlindung kepada Tuhan Yang Maha Pemurah daripada gangguanmu, jika engkau seorang yang bertakwa.\' Malaikat itu menjawab:', 'order' => 52],
            ['start_time' => 430.64, 'end_time' => 437.12, 'target_text' => '"I am only the messenger of your Lord to grant you a pure son." She said,', 'source_text' => '\'Sesungguhnya aku hanyalah utusan Tuhanmu, untuk mengurniakan kepadamu seorang anak lelaki yang suci murni.\' Maryam bertanya:', 'order' => 53],
            ['start_time' => 437.12, 'end_time' => 442.24, 'target_text' => '"How can I have a son when no man has touched me, nor have I been unchased?" He said,', 'source_text' => '\'Bagaimanakah aku boleh mempunyai seorang anak lelaki, sedangkan aku tidak pernah disentuh oleh seorang lelaki pun, dan aku bukanlah seorang wanita penzina?\' Jibril menjawab:', 'order' => 54],
            ['start_time' => 442.24, 'end_time' => 450.0, 'target_text' => '"So it will be. Your Lord says, "It is easy for me." The words flowed through the hall', 'source_text' => '\'Demikianlah keadaannya; Tuhanmu berfirman: Perkara itu amat mudah bagi-Ku.\'" Kalimah-kalimah Al-Quran itu mengalir memenuhi segenap ruang istana', 'order' => 55],
            ['start_time' => 450.0, 'end_time' => 456.96, 'target_text' => 'like light. The bishops wept until their scrolls were soaked. The neg took a small stick and said,', 'source_text' => 'laksana pancaran cahaya nur. Para uskup gereja menangis tersedu-sedu sehinggalah lembaran kitab suci mereka lencun dibasahi air mata. Raja Najashi mengambil sebatang ranting kecil lalu bersabda:', 'order' => 56],
            ['start_time' => 456.96, 'end_time' => 464.8, 'target_text' => '"By Allah, what you have recited and what Jesus brought come from the same source." Then he turned', 'source_text' => '"Demi Allah, sesungguhnya apa yang baru kamu bacakan ini dan apa yang pernah dibawa oleh Nabi Isa berasal daripada sumber cahaya nur yang sama!" Kemudian baginda berpaling', 'order' => 57],
            ['start_time' => 464.8, 'end_time' => 472.8, 'target_text' => 'to the Quraysh envoys and said, "Go. I will not hand them over. Defeated, the messengers', 'source_text' => 'kepada utusan Quraisy seraya bertitah tegas: "Pergilah kamu dari sini! Beta tidak akan sekali-kali menyerahkan mereka kepada kamu!" Dalam keadaan tewas dan malu, utusan musyrikin', 'order' => 58],
            ['start_time' => 472.8, 'end_time' => 479.52, 'target_text' => 'returned to Mecca, but the believers remained safe under the neg\'s protection. In Abisinia,', 'source_text' => 'terpaksa pulang dengan tangan kosong ke Mekah, manakala orang-orang beriman kekal aman di bawah perlindungan keadilan Raja Najashi. Di bumi Habsyah,', 'order' => 59],
            ['start_time' => 479.52, 'end_time' => 486.4, 'target_text' => 'they built a small community of prayer and peace, free to worship Allah without fear.', 'source_text' => 'mereka membina sebuah komuniti ibadah yang tenang dan damai, bebas menyembah Allah tanpa sebarang ancaman ketakutan.', 'order' => 60],
            ['start_time' => 486.4, 'end_time' => 491.36, 'target_text' => 'When word reached the prophet peace be upon him, he raised his hands in gratitude. The', 'source_text' => 'Sebaik sahaja khabar gembira ini sampai ke pengetahuan Rasulullah ﷺ, baginda menadah tangan bersyukur kepada Ilahi. Cahaya', 'order' => 61],
            ['start_time' => 491.36, 'end_time' => 499.04, 'target_text' => 'light of Islam had now crossed the sea and the call was no longer bound to one land. Those who', 'source_text' => 'nur Islam kini telah merentasi lautan dan seruan dakwah tidak lagi terhad kepada satu bumi semata-mata. Mereka yang telah melepaskan segala-galanya', 'order' => 62],
            ['start_time' => 499.04, 'end_time' => 511.44, 'target_text' => 'had left everything found a new home through faith, fulfilling the promise of their Lord.', 'source_text' => 'kini menemui tanah air dan kedamaian baharu berkat keimanan mereka, menyempurnakan janji manis daripada Tuhan mereka:', 'order' => 63],
            ['start_time' => 511.44, 'end_time' => 518.32, 'target_text' => 'So their Lord responded to them, "Indeed, I do not allow the deeds of any doer among you to be lost,', 'source_text' => '"Maka Tuhan mereka memperkenankan doa mereka: \'Sesungguhnya Aku tidak akan mensia-siakan amal orang-orang yang beramal di antara kamu,', 'order' => 64],
            ['start_time' => 518.32, 'end_time' => 525.04, 'target_text' => 'whether male or female." Under the protection of a righteous king, the early believers found peace', 'source_text' => 'sama ada lelaki mahupun perempuan.\'" Di bawah naungan perlindungan seorang raja yang adil, golongan beriman terawal menemui ketenteraman jiwa', 'order' => 65],
            ['start_time' => 525.04, 'end_time' => 532.16, 'target_text' => 'and Islam found its first refuge on earth. And though Makkah burned with hostility,', 'source_text' => 'dan Islam menemui tempat perlindungan pertamanya di muka bumi. Dan sungguhpun kota Mekah membara dengan api permusuhan,', 'order' => 66],
            ['start_time' => 532.16, 'end_time' => 538.24, 'target_text' => 'the message had already taken flight. Sometimes Allah does not lift the trial,', 'source_text' => 'risalah agung ini telah pun terbang melebarkan sayapnya ke persada dunia. Kadang-kala Allah tidak mengangkat ujian mehnah itu serta-merta,', 'order' => 67],
            ['start_time' => 538.24, 'end_time' => 543.76, 'target_text' => 'he moves you to a place where you can endure it. In the next episode, inshallah,', 'source_text' => 'sebaliknya Dia memindahkan dirimu ke suatu tempat di mana engkau mampu bertahan dan bangkit menghadapinya. Dalam episod seterusnya, insya-Allah,', 'order' => 68],
            ['start_time' => 543.76, 'end_time' => 563.2, 'target_text' => 'we will witness how Islam continues to spread quietly, steadily, beautifully. Allah Muhammad', 'source_text' => 'kita akan menyaksikan bagaimana Islam terus berkembang mekar secara tenang, mantap, dan begitu indah. Sallallahu \'ala Muhammad ﷺ.', 'order' => 69],
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
