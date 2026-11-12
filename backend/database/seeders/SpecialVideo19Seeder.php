<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo19Seeder extends Seeder
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

        // Special Bilingual Religious Video #19 (Siri 1 Ep.14): The Brotherhood of Madinah | Life of the Final Messenger ﷺ | Ep.14 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'cRmeK1tKuiY'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Brotherhood of Madinah | Life of the Final Messenger ﷺ | Ep.14 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/cRmeK1tKuiY/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 19,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.32, 'end_time' => 3.66, 'target_text' => 'Every tribe had its responsibilities and rights.', 'source_text' => 'Setiap kabilah mempunyai hak dan tanggungjawab masing-masing.', 'order' => 1],
            ['start_time' => 3.76, 'end_time' => 9.579, 'target_text' => 'No believer would be left helpless and called with a voice that echoed across Medina.', 'source_text' => 'Tiada seorang pun orang beriman akan dibiarkan terbiar, dan seruan dilaungkan dengan suara yang bergema di seluruh Madinah.', 'order' => 2],
            ['start_time' => 9.679, 'end_time' => 11.659, 'target_text' => 'The people of Medina prayed together.', 'source_text' => 'Penduduk Madinah menunaikan solat bersama-sama.', 'order' => 3],
            ['start_time' => 11.759, 'end_time' => 14.3, 'target_text' => 'Islam was now lived openly.', 'source_text' => 'Islam kini diamalkan dan dihayati secara terbuka.', 'order' => 4],
            ['start_time' => 14.4, 'end_time' => 15.82, 'target_text' => 'The masid was built.', 'source_text' => 'Masjid Nabawi telah didirikan.', 'order' => 5],
            ['start_time' => 15.92, 'end_time' => 20.28, 'target_text' => 'The laws of zaka and fasting were revealed.', 'source_text' => 'Hukum-hakam pensyariatan zakat dan ibadah puasa diturunkan.', 'order' => 6],
            ['start_time' => 20.4, 'end_time' => 20.939, 'target_text' => 'man.', 'source_text' => 'Keimanan.', 'order' => 7],
            ['start_time' => 21.039, 'end_time' => 29.019, 'target_text' => 'My beloved brothers and sisters, after a long journey through fear, darkness, and uncertainty, the believers finally arrived', 'source_text' => 'Saudara-saudariku yang dikasihi, setelah menempuh perjalanan yang panjang merentasi ketakutan, kegelapan, dan ketidaktentuan, orang-orang beriman akhirnya tiba', 'order' => 8],
            ['start_time' => 29.119, 'end_time' => 33.02, 'target_text' => 'in a city that had not rejected them, but welcomed them.', 'source_text' => 'di sebuah kota yang tidak menolak mereka, malahan menyambut mereka dengan penuh kasih sayang.', 'order' => 9],
            ['start_time' => 33.12, 'end_time' => 36.139, 'target_text' => 'Medina was not just a place.', 'source_text' => 'Madinah bukan sekadar sebuah tempat berteduh.', 'order' => 10],
            ['start_time' => 36.239, 'end_time' => 45.18, 'target_text' => 'It was a new beginning, a home shaped not by walls or stones, but by hearts ready to love for the sake of Allah.', 'source_text' => 'Ia merupakan satu permulaan baharu, sebuah tanah air yang terbina bukan daripada tembok atau batu, tetapi daripada hati-hati yang bersedia mencintai kerana Allah.', 'order' => 11],
            ['start_time' => 45.28, 'end_time' => 50.619, 'target_text' => 'The Ansar opened their homes, their tables, their wealth, and their hearts.', 'source_text' => 'Kaum Ansar membuka pintu rumah mereka, hidangan makanan mereka, harta benda mereka, dan sanubari mereka.', 'order' => 12],
            ['start_time' => 50.719, 'end_time' => 56.38, 'target_text' => 'The muajirin carried with them patience, faith, and trust in Allah.', 'source_text' => 'Kaum Muhajirin pula membawa bersama mereka kesabaran, keimanan, dan tawakal yang utuh kepada Allah.', 'order' => 13],
            ['start_time' => 56.48, 'end_time' => 64.139, 'target_text' => 'Two groups, once strangers, became brothers, not by blood or tribe, but by faith.', 'source_text' => 'Dua golongan yang dahulunya saling tidak mengenali, kini menjadi saudara—bukan kerana pertalian darah atau kabilah, tetapi kerana ikatan keimanan.', 'order' => 14],
            ['start_time' => 64.239, 'end_time' => 72.76, 'target_text' => 'So come with me to the days when Medina began to glow with unity, compassion, and prayer.', 'source_text' => 'Maka marilah bersama saya menyingkap hari-hari tatkala Madinah mula bersinar dengan perpaduan, belas kasihan, dan solat.', 'order' => 15],
            ['start_time' => 85.84, 'end_time' => 91.019, 'target_text' => 'When the messenger of Allah peace be upon him arrived in Ythre, the city became alive.', 'source_text' => 'Tatkala Rasulullah SAW tiba di Yathrib, kota itu menjadi mekar bercahaya dan hidup bernyawa.', 'order' => 16],
            ['start_time' => 91.119, 'end_time' => 97.339, 'target_text' => 'The air filled with hope and the soil of Medina received the footsteps of prophecy.', 'source_text' => 'Udara diselubungi harapan baharu dan bumi Madinah menyambut jejak-jejak langkah kenabian.', 'order' => 17],
            ['start_time' => 97.439, 'end_time' => 103.26, 'target_text' => 'The believers had left everything behind in Mecca, their homes, wealth, and families.', 'source_text' => 'Orang-orang beriman telah meninggalkan segalanya di Mekah—rumah kediaman, harta kekayaan, dan kaum keluarga mereka.', 'order' => 18],
            ['start_time' => 103.36, 'end_time' => 108.78, 'target_text' => 'But in Medina, they found something far greater, brotherhood.', 'source_text' => 'Namun di Madinah, mereka menemui sesuatu yang jauh lebih bernilai dan agung, iaitu persaudaraan (ukhuwah).', 'order' => 19],
            ['start_time' => 108.88, 'end_time' => 117.339, 'target_text' => 'The prophet peace be upon him gathered the Muajirin and the Ansar together and said, "Become brothers in the way of Allah."', 'source_text' => 'Nabi SAW mengumpulkan kaum Muhajirin dan Ansar bersama-sama lalu bersabda, "Bersaudaralah kamu pada jalan Allah."', 'order' => 20],
            ['start_time' => 117.439, 'end_time' => 122.22, 'target_text' => 'He paired them one by one, not through blood, but through faith.', 'source_text' => 'Baginda mempersaudarakan mereka seorang demi seorang—bukan melalui pertalian darah, tetapi melalui ikatan akidah.', 'order' => 21],
            ['start_time' => 122.32, 'end_time' => 128.599, 'target_text' => 'Each pair stood before him, hands joined, hearts united.', 'source_text' => 'Setiap pasangan berdiri di hadapan Baginda, bertaut tangan, bersatu sanubari.', 'order' => 22],
            ['start_time' => 128.8, 'end_time' => 131.32, 'target_text' => 'Abu Bakr withbu', 'source_text' => 'Abu Bakr dipersaudarakan dengan Kharijah,', 'order' => 23],
            ['start_time' => 133.36, 'end_time' => 137.02, 'target_text' => 'with Malik Abdman', 'source_text' => 'Umar dengan Itban bin Malik, Abdurrahman', 'order' => 24],
            ['start_time' => 137.12, 'end_time' => 138.92, 'target_text' => 'withn', 'source_text' => 'dengan Sa\'ad,', 'order' => 25],
            ['start_time' => 140.879, 'end_time' => 142.679, 'target_text' => 'with', 'source_text' => 'Ali bersama Baginda,', 'order' => 26],
            ['start_time' => 142.879, 'end_time' => 144.62, 'target_text' => 'and', 'source_text' => 'dan', 'order' => 27],
            ['start_time' => 144.72, 'end_time' => 150.54, 'target_text' => 'the prophet peace be upon him took his hand and said, "You are my brother."', 'source_text' => 'Nabi SAW memegang erat tangannya seraya bersabda, "Engkaulah saudaraku."', 'order' => 28],
            ['start_time' => 150.64, 'end_time' => 156.139, 'target_text' => 'The hearts that were once divided by centuries of tribal wars now became one.', 'source_text' => 'Hati-hati yang dahulunya berpecah-belah oleh peperangan kabilah selama berabad-abad kini bertaut menjadi satu.', 'order' => 29],
            ['start_time' => 156.239, 'end_time' => 158.759, 'target_text' => 'The Quran declared', 'source_text' => 'Al-Quran mengisytiharkan firman Allah:', 'order' => 30],
            ['start_time' => 169.44, 'end_time' => 171.34, 'target_text' => 'and he united the hearts.', 'source_text' => '"Dan Dialah yang telah menyatupadukan hati-hati mereka.', 'order' => 31],
            ['start_time' => 171.44, 'end_time' => 176.46, 'target_text' => 'If you had spent all that is in the earth, you could never have united them.', 'source_text' => 'Walaupun kamu membelanjakan segala apa yang ada di bumi, nescaya kamu tidak dapat mempersatukan hati mereka,', 'order' => 32],
            ['start_time' => 176.56, 'end_time' => 179.18, 'target_text' => 'But Allah united them.', 'source_text' => 'tetapi Allah jualah yang telah mempersatukan mereka."', 'order' => 33],
            ['start_time' => 179.28, 'end_time' => 184.059, 'target_text' => 'Then the prophet peace be upon him wrote the first constitution in history.', 'source_text' => 'Kemudian Nabi SAW memaktubkan perlembagaan bertulis yang pertama dalam sejarah umat manusia.', 'order' => 34],
            ['start_time' => 184.159, 'end_time' => 186.3, 'target_text' => 'The sahifa of Medina.', 'source_text' => 'Iaitu Piagam Madinah (Sahifah al-Madinah).', 'order' => 35],
            ['start_time' => 186.4, 'end_time' => 191.34, 'target_text' => 'It began in the name of Allah, the most merciful, the most compassionate.', 'source_text' => 'Ia dimulakan dengan nama Allah, Yang Maha Pemurah lagi Maha Mengasihani.', 'order' => 36],
            ['start_time' => 191.44, 'end_time' => 200.219, 'target_text' => 'This is a document from Muhammad, the messenger of Allah between the believers from Qur and those who follow them and strive', 'source_text' => '"Inilah piagam daripada Muhammad, Rasulullah, antara orang-orang beriman kaum Quraisy dan mereka yang mengikut serta berjuang', 'order' => 37],
            ['start_time' => 200.319, 'end_time' => 201.18, 'target_text' => 'with them.', 'source_text' => 'bersama mereka.', 'order' => 38],
            ['start_time' => 201.28, 'end_time' => 206.84, 'target_text' => 'They are one community to the exclusion of all others.', 'source_text' => 'Sesungguhnya mereka adalah satu ummah (komuniti) yang bersatu padu, terpisah daripada manusia yang lain."', 'order' => 39],
            ['start_time' => 207.28, 'end_time' => 211.9, 'target_text' => 'He declared the sanctity of life, justice and cooperation.', 'source_text' => 'Baginda mengisytiharkan kesucian nyawa manusia, prinsip keadilan, dan tolong-menolong.', 'order' => 40],
            ['start_time' => 212, 'end_time' => 216.3, 'target_text' => 'Every tribe had its responsibilities and rights.', 'source_text' => 'Setiap kabilah mempunyai hak dan tanggungjawab yang saksama.', 'order' => 41],
            ['start_time' => 216.4, 'end_time' => 222.3, 'target_text' => 'No believer would be left helpless and no injustice would go unchallenged.', 'source_text' => 'Tiada seorang mukmin pun akan dibiarkan keseorangan tanpa pembelaan, dan tiada kezaliman yang dibiarkan tanpa dicegah.', 'order' => 42],
            ['start_time' => 222.4, 'end_time' => 228.62, 'target_text' => 'The document ensured that the Jews of Medina lived in peace alongside the Muslims.', 'source_text' => 'Piagam tersebut menjamin kaum Yahudi di Madinah hidup dalam suasana aman damai bersama-sama umat Islam.', 'order' => 43],
            ['start_time' => 228.72, 'end_time' => 236.94, 'target_text' => 'The Jews shall have their religion and the Muslims shall have their religion, their allies and their own selves except those', 'source_text' => '"Kaum Yahudi berhak mengamalkan agama mereka dan orang Islam agama mereka; sekutu-sekutu mereka dan diri mereka sendiri dijamin, kecuali sesiapa', 'order' => 44],
            ['start_time' => 237.04, 'end_time' => 240.699, 'target_text' => 'who commit oppression or sin.', 'source_text' => 'yang melakukan kezaliman atau kemungkaran."', 'order' => 45],
            ['start_time' => 240.799, 'end_time' => 244.859, 'target_text' => 'He affirmed, "The valley of Ythre is sacred for its people.', 'source_text' => 'Baginda menegaskan, "Lembah Yathrib adalah kawasan tanah suci yang terpelihara bagi penghuninya.', 'order' => 46],
            ['start_time' => 244.959, 'end_time' => 248.779, 'target_text' => 'The neighbor shall be protected as oneself.', 'source_text' => 'Jiran tetangga hendaklah dilindungi sebagaimana melindungi diri sendiri.', 'order' => 47],
            ['start_time' => 248.879, 'end_time' => 258.539, 'target_text' => 'The oppressed shall be aided and whoever commits injustice will bear it upon himself and his family." It was a covenant of', 'source_text' => 'Orang yang dizalimi wajib dibantu, dan sesiapa yang melakukan kezaliman nescaya menanggung akibatnya ke atas diri dan keluarganya." Ia merupakan perjanjian', 'order' => 48],
            ['start_time' => 258.639, 'end_time' => 261.58, 'target_text' => 'justice, mercy, and coexistence.', 'source_text' => 'keadilan, rahmah, dan keharmonian hidup bersama.', 'order' => 49],
            ['start_time' => 261.68, 'end_time' => 265.74, 'target_text' => 'A model of governance centuries ahead of its time.', 'source_text' => 'Suatu model tadbir urus kenegaraan yang mendahului zamannya berabad-abad lamanya.', 'order' => 50],
            ['start_time' => 265.84, 'end_time' => 272.68, 'target_text' => 'Then came the call that would forever mark the ummah, the adan.', 'source_text' => 'Kemudian bergema seruan azan yang akan menandakan identiti umat Islam buat selama-lamanya.', 'order' => 51],
            ['start_time' => 272.8, 'end_time' => 278.14, 'target_text' => 'A companion named Abdullahbin Zed saw a vision in his sleep.', 'source_text' => 'Seorang sahabat bernama Abdullah bin Zaid RA melihat mimpi petunjuk dalam tidurnya.', 'order' => 52],
            ['start_time' => 278.24, 'end_time' => 286.6, 'target_text' => 'A man carrying a bell said to him, "Shall I show you something better than this?" He then recited.', 'source_text' => 'Seorang lelaki yang membawa loceng berkata kepadanya, "Mahukah aku tunjukkan kepadamu seruan yang jauh lebih baik daripada ini?" Lalu dia mengalunkan azan.', 'order' => 53],
            ['start_time' => 291.759, 'end_time' => 296.379, 'target_text' => 'When the prophet peace be upon him heard of it, he said, "It is a true vision.', 'source_text' => 'Tatkala Nabi SAW mendengar mengenainya, Baginda bersabda, "Sesungguhnya ini adalah mimpi yang benar.', 'order' => 54],
            ['start_time' => 296.479, 'end_time' => 305.9, 'target_text' => 'By the will of Allah, teach it to Bilal, for his voice is strong." And Bilal ascended and called with a voice that echoed', 'source_text' => 'Dengan izin Allah, ajarkanlah ia kepada Bilal, kerana suaranya amat lantang merdu." Lalu Bilal naik ke tempat tinggi dan melaungkan seruan azan yang bergema', 'order' => 55],
            ['start_time' => 306, 'end_time' => 307.58, 'target_text' => 'across Medina.', 'source_text' => 'ke serata pelusuk kota Madinah.', 'order' => 56],
            ['start_time' => 307.68, 'end_time' => 317.099, 'target_text' => 'Omar, may Allah be pleased with them all, ran, his eyes filled with tears, saying, "By Allah, oh messenger of Allah, I saw', 'source_text' => 'Umar RA berlari keluar dengan mata yang berkaca air mata, seraya berkata, "Demi Allah, wahai Rasulullah, sesungguhnya aku melihat', 'order' => 57],
            ['start_time' => 317.199, 'end_time' => 323.819, 'target_text' => 'the same vision." The prophet peace be upon him smiled and said, "This is revelation from Allah."', 'source_text' => 'mimpi yang sama!" Nabi SAW tersenyum seraya bersabda, "Ini adalah wahyu petunjuk daripada Allah."', 'order' => 58],
            ['start_time' => 323.919, 'end_time' => 326.3, 'target_text' => 'The people of Medina prayed together.', 'source_text' => 'Seluruh penduduk Madinah menunaikan solat bersama-sama.', 'order' => 59],
            ['start_time' => 326.4, 'end_time' => 329.42, 'target_text' => 'Islam was now lived openly.', 'source_text' => 'Islam kini diamalkan secara terang-terangan dan terbuka.', 'order' => 60],
            ['start_time' => 329.52, 'end_time' => 331.659, 'target_text' => 'The masid was built.', 'source_text' => 'Masjid Nabawi siap terbina.', 'order' => 61],
            ['start_time' => 331.759, 'end_time' => 335.26, 'target_text' => 'The laws of zaka and fasting were revealed.', 'source_text' => 'Syariat zakat dan ibadah puasa mula difardukan.', 'order' => 62],
            ['start_time' => 335.36, 'end_time' => 338.92, 'target_text' => 'And the faith became a community.', 'source_text' => 'Dan keimanan itu bertukar menjadi sebuah masyarakat yang utuh.', 'order' => 63],
            ['start_time' => 339.039, 'end_time' => 342.12, 'target_text' => 'The Quran described them.', 'source_text' => 'Al-Quran memuji kemuliaan pekerti mereka:', 'order' => 64],
            ['start_time' => 351.12, 'end_time' => 352.92, 'target_text' => 'Those', 'source_text' => '"Dan orang-orang', 'order' => 65],
            ['start_time' => 355.84, 'end_time' => 363.74, 'target_text' => 'who had settled in the city and had faith before them loved those who immigrated to them and find no envy in their hearts', 'source_text' => 'yang mendiami kota (Madinah) dan beriman sebelum mereka, mengasihi orang-orang yang berhijrah kepada mereka, dan tiada sekelumit dengki di dalam hati mereka', 'order' => 66],
            ['start_time' => 363.84, 'end_time' => 372.06, 'target_text' => 'for what they are given but prefer them over themselves even if they too are in need.', 'source_text' => 'terhadap apa yang diberikan kepada mereka; bahkan mereka mengutamakan saudara mereka melebihi diri mereka sendiri, sekalipun mereka sendiri dalam kesempitan."', 'order' => 67],
            ['start_time' => 372.16, 'end_time' => 379.9, 'target_text' => 'Thus the first Muslim society was born not of conquest but of compassion, not of blood but of brotherhood.', 'source_text' => 'Demikianlah masyarakat Islam pertama lahir—bukan hasil penaklukan pedang tetapi kasih sayang, bukan berasaskan keturunan tetapi persaudaraan akidah.', 'order' => 68],
            ['start_time' => 380, 'end_time' => 391.4, 'target_text' => 'From that day, the world would know Medina not just as a city but as the heart of an ummah united under one word.', 'source_text' => 'Mulai hari itu, dunia mengenali Madinah bukan sekadar sebuah kota, tetapi nadi utama ummah yang bersatu di bawah satu kalimah tauhid.', 'order' => 69],
            ['start_time' => 394.96, 'end_time' => 397.42, 'target_text' => 'And so Medina came to life.', 'source_text' => 'Maka hiduplah Madinah dengan penuh keberkatan.', 'order' => 70],
            ['start_time' => 397.52, 'end_time' => 401.74, 'target_text' => 'A community built on mercy, trust and brotherhood.', 'source_text' => 'Sebuah masyarakat yang terbina di atas landasan rahmah, kepercayaan, dan persaudaraan sejati.', 'order' => 71],
            ['start_time' => 401.84, 'end_time' => 406.379, 'target_text' => 'A place where Islam was not only believed but lived.', 'source_text' => 'Sebuah tempat di mana Islam bukan sahaja diyakini di dalam hati, malah dihayati dalam setiap aspek kehidupan.', 'order' => 72],
            ['start_time' => 406.479, 'end_time' => 409.74, 'target_text' => 'But soon that peace would be tested.', 'source_text' => 'Namun tidak lama lagi, keamanan itu bakal diuji hebat.', 'order' => 73],
            ['start_time' => 409.84, 'end_time' => 413.9, 'target_text' => 'Not in whispers but on the open field.', 'source_text' => 'Bukan lagi dengan bisikan rahsia, tetapi di medan pertempuran yang terbuka.', 'order' => 74],
            ['start_time' => 414, 'end_time' => 421.58, 'target_text' => 'In the next episode, inshallah we walk toward the day that would separate truth from falsehood.', 'source_text' => 'Dalam episod akan datang insya-Allah, kita akan melangkah menuju hari pemisah antara kebenaran dan kebatilan.', 'order' => 75],
            ['start_time' => 421.68, 'end_time' => 423.26, 'target_text' => 'The day of bad.', 'source_text' => 'Iaitu Hari Perang Badar (Yaumul Furqan).', 'order' => 76],
            ['start_time' => 423.36, 'end_time' => 425.16, 'target_text' => 'S', 'source_text' => 'ﷺ.', 'order' => 77],
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
