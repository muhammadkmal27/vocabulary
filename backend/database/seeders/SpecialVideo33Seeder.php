<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo33Seeder extends Seeder
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

        // Special Bilingual Religious Video #33 (Siri 1 Ep.28): The Expedition to Tabuk | Life of the Final Messenger ﷺ | Ep.28 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'LZPqtScwpJQ'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Expedition to Tabuk | Life of the Final Messenger ﷺ | Ep.28 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/LZPqtScwpJQ/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 33,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.0, 'end_time' => 4.0, 'target_text' => 'The Prophet (peace be upon him) sent Talhah ibn Ubaydillah,', 'source_text' => 'Baginda Nabi ﷺ telah mengutuskan Talhah bin Ubaidillah RA,', 'order' => 1],
            ['start_time' => 4.0, 'end_time' => 9.12, 'target_text' => 'may Allah be pleased with him, with a group of companions to burn the house down upon them.', 'source_text' => 'semoga Allah meredhainya, bersama sekumpulan sahabat untuk membakar rumah tempat persembunyian mereka.', 'order' => 2],
            ['start_time' => 9.12, 'end_time' => 12.08, 'target_text' => 'They escaped, but their conspiracy ended there.', 'source_text' => 'Mereka berjaya melarikan diri, namun pakatan jahat mereka berakhir di situ.', 'order' => 3],
            ['start_time' => 13.04, 'end_time' => 17.84, 'target_text' => 'The march was long. The heat of the Arabian desert burned like fire,', 'source_text' => 'Perjalanan itu amat jauh. Bahang padang pasir Semenanjung Arab membakar laksana api,', 'order' => 4],
            ['start_time' => 17.84, 'end_time' => 23.36, 'target_text' => 'and the believers had little food or water, but their hearts remained steadfast.', 'source_text' => 'dan orang-orang beriman hanya memiliki sedikit bekalan makanan dan air, namun hati mereka tetap teguh berpaut.', 'order' => 5],
            ['start_time' => 23.36, 'end_time' => 28.88, 'target_text' => 'Bismillahir Rahmanir Rahim. My beloved brothers and sisters, the expedition to Tabuk', 'source_text' => 'Bismillahir Rahmanir Rahim. Saudara dan saudariku yang dikasihi, Ekspedisi Perang Tabuk', 'order' => 6],
            ['start_time' => 28.88, 'end_time' => 34.96, 'target_text' => 'was not a battle of swords, but a test of the heart. The heat was intense.', 'source_text' => 'bukanlah sekadar pertempuran mata pedang, sebaliknya suatu ujian keimanan sanubari. Kepanasan terik membakar.', 'order' => 7],
            ['start_time' => 34.96, 'end_time' => 42.0, 'target_text' => 'The journey was long. The provisions few. Yet those who were sincere stepped forward,', 'source_text' => 'Musafir perjalanan amat jauh. Bekalan kian mencukupi. Namun insan-insan yang ikhlas tampil ke hadapan,', 'order' => 8],
            ['start_time' => 42.0, 'end_time' => 49.76, 'target_text' => 'while those whose faith was only on the tongue, held back. So come with me to a journey that', 'source_text' => 'manakala mereka yang imannya sekadar di bibir lidah, berundur mengelak. Maka marilah bersama saya menyusuri safar yang', 'order' => 9],
            ['start_time' => 49.76, 'end_time' => 53.76, 'target_text' => 'revealed intentions and purified hearts.', 'source_text' => 'menyingkap segala niat dan menyucikan sanubari hati.', 'order' => 10],
            ['start_time' => 68.24, 'end_time' => 74.64, 'target_text' => 'It was the ninth year after Hijrah, the scorching sun of Madinah hung heavy in the sky,', 'source_text' => 'Ketika itu tahun kesembilan Hijrah, terik matahari kota Madinah membahang di angkasa raya,', 'order' => 11],
            ['start_time' => 74.64, 'end_time' => 81.12, 'target_text' => 'and the date palms had just ripened with fruit. People longed for shade, for comfort,', 'source_text' => 'dan pohon-pohon kurma baru sahaja ranum membuahkan hasil. Orang ramai mendambakan teduhan dan keselesaan,', 'order' => 12],
            ['start_time' => 81.12, 'end_time' => 88.16, 'target_text' => 'but the call of Allah came instead for hardship. From the pulpit of the Prophet\'s mosque,', 'source_text' => 'namun seruan Allah sebaliknya tiba menuntut kesukaran dan jihad. Dari atas mimbar Masjid Nabawi,', 'order' => 13],
            ['start_time' => 88.16, 'end_time' => 93.68, 'target_text' => 'the Messenger of Allah (peace be upon him) announced: Prepare for the expedition to the Romans.', 'source_text' => 'Rasulullah ﷺ mengumumkan: Buatlah persiapan rapi untuk ekspedisi menghadapi bangsa Rom.', 'order' => 14],
            ['start_time' => 94.56, 'end_time' => 101.12, 'target_text' => 'This was no ordinary call. The journey would be long, the heat unbearable, and the enemy,', 'source_text' => 'Ini bukanlah seruan biasa. Perjalanannya bakal berlarutan panjang, kepanasannya tak tertanggung, dan musuhnya,', 'order' => 15],
            ['start_time' => 101.12, 'end_time' => 108.96, 'target_text' => 'far and powerful, the Byzantine Empire itself. It would later be known as the Expedition of', 'source_text' => 'amat jauh lagi perkasa, iaitu Empayar Byzantine (Rom Timur) itu sendiri. Ia kelak dikenali sebagai Ekspedisi', 'order' => 16],
            ['start_time' => 108.96, 'end_time' => 117.52, 'target_text' => 'Difficulty, Ghazwat al-\'Usrah. Despite the sweltering season, the Prophet (peace be upon him) openly', 'source_text' => 'Kesukaran yang getir, Ghazwatul \'Usrah. Di sebalik musim panas membahang, Nabi ﷺ secara terang-terangan', 'order' => 17],
            ['start_time' => 117.52, 'end_time' => 124.48, 'target_text' => 'declared the destination, unlike his usual practice of secrecy in campaigns, so the believers could', 'source_text' => 'mengisytiharkan destinasi tujuannya, berbeza dengan kebiasaan baginda yang merahsiakan operasi perang, agar kaum mukminin dapat', 'order' => 18],
            ['start_time' => 124.48, 'end_time' => 132.96, 'target_text' => 'prepare fully for the test ahead. Some wavered. Among the hypocrites was a man who said mockingly:', 'source_text' => 'bersiap siaga sepenuhnya menempuh ujian getir di hadapan. Ada yang goyah. Antara golongan munafik, ada seorang lelaki yang berkata secara mengejek:', 'order' => 19],
            ['start_time' => 132.96, 'end_time' => 138.4, 'target_text' => '\'O Messenger of Allah, allow me to stay behind and do not tempt me. For no one is more', 'source_text' => '\'Wahai Rasulullah, izinkanlah aku tinggal di belakang dan janganlah menguji fitnahku. Kerana tiada siapa yang lebih', 'order' => 20],
            ['start_time' => 138.4, 'end_time' => 144.72, 'target_text' => 'captivated by women than I. I fear I will fall into temptation with the women of the Byzantines.\'', 'source_text' => 'terpikat dengan wanita melebihi diriku. Aku khuatir akan tergoda fitnah dengan wanita-wanita bangsa Rom.\'', 'order' => 21],
            ['start_time' => 145.36, 'end_time' => 151.52, 'target_text' => 'The Prophet (peace be upon him) turned away silently, then Allah revealed concerning such excuses:', 'source_text' => 'Nabi ﷺ berpaling secara diam, lalu Allah Taala menurunkan wahyu mengenai helah alasan seumpama itu:', 'order' => 22],
            ['start_time' => 152.32, 'end_time' => 160.72, 'target_text' => '\'Among them are those who say: Grant me leave and do not tempt me. Surely they have fallen into temptation.\'', 'source_text' => '\'Dan di antara mereka ada yang berkata: Izinkanlah aku dan janganlah kamu menjerumuskanku ke dalam fitnah. Ketahuilah bahawa mereka telah pun terjerumus ke dalam fitnah.\'', 'order' => 23],
            ['start_time' => 160.72, 'end_time' => 164.16, 'target_text' => '\'And indeed, Hell will encompass the disbelievers.\'', 'source_text' => '\'Dan sesungguhnya neraka Jahannam itu benar-benar meliputi orang-orang yang kafir.\'', 'order' => 24],
            ['start_time' => 164.88, 'end_time' => 191.44, 'target_text' => 'Thus, those who feared the trial of desire had already fallen into a greater trial,', 'source_text' => 'Maka, mereka yang kononnya takutkan ujian hawa nafsu sebenarnya telah pun jatuh ke dalam ujian fitnah yang jauh lebih besar,', 'order' => 25],
            ['start_time' => 191.44, 'end_time' => 199.2, 'target_text' => 'the trial of disbelief and hypocrisy. Others said: \'Do not march in this heat,\' so Allah revealed:', 'source_text' => 'iaitu fitnah kekufuran dan kemunafikan. Ada pula yang berkata: \'Janganlah kamu berangkat dalam kepanasan ini,\' maka Allah berfirman:', 'order' => 26],
            ['start_time' => 199.2, 'end_time' => 208.32, 'target_text' => '\'Qul naaru jahannama ashaddu harra law kaanu yafqahuun\' — Say: The fire of Hell is hotter, if only they understood.', 'source_text' => '\'Qul naaru jahannama ashaddu harra law kaanu yafqahuun\' — Katakanlah: Api neraka Jahannam itu jauh lebih panas, kalaulah mereka mengerti.', 'order' => 27],
            ['start_time' => 209.04, 'end_time' => 216.08, 'target_text' => 'A group of hypocrites gathered in the house of a Jewish man named Suwaylim, plotting to discourage', 'source_text' => 'Sekumpulan munafik berkumpul di rumah seorang Yahudi bernama Suwailim, berkomplot melemahkan semangat', 'order' => 28],
            ['start_time' => 216.08, 'end_time' => 222.08, 'target_text' => 'the Muslims. The Prophet (peace be upon him) sent Talhah ibn Ubaydillah (may Allah be pleased with', 'source_text' => 'kaum Muslimin. Maka Nabi ﷺ mengutuskan Talhah bin Ubaidillah (semoga Allah meredhai', 'order' => 29],
            ['start_time' => 222.08, 'end_time' => 228.4, 'target_text' => 'him) with a group of companions to burn the house down upon them. They escaped, but their conspiracy', 'source_text' => 'beliau) bersama sekumpulan sahabat untuk membakar rumah itu ke atas mereka. Mereka melarikan diri, namun konspirasi', 'order' => 30],
            ['start_time' => 228.4, 'end_time' => 236.4, 'target_text' => 'ended there, their cowardice exposed to all. Then came the time for sacrifice. The Messenger', 'source_text' => 'terhenti di situ, sifat pengecut mereka terbongkar kepada semua. Kemudian tibalah detik pengorbanan harta. Rasulullah', 'order' => 31],
            ['start_time' => 236.4, 'end_time' => 242.64, 'target_text' => '(peace be upon him) urged those with wealth to give, saying: \'Whoever equips the army of difficulty,', 'source_text' => 'ﷺ menggesa mereka yang berharta agar berinfak, sabda baginda: \'Sesiapa yang melengkapkan tentera kesukaran ini,', 'order' => 32],
            ['start_time' => 242.64, 'end_time' => 248.64, 'target_text' => 'for him is Paradise.\' Uthman ibn Affan (may Allah be pleased with him) brought a thousand gold', 'source_text' => 'maka baginya ganjaran Syurga.\' Saidina Uthman bin Affan (semoga Allah meredhainya) membawa seribu keping emas', 'order' => 33],
            ['start_time' => 248.64, 'end_time' => 254.56, 'target_text' => 'dinars, placing them in the Prophet\'s (peace be upon him) lap. The Prophet (peace be upon him) turned', 'source_text' => 'dinar, lalu menuangkannya ke dalam pangkuan riba Nabi ﷺ. Baginda Nabi ﷺ membelek-belek', 'order' => 34],
            ['start_time' => 254.56, 'end_time' => 259.92, 'target_text' => 'them over with his blessed hand and said: \'Nothing harms Uthman after this day.\'', 'source_text' => 'wang dinar tersebut dengan tangannya yang mulia seraya bersabda: \'Tiada apa yang memudaratkan Uthman selepas hari ini.\'', 'order' => 35],
            ['start_time' => 259.92, 'end_time' => 266.16, 'target_text' => '\'O Allah, be pleased with Uthman, for I am pleased with him.\' The wealthy gave in abundance,', 'source_text' => '\'Ya Allah, redhailah Uthman, kerana sesungguhnya aku redha kepadanya.\' Golongan kaya memberi sumbangan melimpah-ruah,', 'order' => 36],
            ['start_time' => 266.16, 'end_time' => 272.96, 'target_text' => 'and the poor gave whatever they could. Even a handful of dates, given sincerely, became', 'source_text' => 'dan golongan miskin menyumbang apa sahaja termampu. Walau sekadar segenggam kurma yang dihulur ikhlas, nilainya menjadi', 'order' => 37],
            ['start_time' => 272.96, 'end_time' => 281.92, 'target_text' => 'weightier than gold. Then came seven men, poor companions from the Ansar and others. They said with tears', 'source_text' => 'jauh lebih berat daripada timbunan emas. Kemudian datanglah tujuh orang sahabat miskin dari kalangan Ansar dan lain-lain. Mereka merayu dengan titisan air mata', 'order' => 38],
            ['start_time' => 281.92, 'end_time' => 288.64, 'target_text' => 'in their eyes: \'O Messenger of Allah, carry us with you.\' But he had nothing left to mount them on,', 'source_text' => 'di mata mereka: \'Wahai Rasulullah, bawalah kami bersama tuan.\' Namun baginda tiada lagi tunggangan berbaki untuk dinaiki mereka,', 'order' => 39],
            ['start_time' => 288.64, 'end_time' => 295.68, 'target_text' => 'so they turned away, their eyes overflowing with tears, grieving that they could not spend for', 'source_text' => 'maka mereka berpaling pulang dengan air mata berlinangan lebat, bersedih pilu kerana tidak memiliki apa-apa untuk diinfakkan pada', 'order' => 40],
            ['start_time' => 295.68, 'end_time' => 303.28, 'target_text' => 'the sake of Allah. \'Nor is there any blame upon those who, when they came to you for mounts, you said:\'', 'source_text' => 'jalan Allah. \'Dan tiada dosa ke atas orang-orang yang ketika datang kepadamu meminta tunggangan, lalu kamu berkata:\'', 'order' => 41],
            ['start_time' => 304.0, 'end_time' => 309.84, 'target_text' => '\'I can find nothing to carry you upon, and they turned away, their eyes overflowing with tears\'', 'source_text' => '\'Aku tidak mendapati kenderaan untuk membawamu, lalu mereka berpaling dengan mata yang mencurah air mata\'', 'order' => 42],
            ['start_time' => 309.84, 'end_time' => 315.36, 'target_text' => '\'out of grief that they could not find anything to spend.\' Their sorrow became a mark of faith,', 'source_text' => '\'kerana sedih bahawa mereka tidak mempunyai sesuatu untuk dinafkahkan.\' Kesedihan mereka menjadi lambang keimanan,', 'order' => 43],
            ['start_time' => 316.08, 'end_time' => 323.36, 'target_text' => 'the tears of longing, not weakness. The army of believers set out, numbering 30,000.', 'source_text' => 'titisan air mata kerinduan berjuang, bukan kelemahan. Angkatan tentera mukminin pun berangkat, seramai 30,000 perajurit.', 'order' => 44],
            ['start_time' => 323.36, 'end_time' => 328.0, 'target_text' => 'The Prophet (peace be upon him) appointed Ali ibn Abi Talib (may Allah be pleased with', 'source_text' => 'Nabi ﷺ melantik Saidina Ali bin Abi Talib (semoga Allah meredhai', 'order' => 45],
            ['start_time' => 328.0, 'end_time' => 334.4, 'target_text' => 'him) to remain in Madinah, to care for the families. The hypocrites mocked, saying: \'He left you behind', 'source_text' => 'beliau) untuk tinggal di Madinah, menjaga kebajikan kaum keluarga. Golongan munafik mengejek seraya berkata: \'Baginda meninggalkanmu', 'order' => 46],
            ['start_time' => 334.4, 'end_time' => 340.32, 'target_text' => 'because he dislikes your company.\' Ali (may Allah be pleased with him) saddled his camel and rode to', 'source_text' => 'kerana baginda merasa berat dan tidak menyukai kehadiranmu.\' Saidina Ali RA lantas memasang pelana untanya dan menunggang menuju', 'order' => 47],
            ['start_time' => 340.32, 'end_time' => 346.72, 'target_text' => 'the Prophet (peace be upon him) at al-Jurf, saying: \'O Messenger of Allah, are you leaving me behind', 'source_text' => 'kepada Nabi ﷺ di al-Jurf, sambil berkata: \'Wahai Rasulullah, adakah tuan meninggalkan aku di belakang', 'order' => 48],
            ['start_time' => 346.72, 'end_time' => 351.76, 'target_text' => 'among women and children?\' The Prophet (peace be upon him) smiled and said: \'Are you not pleased,', 'source_text' => 'bersama kaum wanita dan kanak-kanak?\' Baginda Nabi ﷺ tersenyum seraya bersabda: \'Tidakkah engkau redha gembira,', 'order' => 49],
            ['start_time' => 351.76, 'end_time' => 358.72, 'target_text' => 'O Ali, that you are to me as Harun was to Musa, except that there is no prophet after me?\'', 'source_text' => 'wahai Ali, bahawa kedudukanmu di sisiku laksana Harun di sisi Musa, melainkan tiada nabi lagi sesudahku?\'', 'order' => 50],
            ['start_time' => 359.76, 'end_time' => 367.04, 'target_text' => 'Ali (may Allah be pleased with him) returned content and honored. The march was long, the heat of the', 'source_text' => 'Saidina Ali RA pun pulang dengan hati yang tenang dan penuh kemuliaan. Perjalanan amat panjang, bahang panas', 'order' => 51],
            ['start_time' => 367.04, 'end_time' => 374.0, 'target_text' => 'Arabian desert burned like fire, and the believers had little food or water, but their hearts remained', 'source_text' => 'padang pasir Arab membakar laksana api, dan kaum mukminin kehabisan bekalan makanan dan air, namun sanubari mereka tetap', 'order' => 52],
            ['start_time' => 374.0, 'end_time' => 381.68, 'target_text' => 'steadfast. One man, Abu Khaythamah, returned home to find his wives in cool shade and food', 'source_text' => 'teguh bersabar. Seorang sahabat bernama Abu Khaithamah pulang ke rumah lalu mendapati isteri-isterinya berada di bawah teduhan yang sejuk bersama hidangan makanan', 'order' => 53],
            ['start_time' => 381.68, 'end_time' => 387.28, 'target_text' => 'prepared. He looked at the comfort before him and said: \'The Messenger of Allah (peace be upon', 'source_text' => 'yang terhidang. Beliau merenung keselesaan di hadapan matanya lalu berkata: \'Rasulullah ﷺ', 'order' => 54],
            ['start_time' => 387.28, 'end_time' => 394.88, 'target_text' => 'him) sits in the sun and wind, and Abu Khaythamah rests in shade and comfort? By Allah, this is not fair!\'', 'source_text' => 'berada di bawah terik mentari dan tiupan angin debu, sedangkan Abu Khaithamah berehat di tempat teduh yang selesa? Demi Allah, ini sama sekali tidak adil!\'', 'order' => 55],
            ['start_time' => 394.88, 'end_time' => 400.64, 'target_text' => 'He mounted his camel, leaving his comfort behind, and rode until he reached Tabuk. The Prophet', 'source_text' => 'Beliau terus menunggang untanya, meninggalkan segala kemewahan di belakang, dan memecut laju hingga tiba di Tabuk. Baginda Nabi', 'order' => 56],
            ['start_time' => 400.64, 'end_time' => 406.72, 'target_text' => '(peace be upon him) saw him from afar and said: \'Abu Khaythamah!\' And it was indeed him. The Prophet', 'source_text' => 'ﷺ melihat kelibatnya dari kejauhan lalu bersabda: \'Jadilah engkau Abu Khaithamah!\' Dan memang benar beliau. Nabi', 'order' => 57],
            ['start_time' => 406.72, 'end_time' => 414.0, 'target_text' => '(peace be upon him) smiled, prayed for him, and welcomed him among the righteous. As the army passed', 'source_text' => 'ﷺ tersenyum gembira, mendoakannya, dan menyambutnya di kalangan orang-orang yang soleh. Tatkala angkatan tentera melintasi', 'order' => 58],
            ['start_time' => 414.0, 'end_time' => 420.0, 'target_text' => 'through the ancient ruins of Thamud, al-Hijr, the Prophet (peace be upon him) said: \'Do not', 'source_text' => 'runtuhan purba kaum Thamud di al-Hijr (Mada\'in Salih), Nabi ﷺ bersabda: \'Janganlah kamu', 'order' => 59],
            ['start_time' => 420.0, 'end_time' => 427.44, 'target_text' => 'enter the dwellings of those who wronged themselves except weeping, lest what befell them should', 'source_text' => 'memasuki tempat tinggal mereka yang menzalimi diri sendiri melainkan dalam keadaan menangis, agar apa yang menimpa mereka tidak', 'order' => 60],
            ['start_time' => 427.44, 'end_time' => 435.28, 'target_text' => 'befall you.\' He covered his head, urged his camel forward, and told the people not to drink from', 'source_text' => 'menimpa ke atas diri kamu.\' Baginda menutup kepalanya, memecut untanya ke hadapan, dan melarang para sahabat meminum daripada', 'order' => 61],
            ['start_time' => 435.76, 'end_time' => 442.4, 'target_text' => 'the wells of Thamud. Only one spring was blessed by his touch; water gushed forth and quenched the army.', 'source_text' => 'telaga-telaga kaum Thamud. Hanya satu mata air yang diberkati dengan sentuhan baginda; air memancar keluar dan menghilangkan dahaga seluruh tentera.', 'order' => 62],
            ['start_time' => 443.12, 'end_time' => 448.72, 'target_text' => 'When the Prophet\'s (peace be upon him) camel went missing, a hypocrite mocked: \'He claims to know the', 'source_text' => 'Tatkala unta Nabi ﷺ hilang di pertengahan jalan, seorang munafik mengejek: \'Dia mendakwa mengetahui perkara', 'order' => 63],
            ['start_time' => 448.72, 'end_time' => 454.56, 'target_text' => 'unseen, yet he does not even know where his camel is!\' The Prophet (peace be upon him) said calmly: \'By', 'source_text' => 'ghaib, tetapi dia sendiri tidak tahu di mana untanya berada!\' Nabi ﷺ bersabda dengan tenang: \'Demi', 'order' => 64],
            ['start_time' => 454.56, 'end_time' => 464.24, 'target_text' => 'Allah, I know only what my Lord teaches me. It is in such and such a valley, held back by its rope', 'source_text' => 'Allah, aku hanya mengetahui apa yang diajarkan Tuhanku kepadaku. Unta itu berada di lembah sekian, tersangkut talinya', 'order' => 65],
            ['start_time' => 464.24, 'end_time' => 472.56, 'target_text' => 'among the trees.\' They went and found it exactly as he described, a sign that silenced every', 'source_text' => 'pada sebatang pohon.\' Para sahabat pergi mencarinya lalu menemuinya tepat seperti yang digambarkan, satu mukjizat yang membisukan setiap', 'order' => 66],
            ['start_time' => 472.56, 'end_time' => 481.36, 'target_text' => 'doubter. The Prophet (peace be upon him) reached Tabuk, but found no Roman army. Instead, he met the', 'source_text' => 'orang yang ragu-ragu. Nabi ﷺ tiba di Tabuk, namun tidak menemui ketumbukan tentera Rom. Sebaliknya baginda menemui', 'order' => 67],
            ['start_time' => 481.36, 'end_time' => 488.48, 'target_text' => 'Christian ruler, Yuhanna, who came forward and made a peace treaty, paying the jizyah without battle.', 'source_text' => 'pemerintah Kristian Tabuk, Yuhanna bin Ru\'bah, yang datang memeterai perjanjian damai serta membayar jizyah tanpa sebarang pertumpahan darah.', 'order' => 68],
            ['start_time' => 488.64, 'end_time' => 494.48, 'target_text' => 'The Prophet (peace be upon him) accepted and guaranteed his safety. He also sent Khalid ibn', 'source_text' => 'Nabi ﷺ menerima perdamaian itu dan menjamin keselamatannya. Baginda turut mengutuskan Khalid bin', 'order' => 69],
            ['start_time' => 494.48, 'end_time' => 499.6, 'target_text' => 'al-Walid (may Allah be pleased with him) to capture Ukaydir, the Christian ruler of Dumat al-Jandal,', 'source_text' => 'al-Walid (semoga Allah meredhainya) untuk menangkap Ukaidir, penguasa Kristian di Dumah al-Jandal,', 'order' => 70],
            ['start_time' => 500.16, 'end_time' => 505.92, 'target_text' => 'who was caught exactly as foretold, hunting wild cattle under the moonlight.', 'source_text' => 'yang ditangkap tepat seperti yang telah diramalkan baginda, sedang memburu lembu liar di bawah sinaran bulan.', 'order' => 71],
            ['start_time' => 506.8, 'end_time' => 512.72, 'target_text' => 'Ukaydir was brought before the Prophet (peace be upon him), who spared him and accepted his treaty.', 'source_text' => 'Ukaidir dibawa mengadap ke hadapan Nabi ﷺ, lalu baginda memaafkannya serta menerima perjanjian damainya.', 'order' => 72],
            ['start_time' => 513.68, 'end_time' => 518.88, 'target_text' => 'After staying in Tabuk for twenty nights, the Prophet (peace be upon him) turned back to Madinah.', 'source_text' => 'Setelah berkampung di Tabuk selama dua puluh malam, Nabi ﷺ pun berpatah balik pulang ke Madinah.', 'order' => 73],
            ['start_time' => 518.88, 'end_time' => 524.32, 'target_text' => 'Along the way, he passed by the grave of a young man, rejected by his tribe, who had', 'source_text' => 'Sepanjang perjalanan pulang, baginda melewati pusara seorang pemuda yang disisihkan kabilahnya, yang telah', 'order' => 74],
            ['start_time' => 524.32, 'end_time' => 530.24, 'target_text' => 'come to Madinah wearing nothing but a rough cloak. When he died, the Prophet (peace be upon', 'source_text' => 'berhijrah ke Madinah tanpa memakai apa-apa selain jubah kain kasar (Dzul Bijadain). Apabila beliau wafat, Nabi ﷺ', 'order' => 75],
            ['start_time' => 530.24, 'end_time' => 536.96, 'target_text' => 'him) himself descended into his grave and said: \'O Allah, I am pleased with him, so be pleased with him!\'', 'source_text' => 'sendiri turun ke dalam liang lahadnya dan berdoa: \'Ya Allah, sesungguhnya aku redha kepadanya, maka redhailah dia!\'', 'order' => 76],
            ['start_time' => 537.52, 'end_time' => 544.24, 'target_text' => 'Abdullah ibn Mas\'ud (may Allah be pleased with him) said: \'I wish that I were in his place right now.\'', 'source_text' => 'Abdullah bin Mas\'ud (semoga Allah meredhainya) berkata: \'Alangkah baiknya jika aku yang berada di tempat penghuni kubur itu saat ini.\'', 'order' => 77],
            ['start_time' => 544.88, 'end_time' => 550.08, 'target_text' => 'As the Prophet (peace be upon him) neared Madinah, he received news of a mosque built by hypocrites,', 'source_text' => 'Tatkala Nabi ﷺ semakin menghampiri Madinah, baginda menerima khabar mengenai sebuah masjid yang didirikan oleh kaum munafik,', 'order' => 78],
            ['start_time' => 550.08, 'end_time' => 557.92, 'target_text' => 'Masjid al-Dirar, built not for worship, but for division. They had asked him earlier to bless it,', 'source_text' => 'Masjid Dhirar, yang dibina bukan untuk ibadah, sebaliknya bagi memecah-belahkan umat. Mereka pernah memohon baginda untuk merasmikannya,', 'order' => 79],
            ['start_time' => 557.92, 'end_time' => 566.56, 'target_text' => 'but Allah revealed: Those who built a mosque for harm, disbelief, and division among the believers,', 'source_text' => 'namun Allah mewahyukan: Orang-orang yang mendirikan masjid untuk mendatangkan bahaya, kekufuran dan perpecahan di kalangan mukminin,', 'order' => 80],
            ['start_time' => 566.56, 'end_time' => 572.56, 'target_text' => 'Allah does not permit you to stand in it. The Prophet (peace be upon him) sent his companions', 'source_text' => 'Allah melarang engkau berdiri solat di dalamnya selama-lamanya. Nabi ﷺ lalu mengutuskan para sahabat', 'order' => 81],
            ['start_time' => 572.56, 'end_time' => 579.12, 'target_text' => 'to burn it down; the flames of falsehood rose into the sky, and the believers returned home,', 'source_text' => 'untuk membakarnya hingga hangus; marak api kepalsuan menjulang ke langit, dan kaum mukminin pun pulang ke tanah air,', 'order' => 82],
            ['start_time' => 579.12, 'end_time' => 587.12, 'target_text' => 'purified once more by trial and faith. And so Tabuk did not echo with the clash of armies,', 'source_text' => 'disucikan sekali lagi menerusi ujian dan keimanan. Maka Perang Tabuk tidak bergema dengan lagaan pedang bala tentera,', 'order' => 83],
            ['start_time' => 587.68, 'end_time' => 592.8, 'target_text' => 'but with the weight of truth; it revealed sincerity, it exposed hesitation.', 'source_text' => 'sebaliknya bergemuruh dengan keagungan kebenaran; ia menzahirkan keikhlasan, dan menelanjangkan sifat keraguan.', 'order' => 84],
            ['start_time' => 593.76, 'end_time' => 599.84, 'target_text' => 'For not every victory is seen; some are felt. In the next episode, insha\'Allah,', 'source_text' => 'Kerana bukan setiap kemenangan dapat dilihat dengan mata kasar; sebahagiannya dirasai jauh di lubuk sanubari. Dalam episod seterusnya, insya-Allah,', 'order' => 85],
            ['start_time' => 599.84, 'end_time' => 607.84, 'target_text' => 'we witness the days when nations came, not with armies, but with delegations, as the message of Islam', 'source_text' => 'kita bakal menyaksikan hari-hari ketika pelbagai bangsa tiba bukan dengan angkatan tentera, tetapi dengan utusan rombongan, saat risalah Islam', 'order' => 86],
            ['start_time' => 607.84, 'end_time' => 617.92, 'target_text' => 'began to reach the world. Sallallahu \'ala Muhammad.', 'source_text' => 'mula tersebar ke serata pelosok dunia. Selawat dan salam ke atas junjungan Nabi Muhammad ﷺ.', 'order' => 87],
        ];

        $rows = [];
        $now  = now();
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

        foreach (array_chunk($rows, 50) as $chunk) {
            DB::table('video_subtitles')->insert($chunk);
        }
    }
}
