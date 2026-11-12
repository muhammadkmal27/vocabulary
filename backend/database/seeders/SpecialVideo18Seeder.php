<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo18Seeder extends Seeder
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

        // Special Bilingual Religious Video #18 (Siri 1 Ep.13): The Hijrah | Life of the Final Messenger ﷺ | Ep.13 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'qWubL2TGPlc'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Hijrah | Life of the Final Messenger ﷺ | Ep.13 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/qWubL2TGPlc/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 18,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.4, 'end_time' => 8.879, 'target_text' => 'They traveled south away from Ythre to the cave  of Thor, hidden among the cliffs. Inside the cave,  ', 'source_text' => 'Mereka mengembara ke arah selatan menjauhi Yathrib menuju ke Gua Thaur, tersembunyi di celah-celah tebing tinggi. Di dalam gua itu,', 'order' => 1],
            ['start_time' => 8.88, 'end_time' => 14.879, 'target_text' => 'Abu Bakr\'s breath trembled. Oh messenger of  Allah, peace be upon him, if they look down,  ', 'source_text' => 'nafas Abu Bakr bergetar bimbang. "Wahai Rasulullah SAW, sekiranya mereka melihat ke bawah,', 'order' => 2],
            ['start_time' => 14.88, 'end_time' => 24.879, 'target_text' => 'they will see us. But the prophet  peace be upon him said calmly,', 'source_text' => 'nescaya mereka akan melihat kita." Namun Nabi SAW bersabda dengan penuh ketenangan,', 'order' => 3],
            ['start_time' => 24.88, 'end_time' => 29.199, 'target_text' => '"My beloved brothers and sisters, tonight  we walk with the messenger of Allah,  ', 'source_text' => '"Saudara-saudariku yang dikasihi, malam ini kita melangkah bersama Rasulullah SAW,', 'order' => 4],
            ['start_time' => 29.2, 'end_time' => 35.599, 'target_text' => 'peace be upon him through one of the most  delicate and sacred moments in history. The  ', 'source_text' => 'merentasi salah satu detik paling genting dan penuh kesucian dalam sejarah. Detik', 'order' => 5],
            ['start_time' => 35.6, 'end_time' => 43.199, 'target_text' => 'moment when faith stepped forward and the world  stepped back. Makkah had rejected the message.  ', 'source_text' => 'tatkala keimanan melangkah ke hadapan dan dunia berundur ke belakang. Kaum Mekah telah menolak risalah dakwah.', 'order' => 6],
            ['start_time' => 43.2, 'end_time' => 48.239, 'target_text' => 'The believers had been harmed, isolated,  humiliated. But Allah never leaves his  ', 'source_text' => 'Orang-orang beriman disakiti, dipulaukan, dan dihina. Namun Allah tidak pernah sesekali membiarkan', 'order' => 7],
            ['start_time' => 48.24, 'end_time' => 54.639, 'target_text' => 'servants unprotected. And so when the world  closed its doors, Allah opened a road through  ', 'source_text' => 'hamba-hamba-Nya tanpa perlindungan. Maka tatkala dunia menutup rapat pintu-pintunya, Allah membuka laluan merentasi', 'order' => 8],
            ['start_time' => 54.64, 'end_time' => 61.359, 'target_text' => 'the night. This was not a journey of escape. It  was a journey of trust, a journey of protection,  ', 'source_text' => 'kegelapan malam. Ini bukanlah perjalanan melarikan diri, sebaliknya ini ialah perjalanan tawakal, perjalanan perlindungan Ilahi,', 'order' => 9],
            ['start_time' => 61.36, 'end_time' => 67.679, 'target_text' => 'a journey written by the one who commands  the stars above the desert sky. The city  ', 'source_text' => 'perjalanan yang ditakdirkan oleh Tuhan yang menguasai bintang-bintang di dada langit padang pasir. Kota', 'order' => 10],
            ['start_time' => 67.68, 'end_time' => 73.439, 'target_text' => 'of faith was waiting. But between Mecca  and Medina, there were valleys of danger,  ', 'source_text' => 'keimanan sedia menanti. Namun di antara Mekah dan Madinah, terbentang lembah-lembah penuh bahaya,', 'order' => 11],
            ['start_time' => 73.44, 'end_time' => 80.879, 'target_text' => 'hunters searching, and footsteps that had to  move in silence. Yet even in the darkest night,  ', 'source_text' => 'pemburu yang gigih menjejak, dan langkah-langkah yang perlu diatur dalam keheningan yang sunyi. Namun walau dalam malam paling pekat sekalipun,', 'order' => 12],
            ['start_time' => 80.88, 'end_time' => 87.439, 'target_text' => 'the one who guards hearts was watching. So  come with me as we follow the messenger,  ', 'source_text' => 'Tuhan yang memelihara setiap sanubari sentiasa mengawasi. Maka marilah bersama saya tatkala kita menjejaki Rasulullah SAW,', 'order' => 13],
            ['start_time' => 87.44, 'end_time' => 96.48, 'target_text' => 'peace be upon him, on the night when angels  walked beside him, though the world could not see.', 'source_text' => 'pada malam ketika para malaikat mengiringi di sisi Baginda, sekalipun mata kasar dunia tidak dapat melihatnya.', 'order' => 14],
            ['start_time' => 108.4, 'end_time' => 115.759, 'target_text' => 'The night had fallen quietly over Mecca, but the  city was not at peace. In the darkness of Dar  ', 'source_text' => 'Malam melabuhkan tirainya dengan tenang di Mekah, namun kota itu sama sekali tidak berada dalam ketenangan. Dalam kegelapan Dar', 'order' => 15],
            ['start_time' => 115.76, 'end_time' => 121.999, 'target_text' => 'Nadwa, the chiefs of Qur gathered, whispering,  plotting, deciding the fate of one man. Their  ', 'source_text' => 'an-Nadwah, para pembesar Quraisy berhimpun, berbisik-bisik, merancang pakatan jahat, menentukan takdir seorang insan. Kata-kata', 'order' => 16],
            ['start_time' => 122, 'end_time' => 128.719, 'target_text' => 'words were cold, their eyes sharp with fear.  He has divided our people, they said. He must  ', 'source_text' => 'mereka dingin mencengkam, pandangan mata mereka tajam diselubungi ketakutan. "Dia telah memecahbelahkan kaum kita," kata mereka. "Dia mesti', 'order' => 17],
            ['start_time' => 128.72, 'end_time' => 136.479, 'target_text' => 'be stopped. Among them stood Abu Jahal, his pride  burning brighter than the lamps that lit the hall.  ', 'source_text' => 'dihentikan." Antara yang berdiri di situ ialah Abu Jahal, keangkuhannya membakar lebih marak daripada lampu-lampu yang menerangi balairung itu.', 'order' => 18],
            ['start_time' => 136.48, 'end_time' => 144.959, 'target_text' => 'Others suggested exile or imprisonment, but he  insisted, "Let us strike him all at once." So that  ', 'source_text' => 'Sebahagian mencadangkan agar Baginda dibuang negeri atau dipenjarakan, namun dia berkeras, "Marilah kita menyerangnya secara serentak." Supaya', 'order' => 19],
            ['start_time' => 144.96, 'end_time' => 154.24, 'target_text' => 'his blood is upon every tribe. What they did not  know was that Allah had already decreed his plan.', 'source_text' => 'tumpahan darahnya ditanggung oleh setiap kabilah. Apa yang tidak mereka ketahui ialah Allah telah pun menetapkan perancangan-Nya.', 'order' => 20],
            ['start_time' => 158.08, 'end_time' => 165.039, 'target_text' => 'And they plan and Allah plans and Allah  is the best of planners. That same night  ', 'source_text' => '"Dan mereka merancang, serta Allah juga merancang; dan Allah jualah sebaik-baik perancang." Pada malam yang sama,', 'order' => 21],
            ['start_time' => 165.04, 'end_time' => 171.439, 'target_text' => 'in a small house near the Kaa, the prophet  peace be upon him whispered to Ali Abi Talib,  ', 'source_text' => 'di sebuah rumah kecil berhampiran Kaabah, Nabi SAW berbisik kepada Ali bin Abi Talib RA,', 'order' => 22],
            ['start_time' => 171.44, 'end_time' => 177.439, 'target_text' => '"May Allah be pleased with him, sleep in  my bed," he said softly. "And fear not,  ', 'source_text' => '"Tidurlah di atas katilku," sabda Baginda dengan lembut. "Dan janganlah kamu berasa takut,', 'order' => 23],
            ['start_time' => 177.44, 'end_time' => 184.399, 'target_text' => 'they will do you no harm." Ali, may Allah be  pleased with him, nodded. His heart steady  ', 'source_text' => 'mereka tidak akan mampu memudaratkanmu sedikit pun." Ali RA mengangguk akur. Sanubarinya teguh', 'order' => 24],
            ['start_time' => 184.4, 'end_time' => 190.239, 'target_text' => 'with faith as the messenger peace be upon him  prepared to leave the city of his birth. The  ', 'source_text' => 'dengan keimanan tatkala Rasulullah SAW bersiap untuk meninggalkan tanah tumpah darahnya. Sebuah', 'order' => 25],
            ['start_time' => 190.24, 'end_time' => 199.599, 'target_text' => 'city that had mocked him yet one he loved deeply.  Before dawn the assassins surrounded his door,  ', 'source_text' => 'kota yang pernah mengejeknya namun amat dicintai Baginda sedalam-dalamnya. Sebelum fajar menyingsing, para pembunuh mengepung pintu rumahnya,', 'order' => 26],
            ['start_time' => 199.6, 'end_time' => 206.639, 'target_text' => 'swords drawn, eyes fixed, waiting for sleep  to claim him. But the prophet peace be upon  ', 'source_text' => 'pedang terhunus, mata terpaku memandang, menantikan Baginda terlena. Namun Nabi SAW', 'order' => 27],
            ['start_time' => 206.64, 'end_time' => 222.719, 'target_text' => 'him stepped outside unseen a handful of dust  in his blessed hand reciting the words of', 'source_text' => 'melangkah keluar tanpa disedari dengan segenggam debu pasir di tangan Baginda yang penuh keberkatan, sambil membaca kalam firman', 'order' => 28],
            ['start_time' => 222.72, 'end_time' => 228.559, 'target_text' => 'and we placed a barrier before them and a barrier  behind them and we covered them so they cannot  ', 'source_text' => '"Dan Kami adakan di hadapan mereka sekatan dan di belakang mereka sekatan, lalu Kami tutup pandangan mereka sehingga mereka tidak dapat', 'order' => 29],
            ['start_time' => 228.56, 'end_time' => 236.799, 'target_text' => 'see. He scattered the dust upon their heads one  by one and walked past them into the night. Not  ', 'source_text' => 'melihat." Baginda menaburkan debu ke atas kepala mereka seorang demi seorang dan melintasi mereka menembusi kegelapan malam. Tiada', 'order' => 30],
            ['start_time' => 236.8, 'end_time' => 246.239, 'target_text' => 'a single eye saw him. When the city awoke,  rage filled Qures. They searched every path,  ', 'source_text' => 'sepasang mata pun yang dapat melihat Baginda. Apabila kota itu tersedar, kemarahan membara melanda Quraisy. Mereka memeriksa setiap lorong,', 'order' => 31],
            ['start_time' => 246.24, 'end_time' => 251.999, 'target_text' => 'every valley. A reward was offered a 100  camels for whoever captured him. But the  ', 'source_text' => 'setiap ceruk lembah. Tawaran ganjaran 100 ekor unta diumumkan bagi sesiapa sahaja yang berjaya menangkap Baginda. Namun', 'order' => 32],
            ['start_time' => 252, 'end_time' => 259.199, 'target_text' => 'prophet peace be upon him was already on his way.  Accompanied by his loyal friend Abu Bakr Sudik.  ', 'source_text' => 'Nabi SAW telah pun memulakan perjalanan. Ditemani oleh sahabat setianya, Abu Bakr As-Siddiq RA.', 'order' => 33],
            ['start_time' => 259.2, 'end_time' => 266.639, 'target_text' => 'May Allah be pleased with him. They traveled  south away from Ythre to the cave of Thor,  ', 'source_text' => 'Semoga Allah meredainya. Mereka mengembara ke arah selatan menjauhi Yathrib menuju ke Gua Thaur,', 'order' => 34],
            ['start_time' => 266.64, 'end_time' => 273.439, 'target_text' => 'hidden among the cliffs. There they rested  as Quresh searched the desert. Their horses  ', 'source_text' => 'yang tersembunyi di celah-celah tebing curam. Di situlah mereka berehat tatkala kaum Quraisy memburu di padang pasir. Kuda-kuda mereka', 'order' => 35],
            ['start_time' => 273.44, 'end_time' => 280.959, 'target_text' => 'kicking up dust beneath the sun. Inside the cave,  Abu Bakr\'s breath trembled. Oh messenger of Allah  ', 'source_text' => 'menerbangkan debu di bawah terik mentari. Di dalam gua itu, nafas Abu Bakr bergetar bimbang. "Wahai Rasulullah,', 'order' => 36],
            ['start_time' => 280.96, 'end_time' => 291.039, 'target_text' => 'peace be upon him if they look down they will see  us but the prophet peace be upon him said calmly', 'source_text' => 'sekiranya mereka melihat ke bawah nescaya mereka akan nampak kita." Tetapi Nabi SAW bersabda dengan tenang,', 'order' => 37],
            ['start_time' => 291.04, 'end_time' => 298.959, 'target_text' => 'don\'t be afraid indeed Allah is with us above the  cave\'s entrance it is said that a spider spun its  ', 'source_text' => '"Janganlah takut, sesungguhnya Allah bersama kita." Di atas pintu masuk gua itu, diriwayatkan bahawa seekor labah-labah telah menganyam', 'order' => 38],
            ['start_time' => 298.96, 'end_time' => 306.799, 'target_text' => 'web and a dove built its nest a veil woven by the  decree of the Almighty when the pursuers arrived  ', 'source_text' => 'sarangnya dan seekor merpati membina sarangnya—suatu hijab perlindungan yang ditenun dengan takdir Yang Maha Kuasa. Tatkala para pemburu tiba,', 'order' => 39],
            ['start_time' => 306.8, 'end_time' => 314.719, 'target_text' => 'they saw this web untouched they turned turned  away saying had they entered the web would not  ', 'source_text' => 'mereka melihat sarang labah-labah ini tidak terusik, lalu mereka berpaling seraya berkata, "Sekiranya mereka masuk nescaya sarang ini tidak', 'order' => 40],
            ['start_time' => 314.72, 'end_time' => 322.559, 'target_text' => 'still be there in Mecca Ali Abi Talib may Allah  be pleased with him returned the trusts that had  ', 'source_text' => 'akan kekal di sini." Di Mekah pula, Ali bin Abi Talib RA mengembalikan segala barang amanah yang pernah', 'order' => 41],
            ['start_time' => 322.56, 'end_time' => 327.999, 'target_text' => 'been kept with the prophet peace be upon him even  those who plotted against him had once left their  ', 'source_text' => 'disimpan di bawah jagaan Nabi SAW. Malahan mereka yang berpakat membunuh Baginda pun pernah meninggalkan', 'order' => 42],
            ['start_time' => 328, 'end_time' => 337.679, 'target_text' => 'belongings in his care for even his enemies knew  his truthfulness meanwhile as bintak may Allah  ', 'source_text' => 'harta benda mereka dalam amanahnya, kerana musuh-musuh Baginda sendiri mengakui kejujurannya. Sementara itu, Asma\' bint Abi Bakr RA', 'order' => 43],
            ['start_time' => 337.68, 'end_time' => 343.999, 'target_text' => 'be pleased with her secretly carried food to the  cave. Her courage was struck by the cruelty of Abu  ', 'source_text' => 'secara sembunyi-sembunyi menghantar bekalan makanan ke gua itu. Keberaniannya diuji oleh kekejaman Abu', 'order' => 44],
            ['start_time' => 344, 'end_time' => 351.119, 'target_text' => 'Jahal, who slapped her in fury, but her resolve  did not break. She would later be known as Datain,  ', 'source_text' => 'Jahal yang menampar wajahnya dalam kemarahan meluap-luap, namun keazaman Asma\' tidak pernah goyah. Beliau kemudiannya dikenali sebagai Dhat an-Nitaqayn,', 'order' => 45],
            ['start_time' => 351.12, 'end_time' => 358.879, 'target_text' => 'the woman of two belts, for she tore her  sash in two, one half to tie the food,  ', 'source_text' => '"Wanita Pemilik Dua Tali Pinggang", kerana beliau mengoyakkan kain ikat pinggangnya menjadi dua—satu bahagian untuk mengikat bekalan makanan,', 'order' => 46],
            ['start_time' => 358.88, 'end_time' => 367.359, 'target_text' => 'the other to carry it. After three nights, the  path was clear. A hired guide Abdullah led them  ', 'source_text' => 'dan satu lagi untuk membawanya. Selepas tiga malam berlalu, laluan menjadi selamat. Seorang penunjuk jalan upahan, Abdullah ibn Urayqit, memandu mereka', 'order' => 47],
            ['start_time' => 367.36, 'end_time' => 375.039, 'target_text' => 'through untridden ways away from the main roads  of Quraysh. By day they hid among the rocks.  ', 'source_text' => 'melalui denai-denai yang jarang dilalui, jauh daripada laluan utama kaum Quraisy. Pada waktu siang mereka berlindung di celah batu-batan.', 'order' => 48],
            ['start_time' => 375.04, 'end_time' => 382.959, 'target_text' => 'By night they rode beneath the stars. Each step  carried a weight of sacrifice. Homes abandoned,  ', 'source_text' => 'Pada waktu malam mereka menunggang di bawah bimbingan gemerlap bintang. Setiap langkah sarat dengan nilai pengorbanan. Rumah-rumah ditinggalkan,', 'order' => 49],
            ['start_time' => 382.96, 'end_time' => 389.279, 'target_text' => 'wealth forsaken. All for the sake  of Allah. When they neared Medina,  ', 'source_text' => 'harta benda dilepaskan. Semuanya demi kerana Allah. Tatkala mereka menghampiri Madinah,', 'order' => 50],
            ['start_time' => 389.28, 'end_time' => 397.279, 'target_text' => 'the air was filled with anticipation. The people  of Yatri now the Ansar had long awaited him. They  ', 'source_text' => 'suasana diselubungi debaran kerinduan. Penduduk Yathrib yang kini bergelar kaum Ansar telah lama menantikan ketibaan Baginda. Mereka', 'order' => 51],
            ['start_time' => 397.28, 'end_time' => 403.199, 'target_text' => 'climbed rooftops looked to the horizon each  morning and finally one day someone cried,  ', 'source_text' => 'memanjat bumbung-bumbung rumah memandang ke kaki langit setiap pagi, dan akhirnya pada suatu hari kedengaran seseorang melaungkan,', 'order' => 52],
            ['start_time' => 403.2, 'end_time' => 409.919, 'target_text' => '"The messenger of Allah has arrived. Joy swept  the city. Men, women, and children poured into  ', 'source_text' => '"Rasulullah telah tiba!" Kegembiraan yang tidak terperi menyelubungi segenap kota. Kaum lelaki, wanita, dan kanak-kanak berpusu-pusu keluar ke', 'order' => 53],
            ['start_time' => 409.92, 'end_time' => 419.679, 'target_text' => 'the streets. The full moon has risen upon us."  And thus began the new dawn, the dawn of Hijra,  ', 'source_text' => 'jalan-jalan raya. "Telah terbit bulan purnama ke atas kita!" Dan bermulalah fajar baharu, fajar peristiwa agung Hijrah,', 'order' => 54],
            ['start_time' => 419.68, 'end_time' => 425.999, 'target_text' => 'the migration that would mark not just a journey  across the desert, but the turning of an age  ', 'source_text' => 'penghijrahan yang bukan sekadar menandakan sebuah perjalanan merentasi gurun pasir, tetapi titik peralihan zaman,', 'order' => 55],
            ['start_time' => 426, 'end_time' => 435.119, 'target_text' => 'from persecution to freedom, from darkness to  light. And so, step by step, shape by shape,  ', 'source_text' => 'daripada penindasan kepada kebebasan, daripada kegelapan kepada cahaya. Begitulah, langkah demi langkah, bayangan demi bayangan,', 'order' => 56],
            ['start_time' => 435.12, 'end_time' => 443.519, 'target_text' => 'in the moonlit sand, the journey continued. Behind  him, a city that rejected, ahead of him, a city  ', 'source_text' => 'di atas pasir yang diterangi rembulan, perjalanan itu diteruskan. Di belakang Baginda, sebuah kota yang menolak; di hadapan Baginda, sebuah kota', 'order' => 57],
            ['start_time' => 443.52, 'end_time' => 451.119, 'target_text' => 'that waited with love, and in between a cave  where fear tried to enter, but faith stood like  ', 'source_text' => 'yang menanti penuh kecintaan; dan di antara kedua-duanya tersergam sebuah gua di mana ketakutan cuba merasuk, namun keimanan teguh berdiri laksana', 'order' => 58],
            ['start_time' => 451.12, 'end_time' => 460.159, 'target_text' => 'a mountain. If they look down, they will see us.  But Allah is nearer than sight, nearer than fear,  ', 'source_text' => 'gunung yang gagah. Sekiranya mereka memandang ke bawah, mereka akan melihat kita. Tetapi Allah jauh lebih hampir daripada pandangan mata, lebih hampir daripada ketakutan,', 'order' => 59],
            ['start_time' => 460.16, 'end_time' => 468.399, 'target_text' => 'nearer than every heartbeat in the night. This  journey teaches us when the world closes in, Allah  ', 'source_text' => 'dan lebih hampir daripada setiap degupan jantung di keheningan malam. Perjalanan ini mengajarkan kita bahawa tatkala dunia terasa sempit menghimpit, Allah', 'order' => 60],
            ['start_time' => 468.4, 'end_time' => 477.279, 'target_text' => 'opens a path no one can block. When the world says  there is no way, Allah says walk. I am with you.  ', 'source_text' => 'membuka jalan yang tidak mampu dihalang oleh sesiapapun. Tatkala dunia berkata tiada lagi jalan keluar, Allah berfirman: Melangkahlah, Aku bersamamu.', 'order' => 61],
            ['start_time' => 477.28, 'end_time' => 482.479, 'target_text' => 'And soon by the will of the most merciful, the  messenger peace be upon him would arrive to a  ', 'source_text' => 'Dan tidak lama lagi dengan kehendak Tuhan Yang Maha Pengasih, Rasulullah SAW akan tiba di sebuah', 'order' => 62],
            ['start_time' => 482.48, 'end_time' => 490.319, 'target_text' => 'city that would open its arms and history would  turn its page. In the next episode, inshallah,  ', 'source_text' => 'kota yang menyambut Baginda dengan tangan terbuka, dan sejarah akan membuka lembaran baharu. Dalam episod akan datang, insya-Allah,', 'order' => 63],
            ['start_time' => 490.32, 'end_time' => 498.32, 'target_text' => 'we witness the birth of a new home, a home of  peace, brotherhood, and unity. Oh, Allah Muhammad', 'source_text' => 'kita akan menyaksikan kelahiran sebuah tanah air baharu—tanah air kedamaian, persaudaraan, dan perpaduan. Ya Allah, selawat ke atas Nabi Muhammad SAW.', 'order' => 64],
        ];

        $now = now();
        foreach (array_chunk($subtitles, 50) as $chunk) {
            $insertData = [];
            foreach ($chunk as $sub) {
                $insertData[] = [
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
            DB::table('video_subtitles')->insert($insertData);
        }
    }
}
