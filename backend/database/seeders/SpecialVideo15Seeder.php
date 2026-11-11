<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo15Seeder extends Seeder
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

        // Special Bilingual Religious Video #15 (Siri 1 Ep.10): The Conversion of Umar (RA) | Life of the Final Messenger ﷺ | Ep.10 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'butrsoKNPz4'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Conversion of Umar (RA) | Life of the Final Messenger ﷺ | Ep.10 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/butrsoKNPz4/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 15,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.0, 'end_time' => 5.38, 'target_text' => 'O Omar, has the time not come for your heart to submit to Allah?', 'source_text' => '"Wahai Umar, belumkah tiba masanya untuk hatimu tunduk patuh kepada Allah?"', 'order' => 1],
            ['start_time' => 5.48, 'end_time' => 6.74, 'target_text' => 'Tears fell.', 'source_text' => 'Titisan air mata pun mengalir membasahi pipinya.', 'order' => 2],
            ['start_time' => 6.84, 'end_time' => 16.32, 'target_text' => 'What had began in a small house on Safa had now filled the city with the light of conviction.', 'source_text' => 'Apa yang dahulunya bermula di sebuah rumah kecil di bukit Safa, kini telah memenuhi seluruh kota dengan cahaya keimanan yang kukuh.', 'order' => 3],
            ['start_time' => 17.2, 'end_time' => 18.78, 'target_text' => 'Bismillah Rahman Rahim.', 'source_text' => 'Bismillahir Rahmanir Rahim (Dengan nama Allah Yang Maha Pemurah lagi Maha Penyayang).', 'order' => 4],
            ['start_time' => 18.88, 'end_time' => 26.3, 'target_text' => 'My beloved brothers and sisters, Islam in its early days was delicate, tender, and quietly growing.', 'source_text' => 'Saudara-saudariku yang dikasihi, Islam pada hari-hari terawalnya begitu halus, lembut, dan berkembang secara senyap dan tenang.', 'order' => 5],
            ['start_time' => 26.4, 'end_time' => 30.06, 'target_text' => 'A light passed from heart to heart in whispers.', 'source_text' => 'Cahaya nur yang berpindah dari satu hati ke satu hati yang lain melalui bisikan penuh keikhlasan.', 'order' => 6],
            ['start_time' => 30.16, 'end_time' => 32.38, 'target_text' => 'But Mecca was heavy with anger.', 'source_text' => 'Namun kota Mekah sarat diselubungi kemarahan yang membara.', 'order' => 7],
            ['start_time' => 32.48, 'end_time' => 34.5, 'target_text' => 'The chiefs feared change.', 'source_text' => 'Para pembesar Quraisy sangat takut akan perubahan.', 'order' => 8],
            ['start_time' => 34.6, 'end_time' => 36.34, 'target_text' => 'Families were torn apart.', 'source_text' => 'Ikatan keluarga berpecah-belah dan tercerai-berai.', 'order' => 9],
            ['start_time' => 36.44, 'end_time' => 39.62, 'target_text' => 'The believers were beaten, humiliated, and tested.', 'source_text' => 'Golongan beriman dipukul, dihina, dan diuji dengan pelbagai seksaan.', 'order' => 10],
            ['start_time' => 39.72, 'end_time' => 42.74, 'target_text' => 'Yet even in pain, the light did not fade.', 'source_text' => 'Namun walaupun diulit keperitan, cahaya keimanan tidak pernah padam.', 'order' => 11],
            ['start_time' => 42.84, 'end_time' => 48.74, 'target_text' => 'It only grew stronger for Allah guides hearts in a way we cannot predict.', 'source_text' => 'Malah ia semakin bertambah kukuh, kerana Allah memberi petunjuk kepada hati-hati manusia dengan cara yang tidak dapat kita duga.', 'order' => 12],
            ['start_time' => 48.84, 'end_time' => 55.3, 'target_text' => 'Sometimes, the heart most distant is the one closest to being transformed.', 'source_text' => 'Kadang-kala, hati yang paling jauh itulah yang sebenarnya paling hampir untuk mengalami transformasi hidayah.', 'order' => 13],
            ['start_time' => 55.4, 'end_time' => 63.1, 'target_text' => 'And soon, the one who wished to silence the message would become one of its strongest protectors.', 'source_text' => 'Dan tidak lama kemudian, insan yang dahulunya berhasrat membungkam risalah ini bakal menjadi salah seorang pelindung terkuatnya.', 'order' => 14],
            ['start_time' => 63.2, 'end_time' => 72.6, 'target_text' => 'So come with me to the moment when truth reached a heart that the world believed could never soften.', 'source_text' => 'Oleh itu, hayutilah bersama saya saat ketika kebenaran mengetuk sanubari sebuah hati yang disangka dunia tidak akan sesekali melembut.', 'order' => 15],
            ['start_time' => 86.56, 'end_time' => 89.14, 'target_text' => 'The persecution in Mecca deepened.', 'source_text' => 'Penyeksaan dan penindasan di kota Mekah semakin meruncing dan mendalam.', 'order' => 16],
            ['start_time' => 89.24, 'end_time' => 92.54, 'target_text' => 'Quraysh\'s cruelty knew no bounds.', 'source_text' => 'Kezaliman kaum Quraisy sudah melampaui segala batas perikemanusiaan.', 'order' => 17],
            ['start_time' => 92.64, 'end_time' => 101.46, 'target_text' => 'Men and women were lashed in the sun, tied with chains, and mocked for uttering the word Allah.', 'source_text' => 'Kaum lelaki dan wanita disebat di bawah terik mentari, dirantai dengan belenggu besi, dan dicemuh hanya kerana melafazkan nama Allah.', 'order' => 18],
            ['start_time' => 101.56, 'end_time' => 104.1, 'target_text' => 'Yet their voices never wavered.', 'source_text' => 'Namun suara keteguhan mereka tidak pernah sesekali goyah.', 'order' => 19],
            ['start_time' => 104.2, 'end_time' => 108.14, 'target_text' => 'Faith had become their shield, and patience their weapon.', 'source_text' => 'Keimanan telah menjadi perisai pertahanan mereka, dan kesabaran menjadi senjata terampuh mereka.', 'order' => 20],
            ['start_time' => 108.24, 'end_time' => 110.9, 'target_text' => 'The prophet, peace be upon him, walked among them.', 'source_text' => 'Rasulullah ﷺ berjalan menziarahi di celah-celah mereka.', 'order' => 21],
            ['start_time' => 111.0, 'end_time' => 116.78, 'target_text' => 'His heart heavy with mercy, whispering prayers for their strength.', 'source_text' => 'Hati baginda sarat dengan belas kasihan dan rahmat, membisikkan doa-doa munajat demi kekuatan jiwa mereka.', 'order' => 22],
            ['start_time' => 116.88, 'end_time' => 124.02, 'target_text' => 'When the torment grew unbearable, the prophet, peace be upon him, permitted a second migration to Abyssinia, larger than the', 'source_text' => 'Tatkala azab seksaan semakin tidak tertanggung, Rasulullah ﷺ membenarkan penghijrahan kali kedua ke Habsyah, yang jauh lebih besar daripada', 'order' => 23],
            ['start_time' => 124.12, 'end_time' => 125.1, 'target_text' => 'first.', 'source_text' => 'penghijrahan yang pertama.', 'order' => 24],
            ['start_time' => 125.2, 'end_time' => 132.82, 'target_text' => 'Nearly 100 men and women gathered under the darkness of night, carrying little more than faith.', 'source_text' => 'Hampir 100 orang lelaki dan wanita berhimpun di bawah kepekatan malam, berbekalkan tiada apa-apa selain keimanan yang teguh.', 'order' => 25],
            ['start_time' => 132.92, 'end_time' => 140.34, 'target_text' => 'Among them were Ja\'far ibn Abi Talib and his wife Asma bint Umays, may Allah be pleased with all of them.', 'source_text' => 'Antara mereka ialah Ja\'far bin Abi Talib dan isterinya Asma\' binti \'Umais, semoga Allah meredai mereka kesemuanya.', 'order' => 26],
            ['start_time' => 140.44, 'end_time' => 149.42, 'target_text' => 'They crossed the Red Sea again, their tears mixing with the salt of the waves, whispering the words of their Lord, "Wal-ladhina', 'source_text' => 'Mereka menyeberangi Laut Merah sekali lagi, titisan air mata mereka bercampur dengan buih asin ombak lautan, seraya membisikkan firman Tuhan mereka: "Wal-ladhina', 'order' => 27],
            ['start_time' => 149.52, 'end_time' => 158.94, 'target_text' => 'hajaru fillahi mim ba\'di ma zulimu, lanubawwi\'annahum fid-dunya hasanah, wal-ajrul-akhirati akbar, law kanu ya\'lamun." Those', 'source_text' => 'hajaru fillahi mim ba\'di ma zulimu, lanubawwi\'annahum fid-dunya hasanah, wal-ajrul-akhirati akbar, law kanu ya\'lamun." Iaitu golongan', 'order' => 28],
            ['start_time' => 159.04, 'end_time' => 166.38, 'target_text' => 'who emigrated for Allah after being wronged, we will surely settle them in a good place in this world, and their reward for', 'source_text' => 'yang berhijrah kerana Allah sesudah mereka dizalimi, pasti Kami akan menempatkan mereka di tempat yang baik di dunia ini, dan sesungguhnya pahala ganjaran', 'order' => 29],
            ['start_time' => 166.48, 'end_time' => 171.3, 'target_text' => 'the hereafter is greater, if only they knew.', 'source_text' => 'di hari akhirat itu jauh lebih besar, kalaulah mereka mengetahuinya.', 'order' => 30],
            ['start_time' => 171.4, 'end_time' => 177.34, 'target_text' => 'In Abyssinia, they were received once more by the righteous king, an-Najashi.', 'source_text' => 'Di bumi Habsyah, mereka disambut sekali lagi dengan penuh kemuliaan oleh raja yang adil lagi soleh, Raja Najashi.', 'order' => 31],
            ['start_time' => 177.44, 'end_time' => 185.419, 'target_text' => 'Quraysh sent Amr ibn al-As again, bearing gifts and deceitful words, but the king\'s heart was firm.', 'source_text' => 'Pihak Quraisy menghantar \'Amr bin al-\'As sekali lagi dengan membawa pelbagai hadiah dan kata-kata tipu daya, namun pendirian raja itu kekal teguh.', 'order' => 32],
            ['start_time' => 185.519, 'end_time' => 188.1, 'target_text' => '"They are safe in my land," he said.', 'source_text' => '"Mereka selamat berada di bawah naungan bumiku," titah baginda raja.', 'order' => 33],
            ['start_time' => 188.2, 'end_time' => 196.62, 'target_text' => '"No one who seeks refuge with me shall be harmed." The believers wept in gratitude, and their prayers rose from the valleys', 'source_text' => '"Tiada sesiapa yang meminta perlindungan denganku akan disakiti." Kaum beriman menangis kesyukuran, dan doa-doa mereka bergema naik dari lembah-lembah', 'order' => 34],
            ['start_time' => 196.72, 'end_time' => 199.72, 'target_text' => 'of Habasha to the heavens.', 'source_text' => 'bumi Habsyah terus membubung tinggi ke langit.', 'order' => 35],
            ['start_time' => 200.16, 'end_time' => 208.38, 'target_text' => 'Meanwhile, in Mecca, the prophet, peace be upon him, continued his call quietly, yet fearlessly, in the home of al-Arqam ibn', 'source_text' => 'Sementara itu di kota Mekah, Rasulullah ﷺ meneruskan dakwah seruannya secara tenang tetapi tanpa sekelumit rasa gentar, di rumah al-Arqam bin', 'order' => 36],
            ['start_time' => 208.48, 'end_time' => 212.1, 'target_text' => 'Abi al-Arqam, near the hill of Safa.', 'source_text' => 'Abi al-Arqam, berhampiran bukit Safa.', 'order' => 37],
            ['start_time' => 212.2, 'end_time' => 220.26, 'target_text' => 'There, the first small circle of believers gathered, learning the verses of the Qur\'an as they descended.', 'source_text' => 'Di sanalah kelompok terawal golongan beriman berhimpun, mempelajari ayat-ayat suci al-Quran tatkala ia diturunkan satu persatu.', 'order' => 38],
            ['start_time' => 220.36, 'end_time' => 226.7, 'target_text' => 'Words that broke idols, not with hammers, but with truth.', 'source_text' => 'Kalimah-kalimah agung yang memecahkan berhala-berhala kebatilan bukan dengan tukul besi, melainkan dengan hakikat kebenaran.', 'order' => 39],
            ['start_time' => 226.8, 'end_time' => 235.1, 'target_text' => 'Among those hearts still hardened was a man whose strength was feared by all, Omar ibn al-Khattab.', 'source_text' => 'Di antara hati-hati yang masih membatu keras ketika itu ialah seorang pahlawan yang kekuatannya digeruni semua, \'Umar bin al-Khattab.', 'order' => 40],
            ['start_time' => 235.2, 'end_time' => 243.46, 'target_text' => 'Tall, fierce, his eyes burning with pride, he could not bear to see Quraysh divided by this new faith.', 'source_text' => 'Tinggi lampai, bengis perkasa, dengan mata yang menyala penuh kebanggaan jahiliah, dia tidak sanggup melihat Quraisy terpecah-belah akibat ajaran baharu ini.', 'order' => 41],
            ['start_time' => 243.56, 'end_time' => 246.26, 'target_text' => 'One day, his anger reached its peak.', 'source_text' => 'Pada suatu hari, kemarahannya telah sampai ke paras kemuncaknya.', 'order' => 42],
            ['start_time' => 246.36, 'end_time' => 250.78, 'target_text' => 'Sword in hand, he set out to end the matter once and for all.', 'source_text' => 'Dengan pedang terhunus di tangan, dia melangkah keluar bertekad untuk menamatkan urusan ini buat selama-lamanya.', 'order' => 43],
            ['start_time' => 250.88, 'end_time' => 253.7, 'target_text' => '"I will kill Muhammad," he declared.', 'source_text' => '"Aku akan membunuh Muhammad!" laungnya dengan penuh tekad amarah.', 'order' => 44],
            ['start_time' => 253.8, 'end_time' => 261.5, 'target_text' => 'On the way, he met Nu\'aym ibn Abdillah who said, "Before you do, know that your sister and her husband have embraced this', 'source_text' => 'Dalam perjalanannya, dia bertembung dengan Nu\'aim bin \'Abdullah yang berkata: "Sebelum engkau berbuat demikian, ketahuilah bahawa adik perempuanmu dan suaminya sendiri telah memeluk', 'order' => 45],
            ['start_time' => 261.6, 'end_time' => 264.42, 'target_text' => 'faith." Rage surged within him.', 'source_text' => 'agama ini!" Kemarahan yang meluap-luap bergelora hebat dalam jiwanya.', 'order' => 46],
            ['start_time' => 264.52, 'end_time' => 270.819, 'target_text' => 'He stormed toward their house, the verses of the Quran echoing faintly from inside.', 'source_text' => 'Dia meluru menyerbu ke arah rumah mereka, manakala ayat-ayat al-Quran kedengaran bergema sayup-sayup dari dalam rumah.', 'order' => 47],
            ['start_time' => 270.919, 'end_time' => 277.22, 'target_text' => 'When he burst through the door, his sister Fatima tried to hide the scroll.', 'source_text' => 'Sebaik sahaja dia merempuh pintu, adiknya Fatimah segera cuba menyembunyikan lembaran surah tersebut.', 'order' => 48],
            ['start_time' => 277.32, 'end_time' => 282.58, 'target_text' => 'In his fury, he struck her and blood fell from her face.', 'source_text' => 'Dalam kemuncaknya kemurkaan, dia menampar adiknya hingga darah menitis membasahi wajah Fatimah.', 'order' => 49],
            ['start_time' => 282.68, 'end_time' => 285.38, 'target_text' => 'The sight broke him.', 'source_text' => 'Melihat titisan darah adiknya sendiri, hancur luluh seketika keegoan hatinya.', 'order' => 50],
            ['start_time' => 285.48, 'end_time' => 287.62, 'target_text' => 'Shame replaced his rage.', 'source_text' => 'Rasa malu dan sesal serta-merta menggantikan amarahnya yang membakar.', 'order' => 51],
            ['start_time' => 287.72, 'end_time' => 291.58, 'target_text' => '"Give me what you were reading," he said softly.', 'source_text' => '"Berikan kepadaku apa yang sedang kamu baca tadi," katanya dengan nada suara yang melembut.', 'order' => 52],
            ['start_time' => 291.68, 'end_time' => 294.02, 'target_text' => 'She replied, "You are unclean.', 'source_text' => 'Fatimah menjawab: "Sesungguhnya engkau berada dalam keadaan tidak suci.', 'order' => 53],
            ['start_time' => 294.12, 'end_time' => 299.34, 'target_text' => 'Purify yourself first." He washed, then opened the parchment.', 'source_text' => 'Bersucilah terlebih dahulu." Dia pun membersihkan dirinya, lalu membuka lembaran manuskrip tersebut.', 'order' => 54],
            ['start_time' => 299.44, 'end_time' => 311.38, 'target_text' => 'His eyes fell upon the words, "Taha, Ma anzala alayka al-Quran litashqa illa tazkiratan liman yakhsha tanzilam mimman khalaqa', 'source_text' => 'Pandangan matanya terpaku pada ayat: "Ta-Ha, Ma anzala \'alaykal-Qur\'ana litasyqa, illa tazkiratal-liman yakhsya, tanzilam-mimman khalaqa', 'order' => 55],
            ['start_time' => 311.48, 'end_time' => 313.5, 'target_text' => 'al-arda wa as-samawati al-ula.', 'source_text' => 'al-arda was-samawatil-\'ula.', 'order' => 56],
            ['start_time' => 313.6, 'end_time' => 321.819, 'target_text' => 'Taha, we have not sent down the Quran to cause you distress, but only as a reminder for those who fear Allah, a revelation', 'source_text' => '"Ta-Ha. Kami tidak menurunkan al-Quran ini kepadamu supaya engkau menanggung kesusahan; melainkan sebagai peringatan bagi orang-orang yang takutkan Allah; diturunkan daripada Tuhan', 'order' => 57],
            ['start_time' => 321.919, 'end_time' => 326.62, 'target_text' => 'from the one who created the earth and the high heavens."', 'source_text' => 'yang menciptakan bumi dan langit-langit yang tinggi."', 'order' => 58],
            ['start_time' => 326.72, 'end_time' => 330.62, 'target_text' => 'The words struck his heart like lightning.', 'source_text' => 'Kalimah-kalimah suci itu meresap menyentak sanubarinya bagaikan panahan kilat.', 'order' => 59],
            ['start_time' => 330.72, 'end_time' => 334.34, 'target_text' => 'The sword fell from his hand, his eyes filled with tears.', 'source_text' => 'Pedang yang dipegang terlepas gugur daripada genggamannya, dan kedua-dua matanya digenangi air mata keinsafan.', 'order' => 60],
            ['start_time' => 334.44, 'end_time' => 338.22, 'target_text' => 'He whispered, "Show me where Muhammad is."', 'source_text' => 'Dia berbisik perlahan: "Tunjukkanlah kepadaku di mana Muhammad berada."', 'order' => 61],
            ['start_time' => 338.32, 'end_time' => 346.06, 'target_text' => 'Moments later, he stood before the door of Darul Arqam, where the believers had gathered in secret.', 'source_text' => 'Seketika kemudian, dia berdiri tegak di hadapan pintu Darul Arqam, tempat di mana para sahabat berhimpun secara rahsia.', 'order' => 62],
            ['start_time' => 346.16, 'end_time' => 349.94, 'target_text' => 'Inside, they heard heavy steps and fell silent.', 'source_text' => 'Di dalam rumah itu, mereka mendengar derapan langkah yang berat lalu suasana menjadi sunyi sepi.', 'order' => 63],
            ['start_time' => 350.04, 'end_time' => 357.54, 'target_text' => 'Hamza, may Allah be pleased with him, drew his sword ready to defend, but the prophet, peace be upon him, said calmly, "Open', 'source_text' => 'Hamzah رضي الله عنه segera menghunus pedangnya bersiap sedia untuk mempertahankan, namun Rasulullah ﷺ bersabda dengan tenang: "Bukalah', 'order' => 64],
            ['start_time' => 357.64, 'end_time' => 358.5, 'target_text' => 'the door.', 'source_text' => 'pintu itu.', 'order' => 65],
            ['start_time' => 358.6, 'end_time' => 361.38, 'target_text' => 'If he has come to seek the truth,', 'source_text' => 'Sekiranya dia datang untuk mencari kebenaran,', 'order' => 66],
            ['start_time' => 361.48, 'end_time' => 362.78, 'target_text' => 'guide him to it.', 'source_text' => 'bimbinglah dia ke arahnya.', 'order' => 67],
            ['start_time' => 362.88, 'end_time' => 367.1, 'target_text' => 'If he seeks harm, we will deal with him."', 'source_text' => 'Dan sekiranya dia berniat jahat, kita sendiri yang akan berhadapan dengannya."', 'order' => 68],
            ['start_time' => 367.2, 'end_time' => 372.58, 'target_text' => 'The door opened and Omar entered, sword still at his side.', 'source_text' => 'Pintu pun dibuka dan \'Umar melangkah masuk, dengan pedang yang masih tersangkut di sisinya.', 'order' => 69],
            ['start_time' => 372.68, 'end_time' => 376.42, 'target_text' => 'He looked at the messenger, peace be upon him,', 'source_text' => 'Dia menatap wajah Rasulullah ﷺ,', 'order' => 70],
            ['start_time' => 376.52, 'end_time' => 378.34, 'target_text' => 'his breath trembling.', 'source_text' => 'nafasnya bergetar kencang.', 'order' => 71],
            ['start_time' => 378.44, 'end_time' => 385.1, 'target_text' => 'The prophet, peace be upon him, placed his blessed hand upon his chest and said, "Oh Omar, for you, has the time not come', 'source_text' => 'Rasulullah ﷺ meletakkan tangan baginda yang penuh berkat ke dada Umar seraya bersabda: "Wahai \'Umar, untuk dirimu, belumkah tiba masanya', 'order' => 72],
            ['start_time' => 385.2, 'end_time' => 389.34, 'target_text' => 'for your heart to submit to Allah?" Tears fell.', 'source_text' => 'untuk hatimu tunduk patuh kepada Allah?" Titisan air mata \'Umar gugur membasahi pipinya.', 'order' => 73],
            ['start_time' => 389.44, 'end_time' => 395.42, 'target_text' => 'Omar dropped to his knees and said, "I bear witness that there is no god but Allah', 'source_text' => '\'Umar jatuh melutut ke tanah lalu bersaksi: "Aku bersaksi bahawa tiada Tuhan yang berhak disembah melainkan Allah,', 'order' => 74],
            ['start_time' => 395.52, 'end_time' => 399.32, 'target_text' => 'and that you are the messenger of Allah."', 'source_text' => 'dan aku bersaksi bahawa engkau adalah sesungguhnya utusan Allah."', 'order' => 75],
            ['start_time' => 399.44, 'end_time' => 403.74, 'target_text' => 'The house erupted in takbir, their voices shaking the walls.', 'source_text' => 'Rumah tersebut bergemuruh meletus dengan seruan takbir, suara mereka menggegar segenap dinding rumah.', 'order' => 76],
            ['start_time' => 403.84, 'end_time' => 406.26, 'target_text' => 'The news spread through Mecca like fire.', 'source_text' => 'Berita keislaman itu tersebar ke seluruh kota Mekah sepantas api membakar jerami.', 'order' => 77],
            ['start_time' => 406.36, 'end_time' => 408.5, 'target_text' => 'Quraysh could not believe what they heard.', 'source_text' => 'Kaum Quraisy hampir tidak dapat mempercayai apa yang singgah ke pendengaran mereka.', 'order' => 78],
            ['start_time' => 408.6, 'end_time' => 413.819, 'target_text' => 'Omar, the enemy of Islam, had become one of its pillars.', 'source_text' => '\'Umar, yang selama ini musuh ketat Islam, kini telah bertukar menjadi salah satu tiang pasak teragungnya.', 'order' => 79],
            ['start_time' => 413.919, 'end_time' => 417.34, 'target_text' => 'From that day, the believers no longer hid.', 'source_text' => 'Bermula dari detik bersejarah itu, golongan beriman tidak lagi menyembunyikan diri.', 'order' => 80],
            ['start_time' => 417.44, 'end_time' => 426.62, 'target_text' => 'Omar said, "Oh messenger of Allah, peace be upon him, are we not upon the truth?" The prophet, peace be upon him, said, "Indeed."', 'source_text' => '\'Umar bertanya: "Wahai Rasulullah ﷺ, bukankah kita berada di atas landasan kebenaran?" Baginda ﷺ menjawab: "Benar sekali."', 'order' => 81],
            ['start_time' => 426.72, 'end_time' => 432.02, 'target_text' => 'Omar, may Allah be pleased with him, replied, "Then why do we hide?"', 'source_text' => '\'Umar رضي الله عنه menyahut: "Jika demikian, mengapakah kita masih perlu bersembunyi?"', 'order' => 82],
            ['start_time' => 432.12, 'end_time' => 438.78, 'target_text' => 'He marched with the Muslims towards the Kaaba, two rows, one led by Omar, may Allah be pleased with him, the other by Hamza,', 'source_text' => 'Dia berarak maju bersama kaum Muslimin menuju ke Kaabah dalam dua saf perbarisan, satu saf dipimpin oleh \'Umar رضي الله عنه, dan satu lagi oleh Hamzah,', 'order' => 83],
            ['start_time' => 438.88, 'end_time' => 440.86, 'target_text' => 'may Allah be pleased with him.', 'source_text' => 'semoga Allah meredai kedua-duanya.', 'order' => 84],
            ['start_time' => 440.96, 'end_time' => 447.7, 'target_text' => 'Their voices rose reciting the words of Allah as Quraysh watched in silence.', 'source_text' => 'Suara mereka bergema membacakan ayat-ayat firman Allah tatkala kaum Quraisy terpaku memandang dalam kebisuan.', 'order' => 85],
            ['start_time' => 447.8, 'end_time' => 452.66, 'target_text' => 'For the first time, the truth walked openly through Mecca.', 'source_text' => 'Buat julung kalinya, kebenaran Islam melangkah dengan megah dan terbuka di tengah-tengah kota Mekah.', 'order' => 86],
            ['start_time' => 452.76, 'end_time' => 457.48, 'target_text' => 'The Quran would later speak of such hearts transformed.', 'source_text' => 'Al-Quran di kemudian hari menggambarkan keagungan hati-hati yang telah ditransformasikan ini:', 'order' => 87],
            ['start_time' => 467.84, 'end_time' => 469.9, 'target_text' => 'And he united the hearts.', 'source_text' => '"Dan Dialah yang telah menyatupadukan antara hati-hati mereka.', 'order' => 88],
            ['start_time' => 470.0, 'end_time' => 478.14, 'target_text' => 'If you had spent all that is in the earth, you could not have united their hearts, but Allah united them.', 'source_text' => 'Walaupun engkau belanjakan segala harta yang ada di bumi, nescaya engkau tidak dapat menyatukan hati mereka, tetapi Allah jua yang telah menyatukan mereka."', 'order' => 89],
            ['start_time' => 478.24, 'end_time' => 481.18, 'target_text' => 'That day marked the turning of hearts.', 'source_text' => 'Hari tersebut menandakan detik permulaan pembalikan sanubari.', 'order' => 90],
            ['start_time' => 481.28, 'end_time' => 483.98, 'target_text' => 'The enemies of Islam began to falter.', 'source_text' => 'Musuh-musuh Islam mula goyah dan hilang punca.', 'order' => 91],
            ['start_time' => 484.08, 'end_time' => 489.38, 'target_text' => 'Their arrogance shaken by the sight of believers praying openly beside the Kaaba.', 'source_text' => 'Keangkuhan mereka luntur digegarkan oleh pemandangan orang-orang beriman yang mendirikan solat secara terang-terangan di samping Kaabah.', 'order' => 92],
            ['start_time' => 489.48, 'end_time' => 494.62, 'target_text' => 'Faith once whispered in secret, now echoed across Mecca.', 'source_text' => 'Keimanan yang dahulunya hanya dibisikkan secara sembunyi, kini bergema megah di segenap pelosok Mekah.', 'order' => 93],
            ['start_time' => 494.72, 'end_time' => 499.7, 'target_text' => 'And among those echoes rolled a strength no power could silence.', 'source_text' => 'Dan di sebalik gemaan itu mengalir kekuatan dahsyat yang tiada kuasa mampu membungkamnya lagi.', 'order' => 94],
            ['start_time' => 499.8, 'end_time' => 509.38, 'target_text' => 'The prophet, peace be upon him, looked upon his companions, men and women who had endured hunger, exile, and pain, and smiled.', 'source_text' => 'Rasulullah ﷺ memandang para sahabat baginda, kaum lelaki dan wanita yang telah tabah mengharungi kelaparan, pemulauan, dan kesakitan, lalu baginda tersenyum lega.', 'order' => 95],
            ['start_time' => 509.48, 'end_time' => 518.22, 'target_text' => 'What had began in a small house on Safa had now filled the city with the light of conviction.', 'source_text' => 'Apa yang dahulunya bermula di sebuah rumah kecil di lereng Safa, kini telah memenuhi seluruh penjuru kota dengan limpahan nur keyakinan yang padu.', 'order' => 96],
            ['start_time' => 518.32, 'end_time' => 521.1, 'target_text' => 'The message of Allah was unstoppable.', 'source_text' => 'Risalah agung Allah sama sekali tidak dapat dihalang atau disekat lagi.', 'order' => 97],
            ['start_time' => 521.2, 'end_time' => 530.0, 'target_text' => 'And in the stillness of the night, the believers prayed together, their hearts trembling at the words of their Lord.', 'source_text' => 'Dan dalam keheningan malam yang sunyi, orang-orang beriman bersolat bersama-sama, hati mereka bergetar syahdu menghayati kalam Tuhan mereka.', 'order' => 98],
            ['start_time' => 543.6, 'end_time' => 550.3, 'target_text' => 'Allah has sent down the best of speech, a book consistent in its parts, repeating its lessons.', 'source_text' => '"Allah telah menurunkan sebaik-baik perkataan iaitu Kitab Suci al-Quran yang bersamaan kandungannya lagi berulang-ulang peringatannya.', 'order' => 99],
            ['start_time' => 550.4, 'end_time' => 554.02, 'target_text' => 'The skins of those who fear their Lord shiver from it.', 'source_text' => 'Menggeletar kerananya kulit orang-orang yang takut kepada Tuhan mereka;', 'order' => 100],
            ['start_time' => 554.12, 'end_time' => 559.52, 'target_text' => 'Then their hearts and skins soften to the remembrance of Allah.', 'source_text' => 'kemudian menjadi lembut dan tenang kulit serta hati mereka kepada mengingati zikrullah."', 'order' => 101],
            ['start_time' => 559.64, 'end_time' => 566.78, 'target_text' => 'The fire of persecution still burned, but now it met the steel of faith.', 'source_text' => 'Api penindasan musyrikin masih bernyala, namun kini ia terbentur dengan perisai waja keimanan yang teguh tiada tandingan.', 'order' => 102],
            ['start_time' => 566.88, 'end_time' => 572.76, 'target_text' => 'For when Allah turns a heart, no hand can turn it back.', 'source_text' => 'Kerana sesungguhnya apabila Allah telah membalikkan sesuatu hati, tiada tangan yang mampu membalikkannya kembali.', 'order' => 103],
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
