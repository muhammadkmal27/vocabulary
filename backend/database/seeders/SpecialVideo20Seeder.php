<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo20Seeder extends Seeder
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

        // Special Bilingual Religious Video #20 (Siri 1 Ep.15): The Battle of Badr | Life of the Final Messenger ﷺ | Ep.15 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'fH49JET37eY'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Battle of Badr | Life of the Final Messenger ﷺ | Ep.15 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/fH49JET37eY/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 20,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.4, 'end_time' => 5.739, 'target_text' => 'The Muslims, just over 300, marched not for war, but for hope.', 'source_text' => 'Orang Islam yang hanya berjumlah sedikit melebihi 300 orang, berarak bukan untuk berperang, tetapi demi harapan.', 'order' => 1],
            ['start_time' => 5.839, 'end_time' => 14.459, 'target_text' => 'When Qur learned of the Muslims approach, they gathered a thousand men, armored, mounted, and proud.', 'source_text' => 'Tatkala Quraisy mengetahui kemaraan umat Islam, mereka menghimpunkan seribu orang tentera berbaju zirah, berkuda, dan angkuh.', 'order' => 2],
            ['start_time' => 14.559, 'end_time' => 19.88, 'target_text' => 'Quraysh fled, leaving behind their pride and their deadman.', 'source_text' => 'Kaum Quraisy lari bertempiaran, meninggalkan keangkuhan dan mayat-mayat tentera mereka.', 'order' => 3],
            ['start_time' => 21.439, 'end_time' => 26.939, 'target_text' => 'My beloved brothers and sisters, there are days in history that do not just pass.', 'source_text' => 'Saudara-saudariku yang dikasihi, ada hari-hari dalam lipatan sejarah yang tidak berlalu begitu sahaja.', 'order' => 4],
            ['start_time' => 27.039, 'end_time' => 29.419, 'target_text' => 'They shape the future of the world.', 'source_text' => 'Hari-hari tersebut mencorakkan masa depan dunia.', 'order' => 5],
            ['start_time' => 29.519, 'end_time' => 31.9, 'target_text' => 'And Bed was one of those days.', 'source_text' => 'Dan Perang Badar merupakan salah satu daripada hari-hari bersejarah itu.', 'order' => 6],
            ['start_time' => 32, 'end_time' => 33.66, 'target_text' => 'The believers were few.', 'source_text' => 'Bilangan orang beriman ketika itu amat sedikit.', 'order' => 7],
            ['start_time' => 33.76, 'end_time' => 39.9, 'target_text' => '70 camels, two horses, little armor, and yet their hearts were filled with certainty.', 'source_text' => 'Hanya 70 ekor unta, dua ekor kuda, sedikit baju zirah, namun sanubari mereka sarat dengan keyakinan yang teguh.', 'order' => 8],
            ['start_time' => 40, 'end_time' => 47.58, 'target_text' => 'Across the valley, Bures marched with pride, their numbers many, and their strength known.', 'source_text' => 'Di seberang lembah, Quraisy berarak penuh kesombongan, bilangan mereka ramai, dan kegagahan mereka terkenal.', 'order' => 9],
            ['start_time' => 47.68, 'end_time' => 53.02, 'target_text' => 'But Allah does not measure victory by numbers, only by hearts.', 'source_text' => 'Namun Allah tidak mengukur kemenangan berdasarkan angka, melainkan melalui keikhlasan sanubari.', 'order' => 10],
            ['start_time' => 53.12, 'end_time' => 57.8, 'target_text' => 'This is the day the heavens join the earth.', 'source_text' => 'Inilah hari tatkala penduduk langit bergabung bersama penduduk bumi.', 'order' => 11],
            ['start_time' => 71.04, 'end_time' => 74.78, 'target_text' => 'Bad, a small valley between Mecca and Medina.', 'source_text' => 'Badar, sebuah lembah kecil di antara Mekah dan Madinah.', 'order' => 12],
            ['start_time' => 74.88, 'end_time' => 77.26, 'target_text' => 'Unremarkable, quiet.', 'source_text' => 'Lembah yang sunyi dan tidak dikenali ramai.', 'order' => 13],
            ['start_time' => 77.36, 'end_time' => 83.9, 'target_text' => 'Yet by the decree of Allah, it would become the stage where the fate of nations turned.', 'source_text' => 'Namun dengan takdir ketetapan Allah, ia menjadi medan penentu di mana takdir bangsa-bangsa beralih arah.', 'order' => 14],
            ['start_time' => 84, 'end_time' => 89.9, 'target_text' => 'The Muslims just over 300 marched not for war but for hope.', 'source_text' => 'Umat Islam yang hanya melebihi 300 orang berarak bukan demi peperangan, tetapi demi membawa harapan.', 'order' => 15],
            ['start_time' => 90, 'end_time' => 98.379, 'target_text' => 'They carried no armor, few swords, little food, but they carried faith, unshakable faith, and the messenger of Allah, peace', 'source_text' => 'Mereka tidak memakai baju besi, hanya ada beberapa bilah pedang, bekalan makanan sedikit, namun mereka membawa keimanan yang tidak goyah, bersama Rasulullah SAW', 'order' => 16],
            ['start_time' => 98.479, 'end_time' => 101.1, 'target_text' => 'be upon him, at their head.', 'source_text' => 'memimpin di barisan hadapan mereka.', 'order' => 17],
            ['start_time' => 101.2, 'end_time' => 105.5, 'target_text' => 'He said, "This is the caravan of Quraysh.', 'source_text' => 'Baginda bersabda, "Inilah kafilah perniagaan Quraisy.', 'order' => 18],
            ['start_time' => 105.6, 'end_time' => 112.22, 'target_text' => 'Allah has promised you one of the two, but Allah had willed a greater victory."', 'source_text' => 'Allah telah menjanjikan kepada kamu salah satu daripada dua kebaikan, namun Allah menghendaki kemenangan yang jauh lebih agung."', 'order' => 19],
            ['start_time' => 112.32, 'end_time' => 120.86, 'target_text' => 'When Quresh learned of the Muslims approach, they gathered a thousand men, armored, mounted, and proud.', 'source_text' => 'Apabila pihak Quraisy mendapat tahu kemaraan kaum Muslimin, mereka mengumpulkan seribu orang pahlawan lengkap berbaju besi, berkuda, dan sombong.', 'order' => 20],
            ['start_time' => 120.96, 'end_time' => 129.98, 'target_text' => 'Abu Jahal roared, "We will not return until we have crushed them." Yet not all hearts shared his hatred.', 'source_text' => 'Abu Jahal melaung bongkak, "Kita tidak akan berundur sehingga kita memusnahkan mereka!" Namun tidak semua hati berkongsi kebenciannya.', 'order' => 21],
            ['start_time' => 130.08, 'end_time' => 133.16, 'target_text' => 'Some like Akna', 'source_text' => 'Sebahagiannya seperti Al-Akhnas bin Syariq', 'order' => 22],
            ['start_time' => 133.44, 'end_time' => 138.139, 'target_text' => 'and Benu Zah turned back, fearing injustice.', 'source_text' => 'dan Bani Zahrah telah berpatah balik kerana enggan bersekongkol dalam kezaliman.', 'order' => 23],
            ['start_time' => 138.239, 'end_time' => 143.1, 'target_text' => 'Still the army advanced, thunder rolling across the desert.', 'source_text' => 'Namun bala tentera musuh tetap mara, bagaikan guruh yang bergema merentasi padang pasir.', 'order' => 24],
            ['start_time' => 143.2, 'end_time' => 149.42, 'target_text' => 'As night fell, the prophet peace be upon him and his companions camped near Badra\'s wells.', 'source_text' => 'Tatkala malam menjelang, Nabi SAW dan para sahabatnya berkhemah berhampiran telaga-telaga Badar.', 'order' => 25],
            ['start_time' => 149.52, 'end_time' => 151.499, 'target_text' => 'He raised his hands in the darkness.', 'source_text' => 'Baginda menadah kedua-dua tangannya ke langit dalam keheningan malam.', 'order' => 26],
            ['start_time' => 151.599, 'end_time' => 156.219, 'target_text' => 'Oh Allah, hear our Qur arrogant and defiant.', 'source_text' => '"Ya Allah, saksikanlah kaum Quraisy ini datang dengan penuh keangkuhan dan penentangan.', 'order' => 27],
            ['start_time' => 156.319, 'end_time' => 157.82, 'target_text' => 'They deny your messenger.', 'source_text' => 'Mereka mendustakan Rasul-Mu.', 'order' => 28],
            ['start_time' => 157.92, 'end_time' => 160.94, 'target_text' => 'Oh Allah, grant me the victory you promised.', 'source_text' => 'Ya Allah, kurniakanlah kepadaku pertolongan dan kemenangan yang telah Engkau janjikan."', 'order' => 29],
            ['start_time' => 161.04, 'end_time' => 163.48, 'target_text' => 'And Allah responded,', 'source_text' => 'Dan Allah memperkenankan doa Baginda:', 'order' => 30],
            ['start_time' => 171.2, 'end_time' => 180.06, 'target_text' => 'When you cried out to your Lord for help, he answered you, "I will reinforce you with a thousand angels rank after rank."', 'source_text' => '"Ingatlah ketika kamu memohon pertolongan kepada Tuhanmu, lalu diperkenankan-Nya bagimu: \'Sesungguhnya Aku akan membantu kamu dengan seribu malaikat yang datang berturut-turut.\'"', 'order' => 31],
            ['start_time' => 180.16, 'end_time' => 183.9, 'target_text' => 'The prophet peace be upon him positioned his men carefully.', 'source_text' => 'Nabi SAW mengatur saf kedudukan para sahabatnya dengan penuh teliti.', 'order' => 32],
            ['start_time' => 184, 'end_time' => 192.779, 'target_text' => 'Placing Mikdad, Omar, and Ali, may Allah be pleased with them, in the front ranks, he said, "Do not rush into battle until', 'source_text' => 'Menempatkan Al-Miqdad, Umar, dan Ali RA di saf hadapan, Baginda berpesan, "Jangan terburu-buru menyerang sehingga', 'order' => 33],
            ['start_time' => 192.879, 'end_time' => 194.859, 'target_text' => 'I command.', 'source_text' => 'aku berikan arahan."', 'order' => 34],
            ['start_time' => 194.959, 'end_time' => 204.46, 'target_text' => 'As dawn broke, rain fell gently over the believers, cooling their hearts and firming the sand beneath their feet.', 'source_text' => 'Tatkala fajar menyingsing, hujan turun membasahi bumi dengan tenang ke atas orang-orang beriman, menyejukkan hati dan memadatkan pasir di bawah derapan kaki mereka.', 'order' => 35],
            ['start_time' => 204.56, 'end_time' => 212.2, 'target_text' => 'But on the other side, Quresh sank in the mud, their arrogance weighed down.', 'source_text' => 'Namun di pihak musuh, Quraisy tenggelam dalam lumpur lecak, keangkuhan mereka menjadi beban yang memberatkan langkah.', 'order' => 36],
            ['start_time' => 212.48, 'end_time' => 216.46, 'target_text' => 'The first to step forward was Ra', 'source_text' => 'Jaguh pertama Quraisy yang melangkah ke hadapan ialah \'Utbah bin Rabi\'ah,', 'order' => 37],
            ['start_time' => 216.56, 'end_time' => 219.56, 'target_text' => 'flanked by his brother Shbah', 'source_text' => 'diiringi oleh saudaranya Syaibah,', 'order' => 38],
            ['start_time' => 219.92, 'end_time' => 222.679, 'target_text' => 'and his son Alwid.', 'source_text' => 'dan anaknya Al-Walid.', 'order' => 39],
            ['start_time' => 222.879, 'end_time' => 227.98, 'target_text' => 'From the Muslim ranks emerged Hari Hamdalib', 'source_text' => 'Dari saf kaum Muslimin mara \'Ubaidah bin al-Harith, Hamzah bin \'Abdil Muttalib,', 'order' => 40],
            ['start_time' => 228.08, 'end_time' => 229.66, 'target_text' => 'and Ali Abi Talib.', 'source_text' => 'dan Ali bin Abi Talib.', 'order' => 41],
            ['start_time' => 229.76, 'end_time' => 231.9, 'target_text' => 'May Allah be pleased with them.', 'source_text' => 'Semoga Allah meredai mereka semua.', 'order' => 42],
            ['start_time' => 232, 'end_time' => 236.62, 'target_text' => 'Swords clashed, the air rang with cries of Allah Akbar.', 'source_text' => 'Pedang mula berlaga, udara bergema dengan laungan takbir Allahu Akbar!', 'order' => 43],
            ['start_time' => 236.72, 'end_time' => 242.62, 'target_text' => 'Dust rose and when it settled the Quraysh champions lay silent.', 'source_text' => 'Debu pertempuran membubung tinggi, dan tatkala ia reda, para jaguh Quraisy tersungkur kaku.', 'order' => 44],
            ['start_time' => 242.72, 'end_time' => 251.339, 'target_text' => 'The prophet peace be upon him lifted a handful of sand and cast it towards the enemy saying may their faces be disfigured.', 'source_text' => 'Nabi SAW mengambil segenggam pasir lalu melontarkannya ke arah tentera musuh seraya bersabda, "Binasalah muka-muka mereka (Syahatil Wujuh)!"', 'order' => 45],
            ['start_time' => 251.439, 'end_time' => 253.8, 'target_text' => 'And Allah revealed', 'source_text' => 'Maka Allah menurunkan wahyu-Nya:', 'order' => 46],
            ['start_time' => 262.16, 'end_time' => 266.06, 'target_text' => 'it was not you who slew them but Allah slew them.', 'source_text' => '"Bukanlah kamu yang membunuh mereka, akan tetapi Allah jualah yang membunuh mereka.', 'order' => 47],
            ['start_time' => 266.16, 'end_time' => 270.22, 'target_text' => 'Nor was it you who threw when you threw, but Allah threw.', 'source_text' => 'Dan bukanlah engkau yang melontar tatkala engkau melontar, akan tetapi Allah jualah yang melontar."', 'order' => 48],
            ['start_time' => 270.32, 'end_time' => 272.62, 'target_text' => 'Then the unseen descended.', 'source_text' => 'Kemudian bala tentera ghaib diturunkan dari langit.', 'order' => 49],
            ['start_time' => 272.72, 'end_time' => 274.06, 'target_text' => 'Winds surged.', 'source_text' => 'Angin kencang bertiup menderu-deru.', 'order' => 50],
            ['start_time' => 274.16, 'end_time' => 280.12, 'target_text' => 'The angels appeared clothed in white, striking down the ranks of disbelief.', 'source_text' => 'Para malaikat menjelma dengan berpakaian serba putih, menghancurkan barisan kaum kafir.', 'order' => 51],
            ['start_time' => 280.32, 'end_time' => 283.58, 'target_text' => 'Fled, leaving behind their pride and their dead.', 'source_text' => 'Musuh lari bertempiaran, meninggalkan keangkuhan dan bangkai tentera mereka.', 'order' => 52],
            ['start_time' => 283.68, 'end_time' => 289.74, 'target_text' => 'Abu Jahal, the pharaoh of this ummah, was found fallen upon the sand.', 'source_text' => 'Abu Jahal, si Firaun bagi umat ini, ditemui rebah tersungkur di atas pasir.', 'order' => 53],
            ['start_time' => 289.84, 'end_time' => 295.18, 'target_text' => 'Abdullahbn Masoud stood over him as he breathed his last.', 'source_text' => 'Abdullah bin Mas\'ud RA berdiri di hadapannya tatkala dia menghembuskan nafas yang terakhir.', 'order' => 54],
            ['start_time' => 295.28, 'end_time' => 302.06, 'target_text' => 'The messenger of Allah, peace be upon him, stood before the fallen chiefs and said, "Have you found true what your Lord promised', 'source_text' => 'Rasulullah SAW berdiri di hadapan para pembesar musuh yang terkorban lalu bersabda, "Adakah kamu mendapati benar apa yang Tuhan kamu janjikan', 'order' => 55],
            ['start_time' => 302.16, 'end_time' => 306.78, 'target_text' => 'you?" 70 enemies were slain, 70 captured.', 'source_text' => 'kepada kamu?" 70 orang musuh terbunuh, dan 70 orang lagi ditawan.', 'order' => 56],
            ['start_time' => 306.88, 'end_time' => 314.06, 'target_text' => 'Among them, those who had once tortured the weak in Mecca, but the prophet peace be upon him forbade vengeance.', 'source_text' => 'Antara mereka adalah orang-orang yang dahulunya menyeksa golongan lemah di Mekah, namun Nabi SAW melarang sebarang dendam kesumat.', 'order' => 57],
            ['start_time' => 314.16, 'end_time' => 318.14, 'target_text' => 'He said, "Treat them well." And they did.', 'source_text' => 'Baginda bersabda, "Layanilah mereka dengan baik." Dan para sahabat benar-benar mematuhinya.', 'order' => 58],
            ['start_time' => 318.24, 'end_time' => 328.36, 'target_text' => 'Among those captives was Albbas Abd Muttalib whose ransom would later fund the armies of Islam.', 'source_text' => 'Antara tawanan perang itu ialah Al-Abbas bin \'Abdil Muttalib, yang wang tebusannya kelak membiayai kelengkapan bala tentera Islam.', 'order' => 59],
            ['start_time' => 328.72, 'end_time' => 332.12, 'target_text' => 'The Quran called that day,', 'source_text' => 'Al-Quran menamakan hari bersejarah itu:', 'order' => 60],
            ['start_time' => 334.56, 'end_time' => 339.26, 'target_text' => 'the day of criterion, the day when the two hosts met.', 'source_text' => '"Hari Pemisah (Yaumul Furqan), hari pertemuan antara dua pasukan tentera."', 'order' => 61],
            ['start_time' => 339.36, 'end_time' => 346.3, 'target_text' => 'It was the day when truth triumphed not by numbers nor by strength but by faith.', 'source_text' => 'Ia adalah hari di mana kebenaran menang—bukan kerana bilangan angka tentera mahupun kekuatan senjata, tetapi kerana kekuatan iman.', 'order' => 62],
            ['start_time' => 346.4, 'end_time' => 351.26, 'target_text' => 'And so the believers, few in number, walked away victorious.', 'source_text' => 'Begitulah, orang-orang beriman yang sedikit bilangannya melangkah keluar sebagai pemenang.', 'order' => 63],
            ['start_time' => 351.36, 'end_time' => 356.939, 'target_text' => 'Not by might, not by weapons, but because Allah was with them.', 'source_text' => 'Bukan kerana kehebatan diri atau senjata, tetapi semata-mata kerana Allah bersama mereka.', 'order' => 64],
            ['start_time' => 357.039, 'end_time' => 363.42, 'target_text' => 'This was Ya Furan, the day of criterion, the day truth stood clear from falsehood.', 'source_text' => 'Inilah Yaumul Furqan, hari pemisah di mana kebenaran terbukti nyata terpisah daripada kebatilan.', 'order' => 65],
            ['start_time' => 363.52, 'end_time' => 367.099, 'target_text' => 'But victory is a test just as hardship is.', 'source_text' => 'Namun kemenangan adalah satu ujian sebagaimana kesulitan juga adalah ujian.', 'order' => 66],
            ['start_time' => 367.199, 'end_time' => 369.819, 'target_text' => 'And soon another test would rise.', 'source_text' => 'Dan tidak lama lagi, satu lagi ujian getir bakal menjelma.', 'order' => 67],
            ['start_time' => 369.919, 'end_time' => 378.36, 'target_text' => 'In the next episode, inshallah, we witness how the heart remains steadfast when triumph meets trial.', 'source_text' => 'Dalam episod akan datang insya-Allah, kita akan menyaksikan bagaimana sanubari kekal teguh tatkala kejayaan diuji dengan cubaan.', 'order' => 68],
            ['start_time' => 379.44, 'end_time' => 381.64, 'target_text' => 'Allah Muhammad', 'source_text' => 'Selawat dan salam ke atas Nabi Muhammad SAW.', 'order' => 69],
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
