<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo31Seeder extends Seeder
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

        // Special Bilingual Religious Video #31 (Siri 1 Ep.26): The Conquest of Makkah | Life of the Final Messenger ﷺ | Ep.26 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'TsjC5a7AwYU'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Conquest of Makkah | Life of the Final Messenger ﷺ | Ep.26 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/TsjC5a7AwYU/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 31,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.16, 'end_time' => 6.08, 'target_text' => 'The Prophet peace be upon him smiled gently and said, "Go, Abu Sufyan. Whoever enters your', 'source_text' => 'Nabi ﷺ tersenyum lembut seraya bersabda, "Pergilah wahai Abu Sufyan. Sesiapa yang memasuki', 'order' => 1],
            ['start_time' => 6.08, 'end_time' => 12.08, 'target_text' => 'house will be safe. I say to you as Yusuf said to his brothers: \'No blame shall be', 'source_text' => 'rumahmu, dia akan selamat. Aku berkata kepadamu sebagaimana Nabi Yusuf berkata kepada saudara-saudaranya: \'Tiada celaan ke atas kamu', 'order' => 2],
            ['start_time' => 12.08, 'end_time' => 20.4, 'target_text' => 'upon you today. Go, for you are all free.\'" My beloved brothers and sisters,', 'source_text' => 'pada hari ini. Pergilah, kerana kamu semua kini bebas.\'" Saudara dan saudariku yang dikasihi,', 'order' => 3],
            ['start_time' => 20.4, 'end_time' => 27.28, 'target_text' => 'there are moments in history when the world pauses to witness the true meaning of greatness. Years', 'source_text' => 'terdapat detik-detik dalam lipatan sejarah tatkala seisi dunia terpegun menyaksikan erti keagungan yang sebenar. Bertahun-tahun', 'order' => 4],
            ['start_time' => 27.28, 'end_time' => 34, 'target_text' => 'had passed since the believers were driven from Makkah — their homes taken, their families torn,', 'source_text' => 'telah berlalu sejak kaum mukminin diusir kejam dari kota Makkah — kediaman mereka dirampas, sanak saudara dipisahkan,', 'order' => 5],
            ['start_time' => 34, 'end_time' => 42.56, 'target_text' => 'their dignity tested. But Allah sees every tear, every sacrifice, every step taken in patience.', 'source_text' => 'maruah mereka diuji. Namun Allah Maha Melihat setiap titisan air mata, setiap pengorbanan, dan setiap langkah yang diharungi dengan penuh kesabaran.', 'order' => 6],
            ['start_time' => 42.56, 'end_time' => 49.2, 'target_text' => 'And when the time is right, He returns honor to those who held firm. The Prophet peace be upon', 'source_text' => 'Dan apabila tiba saat yang dijanjikan, Dia mengembalikan kemuliaan kepada mereka yang teguh berpegang pada kebenaran. Nabi', 'order' => 7],
            ['start_time' => 49.2, 'end_time' => 55.52, 'target_text' => 'him did not return to Makkah as a conqueror seeking victory, but as a messenger of mercy.', 'source_text' => 'ﷺ tidak kembali ke Makkah sebagai seorang penakluk yang memburu kemenangan, sebaliknya sebagai rasul pembawa rahmat.', 'order' => 8],
            ['start_time' => 55.52, 'end_time' => 62.8, 'target_text' => 'His strength was gentle. His authority was compassionate. His triumph was forgiveness.', 'source_text' => 'Kekuatan baginda diselubungi kelembutan. Kewibawaan baginda sarat dengan belas kasihan. Kemenangan baginda adalah kemaafan.', 'order' => 9],
            ['start_time' => 62.8, 'end_time' => 77.6, 'target_text' => 'So come with me to the day when the doors of the sacred city opened not to the sword, but to mercy.', 'source_text' => 'Maka hayutilah bersama saya hari tatkala pintu-pintu kota suci terbuka bukan kerana libasan pedang, melainkan kerana rahmat kasih sayang.', 'order' => 10],
            ['start_time' => 84.96, 'end_time' => 92.8, 'target_text' => 'Eight years had passed since the Prophet peace be upon him and his companions left Makkah — hearts heavy,', 'source_text' => 'Lapan tahun telah berlalu sejak Nabi ﷺ dan para sahabat baginda meninggalkan Makkah — dengan hati yang sayu,', 'order' => 11],
            ['start_time' => 92.8, 'end_time' => 100.72, 'target_text' => 'driven from their homes. Now, as the dawn of the eighth year after Hijrah broke over Medina,', 'source_text' => 'terusir dari kampung halaman mereka. Kini, tatkala fajar tahun kelapan Hijrah menyingsing di Madinah,', 'order' => 12],
            ['start_time' => 100.72, 'end_time' => 108.48, 'target_text' => 'revelation came: it was time to return. After Quraysh broke the treaty of al-Hudaybiyyah,', 'source_text' => 'wahyu Ilahi turun: sudah tiba masanya untuk kembali. Setelah pihak Quraisy mengkhianati Perjanjian Hudaibiyyah,', 'order' => 13],
            ['start_time' => 108.48, 'end_time' => 114.8, 'target_text' => 'aiding Banu Bakr in attacking the tribe of Khuza\'ah, the Prophet peace be upon him declared:', 'source_text' => 'membantu Bani Bakr menyerang kabilah Khuza\'ah yang bersekutu dengan Islam, Nabi ﷺ mengisytiharkan:', 'order' => 14],
            ['start_time' => 114.8, 'end_time' => 122.88, 'target_text' => '"This is treachery, and Allah has permitted Makkah to be opened." He commanded silence', 'source_text' => '"Ini adalah suatu pengkhianatan, dan Allah telah mengizinkan kota Makkah untuk dibuka." Baginda memerintahkan kerahsiaan', 'order' => 15],
            ['start_time' => 122.88, 'end_time' => 132.4, 'target_text' => 'and secrecy. 10,000 believers marched beneath the moonlight. No war drums, no banners of arrogance —', 'source_text' => 'dan pergerakan tanpa bunyi. Sepuluh ribu orang beriman berarak mara di bawah sinaran rembulan. Tiada paluan gendang perang, tiada panji-panji keangkuhan —', 'order' => 16],
            ['start_time' => 132.4, 'end_time' => 140, 'target_text' => 'only hearts filled with gratitude and awe. The Prophet peace be upon him advanced toward Makkah,', 'source_text' => 'hanyalah sanubari yang dipenuhi kesyukuran dan takzim. Nabi ﷺ mara menuju ke Makkah,', 'order' => 17],
            ['start_time' => 140, 'end_time' => 147.92, 'target_text' => 'setting camp at Marr al-Zahran, a valley near the city. That night, fires lit the', 'source_text' => 'mendirikan khemah di Marr al-Zahran, sebuah lembah berhampiran kota itu. Pada malam tersebut, unggun api menyala di', 'order' => 18],
            ['start_time' => 147.92, 'end_time' => 157.12, 'target_text' => 'horizon: 10,000 flames shimmering like a sea of light. Quraysh was struck with fear. Abu Sufyan,', 'source_text' => 'kaki langit: 10,000 nyalaan api berkilauan bagai lautan cahaya. Quraisy diselubungi ketakutan yang amat dahsyat. Abu Sufyan,', 'order' => 19],
            ['start_time' => 157.12, 'end_time' => 164.4, 'target_text' => 'still among the leaders of Makkah, went forth to learn the truth. Captured by al-Abbas,', 'source_text' => 'yang masih menjadi antara pemimpin utama Makkah, keluar untuk meninjau keadaan sebenar. Setelah ditahan oleh al-Abbas,', 'order' => 20],
            ['start_time' => 164.4, 'end_time' => 170.32, 'target_text' => 'the Prophet\'s uncle, he was brought before the Messenger, peace be upon him. The Prophet peace', 'source_text' => 'bapa saudara Nabi ﷺ, beliau dibawa menghadap Rasulullah ﷺ. Nabi', 'order' => 21],
            ['start_time' => 170.32, 'end_time' => 177.36, 'target_text' => 'be upon him looked at him with calm dignity and said, "Woe to you, Abu Sufyan! Has the time not', 'source_text' => 'ﷺ memandangnya dengan ketenangan dan wibawa seraya bersabda, "Celakalah engkau, wahai Abu Sufyan! Tidakkah sudah tiba', 'order' => 22],
            ['start_time' => 177.36, 'end_time' => 184.96, 'target_text' => 'come for you to recognize that there is no god but Allah?" Abu Sufyan trembled: "By Allah, had', 'source_text' => 'masanya untuk engkau mengakui bahawa tiada Tuhan selain Allah?" Abu Sufyan menggeletar: "Demi Allah, sekiranya', 'order' => 23],
            ['start_time' => 184.96, 'end_time' => 190.72, 'target_text' => 'there been another god besides Allah, he would have helped me by now." "And has the time not come', 'source_text' => 'ada tuhan selain Allah, nescaya dia sudah membantuku sekarang." "Dan tidakkah tiba masanya', 'order' => 24],
            ['start_time' => 190.72, 'end_time' => 197.84, 'target_text' => 'for you to know that I am the Messenger of Allah?" Abu Sufyan replied, "By my father and mother, how', 'source_text' => 'untuk engkau meyakini bahawa aku adalah utusan Allah?" Abu Sufyan menjawab, "Demi ayah dan ibuku, betapa', 'order' => 25],
            ['start_time' => 197.84, 'end_time' => 204.56, 'target_text' => 'forbearing and noble you are! Indeed, I testify you are the Messenger of Allah." The Prophet', 'source_text' => 'penyantun dan mulianya dirimu! Sesungguhnya aku bersaksi bahawa engkau adalah utusan Allah." Nabi', 'order' => 26],
            ['start_time' => 204.56, 'end_time' => 212.32, 'target_text' => 'peace be upon him smiled gently and said, "Go, Abu Sufyan. Whoever enters your house will be safe.', 'source_text' => 'ﷺ tersenyum lembut seraya bersabda, "Pergilah wahai Abu Sufyan. Sesiapa yang memasuki rumahmu, dia akan selamat.', 'order' => 27],
            ['start_time' => 212.32, 'end_time' => 219.68, 'target_text' => 'Whoever enters the Sacred Mosque will be safe. Whoever closes his door will be safe." At dawn,', 'source_text' => 'Sesiapa yang memasuki Masjidil Haram, dia akan selamat. Dan sesiapa yang menutup pintunya, dia juga akan selamat." Tatkala fajar menyingsing,', 'order' => 28],
            ['start_time' => 219.68, 'end_time' => 226.16, 'target_text' => 'the gates of Makkah opened. The Prophet peace be upon him entered humbly — not as a conqueror,', 'source_text' => 'pintu-pintu kota Makkah terbuka luas. Nabi ﷺ memasukinya dengan penuh tawaduk — bukan sebagai penakluk yang megah,', 'order' => 29],
            ['start_time' => 226.16, 'end_time' => 234.16, 'target_text' => 'but as a servant of Allah. His head bowed low upon his camel, so close it nearly touched the saddle.', 'source_text' => 'melainkan sebagai hamba Allah yang bersyukur. Baginda menundukkan kepalanya begitu rendah di atas untanya, hingga janggut baginda hampir mencecah pelana.', 'order' => 30],
            ['start_time' => 234.16, 'end_time' => 241.2, 'target_text' => 'He recited, "Indeed, We have given you a clear victory, that Allah may forgive', 'source_text' => 'Baginda mengalunkan ayat: "Sesungguhnya Kami telah membuka bagi perjuanganmu kemenangan yang nyata, supaya Allah mengampunkan', 'order' => 31],
            ['start_time' => 241.2, 'end_time' => 255.52, 'target_text' => 'you your past and future sins, and complete His favor upon you, and guide you to a straight path."', 'source_text' => 'kesalahanmu yang telah lalu dan yang terkemudian, serta menyempurnakan nikmat-Nya kepadamu, dan memimpinmu ke jalan yang lurus."', 'order' => 32],
            ['start_time' => 262.8, 'end_time' => 268.32, 'target_text' => 'As he entered, the Prophet peace be upon him ordered that no blood be shed except', 'source_text' => 'Sebaik melangkah masuk, Nabi ﷺ memerintahkan agar tiada darah yang ditumpahkan melainkan', 'order' => 33],
            ['start_time' => 268.32, 'end_time' => 275.36, 'target_text' => 'against those who had openly betrayed and persecuted the believers. Yet even most of', 'source_text' => 'terhadap segelintir penjenayah tegar yang secara terang-terangan mengkhianati dan menzalimi kaum mukminin. Namun sebahagian besar daripada', 'order' => 34],
            ['start_time' => 275.36, 'end_time' => 282.32, 'target_text' => 'them were forgiven that day. It would forever be known as the Day of Mercy.', 'source_text' => 'mereka turut diampunkan pada hari itu. Detik itu kekal abadi dalam sejarah sebagai Hari Rahmat dan Kemaafan.', 'order' => 35],
            ['start_time' => 282.32, 'end_time' => 288.8, 'target_text' => 'The Prophet peace be upon him went straight to the Ka\'bah. Around it stood 360 idols —', 'source_text' => 'Nabi ﷺ terus melangkah menuju ke Kaabah. Di sekelilingnya terpacak 360 buah berhala —', 'order' => 36],
            ['start_time' => 288.8, 'end_time' => 302.08, 'target_text' => 'towering symbols of ignorance. With a staff in his hand, he struck them down one by one, reciting:', 'source_text' => 'lambang kejahilan zaman berzaman. Berbekalkan sebatang tongkat di tangan, baginda menumbangkannya satu demi satu seraya membaca:', 'order' => 37],
            ['start_time' => 302.08, 'end_time' => 311.52, 'target_text' => '"Truth has indeed come, and falsehood has vanished. Indeed, falsehood is ever bound to vanish!" As the', 'source_text' => '"Telah datang kebenaran, dan lenyaplah kepalsuan. Sesungguhnya kepalsuan itu pasti akan lenyap!" Tatkala', 'order' => 38],
            ['start_time' => 311.52, 'end_time' => 317.44, 'target_text' => 'idols shattered and fell, the voices of the believers echoed: "Allahu Akbar! Allahu Akbar!"', 'source_text' => 'berhala-berhala itu hancur berkecai menyembah bumi, suara kaum mukminin bergema melaungkan: "Allahu Akbar! Allahu Akbar!"', 'order' => 39],
            ['start_time' => 317.44, 'end_time' => 323.12, 'target_text' => 'The Prophet peace be upon him entered the Ka\'bah where he prayed in its sacred shadow —', 'source_text' => 'Nabi ﷺ melangkah masuk ke dalam Kaabah lalu mendirikan solat di bawah bayang sucinya —', 'order' => 40],
            ['start_time' => 323.12, 'end_time' => 330.08, 'target_text' => 'a prayer of gratitude, not triumph. The people of Makkah stood before him — the same faces that', 'source_text' => 'solat kesyukuran seorang hamba, bukan keangkuhan penakluk. Penduduk Makkah berdiri cemas di hadapan baginda — wajah-wajah yang dahulunya', 'order' => 41],
            ['start_time' => 330.08, 'end_time' => 337.52, 'target_text' => 'had once mocked and stoned him. He said, his voice gentle yet firm, "O people of Quraysh,', 'source_text' => 'pernah mengejek dan membaling batu ke arah baginda. Baginda bersabda dengan suara yang lembut namun tegas, "Wahai kaum Quraisy,', 'order' => 42],
            ['start_time' => 337.52, 'end_time' => 345.12, 'target_text' => 'what do you think I will do to you today?" They said trembling, "You are a noble brother,', 'source_text' => 'apakah yang kamu sangka akan aku lakukan terhadap kamu pada hari ini?" Mereka menjawab dalam ketakutan, "Engkau adalah saudara yang mulia,', 'order' => 43],
            ['start_time' => 345.12, 'end_time' => 352.96, 'target_text' => 'son of a noble brother." He said, "I say to you, as Yusuf said to his brothers: \'No blame shall be', 'source_text' => 'anak kepada saudara yang mulia." Baginda bersabda, "Aku berkata kepada kamu sebagaimana Nabi Yusuf berkata kepada saudara-saudaranya: \'Tiada celaan', 'order' => 44],
            ['start_time' => 352.96, 'end_time' => 360.72, 'target_text' => 'upon you today. Go, for you are all free!\'" Tears filled the eyes of men and women who had once', 'source_text' => 'ke atas kamu pada hari ini. Pergilah, kerana kamu semua kini bebas!\'" Air mata mengalir membasahi pipi lelaki dan wanita yang dahulunya', 'order' => 45],
            ['start_time' => 360.72, 'end_time' => 366.88, 'target_text' => 'denied him. They lowered their heads saying, "You are truly the Messenger of Allah." One by one,', 'source_text' => 'menentang baginda. Mereka menundukkan kepala seraya bersaksi, "Sesungguhnya engkau benar-benar utusan Allah." Satu demi satu,', 'order' => 46],
            ['start_time' => 366.88, 'end_time' => 372.64, 'target_text' => 'Quraysh came forth to embrace Islam. The Prophet peace be upon him stood at the Ka\'bah and raised', 'source_text' => 'pembesar Quraisy mara menyatakan keislaman mereka. Nabi ﷺ berdiri di hadapan pintu Kaabah lalu melaungkan', 'order' => 47],
            ['start_time' => 372.64, 'end_time' => 379.68, 'target_text' => 'his voice: "There is no superiority of an Arab over a non-Arab, nor a non-Arab over an Arab.', 'source_text' => 'seruannya: "Tiada kelebihan orang Arab ke atas orang bukan Arab, dan tiada kelebihan orang bukan Arab ke atas orang Arab.', 'order' => 48],
            ['start_time' => 379.68, 'end_time' => 386.96, 'target_text' => 'The most honored of you in the sight of Allah is the most righteous among you." He appointed Bilal,', 'source_text' => 'Sesungguhnya orang yang paling mulia di antara kamu di sisi Allah ialah orang yang paling bertakwa di antara kamu." Baginda mengarahkan Bilal bin Rabah RA,', 'order' => 49],
            ['start_time' => 386.96, 'end_time' => 393.52, 'target_text' => 'may Allah be pleased with him, to ascend the Ka\'bah and call the first Adhan in Makkah. His voice rang', 'source_text' => 'semoga Allah meredhainya, untuk memanjat bumbung Kaabah dan melaungkan azan pertama di kota Makkah. Suaranya bergema merdu', 'order' => 50],
            ['start_time' => 393.52, 'end_time' => 401.28, 'target_text' => 'through the valleys: "Allahu Akbar! Allahu Akbar!" The sound reached every home, every heart. Even the', 'source_text' => 'merentasi segenap lembah bukit: "Allahu Akbar! Allahu Akbar!" Seruan itu menyentuh setiap rumah dan setiap sudut hati. Malah para', 'order' => 51],
            ['start_time' => 401.28, 'end_time' => 408.32, 'target_text' => 'elders of Quraysh, once fierce enemies, wept. The Prophet peace be upon him stood before the House', 'source_text' => 'pemimpin Quraisy yang dahulunya musuh ketat turut menangis terharu. Nabi ﷺ berdiri di hadapan Baitullah,', 'order' => 52],
            ['start_time' => 408.32, 'end_time' => 415.76, 'target_text' => 'of Allah — the same House built by Ibrahim, peace be upon him. He had entered Makkah with mercy,', 'source_text' => 'rumah suci yang dahulunya dibina oleh Nabi Ibrahim AS. Baginda memasuki Makkah dengan rahmat,', 'order' => 53],
            ['start_time' => 415.76, 'end_time' => 424.24, 'target_text' => 'purified it with truth, and restored its sanctity to the worship of one God: "When the victory of', 'source_text' => 'menyucikannya dengan kebenaran, dan mengembalikan kesuciannya untuk mengabdikan diri kepada Tuhan yang Maha Esa: "Apabila datang pertolongan', 'order' => 54],
            ['start_time' => 424.24, 'end_time' => 430.56, 'target_text' => 'Allah has come and the conquest, and you see the people entering Allah\'s religion in multitudes,', 'source_text' => 'Allah dan kemenangan pembukaan kota, dan engkau melihat manusia berpusu-pusu masuk ke dalam agama Allah berbondong-bondong,', 'order' => 55],
            ['start_time' => 430.56, 'end_time' => 437.12, 'target_text' => 'then glorify the praises of your Lord and seek His forgiveness. Indeed, He is ever Accepting', 'source_text' => 'maka bertasbihlah dengan memuji Tuhanmu dan mohonlah keampunan-Nya. Sesungguhnya Dia adalah Maha Penerima', 'order' => 56],
            ['start_time' => 437.12, 'end_time' => 444.96, 'target_text' => 'of repentance." The victory of Makkah was not a conquest of land, but of hearts. And from that day,', 'source_text' => 'taubat." Pembukaan kota Makkah bukanlah penaklukan tanah semata-mata, melainkan penaklukan hati sanubari manusia. Dan sejak detik itu,', 'order' => 57],
            ['start_time' => 444.96, 'end_time' => 452, 'target_text' => 'Islam spread not by the sword, but by mercy. And so the Messenger of Allah peace be upon him entered', 'source_text' => 'Islam tersebar luas bukan dengan bilah pedang, melainkan dengan keluasan rahmat. Maka begitulah Rasulullah ﷺ melangkah masuk', 'order' => 58],
            ['start_time' => 452, 'end_time' => 458.56, 'target_text' => 'Makkah with his head bowed in humility, not raised in pride. He forgave those who harmed him. He', 'source_text' => 'ke kota Makkah dengan kepala yang menunduk penuh tawaduk, bukan mendabik dada penuh keangkuhan. Baginda memaafkan mereka yang pernah menyakitinya. Baginda', 'order' => 59],
            ['start_time' => 458.56, 'end_time' => 465.36, 'target_text' => 'protected those who once drove him out. He showed the world that true strength is not in conquering', 'source_text' => 'melindungi mereka yang dahulunya pernah menghalaunya keluar. Baginda membuktikan kepada dunia bahawa kekuatan sejati bukanlah pada menakluki', 'order' => 60],
            ['start_time' => 465.36, 'end_time' => 472.56, 'target_text' => 'cities, but in conquering hearts. This was the victory of light over darkness. And yet the', 'source_text' => 'kota-kota besar, melainkan menawan hati sanubari. Inilah kemenangan cahaya ke atas kegelapan jahiliah. Namun perjalanan dakwah', 'order' => 61],
            ['start_time' => 472.56, 'end_time' => 479.52, 'target_text' => 'journey was not finished. For after the victory of Makkah, the message of Islam would spread beyond', 'source_text' => 'belum berakhir. Kerana selepas pembukaan kota Makkah, risalah Islam bakal melangkaui sempadan', 'order' => 62],
            ['start_time' => 479.52, 'end_time' => 488.08, 'target_text' => 'the peninsula to new lands and new hearts. In the next episode, insha\'Allah, we witness how the ummah', 'source_text' => 'Semenanjung Tanah Arab ke negeri-negeri dan sanubari yang baharu. Dalam episod seterusnya, insya-Allah, kita akan menyaksikan bagaimana umat ini', 'order' => 63],
            ['start_time' => 488.08, 'end_time' => 503.44, 'target_text' => 'carries the message forward in days where faith is tested not by hardship, but by power. Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'menggalas risalah ini ke hadapan tatkala keimanan diuji bukan lagi dengan penderitaan, sebaliknya dengan kekuasaan. Selawat dan salam ke atas junjungan Nabi Muhammad dan seluruh keluarga serta para sahabat baginda sekalian.', 'order' => 64],
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
