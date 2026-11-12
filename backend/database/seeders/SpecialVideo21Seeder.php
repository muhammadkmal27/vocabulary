<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo21Seeder extends Seeder
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

        // Special Bilingual Religious Video #21 (Siri 1 Ep.16): The Betrayal of Bana Qaynuqa | Life of the Final Messenger ﷺ | Ep.16 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => '6MEIPR3f4u0'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Betrayal of Bana Qaynuqa | Life of the Final Messenger ﷺ | Ep.16 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/6MEIPR3f4u0/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 21,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.4, 'end_time' => 5.42, 'target_text' => '...so that when she stood it tore, exposing her modesty.', 'source_text' => '...sehingga apabila dia berdiri pakaiannya terkoyak, mendedahkan auratnya.', 'order' => 1],
            ['start_time' => 5.52, 'end_time' => 11.02, 'target_text' => 'A Muslim man saw this, rushed forward and struck the goldsmith dead.', 'source_text' => 'Seorang lelaki Muslim melihat kejadian ini, bergegas ke hadapan dan memukul tukang emas itu hingga mati.', 'order' => 2],
            ['start_time' => 11.12, 'end_time' => 12.78, 'target_text' => 'The Jews retaliated.', 'source_text' => 'Orang-orang Yahudi membalas dendam.', 'order' => 3],
            ['start_time' => 12.88, 'end_time' => 17.42, 'target_text' => 'They killed the Muslim and thus the spark ignited.', 'source_text' => 'Mereka membunuh lelaki Muslim itu, lantas menyalakan api persengketaan.', 'order' => 4],
            ['start_time' => 17.52, 'end_time' => 25.98, 'target_text' => 'Bismillahir Rahmanir Rahim. My beloved brothers and sisters, after the victory of Badr, Medina felt a new breath of hope.', 'source_text' => 'Bismillahir Rahmanir Rahim. Saudara dan saudari yang dikasihi, selepas kemenangan di Badar, Madinah merasai nafas harapan yang baharu.', 'order' => 5],
            ['start_time' => 26.08, 'end_time' => 32.7, 'target_text' => 'The believers walked with hearts lifted and the world began to take notice.', 'source_text' => 'Kaum mukminin melangkah dengan hati yang teguh dan dunia mula membuka mata.', 'order' => 6],
            ['start_time' => 32.8, 'end_time' => 35.1, 'target_text' => 'But victory does not end trials.', 'source_text' => 'Namun kemenangan tidak menamatkan ujian.', 'order' => 7],
            ['start_time' => 35.2, 'end_time' => 36.86, 'target_text' => 'It changes them.', 'source_text' => 'Ia hanya mengubah bentuknya.', 'order' => 8],
            ['start_time' => 36.96, 'end_time' => 44.54, 'target_text' => 'For when truth rises, it awakens not only admiration but envy, fear, and resentment.', 'source_text' => 'Kerana apabila kebenaran tertegak, ia bukan sahaja membangkitkan kekaguman, tetapi juga rasa hasad, takut, dan dendam.', 'order' => 9],
            ['start_time' => 44.64, 'end_time' => 52.939, 'target_text' => 'There were those in Medina who lived beside the believers, ate with them, worked with them, but their hearts were not the', 'source_text' => 'Ada golongan di Madinah yang tinggal bersebelahan kaum mukminin, makan bersama mereka, bekerja bersama mereka, tetapi hati mereka tidaklah', 'order' => 10],
            ['start_time' => 53.039, 'end_time' => 53.74, 'target_text' => 'same.', 'source_text' => 'sama.', 'order' => 11],
            ['start_time' => 53.84, 'end_time' => 56.38, 'target_text' => 'Some watched Islam with love.', 'source_text' => 'Sebahagian memandang Islam dengan penuh kasih sayang.', 'order' => 12],
            ['start_time' => 56.48, 'end_time' => 58.7, 'target_text' => 'Others watched it with hatred.', 'source_text' => 'Sebahagian yang lain memandangnya dengan penuh kebencian.', 'order' => 13],
            ['start_time' => 58.8, 'end_time' => 62.039, 'target_text' => 'They hid behind their smiles.', 'source_text' => 'Mereka menyembunyikan rasa benci di sebalik senyuman mereka.', 'order' => 14],
            ['start_time' => 62.16, 'end_time' => 68.699, 'target_text' => 'This is a story not of open war but of deception and whispered alliances.', 'source_text' => 'Ini bukanlah kisah tentang peperangan terbuka, melainkan tentang pengkhianatan dan pakatan rahsia yang berbisik.', 'order' => 15],
            ['start_time' => 68.799, 'end_time' => 76.699, 'target_text' => 'So come with me as we witness how the Messenger of Allah peace be upon him protected the harmony of Medina with mercy', 'source_text' => 'Maka marilah bersama saya menyaksikan bagaimana Rasulullah ﷺ memelihara keharmonian Madinah dengan belas kasihan', 'order' => 16],
            ['start_time' => 76.799, 'end_time' => 82.599, 'target_text' => 'when mercy was needed and firmness when firmness was required.', 'source_text' => 'apabila belas kasihan diperlukan, dan dengan ketegasan apabila ketegasan dituntut.', 'order' => 17],
            ['start_time' => 96.079, 'end_time' => 99.019, 'target_text' => 'After Badr, Medina stood in awe.', 'source_text' => 'Selepas perang Badar, kota Madinah diselubungi rasa takjub.', 'order' => 18],
            ['start_time' => 99.119, 'end_time' => 101.58, 'target_text' => 'Victory had lifted every heart.', 'source_text' => 'Kemenangan telah mengangkat semangat setiap jiwa.', 'order' => 19],
            ['start_time' => 101.68, 'end_time' => 106.94, 'target_text' => 'But envy and fear began to stir beyond its walls.', 'source_text' => 'Namun hasad dengki dan ketakutan mula bergolak di luar temboknya.', 'order' => 20],
            ['start_time' => 107.04, 'end_time' => 113.9, 'target_text' => 'Tribes around the oasis watched, some with admiration, others with hatred.', 'source_text' => 'Kabilah-kabilah di sekitar oasis memerhati, sebahagian dengan rasa kagum, sebahagian lagi dengan penuh dendam.', 'order' => 21],
            ['start_time' => 114, 'end_time' => 116.94, 'target_text' => 'Among them were Banu Qaynuqa,', 'source_text' => 'Antara mereka ialah Bani Qainuqa\',', 'order' => 22],
            ['start_time' => 117.04, 'end_time' => 124.54, 'target_text' => 'a tribe of Jews living within Medina, known for their craftsmanship in gold and armor.', 'source_text' => 'kabilah Yahudi yang menetap di Madinah, terkenal dengan kemahiran pertukangan emas dan baju perisai.', 'order' => 23],
            ['start_time' => 124.64, 'end_time' => 132.7, 'target_text' => 'The Messenger of Allah peace be upon him gathered them in their marketplace and said, "O assembly of Jews, accept Islam,', 'source_text' => 'Rasulullah ﷺ mengumpulkan mereka di pasar mereka dan bersabda, "Wahai sekalian kaum Yahudi, peluklah Islam,', 'order' => 24],
            ['start_time' => 132.8, 'end_time' => 141.42, 'target_text' => 'before there comes upon you what came upon Quraysh." But they mocked and said, "Don\'t be deceived, O Muhammad.', 'source_text' => 'sebelum menimpa ke atas kamu apa yang telah menimpa kaum Quraisy." Namun mereka mengejek dan berkata, "Janganlah terpedaya, wahai Muhammad.', 'order' => 25],
            ['start_time' => 141.52, 'end_time' => 147.74, 'target_text' => 'You think because you fought men who knew nothing of war that you can stand against us?', 'source_text' => 'Adakah kamu menyangka kerana kamu telah memerangi mereka yang jahil tentang peperangan, maka kamu mampu menentang kami?', 'order' => 26],
            ['start_time' => 147.84, 'end_time' => 150.859, 'target_text' => 'We are the people of battle."', 'source_text' => 'Kamilah pakar medan pertempuran sebenar."', 'order' => 27],
            ['start_time' => 150.959, 'end_time' => 154.3, 'target_text' => 'One day a Muslim woman came to their market.', 'source_text' => 'Pada suatu hari, seorang wanita Muslimah datang ke pasar mereka.', 'order' => 28],
            ['start_time' => 154.4, 'end_time' => 158.54, 'target_text' => 'She sat by a goldsmith\'s shop to sell her goods.', 'source_text' => 'Dia duduk berhampiran kedai seorang tukang emas untuk menjual barangan dagangannya.', 'order' => 29],
            ['start_time' => 158.64, 'end_time' => 162.62, 'target_text' => 'The men of Banu Qaynuqa demanded she uncover her face.', 'source_text' => 'Lelaki-lelaki Bani Qainuqa\' menuntut agar dia membuka penutup wajahnya.', 'order' => 30],
            ['start_time' => 162.72, 'end_time' => 164.84, 'target_text' => 'She refused.', 'source_text' => 'Wanita itu menolak dengan tegas.', 'order' => 31],
            ['start_time' => 165.12, 'end_time' => 174.779, 'target_text' => 'As she rose to leave, the goldsmith had tied her garment so that when she stood it tore, exposing her modesty.', 'source_text' => 'Apabila dia bangkit untuk beredar, tukang emas itu telah mengikat hujung pakaiannya sehingga terkoyak ketika dia berdiri, lalu mendedahkan auratnya.', 'order' => 32],
            ['start_time' => 174.879, 'end_time' => 176.3, 'target_text' => 'They laughed.', 'source_text' => 'Mereka ketawa mengejek.', 'order' => 33],
            ['start_time' => 176.4, 'end_time' => 181.9, 'target_text' => 'A Muslim man saw this, rushed forward and struck the goldsmith dead.', 'source_text' => 'Seorang lelaki Muslim melihat perbuatan biadab ini, bergegas ke hadapan dan membunuh tukang emas itu.', 'order' => 34],
            ['start_time' => 182, 'end_time' => 183.74, 'target_text' => 'The Jews retaliated.', 'source_text' => 'Orang-orang Yahudi membalas dendam.', 'order' => 35],
            ['start_time' => 183.84, 'end_time' => 188.46, 'target_text' => 'They killed the Muslim and thus the spark ignited.', 'source_text' => 'Mereka membunuh lelaki Muslim tersebut dan lantas menyalakan api peperangan.', 'order' => 36],
            ['start_time' => 188.56, 'end_time' => 190.3, 'target_text' => 'Medina\'s streets trembled.', 'source_text' => 'Jalan-jalan di Madinah diselubungi kegusaran.', 'order' => 37],
            ['start_time' => 190.4, 'end_time' => 195.18, 'target_text' => 'The Prophet peace be upon him marched forth not for revenge but for justice.', 'source_text' => 'Nabi ﷺ mara keluar bukan untuk membalas dendam, tetapi demi menegakkan keadilan.', 'order' => 38],
            ['start_time' => 195.28, 'end_time' => 199.66, 'target_text' => 'The Prophet peace be upon him laid siege to their fortresses.', 'source_text' => 'Nabi ﷺ mengepung benteng-benteng pertahanan mereka.', 'order' => 39],
            ['start_time' => 199.76, 'end_time' => 204.7, 'target_text' => 'For 15 days their hearts grew restless, their strength fading.', 'source_text' => 'Selama 15 hari hati mereka diselubungi kegelisahan, dan kekuatan mereka kian luntur.', 'order' => 40],
            ['start_time' => 204.8, 'end_time' => 207.02, 'target_text' => 'Finally they surrendered.', 'source_text' => 'Akhirnya mereka menyerah kalah.', 'order' => 41],
            ['start_time' => 207.12, 'end_time' => 211.56, 'target_text' => 'But among them was a man who pleaded, Abdullah ibn Ubayy,', 'source_text' => 'Namun ada seorang lelaki yang datang merayu, iaitu Abdullah ibn Ubayy,', 'order' => 42],
            ['start_time' => 212, 'end_time' => 214.94, 'target_text' => 'the hypocrite leader of the Khazraj.', 'source_text' => 'ketua kaum munafik daripada suku Khazraj.', 'order' => 43],
            ['start_time' => 215.04, 'end_time' => 221.26, 'target_text' => 'He clung to the Prophet peace be upon him\'s armor and said, "O Muhammad, these are my allies.', 'source_text' => 'Dia memegang kuat baju perisai Nabi ﷺ seraya merayu, "Wahai Muhammad, mereka adalah sekutu-sekutu aku.', 'order' => 44],
            ['start_time' => 221.36, 'end_time' => 225.58, 'target_text' => 'Treat them well." The Prophet peace be upon him turned away.', 'source_text' => 'Layanlah mereka dengan baik." Nabi ﷺ berpaling daripadanya.', 'order' => 45],
            ['start_time' => 225.68, 'end_time' => 230.46, 'target_text' => 'Yet he persisted until the Messenger peace be upon him said, "Let them go.', 'source_text' => 'Namun dia terus mendesak sehinggalah Rasulullah ﷺ bersabda, "Lepaskanlah mereka.', 'order' => 46],
            ['start_time' => 230.56, 'end_time' => 234.3, 'target_text' => 'They are yours." They were expelled from Medina,', 'source_text' => 'Urusan mereka diserahkan kepadamu." Mereka diusir keluar dari Madinah,', 'order' => 47],
            ['start_time' => 234.4, 'end_time' => 237.339, 'target_text' => 'carrying only what their camels could bear.', 'source_text' => 'hanya membawa apa yang mampu dipikul oleh unta-unta mereka.', 'order' => 48],
            ['start_time' => 237.439, 'end_time' => 240.54, 'target_text' => 'But the danger did not end there.', 'source_text' => 'Namun ancaman bahaya tidak berakhir di situ.', 'order' => 49],
            ['start_time' => 240.64, 'end_time' => 248.46, 'target_text' => 'From the tribe of Banu al-Nadir, a man named Ka\'b ibn al-Ashraf began spreading venom.', 'source_text' => 'Daripada kabilah Bani an-Nadhir, seorang lelaki bernama Ka\'ab bin al-Asyraf mula menyebarkan dakyah beracun.', 'order' => 50],
            ['start_time' => 248.56, 'end_time' => 251.66, 'target_text' => 'He mourned the pagans of Quraysh,', 'source_text' => 'Dia meratapi kematian kaum musyrikin Quraisy,', 'order' => 51],
            ['start_time' => 251.76, 'end_time' => 256.62, 'target_text' => 'reciting poems of grief and insult against the Muslims.', 'source_text' => 'mendendangkan syair ratapan dan penghinaan terhadap kaum muslimin.', 'order' => 52],
            ['start_time' => 256.72, 'end_time' => 263.659, 'target_text' => 'He stirred hatred, mocked the believers, and slandered the honor of Muslim women.', 'source_text' => 'Dia menyemarakkan kebencian, memperlekehkan kaum mukminin, dan mencemarkan maruah wanita-wanita Muslimah.', 'order' => 53],
            ['start_time' => 263.759, 'end_time' => 270.379, 'target_text' => 'One night the Prophet peace be upon him said, "Who will rid me of Ibn al-Ashraf?', 'source_text' => 'Pada suatu malam Nabi ﷺ bersabda, "Siapakah yang sanggup menyelesaikan urusan Ka\'ab bin al-Asyraf untukku?', 'order' => 54],
            ['start_time' => 270.479, 'end_time' => 271.9, 'target_text' => 'For he has harmed Allah and His Messenger." Muhammad ibn Maslamah,', 'source_text' => 'Kerana sesungguhnya dia telah menyakiti Allah dan Rasul-Nya." Muhammad bin Maslamah,', 'order' => 55],
            ['start_time' => 272, 'end_time' => 281.9, 'target_text' => 'may Allah be pleased with him, stood and said, "O Messenger of Allah, I will." He gathered a small group: Abu Na\'ilah, Abbad ibn Bishr,', 'source_text' => 'semoga Allah meredhainya, bangkit lalu berkata, "Wahai Rasulullah, sayalah orangnya." Dia mengumpulkan sekumpulan kecil sahabat: Abu Na\'ilah, \'Abbad bin Bisyr,', 'order' => 56],
            ['start_time' => 282, 'end_time' => 284.04, 'target_text' => 'and al-Harith ibn Aws.', 'source_text' => 'dan al-Harith bin Aus.', 'order' => 57],
            ['start_time' => 284.88, 'end_time' => 287.659, 'target_text' => 'They set out in the silence of night.', 'source_text' => 'Mereka berangkat dalam kesunyian malam.', 'order' => 58],
            ['start_time' => 287.759, 'end_time' => 294.04, 'target_text' => 'The moon hung bright over Medina as they reached Ka\'b\'s fortress.', 'source_text' => 'Bulan bersinar terang di langit Madinah tatkala mereka tiba di benteng Ka\'ab.', 'order' => 59],
            ['start_time' => 294.16, 'end_time' => 297.42, 'target_text' => 'Abu Na\'ilah called out softly.', 'source_text' => 'Abu Na\'ilah memanggilnya dengan lembut.', 'order' => 60],
            ['start_time' => 297.52, 'end_time' => 300.7, 'target_text' => 'Ka\'b, recognizing his voice, descended.', 'source_text' => 'Ka\'ab yang mengenali suaranya pun turun ke bawah.', 'order' => 61],
            ['start_time' => 300.8, 'end_time' => 304.379, 'target_text' => 'His wife warned him, "You are a man at war.', 'source_text' => 'Isterinya memberi amaran kepadanya, "Engkau sedang berada dalam kancah permusuhan.', 'order' => 62],
            ['start_time' => 304.479, 'end_time' => 308.86, 'target_text' => 'They will kill you." He said, "It\'s Abu Na\'ilah, a friend.', 'source_text' => 'Mereka pasti akan membunuhmu." Ka\'ab menjawab, "Dia adalah Abu Na\'ilah, seorang sahabat.', 'order' => 63],
            ['start_time' => 308.96, 'end_time' => 316.14, 'target_text' => 'If he wished me harm, he would not have called by name." They walked together speaking as friends do.', 'source_text' => 'Sekiranya dia berniat jahat terhadapku, dia tidak akan memanggil namaku." Mereka berjalan bersama sambil berbual mesra layaknya sahabat.', 'order' => 64],
            ['start_time' => 316.24, 'end_time' => 319.26, 'target_text' => 'Then suddenly the blades flashed.', 'source_text' => 'Kemudian secara tiba-tiba bilah mata pedang berkilauan.', 'order' => 65],
            ['start_time' => 319.36, 'end_time' => 325.819, 'target_text' => 'Ka\'b fell and with him fell the voice of slander and betrayal.', 'source_text' => 'Rebahlah Ka\'ab dan bersamanya lenyaplah suara fitnah serta pengkhianatan.', 'order' => 66],
            ['start_time' => 325.919, 'end_time' => 334.62, 'target_text' => 'When the group returned to Medina wounded but victorious, the Prophet peace be upon him smiled and said, "Allahu Akbar."', 'source_text' => 'Apabila kumpulan itu kembali ke Madinah dalam keadaan cedera namun beroleh kemenangan, Nabi ﷺ tersenyum lalu bersabda, "Allahu Akbar."', 'order' => 67],
            ['start_time' => 334.72, 'end_time' => 342.6, 'target_text' => 'The message of Islam stood firm, merciful in peace, decisive in justice.', 'source_text' => 'Seruan Islam berdiri teguh, penuh rahmah dalam perdamaian, dan tegas berani dalam menegakkan keadilan.', 'order' => 68],
            ['start_time' => 342.8, 'end_time' => 351.099, 'target_text' => 'For faith must be defended, not with anger, but with resolve, so that Medina would remain a city of light and safety.', 'source_text' => 'Kerana keimanan mesti dipertahankan, bukan dengan amarah nafsu, tetapi dengan keazaman waja, agar Madinah kekal sebagai kota cahaya dan keamanan.', 'order' => 69],
            ['start_time' => 351.199, 'end_time' => 357.819, 'target_text' => 'And so the city remained standing, its light preserved, its unity protected.', 'source_text' => 'Maka kota itu kekal teguh berdiri, cahayanya terpelihara, dan perpaduannya terlindung.', 'order' => 70],
            ['start_time' => 357.919, 'end_time' => 361.819, 'target_text' => 'But beneath the surface, a shadow continued to move.', 'source_text' => 'Namun di sebalik ketenangan itu, bayang-bayang ancaman terus bergerak.', 'order' => 71],
            ['start_time' => 361.919, 'end_time' => 366.46, 'target_text' => 'The hearts that refused faith grew heavier with envy.', 'source_text' => 'Hati-hati yang menolak keimanan semakin sarat dengan hasad dengki.', 'order' => 72],
            ['start_time' => 366.56, 'end_time' => 370.539, 'target_text' => 'The tongues that mocked in secret grew sharper.', 'source_text' => 'Lidah-lidah yang mengejek secara tersembunyi semakin tajam bisanya.', 'order' => 73],
            ['start_time' => 370.639, 'end_time' => 374.7, 'target_text' => 'The alliances beyond the desert began to form.', 'source_text' => 'Pakatan-pakatan di sebalik padang pasir mula dibentuk.', 'order' => 74],
            ['start_time' => 374.8, 'end_time' => 380.939, 'target_text' => 'For every victory in the path of Allah comes a new test.', 'source_text' => 'Bagi setiap kemenangan di jalan Allah, menyusul pula ujian yang baharu.', 'order' => 75],
            ['start_time' => 381.039, 'end_time' => 389.719, 'target_text' => 'In the next episode, insha\'Allah we walk toward the mountain that holds lessons for every believer.', 'source_text' => 'Dalam episod seterusnya, insya-Allah kita akan menuju ke bukit yang menyimpan pengajaran berharga bagi setiap orang yang beriman.', 'order' => 76],
            ['start_time' => 391.199, 'end_time' => 394.439, 'target_text' => 'Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'Semoga selawat dan salam tercurah ke atas Nabi Muhammad dan seluruh keluarga serta para sahabat baginda.', 'order' => 77],
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
