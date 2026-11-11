<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo13Seeder extends Seeder
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

        // Special Bilingual Religious Video #13 (Siri 1 Ep.8): The Message Goes Public | Life of the Final Messenger ﷺ | Ep.8 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'ntv3dJv8wqQ'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Message Goes Public | Life of the Final Messenger ﷺ | Ep.8 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/ntv3dJv8wqQ/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 13,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.24, 'end_time' => 3.34, 'target_text' => 'But Mecca was not a city prepared to surrender.', 'source_text' => 'Tetapi kota Mekah bukanlah sebuah kota yang bersedia untuk tunduk menyerah.', 'order' => 1],
            ['start_time' => 3.44, 'end_time' => 5.34, 'target_text' => 'Its pride so easily.', 'source_text' => 'Keangkuhan harga dirinya tidak mudah dilepaskan.', 'order' => 2],
            ['start_time' => 5.44, 'end_time' => 7.66, 'target_text' => 'The idols stood tall.', 'source_text' => 'Patung-patung berhala masih berdiri megah menjulang.', 'order' => 3],
            ['start_time' => 7.76, 'end_time' => 9.98, 'target_text' => 'Tribal honor was sacred.', 'source_text' => 'Maruah kabilah kesukuan dianggap amat suci.', 'order' => 4],
            ['start_time' => 10.08, 'end_time' => 13.26, 'target_text' => 'Power and status were currency.', 'source_text' => 'Kuasa pemerintahan dan darjat kedudukan menjadi ukuran nilai segala-galanya.', 'order' => 5],
            ['start_time' => 13.36, 'end_time' => 16.7, 'target_text' => 'Al may Allah be pleased with him was stretched upon the sand.', 'source_text' => 'Sayyidina Bilal radhiyallahu \'anhu ditelentangkan di atas pasir yang membakar.', 'order' => 6],
            ['start_time' => 16.8, 'end_time' => 19.56, 'target_text' => 'Rocks upon his chest.', 'source_text' => 'Batu-batu besar dihempapkan ke atas dadanya.', 'order' => 7],
            ['start_time' => 21.12, 'end_time' => 21.9, 'target_text' => 'Rahman.', 'source_text' => 'Bermunajat kepada Yang Maha Pemurah (Ar-Rahman).', 'order' => 8],
            ['start_time' => 22.0, 'end_time' => 29.98, 'target_text' => 'My beloved brothers and sisters, today we enter a chapter where the light begins to shine beyond the walls of private hearts', 'source_text' => 'Saudara-saudariku yang dikasihi, hari ini kita melangkah masuk ke dalam lembaran di mana nur kebenaran mula bersinar melangkaui dinding-dinding sanubari yang tersembunyi,', 'order' => 9],
            ['start_time' => 30.08, 'end_time' => 33.18, 'target_text' => 'and the world begins to react to it.', 'source_text' => 'dan seisi dunia mula memberikan reaksi terhadapnya.', 'order' => 10],
            ['start_time' => 33.28, 'end_time' => 35.5, 'target_text' => 'For truth is never ignored.', 'source_text' => 'Kerana kebenaran tidak pernah sekali-kali dapat dipandang sepi.', 'order' => 11],
            ['start_time' => 35.6, 'end_time' => 40.46, 'target_text' => 'When it rises, it awakens souls and it disturbs darkness.', 'source_text' => 'Tatkala kebenaran bangkit menyinsing, ia membangkitkan sanubari jiwa dan menggugat kepekatan kegelapan.', 'order' => 12],
            ['start_time' => 40.56, 'end_time' => 46.86, 'target_text' => 'The message of illallah was pure, gentle and full of mercy.', 'source_text' => 'Risalah kalimah tauhid \'La ilaha illallah\' begitu suci murni, santun lembut, dan sarat dengan limpahan rahmat.', 'order' => 13],
            ['start_time' => 46.96, 'end_time' => 50.06, 'target_text' => 'But Mecca was not a city prepared to surrender.', 'source_text' => 'Namun kota Mekah bukanlah sebuah kota yang bersedia untuk tunduk menyerah.', 'order' => 14],
            ['start_time' => 50.16, 'end_time' => 52.06, 'target_text' => 'Its pride so easily.', 'source_text' => 'Keangkuhan harga dirinya tidak mudah dilepaskan.', 'order' => 15],
            ['start_time' => 52.16, 'end_time' => 54.3, 'target_text' => 'The idols stood tall.', 'source_text' => 'Patung-patung berhala masih berdiri megah menjulang.', 'order' => 16],
            ['start_time' => 54.4, 'end_time' => 56.62, 'target_text' => 'Tribal honor was sacred.', 'source_text' => 'Maruah kabilah kesukuan dianggap amat suci.', 'order' => 17],
            ['start_time' => 56.72, 'end_time' => 59.42, 'target_text' => 'Power and status were currency.', 'source_text' => 'Kuasa pemerintahan dan darjat kedudukan menjadi ukuran nilai segala-galanya.', 'order' => 18],
            ['start_time' => 59.52, 'end_time' => 64.06, 'target_text' => 'Yet in the middle of all of this stood Muhammad, peace be upon him.', 'source_text' => 'Namun di tengah-tengah pergolakan itu semua, berdirilah Muhammad ﷺ.', 'order' => 19],
            ['start_time' => 64.16, 'end_time' => 71.1, 'target_text' => 'A man of peace, a man of sincerity, a man carrying a message that would end falsehood forever.', 'source_text' => 'Seorang insan pembawa kedamaian, seorang insan yang tulus ikhlas, seorang insan yang menggalas risalah yang bakal memadamkan kepalsuan untuk selama-lamanya.', 'order' => 20],
            ['start_time' => 71.2, 'end_time' => 78.38, 'target_text' => 'The light had begun to spread and darkness felt the ground shift beneath it.', 'source_text' => 'Cahaya nur hidayah telah mula merebak dan kebatilan merasakan bumi bergoncang di bawah kakinya.', 'order' => 21],
            ['start_time' => 78.48, 'end_time' => 79.9, 'target_text' => 'So come with me.', 'source_text' => 'Ayuh ikutilah saya.', 'order' => 22],
            ['start_time' => 80.0, 'end_time' => 84.2, 'target_text' => 'Let us witness the first winds of opposition.', 'source_text' => 'Marilah kita sama-sama menyaksikan tiupan angin penentangan yang pertama.', 'order' => 23],
            ['start_time' => 84.4, 'end_time' => 93.24, 'target_text' => 'And the believers who stood firm not because they were many but because their hearts belonged to Allah.', 'source_text' => 'Dan golongan beriman yang berdiri teguh bukan kerana bilangan mereka ramai, sebaliknya kerana sanubari mereka milik Allah semata-mata.', 'order' => 24],
            ['start_time' => 108.88, 'end_time' => 114.78, 'target_text' => 'The call had begun in whispers in the quiet nights beyond Makkah\'s gaze.', 'source_text' => 'Seruan dakwah telah bermula secara berbisik pada malam-malam hening jauh daripada pandangan kaum Quraisy.', 'order' => 25],
            ['start_time' => 114.88, 'end_time' => 119.64, 'target_text' => 'But the time came when the prophet peace be upon him was commanded,', 'source_text' => 'Namun saatnya telah tiba tatkala baginda Nabi ﷺ diperintahkan secara tegas:', 'order' => 26],
            ['start_time' => 123.12, 'end_time' => 128.54, 'target_text' => '"Then proclaim what you are commanded and turn away from the polytheists."', 'source_text' => '"Maka sampaikanlah secara terang-terangan apa yang diperintahkan kepadamu, dan berpalinglah daripada orang-orang musyrik."', 'order' => 27],
            ['start_time' => 128.64, 'end_time' => 131.26, 'target_text' => 'From that moment, silence ended.', 'source_text' => 'Bermula daripada detik itu, masa untuk berdiam diri telah pun berakhir.', 'order' => 28],
            ['start_time' => 131.36, 'end_time' => 135.34, 'target_text' => 'He stood up on the hill of Safar and called his people by name.', 'source_text' => 'Baginda berdiri tegak di atas Bukit Safa lalu menyeru nama kabilah kaumnya satu demi satu.', 'order' => 29],
            ['start_time' => 135.44, 'end_time' => 139.34, 'target_text' => 'Clan after clan gathered under the blazing sun.', 'source_text' => 'Kabilah demi kabilah berhimpun di bawah terik bahang matahari yang membakar.', 'order' => 30],
            ['start_time' => 139.44, 'end_time' => 140.78, 'target_text' => 'Voices hushed.', 'source_text' => 'Suasana bising serta-merta menjadi senyap sepi.', 'order' => 31],
            ['start_time' => 140.88, 'end_time' => 149.18, 'target_text' => 'The messenger peace be upon him declared, "If I told you an army was advancing from behind this hill, would you believe me?"', 'source_text' => 'Rasulullah ﷺ bersabda: "Sekiranya aku memberitahu kamu bahawa ada pasukan tentera sedang mara dari sebalik bukit ini, adakah kamu mempercayaiku?"', 'order' => 32],
            ['start_time' => 149.28, 'end_time' => 158.46, 'target_text' => 'They said, "We have never known you to lie." He said, "Then I warn you of a severe punishment from your Lord." The crowd stirred,', 'source_text' => 'Mereka menjawab: "Kami tidak pernah mendapati engkau berdusta sekali pun." Baginda bersabda: "Maka sesungguhnya aku memberi peringatan kepada kamu akan azab yang pedih daripada Tuhanmu." Orang ramai mula bergolak,', 'order' => 33],
            ['start_time' => 158.56, 'end_time' => 160.78, 'target_text' => 'some astonished, some mocking.', 'source_text' => 'sebahagiannya tercengang takjub, manakala sebahagian lagi mengejek mempersendakan.', 'order' => 34],
            ['start_time' => 160.88, 'end_time' => 163.26, 'target_text' => 'Abu Lahab\'s voice cut through the air.', 'source_text' => 'Suara lantang Abu Lahab memecah keheningan udara:', 'order' => 35],
            ['start_time' => 163.36, 'end_time' => 164.94, 'target_text' => 'May you perish.', 'source_text' => '"Binasalah engkau untuk selama-lamanya!', 'order' => 36],
            ['start_time' => 165.04, 'end_time' => 167.66, 'target_text' => 'Is this what you gathered us for?', 'source_text' => 'Adakah semata-mata kerana perkara ini engkau mengumpulkan kami semua?"', 'order' => 37],
            ['start_time' => 167.76, 'end_time' => 171.64, 'target_text' => 'Revelation came sealing his fate.', 'source_text' => 'Maka turunlah ayat wahyu yang memeteraikan kesudahan nasib celakanya:', 'order' => 38],
            ['start_time' => 174.08, 'end_time' => 177.02, 'target_text' => 'Perish the hands of Abuahab and perish.', 'source_text' => '"Binasalah kedua-dua belah tangan Abu Lahab, dan binasalah dia!"', 'order' => 39],
            ['start_time' => 177.12, 'end_time' => 178.86, 'target_text' => 'He', 'source_text' => 'Pembesar musyrikin', 'order' => 40],
            ['start_time' => 178.96, 'end_time' => 180.7, 'target_text' => 'could no longer ignore the message.', 'source_text' => 'tidak lagi mampu memandang sepi risalah dakwah ini.', 'order' => 41],
            ['start_time' => 180.8, 'end_time' => 184.3, 'target_text' => 'They ridiculed, cursed, and plotted.', 'source_text' => 'Mereka mula mencaci, mengutuk, dan merancang pelbagai tipu daya jahat.', 'order' => 42],
            ['start_time' => 184.4, 'end_time' => 189.42, 'target_text' => 'Believers now prayed in secret until one day Sadbakas', 'source_text' => 'Orang-orang beriman kini terpaksa bersolat secara sembunyi-sembunyi sehinggalah pada suatu hari Sa\'ad bin Abi Waqqas', 'order' => 43],
            ['start_time' => 189.52, 'end_time' => 193.66, 'target_text' => 'and a small group were discovered praying in a valley.', 'source_text' => 'dan sekumpulan kecil sahabat ditemui sedang mendirikan solat di sebuah lembah.', 'order' => 44],
            ['start_time' => 193.76, 'end_time' => 195.5, 'target_text' => 'A man mocked at them.', 'source_text' => 'Seorang lelaki musyrik mempersendakan dan mencaci mereka.', 'order' => 45],
            ['start_time' => 195.6, 'end_time' => 199.34, 'target_text' => 'Sad struck him with the camel\'s jawbone.', 'source_text' => 'Sa\'ad lalu memukulnya dengan sebatang tulang rahang unta.', 'order' => 46],
            ['start_time' => 199.44, 'end_time' => 203.82, 'target_text' => 'Blood was drawn, the first blood shed for Islam.', 'source_text' => 'Darah musuh mengalir terpercik, itulah darah pertama yang tumpah demi mempertahankan Islam.', 'order' => 47],
            ['start_time' => 203.92, 'end_time' => 207.18, 'target_text' => 'Soon insults turned into torture.', 'source_text' => 'Tidak lama kemudian, cacian lisan bertukar menjadi seksaan fizikal yang kejam.', 'order' => 48],
            ['start_time' => 207.28, 'end_time' => 209.9, 'target_text' => 'Slaves were dragged under the sun.', 'source_text' => 'Hamba-hamba abdi diheret di atas padang pasir di bawah terik panas matahari.', 'order' => 49],
            ['start_time' => 210.0, 'end_time' => 212.62, 'target_text' => 'The weak were tied and beaten.', 'source_text' => 'Golongan yang lemah diikat kemas dan didera dipukul tanpa belas kasihan.', 'order' => 50],
            ['start_time' => 212.72, 'end_time' => 215.58, 'target_text' => 'Yet they whispered a', 'source_text' => 'Namun di sebalik deraan itu, mereka tetap membisikkan:', 'order' => 51],
            ['start_time' => 215.68, 'end_time' => 216.46, 'target_text' => 'one God.', 'source_text' => '"Ahad, Ahad! (Tuhan Yang Maha Esa)."', 'order' => 52],
            ['start_time' => 216.56, 'end_time' => 218.6, 'target_text' => 'One God.', 'source_text' => '"Tuhan Yang Maha Esa!"', 'order' => 53],
            ['start_time' => 219.04, 'end_time' => 224.86, 'target_text' => 'Though he did not embrace Islam, Abu Talib stood as a wall before his nephew.', 'source_text' => 'Sungguhpun tidak memeluk Islam, Abu Talib tetap berdiri teguh laksana benteng di hadapan anak saudaranya.', 'order' => 54],
            ['start_time' => 224.96, 'end_time' => 233.42, 'target_text' => 'The chiefs ofQuresh came to him pleading and threatening, "Stop your nephew or we shall deal with him ourselves." Abu Talib', 'source_text' => 'Para pembesar Quraisy datang menemuinya seraya merayu dan mengugut: "Hentikanlah anak saudaramu, atau kami sendiri yang akan bertindak ke atasnya!" Namun Abu Talib', 'order' => 55],
            ['start_time' => 233.52, 'end_time' => 234.86, 'target_text' => 'refused to surrender him.', 'source_text' => 'enggan menyerahkan baginda kepada mereka.', 'order' => 56],
            ['start_time' => 234.96, 'end_time' => 238.78, 'target_text' => 'They returned again offering wealth, status, and power.', 'source_text' => 'Mereka kembali lagi dengan menawarkan limpahan kekayaan, darjat kedudukan, dan kuasa pemerintahan.', 'order' => 57],
            ['start_time' => 238.88, 'end_time' => 243.82, 'target_text' => 'Even proposing to trade a young noble in exchange for Muhammad, peace be upon him.', 'source_text' => 'Malah mereka mencadangkan pertukaran seorang pemuda bangsawan yang tampan sebagai ganti kepada Muhammad ﷺ.', 'order' => 58],
            ['start_time' => 243.92, 'end_time' => 249.34, 'target_text' => 'Abu Talib\'s voice thundered, "By Allah, you are the most unjust.', 'source_text' => 'Suara Abu Talib bergemuruh lantang: "Demi Allah, kamu adalah golongan yang paling zalim!', 'order' => 59],
            ['start_time' => 249.44, 'end_time' => 254.22, 'target_text' => 'You would give me your son to raise while you kill mine."', 'source_text' => 'Kamu mahu memberikan anak kamu kepadaku untuk kujaga, sedangkan kamu mahu membunuh anak saudaraku?!"', 'order' => 60],
            ['start_time' => 254.32, 'end_time' => 262.54, 'target_text' => 'He turned to the prophet peace be upon him and said, "Do as you are commanded, my son, by Allah, I will never hand you over."', 'source_text' => 'Abu Talib lalu berpaling kepada Nabi ﷺ dan berkata: "Lakukanlah apa yang diperintahkan kepadamu, wahai anakku. Demi Allah, aku tidak akan sesekali menyerahkanmu!"', 'order' => 61],
            ['start_time' => 262.64, 'end_time' => 271.1, 'target_text' => 'When he saw his uncle\'s burden, the prophet peace be upon him said softly, "Oh my uncle, if they placed the sun in my right', 'source_text' => 'Tatkala melihat bebanan berat yang ditanggung oleh bapa saudaranya, baginda Nabi ﷺ bersabda dengan penuh kelembutan: "Wahai bapa saudaraku, sekiranya mereka meletakkan matahari di tangan', 'order' => 62],
            ['start_time' => 271.2, 'end_time' => 282.46, 'target_text' => 'hand and the moon in my left that I abandon this call, I would not until Allah makes it prevail or I perish for it." Tears', 'source_text' => 'kananku dan bulan di tangan kiriku supaya aku meninggalkan seruan dakwah ini, nescaya aku tidak akan meninggalkannya sehinggalah Allah memenangkannya atau aku binasa kerananya." Titisan air mata', 'order' => 63],
            ['start_time' => 282.56, 'end_time' => 284.22, 'target_text' => 'filled Abu Talib\'s eyes.', 'source_text' => 'memenuhi kelopak mata Abu Talib.', 'order' => 64],
            ['start_time' => 284.32, 'end_time' => 285.9, 'target_text' => 'Go, my nephew.', 'source_text' => '"Pergilah, wahai anak saudaraku.', 'order' => 65],
            ['start_time' => 286.0, 'end_time' => 289.42, 'target_text' => 'Say what you will, I will never forsake you.', 'source_text' => 'Katakanlah apa sahaja yang engkau kehendaki, aku tidak akan sekali-kali membiarkanmu."', 'order' => 66],
            ['start_time' => 289.52, 'end_time' => 297.98, 'target_text' => 'That night, the messenger peace be upon him prayed beneath the cabba\'s shadow, his forehead upon the ground, whispering verses', 'source_text' => 'Pada malam itu, Rasulullah ﷺ mendirikan solat di bawah teduhan Kaabah, dahinya sujud rapat ke tanah seraya membisikkan ayat-ayat', 'order' => 67],
            ['start_time' => 298.08, 'end_time' => 300.3, 'target_text' => 'of patience and trust.', 'source_text' => 'kesabaran dan tawakal penuh kepada Tuhannya.', 'order' => 68],
            ['start_time' => 300.4, 'end_time' => 307.98, 'target_text' => 'Among Curesh\'s nobles was Hamza Abdul Muttalib, the lion of Allah yet to roar.', 'source_text' => 'Antara pembesar terkemuka Quraisy ialah Hamzah bin Abdul Muttalib, singa Allah yang belum lagi mengaumkan keperwiraannya.', 'order' => 69],
            ['start_time' => 308.08, 'end_time' => 315.26, 'target_text' => 'One day he returned from hunting to hear that Abu Jahal had insulted the prophet peace be upon him.', 'source_text' => 'Pada suatu hari, sekembalinya daripada berburu, beliau mendengar bahawa Abu Jahal telah mencaci dan menghina Rasulullah ﷺ.', 'order' => 70],
            ['start_time' => 315.36, 'end_time' => 320.94, 'target_text' => 'He stroed to the cabba bow in hand and struck Abu Jahal\'s head before the gathering.', 'source_text' => 'Beliau melangkah gagah menuju ke Kaabah dengan busur panah di tangan lalu menghayun memukul kepala Abu Jahal di hadapan khalayak ramai.', 'order' => 71],
            ['start_time' => 321.04, 'end_time' => 324.62, 'target_text' => 'Do you insult him while I follow his faith?', 'source_text' => '"Adakah engkau berani mencacinya sedangkan aku telah pun memeluk agamanya?!"', 'order' => 72],
            ['start_time' => 324.72, 'end_time' => 326.7, 'target_text' => 'That moment shook Qur.', 'source_text' => 'Detik keberanian itu menggoncang keangkuhan seluruh kaum Quraisy.', 'order' => 73],
            ['start_time' => 326.8, 'end_time' => 333.42, 'target_text' => 'Hamza just embraced Islam and the believers felt a new power rise in Mecca.', 'source_text' => 'Hamzah secara rasmi memeluk Islam dan orang-orang beriman merasakan suatu kekuatan baharu kini bangkit di kota Mekah.', 'order' => 74],
            ['start_time' => 333.52, 'end_time' => 338.2, 'target_text' => 'Unable to silence him, Qur gathered to scheme', 'source_text' => 'Gagal mendiamkan baginda, pembesar Quraisy berhimpun untuk merancang tipu helah:', 'order' => 75],
            ['start_time' => 339.28, 'end_time' => 344.78, 'target_text' => 'Abu Jahal and the elders argued what to call him.', 'source_text' => 'Abu Jahal dan para pembesar berdebat tentang gelaran tohmahan apa yang patut dilemparkan kepadanya:', 'order' => 76],
            ['start_time' => 344.88, 'end_time' => 348.78, 'target_text' => 'poet, madman, sorcerer.', 'source_text' => '"Penyair, orang gila, atau ahli sihir?"', 'order' => 77],
            ['start_time' => 348.88, 'end_time' => 354.2, 'target_text' => 'Each accusation crumbled under the weight of the Quran\'s beauty.', 'source_text' => 'Setiap tuduhan palsu mereka runtuh berkecai di bawah keagungan mukjizat keindahan bahasa Al-Quran.', 'order' => 78],
            ['start_time' => 365.68, 'end_time' => 368.78, 'target_text' => 'Indeed, it is not the word of a poet.', 'source_text' => '"Dan Al-Quran itu bukanlah perkataan seorang penyair.', 'order' => 79],
            ['start_time' => 368.88, 'end_time' => 372.7, 'target_text' => 'Little do you believe, nor the word of a soothsayer.', 'source_text' => 'Amat sedikit kamu beriman. Dan bukanlah ia perkataan seorang tukang tilik.', 'order' => 80],
            ['start_time' => 372.8, 'end_time' => 376.46, 'target_text' => 'Little do you remember a revelation', 'source_text' => 'Amat sedikit kamu mengambil peringatan. Ia adalah wahyu yang diturunkan', 'order' => 81],
            ['start_time' => 376.56, 'end_time' => 379.02, 'target_text' => 'from the Lord of the worlds.', 'source_text' => 'daripada Tuhan sekalian alam."', 'order' => 82],
            ['start_time' => 379.12, 'end_time' => 386.38, 'target_text' => 'Even W admitted by Allah his words have a sweetness and they rise above all speech.', 'source_text' => 'Malah Al-Walid bin Al-Mughirah sendiri terpaksa mengakui: "Demi Allah, sesungguhnya kata-katanya mempunyai kemanisan yang luar biasa dan ia mengatasi segala tutur kata manusia."', 'order' => 83],
            ['start_time' => 386.48, 'end_time' => 388.94, 'target_text' => 'Then began the years of mockery and pain.', 'source_text' => 'Maka bermulalah tahun-tahun penuh ejekan, penghinaan, dan keperitan derita.', 'order' => 84],
            ['start_time' => 389.04, 'end_time' => 392.86, 'target_text' => 'The prophet peace be upon him was followed, stoned, insulted.', 'source_text' => 'Rasulullah ﷺ diekori, dilontari batu, dan dihina ke mana sahaja baginda pergi.', 'order' => 85],
            ['start_time' => 392.96, 'end_time' => 395.1, 'target_text' => 'Dust was thrown upon him.', 'source_text' => 'Debu pasir dilemparkan ke atas kepala baginda.', 'order' => 86],
            ['start_time' => 395.2, 'end_time' => 398.38, 'target_text' => 'Entrails placed on his back in prayer.', 'source_text' => 'Kotoran isi perut unta diletakkan di atas belakang baginda tatkala baginda sedang sujud bersolat.', 'order' => 87],
            ['start_time' => 398.48, 'end_time' => 407.24, 'target_text' => 'Only when Fatima wiped it away, did he raise his hands, praying for guidance, not vengeance.', 'source_text' => 'Hanya apabila puteri baginda, Fatimah, datang menyapu kotoran itu seraya menangis, barulah baginda mengangkat kedua-dua tangannya mendoakan hidayah petunjuk, bukannya membalas dendam.', 'order' => 88],
            ['start_time' => 407.92, 'end_time' => 413.18, 'target_text' => 'Bilal, may Allah be pleased with him, was stretched upon the sand, rocks upon his chest.', 'source_text' => 'Sayyidina Bilal radhiyallahu \'anhu ditelentangkan di atas pasir membakar dengan batu besar diletakkan di atas dadanya.', 'order' => 89],
            ['start_time' => 413.28, 'end_time' => 419.56, 'target_text' => 'Sumeya, may Allah be pleased with her, was martyed, the first soul to dieahillah.', 'source_text' => 'Sayyidatina Sumayyah radhiyallahu \'anha gugur syahid, menjadi jiwa pertama yang syahid di jalan Allah (fi sabilillah).', 'order' => 90],
            ['start_time' => 420.96, 'end_time' => 430.94, 'target_text' => 'Yet amid all this, the message spread beyond Mecca\'s walls toward Ythre, where new hearts would soon listen.', 'source_text' => 'Namun di sebalik segala penderitaan ini, seruan risalah dakwah mula merebak melangkaui tembok Mekah menuju ke Yathrib (Madinah), tempat di mana hati-hati baharu bakal menyambutnya.', 'order' => 91],
            ['start_time' => 431.04, 'end_time' => 433.34, 'target_text' => 'The dawn of opposition had begun.', 'source_text' => 'Fajar penentangan kaum musyrikin telah pun bermula.', 'order' => 92],
            ['start_time' => 433.44, 'end_time' => 435.02, 'target_text' => 'Makkah was divided.', 'source_text' => 'Penduduk kota Mekah kini terbahagi dua.', 'order' => 93],
            ['start_time' => 435.12, 'end_time' => 438.54, 'target_text' => 'The old order trembling before the new truth.', 'source_text' => 'Sistem jahiliah lama bergoncang gementar di hadapan kebenaran baharu.', 'order' => 94],
            ['start_time' => 438.64, 'end_time' => 445.08, 'target_text' => 'Every insult, every wound, every tear was a step toward victory.', 'source_text' => 'Setiap penghinaan, setiap luka derita, dan setiap titisan air mata adalah anak tangga menuju kejayaan hakiki.', 'order' => 95],
            ['start_time' => 445.4, 'end_time' => 455.18, 'target_text' => 'For the fire of Curesh\'s hatred only refined the gold of faith, and the call of Muhammad peace be upon him would', 'source_text' => 'Kerana api kebencian kaum Quraisy hanyalah memurnikan kilauan emas keimanan, dan seruan dakwah Muhammad ﷺ kelak', 'order' => 96],
            ['start_time' => 455.28, 'end_time' => 462.76, 'target_text' => 'soon echo beyond the valleys of Mecca carried by those whose hearts no fear could silence.', 'source_text' => 'bergema merentasi lembah-lembah Mekah, dibawa oleh insan-insan yang sanubarinya tidak mampu dibisukan oleh sebarang ketakutan.', 'order' => 97],
            ['start_time' => 467.84, 'end_time' => 474.86, 'target_text' => 'So be patient as the messengers of determination were patient and do not grieve over them.', 'source_text' => '"Maka bersabarlah engkau sebagaimana sabarnya para rasul yang mempunyai keteguhan azam (Ulul \'Azmi), dan janganlah engkau bersedih hati terhadap mereka."', 'order' => 98],
            ['start_time' => 474.96, 'end_time' => 477.42, 'target_text' => 'But with faith came resistance.', 'source_text' => 'Namun seiring dengan keimanan, datanglah rintangan tentangan.', 'order' => 99],
            ['start_time' => 477.52, 'end_time' => 481.5, 'target_text' => 'Those who feared losing power tried to break spirits.', 'source_text' => 'Mereka yang takut kehilangan kuasa cuba mematahkan semangat perjuangan golongan mukmin.', 'order' => 100],
            ['start_time' => 481.6, 'end_time' => 482.54, 'target_text' => 'They mocked.', 'source_text' => 'Mereka mengejek mempersendakan.', 'order' => 101],
            ['start_time' => 482.64, 'end_time' => 483.5, 'target_text' => 'They threatened.', 'source_text' => 'Mereka mengancam menggertak.', 'order' => 102],
            ['start_time' => 483.6, 'end_time' => 485.02, 'target_text' => 'They spread lies.', 'source_text' => 'Mereka menyebarkan pelbagai pembohongan.', 'order' => 103],
            ['start_time' => 485.12, 'end_time' => 488.22, 'target_text' => 'They tried to turn hearts away.', 'source_text' => 'Mereka cuba memalingkan sanubari manusia daripada kebenaran.', 'order' => 104],
            ['start_time' => 488.32, 'end_time' => 496.78, 'target_text' => 'Yet the believers stood firm not through force but through patience, trust in Allah and love for the messenger peace be upon', 'source_text' => 'Namun orang-orang beriman tetap berdiri teguh bukan dengan kekerasan senjata, sebaliknya melalui kesabaran, tawakal kepada Allah, dan kecintaan mendalam kepada Rasulullah', 'order' => 105],
            ['start_time' => 496.88, 'end_time' => 497.42, 'target_text' => 'him.', 'source_text' => 'ﷺ.', 'order' => 106],
            ['start_time' => 497.52, 'end_time' => 503.42, 'target_text' => 'The dawn of opposition had begun but with it came a new kind of strength.', 'source_text' => 'Fajar penentangan telah bermula, namun bersamanya terbit kekuatan rohani yang luar biasa.', 'order' => 107],
            ['start_time' => 503.52, 'end_time' => 504.22, 'target_text' => 'and their hearts.', 'source_text' => 'dan ketabahan sanubari mereka.', 'order' => 108],
            ['start_time' => 504.32, 'end_time' => 513.26, 'target_text' => 'In the next episode, inshallah, we will witness how patience becomes heroism and how small circles of believers begin to shape', 'source_text' => 'Dalam episod seterusnya, insya-Allah, kita akan menyaksikan bagaimana kesabaran bertukar menjadi keperwiraan sejati dan bagaimana kelompok kecil mukmin mula mencorakkan', 'order' => 109],
            ['start_time' => 513.36, 'end_time' => 516.38, 'target_text' => 'the future of the entire world.', 'source_text' => 'masa hadapan bagi seluruh alam semesta.', 'order' => 110],
            ['start_time' => 516.48, 'end_time' => 524.86, 'target_text' => 'But until then, may Allah make our hearts steadfast, our intentions sincere, and our faith unshakable.', 'source_text' => 'Namun sehingga saat itu, semoga Allah meneguhkan sanubari kita, memurnikan niat kita, dan mengurniakan kita keimanan yang tidak dapat digoyahkan.', 'order' => 111],
            ['start_time' => 524.96, 'end_time' => 526.46, 'target_text' => 'Sah', 'source_text' => 'Salam dan selawat ke atas', 'order' => 112],
            ['start_time' => 526.56, 'end_time' => 528.36, 'target_text' => 'Muhammad', 'source_text' => 'Nabi Muhammad ﷺ.', 'order' => 113],
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
