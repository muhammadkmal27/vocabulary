<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo23Seeder extends Seeder
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

        // Special Bilingual Religious Video #23 (Siri 1 Ep.18): The Aftermath of Uhud | Life of the Final Messenger ﷺ | Ep.18 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'dsQkLDtVy4Q'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Aftermath of Uhud | Life of the Final Messenger ﷺ | Ep.18 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/dsQkLDtVy4Q/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 23,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.4, 'end_time' => 9.74, 'target_text' => 'Then they met Ma\'bad al-Khuza\'i who warned them, "Muhammad has come after you with an army like none you\'ve seen."', 'source_text' => 'Kemudian mereka bertemu dengan Ma\'bad al-Khuza\'i yang memberi amaran, "Muhammad sedang mengejar kamu dengan bala tentera yang belum pernah kamu saksikan."', 'order' => 1],
            ['start_time' => 9.84, 'end_time' => 13.399, 'target_text' => 'Among those in Medina was Abdullah ibn Ubayy,', 'source_text' => 'Antara mereka yang berada di Madinah ialah Abdullah ibn Ubayy,', 'order' => 2],
            ['start_time' => 13.599, 'end_time' => 15.18, 'target_text' => 'the hypocrite.', 'source_text' => 'sang ketua munafik.', 'order' => 3],
            ['start_time' => 15.28, 'end_time' => 21.56, 'target_text' => 'The tribes of Najd betrayed them, capturing or killing them treacherously.', 'source_text' => 'Kabilah-kabilah dari Najd telah mengkhianati mereka, menawan atau membunuh mereka secara kejam.', 'order' => 4],
            ['start_time' => 23.119, 'end_time' => 32.139, 'target_text' => 'Bismillahir Rahmanir Rahim. My beloved brothers and sisters, after the echoes of Uhud settled, the air of Medina was heavy.', 'source_text' => 'Bismillahir Rahmanir Rahim. Saudara dan saudariku yang dikasihi, setelah reda gemuruh perang Uhud, suasana di Madinah terasa amat pilu.', 'order' => 5],
            ['start_time' => 32.239, 'end_time' => 35.979, 'target_text' => 'Hearts were bruised, wounds still open, and the memory of loss lingered.', 'source_text' => 'Hati-hati terluka, parut kecederaan masih berdarah, dan kepedihan akibat kehilangan insan tersayang masih menyelubungi.', 'order' => 6],
            ['start_time' => 36.079, 'end_time' => 40.139, 'target_text' => 'But faith is not measured only in moments of victory.', 'source_text' => 'Namun keimanan tidak diukur hanya pada detik-detik kemenangan.', 'order' => 7],
            ['start_time' => 40.239, 'end_time' => 44.94, 'target_text' => 'It is measured in how we rise after we fall.', 'source_text' => 'Ia diukur pada bagaimana kita bangkit semula setelah kita tersungkur.', 'order' => 8],
            ['start_time' => 45.04, 'end_time' => 50.939, 'target_text' => 'In the quiet days that followed, the believers learned the meaning of patience.', 'source_text' => 'Pada hari-hari hening yang menyusul, kaum mukminin mempelajari erti kesabaran yang sebenar.', 'order' => 9],
            ['start_time' => 51.039, 'end_time' => 59.58, 'target_text' => 'Not the patience of waiting, but the patience of healing, reflecting, and trusting Allah when the heart feels fragile.', 'source_text' => 'Bukan sekadar sabar menunggu, melainkan sabar dalam merawat luka, bermuhasabah, dan berserah diri kepada Allah tatkala jiwa rapuh.', 'order' => 10],
            ['start_time' => 59.68, 'end_time' => 71, 'target_text' => 'So come with me to the days when the ummah learned that sacrifice is not only on the battlefield, but in the courage to continue.', 'source_text' => 'Maka marilah bersama saya menyelami hari-hari tatkala ummah ini belajar bahawa pengorbanan bukan hanya di medan perang, tetapi pada keberanian untuk terus melangkah.', 'order' => 11],
            ['start_time' => 84.64, 'end_time' => 87.18, 'target_text' => 'The night after Uhud was heavy.', 'source_text' => 'Malam selepas perang Uhud terasa amat berat dan mencengkam.', 'order' => 12],
            ['start_time' => 87.28, 'end_time' => 89.26, 'target_text' => 'Medina lay in silence.', 'source_text' => 'Kota Madinah diselubungi keheningan yang sunyi.', 'order' => 13],
            ['start_time' => 89.36, 'end_time' => 91.979, 'target_text' => 'Its streets filled with grief.', 'source_text' => 'Jalan-jalannya sarat dengan duka nestapa.', 'order' => 14],
            ['start_time' => 92.079, 'end_time' => 94.78, 'target_text' => 'Its hearts aching from loss.', 'source_text' => 'Sanubari penghuninya pedih menanggung kehilangan.', 'order' => 15],
            ['start_time' => 94.88, 'end_time' => 99.019, 'target_text' => '70 of the Prophet\'s companions had returned to Allah,', 'source_text' => 'Seramai 70 orang sahabat Nabi telah kembali ke rahmatullah,', 'order' => 16],
            ['start_time' => 99.119, 'end_time' => 100.62, 'target_text' => 'may Allah be pleased with them.', 'source_text' => 'semoga Allah meredhai mereka sekalian.', 'order' => 17],
            ['start_time' => 100.72, 'end_time' => 108.22, 'target_text' => 'And among them was the lion of Allah, Hamzah ibn Abdil Muttalib, may Allah be pleased with him.', 'source_text' => 'Dan antara mereka ialah singa Allah, Hamzah bin Abdul Muttalib, semoga Allah meredhainya.', 'order' => 18],
            ['start_time' => 108.32, 'end_time' => 110.059, 'target_text' => 'But the mission was not over.', 'source_text' => 'Namun perjuangan dakwah belum lagi berakhir.', 'order' => 19],
            ['start_time' => 110.159, 'end_time' => 115.58, 'target_text' => 'The Messenger of Allah, peace be upon him, would not let despair take root.', 'source_text' => 'Rasulullah ﷺ tidak membiarkan rasa putus asa bertapak di dalam sanubari umat.', 'order' => 20],
            ['start_time' => 115.68, 'end_time' => 125.26, 'target_text' => 'He called upon his wounded companions and said, "None shall go out with me except those who stood at Uhud."', 'source_text' => 'Baginda menyeru para sahabatnya yang cedera seraya bersabda, "Tiada siapa yang boleh keluar bersamaku melainkan mereka yang turut serta di Uhud."', 'order' => 21],
            ['start_time' => 125.36, 'end_time' => 135.02, 'target_text' => 'And so even the injured rose, some leaning on others, their bandages still fresh, and they marched once more.', 'source_text' => 'Lalu mereka yang tercedera pun bangkit, ada yang berpapah sesama sendiri dengan balutan luka yang masih basah, lalu mara berarak sekali lagi.', 'order' => 22],
            ['start_time' => 135.12, 'end_time' => 139.1, 'target_text' => 'At dawn, the Prophet peace be upon him set forth with determination.', 'source_text' => 'Pada waktu subuh, Nabi ﷺ berangkat keluar dengan penuh keazaman.', 'order' => 23],
            ['start_time' => 139.2, 'end_time' => 141.26, 'target_text' => 'He appointed', 'source_text' => 'Baginda melantik', 'order' => 24],
            ['start_time' => 141.36, 'end_time' => 150.779, 'target_text' => 'Ibn Umm Maktum, may Allah be pleased with him, to lead prayer in Medina and advanced to Hamra\' al-Asad, eight miles away.', 'source_text' => 'Ibn Ummi Maktum, semoga Allah meredhainya, untuk mengimamkan solat di Madinah, lalu baginda mara menuju ke Hamra\' al-Asad, sejauh lapan batu.', 'order' => 25],
            ['start_time' => 150.879, 'end_time' => 156.46, 'target_text' => 'Quraysh led by Abu Sufyan had begun to reconsider.', 'source_text' => 'Kaum Quraisy di bawah pimpinan Abu Sufyan mula berfikir panjang.', 'order' => 26],
            ['start_time' => 156.56, 'end_time' => 160.94, 'target_text' => 'They had inflicted losses, yes, but not victory.', 'source_text' => 'Mereka telah mengakibatkan korban nyawa, ya, namun mereka belum mencapai kemenangan mutlak.', 'order' => 27],
            ['start_time' => 161.04, 'end_time' => 165.74, 'target_text' => 'They debated returning to finish what they started.', 'source_text' => 'Mereka berbincang sesama sendiri untuk berpatah balik bagi menamatkan apa yang telah mereka mulakan.', 'order' => 28],
            ['start_time' => 165.84, 'end_time' => 174.38, 'target_text' => 'Then they met Ma\'bad al-Khuza\'i who warned them, "Muhammad has come after you with an army like none you\'ve seen.', 'source_text' => 'Kemudian mereka bertemu Ma\'bad al-Khuza\'i yang memberi amaran, "Muhammad sedang mengejar kamu bersama pasukan tentera yang belum pernah kamu saksikan.', 'order' => 29],
            ['start_time' => 174.48, 'end_time' => 177.66, 'target_text' => 'Their eyes burn with vengeance."', 'source_text' => 'Mata mereka menyala dengan api kemarahan menuntut bela."', 'order' => 30],
            ['start_time' => 177.76, 'end_time' => 179.419, 'target_text' => 'Fear crept into their hearts.', 'source_text' => 'Rasa gerun dan gentar mula merayap ke dalam sanubari mereka.', 'order' => 31],
            ['start_time' => 179.519, 'end_time' => 183.9, 'target_text' => 'Abu Sufyan said, "Then we shall not return."', 'source_text' => 'Abu Sufyan lantas berkata, "Jika begitu, kita tidak akan berpatah balik."', 'order' => 32],
            ['start_time' => 184, 'end_time' => 191.66, 'target_text' => 'And he sent a message to Medina through passing travelers saying, "We have gathered again to strike you."', 'source_text' => 'Lalu dia mengirimkan utusan ancaman ke Madinah melalui para kafilah yang lalu, menyatakan, "Kami telah berkumpul semula untuk menyerang kamu."', 'order' => 33],
            ['start_time' => 191.76, 'end_time' => 196.119, 'target_text' => 'When the Prophet peace be upon him heard this, he replied calmly,', 'source_text' => 'Tatkala Nabi ﷺ mendengar perkhabaran ancaman ini, baginda menjawab dengan tenang,', 'order' => 34],
            ['start_time' => 198.4, 'end_time' => 204.039, 'target_text' => '"Allah is sufficient for us, and He is the best disposer of affairs."', 'source_text' => '"Cukuplah Allah bagi kami, dan Dialah sebaik-baik Pengurus segala urusan."', 'order' => 35],
            ['start_time' => 204.8, 'end_time' => 212.859, 'target_text' => 'Among those in Medina was Abdullah ibn Ubayy ibn Salul, the hypocrite who had abandoned the army before.', 'source_text' => 'Antara mereka yang berada di Madinah ialah Abdullah ibn Ubayy ibn Salul, ketua munafik yang telah berpaling undur meninggalkan pasukan tentera sebelumnya.', 'order' => 36],
            ['start_time' => 212.959, 'end_time' => 218.94, 'target_text' => 'After the battle, he rose in the mosque to speak as he once used to.', 'source_text' => 'Selepas pertempuran tersebut, dia bangkit berdiri di dalam masjid untuk berucap seperti kebiasaannya dahulu.', 'order' => 37],
            ['start_time' => 219.04, 'end_time' => 221.34, 'target_text' => 'But the companions turned away.', 'source_text' => 'Namun para sahabat menariknya duduk dan berpaling daripadanya.', 'order' => 38],
            ['start_time' => 221.44, 'end_time' => 226.62, 'target_text' => 'The Messenger of Allah, peace be upon him, had exposed truth and falsehood alike.', 'source_text' => 'Rasulullah ﷺ telah mendedahkan hakikat kebenaran dan kepalsuan dengan sejelas-jelasnya.', 'order' => 39],
            ['start_time' => 226.72, 'end_time' => 232.94, 'target_text' => 'Uhud had separated hearts, some purified, others darkened forever.', 'source_text' => 'Perang Uhud telah memisahkan hati-hati manusia, sebahagiannya disucikan, manakala sebahagian lagi digelapkan selama-lamanya.', 'order' => 40],
            ['start_time' => 233.04, 'end_time' => 240.699, 'target_text' => 'It was a day of testing, a day when Allah distinguished the believers from the hypocrites.', 'source_text' => 'Ia adalah hari ujian yang nyata, hari tatkala Allah membezakan orang-orang yang beriman daripada golongan munafik.', 'order' => 41],
            ['start_time' => 240.799, 'end_time' => 243.98, 'target_text' => 'From the ashes of Uhud came new stories of courage.', 'source_text' => 'Daripada abu kepedihan Uhud, lahirlah kisah-kisah keberanian yang baharu.', 'order' => 42],
            ['start_time' => 244.08, 'end_time' => 251.98, 'target_text' => 'When the Prophet peace be upon him returned to Medina, tribes from Najd approached saying, "Send with us men who will teach us', 'source_text' => 'Apabila Nabi ﷺ kembali ke Madinah, kabilah-kabilah dari Najd datang menghadap seraya berkata, "Hantarkanlah bersama kami mereka yang boleh mengajar kami', 'order' => 43],
            ['start_time' => 252.08, 'end_time' => 253.98, 'target_text' => 'the Quran and the faith."', 'source_text' => 'tentang al-Quran dan asas keimanan."', 'order' => 44],
            ['start_time' => 254.08, 'end_time' => 256.94, 'target_text' => 'He sent six of his noble companions,', 'source_text' => 'Baginda menghantar enam orang sahabat baginda yang mulia,', 'order' => 45],
            ['start_time' => 257.04, 'end_time' => 259.159, 'target_text' => 'among them \'Asim ibn Thabit,', 'source_text' => 'antara mereka ialah \'Asim bin Thabit,', 'order' => 46],
            ['start_time' => 261.199, 'end_time' => 263.099, 'target_text' => 'Khubayb, and Zayd.', 'source_text' => 'Khubaib, dan Zaid.', 'order' => 47],
            ['start_time' => 263.199, 'end_time' => 264.7, 'target_text' => 'But it was a trap.', 'source_text' => 'Namun rupa-rupanya ia adalah suatu jerangkap samar pengkhianatan.', 'order' => 48],
            ['start_time' => 264.8, 'end_time' => 270.94, 'target_text' => 'The tribes of Najd betrayed them, capturing or killing them treacherously.', 'source_text' => 'Kabilah-kabilah Najd itu mengkhianati mereka, menawan dan membunuh mereka secara licik dan kejam.', 'order' => 49],
            ['start_time' => 271.04, 'end_time' => 276.62, 'target_text' => '\'Asim fought until his last breath, refusing to surrender.', 'source_text' => '\'Asim berjuang bermati-matian hingga ke hembusan nafas terakhir, enggan sesekali menyerah kalah.', 'order' => 50],
            ['start_time' => 276.72, 'end_time' => 285.02, 'target_text' => 'When they sought to cut his head for a bounty, Allah sent bees and hornets to guard his body, fulfilling his prayer:', 'source_text' => 'Tatkala musuh cuba memenggal kepalanya demi ganjaran upahan, Allah mengirimkan kawanan lebah dan tebuan menjaga jasadnya, memakbulkan doanya:', 'order' => 51],
            ['start_time' => 285.12, 'end_time' => 289.18, 'target_text' => '"O Allah, protect my body from the touch of the disbelievers."', 'source_text' => '"Ya Allah, lindungilah jasadku daripada disentuh oleh orang-orang kafir."', 'order' => 52],
            ['start_time' => 289.28, 'end_time' => 293.18, 'target_text' => 'And Allah did, in life and in death.', 'source_text' => 'Dan Allah memeliharanya, ketika hidupnya mahupun sesudah wafatnya.', 'order' => 53],
            ['start_time' => 293.28, 'end_time' => 296.379, 'target_text' => 'Among the captured were Zayd ibn al-Dathinah', 'source_text' => 'Antara sahabat yang ditawan ialah Zaid bin ad-Dathinah', 'order' => 54],
            ['start_time' => 296.479, 'end_time' => 298.6, 'target_text' => 'and Khubayb ibn \'Adiy.', 'source_text' => 'dan Khubaib bin \'Adiy.', 'order' => 55],
            ['start_time' => 299.12, 'end_time' => 301.5, 'target_text' => 'They were sold in Makkah.', 'source_text' => 'Mereka dibawa lalu dijual sebagai tawanan di Mekah.', 'order' => 56],
            ['start_time' => 301.6, 'end_time' => 311.659, 'target_text' => 'Before his execution, Zayd was asked by Abu Sufyan, "Would you rather that Muhammad were in your place and you be safe with', 'source_text' => 'Sebelum hukuman bunuh dijalankan, Zaid disoal oleh Abu Sufyan, "Tidakkah engkau lebih suka sekiranya Muhammad berada di tempatmu ini sedangkan engkau selamat bersama', 'order' => 57],
            ['start_time' => 311.759, 'end_time' => 321.18, 'target_text' => 'your family?" He replied, "By Allah, I would not wish that even a thorn should prick the Prophet peace be upon him while I', 'source_text' => 'keluargamu?" Zaid menjawab tegas, "Demi Allah, aku tidak rela walau sebatang duri menusuk Nabi ﷺ tatkala aku', 'order' => 58],
            ['start_time' => 321.28, 'end_time' => 331.34, 'target_text' => 'sit among my people." Abu Sufyan turned away and said, "I have never seen anyone love another as Muhammad\'s companions love', 'source_text' => 'sedang duduk berehat bersama keluargaku." Abu Sufyan berpaling seraya berkata takjub, "Aku belum pernah melihat sesiapa mengasihi orang lain sebagaimana para sahabat Muhammad mencintai', 'order' => 59],
            ['start_time' => 331.44, 'end_time' => 339.819, 'target_text' => 'him." Khubayb, may Allah be pleased with him, before his crucifixion, asked to pray two units of prayer,', 'source_text' => 'baginda." Manakala Khubaib, semoga Allah meredhainya, sebelum disalib, meminta izin untuk mendirikan solat sunat dua rakaat,', 'order' => 60],
            ['start_time' => 339.919, 'end_time' => 344.22, 'target_text' => 'the first to ever do so before martyrdom.', 'source_text' => 'menjadikannya orang pertama yang memulakan sunnah solat dua rakaat sebelum syahid.', 'order' => 61],
            ['start_time' => 344.32, 'end_time' => 354.46, 'target_text' => 'He lifted his face to the sky and said, "O Allah, count them one by one and let not a single one of them escape." And he', 'source_text' => 'Dia menadahkan wajahnya ke langit seraya berdoa, "Ya Allah, hitunglah bilangan mereka satu persatu dan jangan biarkan seorang pun terlepas." Lalu dia', 'order' => 62],
            ['start_time' => 354.56, 'end_time' => 361.74, 'target_text' => 'was executed with peace on his lips and the remembrance of Allah in his heart.', 'source_text' => 'dibunuh dengan ketenangan terukir di bibirnya dan zikir kepada Allah bersemadi di sanubarinya.', 'order' => 63],
            ['start_time' => 361.84, 'end_time' => 369.34, 'target_text' => 'As the Prophet peace be upon him learned of their deaths, his eyes filled with tears, but his voice remained steady.', 'source_text' => 'Tatkala Nabi ﷺ menerima perkhabaran tentang kematian mereka, berlinanganlah air mata baginda, namun suara baginda kekal tabah.', 'order' => 64],
            ['start_time' => 369.44, 'end_time' => 371.98, 'target_text' => '"Your brothers were sincere," he said.', 'source_text' => '"Saudara-saudara kamu adalah orang yang benar-benar ikhlas," sabda baginda.', 'order' => 65],
            ['start_time' => 372.08, 'end_time' => 374.86, 'target_text' => '"They fulfilled their pledge to Allah."', 'source_text' => '"Mereka telah menyempurnakan janji setia mereka kepada Allah."', 'order' => 66],
            ['start_time' => 374.96, 'end_time' => 379.16, 'target_text' => 'And verses descended, honoring their truth:', 'source_text' => 'Dan turunlah ayat-ayat suci al-Quran memuliakan kebenaran mereka:', 'order' => 67],
            ['start_time' => 390.72, 'end_time' => 395.5, 'target_text' => '"Among the believers are men who have been true to what they promised Allah.', 'source_text' => '"Antara orang-orang mukmin itu ada orang-orang yang menepati apa yang telah mereka janjikan kepada Allah;', 'order' => 68],
            ['start_time' => 395.6, 'end_time' => 402.92, 'target_text' => 'Some of them have fulfilled their vow, and some are still waiting, but they have never changed."', 'source_text' => 'maka di antara mereka ada yang gugur menepati janjinya, dan di antara mereka ada yang menunggu-nunggu, dan mereka tidak mengubah janji mereka sedikit pun."', 'order' => 69],
            ['start_time' => 403.52, 'end_time' => 406.78, 'target_text' => 'The desert winds carried their memory.', 'source_text' => 'Tiupan angin padang pasir membawa pergi kenangan abadi perjuangan mereka.', 'order' => 70],
            ['start_time' => 406.88, 'end_time' => 410.46, 'target_text' => 'The bravery of those who refused to surrender,', 'source_text' => 'Keberanian waja mereka yang enggan menyerah kalah,', 'order' => 71],
            ['start_time' => 410.56, 'end_time' => 419.659, 'target_text' => 'the patience of those who died teaching the Quran, and the mercy of a Prophet peace be upon him who never lost hope in Allah\'s', 'source_text' => 'kesabaran murni mereka yang syahid ketika mengajarkan al-Quran, serta sifat rahmah seorang Nabi ﷺ yang tidak pernah putus harapan terhadap', 'order' => 72],
            ['start_time' => 419.759, 'end_time' => 431.42, 'target_text' => 'plan. From the bloodstained sands of Uhud to the betrayal of the tribes of Najd, every loss became a verse, every wound a lesson that', 'source_text' => 'ketetapan Allah. Daripada padang pasir Uhud yang berlumuran darah hinggalah kepada pengkhianatan kabilah-kabilah Najd, setiap kehilangan menjadi bait pengajaran, setiap luka menjadi iktibar bahawa', 'order' => 73],
            ['start_time' => 431.52, 'end_time' => 436.439, 'target_text' => 'faith is not proven in victory, but in steadfastness.', 'source_text' => 'keimanan tidak dibuktikan hanya ketika mengecap kemenangan, sebaliknya dalam ketabahan dan keteguhan jiwa.', 'order' => 74],
            ['start_time' => 436.639, 'end_time' => 443.9, 'target_text' => 'And so the wounds of Uhud were not a sign of weakness; they were lessons written into the hearts of the ummah.', 'source_text' => 'Maka luka-luka perang Uhud bukanlah tanda kelemahan; sebaliknya ia adalah iktibar yang terpahat kukuh di dalam sanubari ummah.', 'order' => 75],
            ['start_time' => 444, 'end_time' => 447.58, 'target_text' => 'For Allah does not raise a nation without shaping it.', 'source_text' => 'Kerana Allah tidak mengangkat kedudukan sesuatu umat melainkan setelah mendidiknya melalui ujian.', 'order' => 76],
            ['start_time' => 447.68, 'end_time' => 452.62, 'target_text' => 'And strength forged in pain becomes strength that cannot be shaken.', 'source_text' => 'Dan kekuatan yang ditempa di dalam kancah keperitan akan menjadi kekuatan ampuh yang tidak mampu digoyahkan.', 'order' => 77],
            ['start_time' => 452.72, 'end_time' => 459.02, 'target_text' => 'But even as the believers healed, there were those in Medina whose hearts darkened with envy and resentment.', 'source_text' => 'Namun tatkala kaum mukminin mula merawat luka, masih ada golongan di Madinah yang hatinya semakin kelam dengan hasad dengki dan dendam.', 'order' => 78],
            ['start_time' => 459.12, 'end_time' => 466.62, 'target_text' => 'Whispers began to move in hidden corners, promises were broken, and alliances formed in shadows.', 'source_text' => 'Bisikan jahat mula tersebar di sudut-sudut tersembunyi, janji-janji dimungkiri, dan pakatan jahat dibentuk di dalam kegelapan.', 'order' => 79],
            ['start_time' => 466.72, 'end_time' => 475.18, 'target_text' => 'In the next episode, insha\'Allah, we will witness how the Prophet peace be upon him faced betrayal with wisdom, justice, and unwavering', 'source_text' => 'Dalam episod seterusnya, insya-Allah, kita akan menyaksikan bagaimana Nabi ﷺ berhadapan dengan pengkhianatan dengan penuh kebijaksanaan, keadilan, dan keyakinan', 'order' => 80],
            ['start_time' => 475.28, 'end_time' => 477.559, 'target_text' => 'trust in Allah.', 'source_text' => 'yang tidak berbelah bahagi kepada Allah.', 'order' => 81],
            ['start_time' => 478.16, 'end_time' => 480.36, 'target_text' => 'Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'Semoga selawat dan salam tercurah ke atas Nabi Muhammad dan seluruh keluarga serta para sahabat baginda.', 'order' => 82],
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
