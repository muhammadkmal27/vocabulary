<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo6Seeder extends Seeder
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

        // Special Bilingual Religious Video #6 (Siri 1 Ep.1): The Year of the Elephant | Life of the Final Messengerﷺ | Ep.1 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'PH61HNWHCyU'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Year of the Elephant | Life of the Final Messengerﷺ | Ep.1 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/PH61HNWHCyU/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 6,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.24, 'end_time' => 8.07, 'target_text' => 'The desert trembled beneath their feet as the army advanced northward. A formation of countless small', 'source_text' => 'Padang pasir bergegar di bawah derapan kaki mereka tatkala bala tentera mara ke arah utara. Sekumpulan burung kecil yang tidak terkira bilangannya', 'order' => 1],
            ['start_time' => 8.08, 'end_time' => 23.67, 'target_text' => 'birds. Each bird carried three stones. Stones of baked clay. Allah revealed in the Quran.', 'source_text' => 'muncul. Setiap burung membawa tiga biji batu. Batu daripada tanah liat yang dibakar. Allah mewahyukan di dalam Al-Quran.', 'order' => 2],
            ['start_time' => 23.68, 'end_time' => 29.43, 'target_text' => 'In the vast deserts of Arabia, beneath skies unbroken and ancient,', 'source_text' => 'Di padang pasir Tanah Arab yang terbentang luas, di bawah naungan langit purba yang saujana mata memandang,', 'order' => 3],
            ['start_time' => 29.44, 'end_time' => 37.19, 'target_text' => 'history was quietly preparing for its greatest chapter. A world filled with tribes, kingdoms,', 'source_text' => 'sejarah secara senyap-senyap sedang mempersiapkan babak teragungnya. Sebuah dunia yang sarat dengan kabilah, kerajaan-kerajaan,', 'order' => 4],
            ['start_time' => 37.2, 'end_time' => 45.59, 'target_text' => 'and empires, all unaware that a light was soon to rise among them. But before that light appeared,', 'source_text' => 'dan empayar-empayar, semuanya tidak menyedari bahawa sebutir cahaya bakal menyinari mereka tidak lama lagi. Namun sebelum cahaya itu memancar,', 'order' => 5],
            ['start_time' => 45.6, 'end_time' => 54.79, 'target_text' => 'Allah showed the world something unmistakable. That power is not in armies. that might is not', 'source_text' => 'Allah telah memperlihatkan kepada seluruh dunia sesuatu yang tiada keraguan padanya. Bahawa kekuatan sebenar bukanlah terletak pada bala tentera. Bahawa keperkasaan bukanlah', 'order' => 6],
            ['start_time' => 54.8, 'end_time' => 65.35, 'target_text' => 'in numbers and that his will reigns above all things. This is not merely a story of events.', 'source_text' => 'pada jumlah bilangan yang ramai, dan sesungguhnya kehendak-Nya mengatasi segala sesuatu. Ini bukanlah sekadar sebuah penceritaan sejarah.', 'order' => 7],
            ['start_time' => 65.36, 'end_time' => 73.04, 'target_text' => 'It is a reminder that Allah shapes history with purpose, with wisdom, and with mercy.', 'source_text' => 'Ia adalah peringatan bahawa Allah mencorakkan sejarah dengan matlamat, penuh dengan hikmah dan dengan limpah rahmat-Nya.', 'order' => 8],
            ['start_time' => 73.84, 'end_time' => 81.59, 'target_text' => 'So let\'s begin our journey not with the birth of the prophet Muhammad peace be upon him but', 'source_text' => 'Maka marilah kita memulakan penjelajahan ini bukan dengan kelahiran Nabi Muhammad ﷺ, sebaliknya', 'order' => 9],
            ['start_time' => 81.6, 'end_time' => 100.55, 'target_text' => 'with the year Allah himself protected his sacred house. The year of the elephant.', 'source_text' => 'dengan tahun di mana Allah sendiri memelihara rumah suci-Nya. Tahun Gajah.', 'order' => 10],
            ['start_time' => 100.56, 'end_time' => 106.87, 'target_text' => 'In a world shadowed by ignorance and arrogance, the land of Arabia stood in darkness. Tribes', 'source_text' => 'Dalam sebuah dunia yang diselubungi kejahilan dan keangkuhan, bumi Tanah Arab berada dalam kegelapan. Kabilah-kabilah', 'order' => 11],
            ['start_time' => 106.88, 'end_time' => 114.07, 'target_text' => 'worshiped idols of stone and wood. Bloodshed was common. Mercy was rare. And the truth of Ibraim\'s', 'source_text' => 'menyembah berhala daripada batu dan kayu. Pertumpahan darah menjadi kebiasaan. Kasih sayang amat sukar ditemui. Dan kebenaran ajaran Nabi Ibrahim', 'order' => 12],
            ['start_time' => 114.08, 'end_time' => 120.79, 'target_text' => 'message had long been forgotten. The Caba, the house built for the worship of one God,', 'source_text' => 'telah sekian lama dilupakan. Kaabah, rumah ibadat yang dibina khusus untuk menyembah Tuhan yang Esa,', 'order' => 13],
            ['start_time' => 120.8, 'end_time' => 129.11, 'target_text' => 'still stood, but surrounded by 360 idols. Yet within that same land of confusion, Allah had', 'source_text' => 'masih berdiri teguh, namun dikelilingi oleh 360 buah berhala. Namun di bumi yang sama yang sarat dengan kekeliruan itu, Allah telah', 'order' => 14],
            ['start_time' => 129.12, 'end_time' => 137.51, 'target_text' => 'chosen a lineage pure and protected from which his final messenger would be born. Generations before,', 'source_text' => 'memilih keturunan yang suci lagi terpelihara, yang daripadanya pesuruh terakhir-Nya akan dilahirkan. Beberapa generasi terdahulu,', 'order' => 15],
            ['start_time' => 137.52, 'end_time' => 143.67, 'target_text' => 'the descendants of Ismael had guarded the sacred valley of Mecca. Among them was Abdul Muttalib,', 'source_text' => 'keturunan Nabi Ismail telah mengawal dan menjaga lembah suci Mekah. Antara mereka ialah Abdul Muttalib,', 'order' => 16],
            ['start_time' => 143.68, 'end_time' => 148.87, 'target_text' => 'noble and respected, the caretaker of the Kaa and grandfather of the prophet peace be', 'source_text' => 'seorang tokoh yang mulia lagi dihormati, penjaga Kaabah dan datuk kepada Nabi Muhammad ﷺ.', 'order' => 17],
            ['start_time' => 148.88, 'end_time' => 154.79, 'target_text' => 'upon him. But before the world would witness the light of Muhammad peace be upon him, it', 'source_text' => 'Namun sebelum dunia menyaksikan cahaya Nabi Muhammad ﷺ, dunia terlebih dahulu', 'order' => 18],
            ['start_time' => 154.8, 'end_time' => 162.39, 'target_text' => 'would first see the collapse of arrogance and the protection of Allah\'s house. Far south in Yemen,', 'source_text' => 'menyaksikan runtuhnya keangkuhan dan perlindungan ilahi terhadap baitullah. Jauh di selatan di bumi Yaman,', 'order' => 19],
            ['start_time' => 162.4, 'end_time' => 169.59, 'target_text' => 'they lived a proud ruler named Abraham, governor under the king of Abbiscinia. He built a grand', 'source_text' => 'tinggal seorang pemerintah yang sombong bernama Abrahah, gabenor di bawah naungan Raja Habsyah (Abyssinia). Dia telah membina sebuah', 'order' => 20],
            ['start_time' => 169.6, 'end_time' => 176.95, 'target_text' => 'church in Salah. Its ceilings of gold, its pillars of marble. He wanted to draw the Arabs away from', 'source_text' => 'gereja katedral yang megah di Sana\'a. Silingnya disaluti emas, tiang-tiangnya daripada batu marmar. Dia mahu memalingkan bangsa Arab daripada', 'order' => 21],
            ['start_time' => 176.96, 'end_time' => 183.91, 'target_text' => 'their pilgrimage to the Kaa to make his cathedral the new center of devotion. When the Arabs', 'source_text' => 'mengerjakan haji ke Kaabah demi menjadikan katedralnya sebagai pusat ibadat yang baharu. Apabila bangsa Arab', 'order' => 22],
            ['start_time' => 183.92, 'end_time' => 191.91, 'target_text' => 'ignored him, his pride burned. Enraged, Abra swore an oath. He would march to Mecca and destroy the', 'source_text' => 'menghiraukannya, maruahnya terasa tercabar. Dengan kemarahan yang meluap-luap, Abrahah bersumpah bahawa dia akan berarak ke Mekah dan memusnahkan', 'order' => 23],
            ['start_time' => 191.92, 'end_time' => 199.59, 'target_text' => 'Cabba himself. With arrogance in his heart, he gathered a vast army led by elephants, creatures', 'source_text' => 'Kaabah dengan tangannya sendiri. Dengan keangkuhan di dalam hatinya, dia mengumpulkan bala tentera yang besar diketuai oleh gajah-gajah, makhluk', 'order' => 24],
            ['start_time' => 199.6, 'end_time' => 207.51, 'target_text' => 'never before seen in Arabia. Among them was the mighty elephant. The desert trembled beneath their', 'source_text' => 'yang belum pernah disaksikan di Tanah Arab sebelum ini. Antaranya ialah seekor gajah gergasi yang perkasa. Padang pasir bergegar di bawah', 'order' => 25],
            ['start_time' => 207.52, 'end_time' => 216.23, 'target_text' => 'feet as the army advanced northward. Tribes along the way tried to resist but were crushed by his', 'source_text' => 'derapan langkah mereka tatkala bala tentera mara ke arah utara. Kabilah-kabilah di sepanjang laluan cuba menentang namun dihancurkan oleh', 'order' => 26],
            ['start_time' => 216.24, 'end_time' => 222.95, 'target_text' => 'power. News of his approach spread across Arabia like a storm. When Abraa reached the outskirts of', 'source_text' => 'kekuatannya. Berita tentang kemaraannya tersebar ke serata Tanah Arab bagaikan ribut. Apabila Abrahah tiba di pinggir kota', 'order' => 27],
            ['start_time' => 222.96, 'end_time' => 231.19, 'target_text' => 'Mecca, he seized the wealth of Qur including 200 camels belonging to Abdul Muttalib. When Abraa', 'source_text' => 'Mekah, dia merampas harta penduduk Quraisy termasuk 200 ekor unta milik Abdul Muttalib. Apabila Abrahah', 'order' => 28],
            ['start_time' => 231.2, 'end_time' => 238.23, 'target_text' => 'summoned Abdul Muttalib, expecting fear, he found dignity instead. The chief of Quresh entered with', 'source_text' => 'memanggil Abdul Muttalib dengan menyangka beliau akan berasa takut, sebaliknya dia mendapati kemuliaan peribadi. Pemimpin Quraisy itu masuk dengan penuh', 'order' => 29],
            ['start_time' => 238.24, 'end_time' => 247.75, 'target_text' => 'calmness, his face noble, his presence commanding respect. Abraad descended from his throne to sit', 'source_text' => 'ketenangan, wajahnya bercahaya mulia, dan kewibawaannya mengundang rasa hormat yang mendalam. Abrahah turun daripada singgahsananya lalu duduk', 'order' => 30],
            ['start_time' => 247.76, 'end_time' => 255.03, 'target_text' => 'beside him. Through a translator, Abraa asked his purpose. Abdul Muttalib replied gently,', 'source_text' => 'di sisinya. Melalui seorang jurubahasa, Abrahah bertanya apakah tujuannya hadir. Abdul Muttalib menjawab dengan tenang dan lembut,', 'order' => 31],
            ['start_time' => 255.04, 'end_time' => 262.15, 'target_text' => '"I came to reclaim my camels that you have taken." Surprised, Abraa said, "I was impressed by your', 'source_text' => '"Aku datang untuk menuntut kembali unta-untaku yang telah engkau rampas." Terperanjat dengan jawapan itu, Abrahah berkata, "Aku pada mulanya berasa kagum dengan', 'order' => 32],
            ['start_time' => 262.16, 'end_time' => 268.39, 'target_text' => 'presence, but your words make me think less of you. You ask me about your camels while I come', 'source_text' => 'kehebatan peribadimu, namun kata-katamu ini membuatkan aku memandang rendah kepadamu. Engkau bertanya kepadaku tentang unta-untamu sedangkan aku datang', 'order' => 33],
            ['start_time' => 268.4, 'end_time' => 275.67, 'target_text' => 'to destroy your holy house." And Abdul Muttalib answered with unshakable faith, "I am the owner', 'source_text' => 'untuk memusnahkan rumah suci agamamu." Dan Abdul Muttalib menjawab dengan keimanan yang tidak berbelah bahagi, "Sesungguhnya aku adalah pemilik', 'order' => 34],
            ['start_time' => 275.68, 'end_time' => 283.11, 'target_text' => 'of the camels. As for the house, it has a Lord who will protect it. Subhan Allah. Those words', 'source_text' => 'kepada unta-unta itu. Adapun Rumah itu (Kaabah), ia memiliki Tuhannya yang akan memeliharanya." Subhanallah. Kalimah keramat itu', 'order' => 35],
            ['start_time' => 283.12, 'end_time' => 289.43, 'target_text' => 'would echo through time. Abdul Muttalib returned to Mecca, gathered his people, and told him to', 'source_text' => 'kekal bergema merentasi zaman. Abdul Muttalib kembali ke Mekah, mengumpulkan kaumnya, dan mengarahkan mereka supaya', 'order' => 36],
            ['start_time' => 289.44, 'end_time' => 296.55, 'target_text' => 'seek safety in the mountains, trusting that Allah would defend his sanctuary. At dawn,', 'source_text' => 'mencari perlindungan keselamatan di kawasan pergunungan, dengan penuh tawakal bahawa Allah pasti membela rumah suci-Nya. Pada waktu fajar,', 'order' => 37],
            ['start_time' => 296.56, 'end_time' => 304.15, 'target_text' => 'the air was still. Abraha ordered his elephants to advance towards the Caba, but the elephant', 'source_text' => 'suasana hening seketika. Abrahah memerintahkan pasukan gajahnya untuk mara ke arah Kaabah, namun gajah utamanya', 'order' => 38],
            ['start_time' => 304.16, 'end_time' => 311.11, 'target_text' => 'refused. When they turned it toward Yemen, it walked. When they turned it toward Mecca,', 'source_text' => 'enggan bergerak. Apabila mereka memalingkannya ke arah Yaman, ia berjalan. Namun apabila mereka memalingkannya ke arah Mekah,', 'order' => 39],
            ['start_time' => 311.12, 'end_time' => 319.99, 'target_text' => 'it knelt. They struck it. They shouted, but it would not move. Then the sky changed. From above,', 'source_text' => 'ia terus menderum melutut. Mereka memukulnya. Mereka menjerit memaksanya, namun ia tetap enggan berganjak. Tiba-tiba suasana langit berubah. Dari arah atas,', 'order' => 40],
            ['start_time' => 320.0, 'end_time' => 330.39, 'target_text' => 'a dark cloud appeared. A formation of countless small birds. Each bird carried three stones,', 'source_text' => 'segumpal awan hitam kelihatan muncul. Ia adalah sekumpulan burung kecil (burung Ababil) yang tidak terhitung jumlahnya. Setiap burung membawa tiga biji batu,', 'order' => 41],
            ['start_time' => 330.4, 'end_time' => 341.75, 'target_text' => 'one in its beak and one in each claw. Stones of baked clay. Allah revealed in the Quran.', 'source_text' => 'sebiji di paruhnya dan sebiji pada setiap cakarnya. Batu-batu daripada tanah liat yang dibakar. Allah mewahyukan di dalam Al-Quran:', 'order' => 42],
            ['start_time' => 341.76, 'end_time' => 349.43, 'target_text' => 'Have you not seen how your Lord dealt with the companions of the elephant?', 'source_text' => '"Tidakkah engkau memerhatikan bagaimana Tuhanmu telah melakukan terhadap tentera bergajah?" (Surah Al-Fil: 1)', 'order' => 43],
            ['start_time' => 349.44, 'end_time' => 353.68, 'target_text' => 'Did he not make their plan go astray?', 'source_text' => '"Bukankah Dia telah menjadikan rancangan jahat mereka hancur berkecai?" (Surah Al-Fil: 2)', 'order' => 44],
            ['start_time' => 355.36, 'end_time' => 362.87, 'target_text' => 'And he sent against them flocks of birds,', 'source_text' => '"Dan Dia telah menghantarkan kepada mereka rombongan burung berpasuk-pasukan," (Surah Al-Fil: 3)', 'order' => 45],
            ['start_time' => 362.88, 'end_time' => 370.55, 'target_text' => 'striking them with stones of hard clay.', 'source_text' => '"Yang melontari mereka dengan batu-batu daripada tanah liat yang dibakar," (Surah Al-Fil: 4)', 'order' => 46],
            ['start_time' => 370.56, 'end_time' => 379.19, 'target_text' => 'And he made them like eaten straw. One by one the soldiers fell. The mightiest army on earth was', 'source_text' => '"Lalu Dia menjadikan mereka seperti daun-daun kayu yang dimakan ulat." (Surah Al-Fil: 5). Satu demi satu askarnya tumbang bergelimpangan. Bala tentera terkuat di muka bumi', 'order' => 47],
            ['start_time' => 379.2, 'end_time' => 386.39, 'target_text' => 'defeated without a sword drawn, without a single man from Quresh lifting his hand. The arrogance', 'source_text' => 'ditumpaskan tanpa sebilah pedang pun dihunus, tanpa seorang pun daripada kaum Quraisy perlu mengangkat tangan mereka. Keangkuhan', 'order' => 48],
            ['start_time' => 386.4, 'end_time' => 394.55, 'target_text' => 'of Abraa melted away under the reign of Allah\'s justice. He turned back wounded and humiliated,', 'source_text' => 'Abrahah lebur musnah di bawah pengadilan keadilan Allah. Dia berundur dalam keadaan parah luka dan terhina,', 'order' => 49],
            ['start_time' => 394.56, 'end_time' => 402.15, 'target_text' => 'his body decaying as he returned to Yemen. A sign to all who defy the will of the creator. That year', 'source_text' => 'tubuhnya hancur membusuk sepanjang perjalanannya pulang ke Yaman. Menjadi suatu tanda pengajaran bagi sesiapa yang mengingkari kehendak Sang Pencipta. Tahun tersebut', 'order' => 50],
            ['start_time' => 402.16, 'end_time' => 411.59, 'target_text' => 'became known as alil, the year of the elephant. And in the same year in the sacred month of Ra,', 'source_text' => 'dikenali sebagai \'Amul Fil, Tahun Gajah. Dan pada tahun yang sama, dalam bulan suci Rabi\'ul Awwal,', 'order' => 51],
            ['start_time' => 411.6, 'end_time' => 418.71, 'target_text' => 'a greater miracle was destined to unfold. The birth of the messenger of Allah, may peace be', 'source_text' => 'suatu mukjizat yang jauh lebih agung ditakdirkan berlaku. Kelahiran Rasulullah, selawat dan salam', 'order' => 52],
            ['start_time' => 418.72, 'end_time' => 428.15, 'target_text' => 'upon him. In a modest home in Mecca, a woman of purity and calm felt the mercy of her Lord descend', 'source_text' => 'ke atas junjungan besar baginda. Di sebuah rumah sederhana di kota Mekah, seorang wanita yang suci lagi tenang (Siti Aminah) merasakan limpahan rahmat Tuhannya turun', 'order' => 53],
            ['start_time' => 428.16, 'end_time' => 434.95, 'target_text' => 'upon her. She saw the light so radiant that it illuminated the palaces of Busra in Syria. She', 'source_text' => 'ke atas dirinya. Beliau menyaksikan sebutir cahaya yang begitu gilang-gemilang sehingga menerangi istana-istana Busra di Syam. Beliau', 'order' => 54],
            ['start_time' => 434.96, 'end_time' => 444.71, 'target_text' => 'gave birth to a child named Muhammad Abdah. The child was pure, serene. The fragrance of musk', 'source_text' => 'melahirkan seorang bayi mulia bernama Muhammad bin Abdullah. Bayi itu suci lagi memancarkan ketenangan. Haruman kasturi', 'order' => 55],
            ['start_time' => 444.72, 'end_time' => 451.91, 'target_text' => 'filled the room and his small hands were raised towards the heavens. The world that had witnessed', 'source_text' => 'semerbak memenuhi bilik dan kedua-dua tangan kecilnya terangkat mengarah ke langit. Dunia yang sebelum ini menyaksikan', 'order' => 56],
            ['start_time' => 451.92, 'end_time' => 459.43, 'target_text' => 'the destruction of arrogance now witnessed the birth of mercy. The prophet peace be upon him', 'source_text' => 'kehancuran sebuah keangkuhan, kini menyaksikan kelahiran sebuah rahmat. Nabi Muhammad ﷺ', 'order' => 57],
            ['start_time' => 459.44, 'end_time' => 466.95, 'target_text' => 'was born an orphan. His father Abdullah had passed away before his birth. Yet Allah was', 'source_text' => 'dilahirkan dalam keadaan yatim. Bapanya, Abdullah, telah meninggal dunia sebelum kelahirannya. Namun Allah', 'order' => 58],
            ['start_time' => 466.96, 'end_time' => 478.79, 'target_text' => 'with him always protecting always preparing him for the message to come. As Allah said in', 'source_text' => 'sentiasa bersama baginda, sentiasa memelihara dan mempersiapkan baginda untuk memikul risalah agung yang bakal tiba. Sebagaimana firman Allah di dalam Surah Ad-Dhuha:', 'order' => 59],
            ['start_time' => 478.8, 'end_time' => 485.44, 'target_text' => 'your Lord has not forsaken you, nor has he detested you.', 'source_text' => '"Tuhanmu tidak meninggalkanmu (wahai Muhammad) dan tidak pula Dia membencimu." (Surah Ad-Dhuha: 3)', 'order' => 60],
            ['start_time' => 487.2, 'end_time' => 494.95, 'target_text' => 'And surely what is to come will be better for you than what has gone before', 'source_text' => '"Dan sesungguhnya kesudahan (akhirat) itu adalah lebih baik bagimu daripada permulaan (dunia)." (Surah Ad-Dhuha: 4)', 'order' => 61],
            ['start_time' => 494.96, 'end_time' => 500.47, 'target_text' => 'and your Lord will give you and you will be pleased. From the beginning the prophet peace', 'source_text' => '"Dan kelak Tuhanmu pasti akan memberikan kurnia-Nya kepadamu, sehingga engkau berasa reda dan puas hati." (Surah Ad-Dhuha: 5). Sejak dari awal, Nabi Muhammad', 'order' => 62],
            ['start_time' => 500.48, 'end_time' => 507.83, 'target_text' => 'be upon him was chosen, protected and guided. He was raised among the purest of people nursed by', 'source_text' => 'ﷺ telah dipilih, dilindungi dan dibimbing. Baginda dibesarkan dalam kalangan kaum yang paling murni budi bahasanya, disusui oleh', 'order' => 63],
            ['start_time' => 507.84, 'end_time' => 516.07, 'target_text' => 'Haleima Sadia who witnessed blessings wherever he went. Rain fell upon their lands. Their', 'source_text' => 'Halimatus Sa\'diyah yang menyaksikan keberkatan melimpah ke mana sahaja baginda pergi. Hujan turun menyuburkan tanah mereka.', 'order' => 64],
            ['start_time' => 516.08, 'end_time' => 522.55, 'target_text' => 'animals grew strong and their hearts filled with peace. All this was Allah\'s preparation', 'source_text' => 'Binatang ternakan mereka menjadi sihat gemuk dan hati mereka dipenuhi dengan ketenangan jiwa. Semua ini merupakan persediaan Allah', 'order' => 65],
            ['start_time' => 522.56, 'end_time' => 529.19, 'target_text' => 'for the one who would carry the final message to mankind. Years later, when the prophet peace', 'source_text' => 'buat insan yang bakal memikul risalah terakhir kepada sekalian umat manusia. Bertahun-tahun selepas itu, apabila Nabi Muhammad', 'order' => 66],
            ['start_time' => 529.2, 'end_time' => 538.71, 'target_text' => 'be upon him would recall his early days, the words of surah would echo his life.', 'source_text' => 'ﷺ mengingati kembali fasa awal hidup baginda, ayat-ayat daripada Surah Asy-Syarh bergema menceritakan perjalanan hidup baginda:', 'order' => 67],
            ['start_time' => 538.72, 'end_time' => 548.95, 'target_text' => 'Did we not expand for you your chest? and remove from you your burden', 'source_text' => '"Bukankah Kami telah melapangkan dadamu (wahai Muhammad)? Dan Kami telah meringankan bebanmu," (Surah Asy-Syarh: 1-2)', 'order' => 68],
            ['start_time' => 548.96, 'end_time' => 554.87, 'target_text' => 'which weighed heavily upon your back', 'source_text' => '"Yang memberatkan tanggungan tulang belakangmu?" (Surah Asy-Syarh: 3)', 'order' => 69],
            ['start_time' => 554.88, 'end_time' => 559.67, 'target_text' => 'and raised high for you your reputation. Indeed,', 'source_text' => '"Dan Kami telah meninggikan bagimu sebutan namamu (kemuliaanmu)?" (Surah Asy-Syarh: 4). Sesungguhnya,', 'order' => 70],
            ['start_time' => 559.68, 'end_time' => 565.19, 'target_text' => 'Allah raised his name alongside his own. When every believer', 'source_text' => 'Allah telah mengangkat nama baginda bersama nama-Nya yang Maha Agung. Di mana setiap orang yang beriman', 'order' => 71],
            ['start_time' => 565.2, 'end_time' => 570.55, 'target_text' => 'saysahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahahillahhammed', 'source_text' => 'melafazkan kalimah syahadah: La ilaha illallah, Muhammadur Rasulullah,', 'order' => 72],
            ['start_time' => 570.56, 'end_time' => 576.47, 'target_text' => 'there is none worthy of worship but Allah and Muhammad is the messenger of Allah. The', 'source_text' => '"Tiada Tuhan yang berhak disembah melainkan Allah, dan Muhammad adalah pesuruh Allah."', 'order' => 73],
            ['start_time' => 576.48, 'end_time' => 582.79, 'target_text' => 'story of the year of the elephant was not merely about the fall of Abraa. It was a', 'source_text' => 'Kisah Tahun Gajah bukanlah semata-mata mengenai kejatuhan Abrahah. Ia adalah', 'order' => 74],
            ['start_time' => 582.8, 'end_time' => 590.47, 'target_text' => 'prelude a divine sign that Allah himself was preparing the world for his final messenger.', 'source_text' => 'mukadimah dan tanda kebesaran ilahi bahawa Allah sendiri sedang mempersiapkan dunia untuk menyambut pesuruh terakhir-Nya.', 'order' => 75],
            ['start_time' => 590.48, 'end_time' => 594.95, 'target_text' => 'As we move forward to the early life of the prophet peace be upon him,', 'source_text' => 'Semasa kita melangkah ke fasa awal kehidupan Nabi Muhammad ﷺ,', 'order' => 76],
            ['start_time' => 594.96, 'end_time' => 603.91, 'target_text' => 'let your heart remember this. Allah did not send him randomly. Every moment, every hardship, every', 'source_text' => 'pasakkanlah di dalam hati anda hakikat ini. Allah tidak mengutuskan baginda secara kebetulan. Setiap detik, setiap kepayahan hidup, setiap', 'order' => 77],
            ['start_time' => 603.92, 'end_time' => 612.47, 'target_text' => 'sign was preparation for the greatest mission ever given. Join me in the next episode inshallah as we', 'source_text' => 'tanda adalah persediaan rapi buat misi paling agung yang pernah diamanahkan. Sertai saya dalam episod seterusnya insya-Allah tatkala kita', 'order' => 78],
            ['start_time' => 612.48, 'end_time' => 620.39, 'target_text' => 'follow the childhood of mercy and watch how Allah raised his prophet peace be upon him with love', 'source_text' => 'menelusuri zaman kanak-kanak insan pembawa rahmat ini dan menyaksikan bagaimana Allah mendidik Nabi-Nya ﷺ dengan penuh kasih sayang,', 'order' => 79],
            ['start_time' => 620.4, 'end_time' => 632.32, 'target_text' => 'with wisdom and with incomparable care. Sallah Muhammad peace and blessings be upon Muhammad.', 'source_text' => 'dengan hikmah dan dengan pemeliharaan yang tiada tandingannya. Sollallahu \'ala Muhammad, selawat dan salam ke atas junjungan Nabi Muhammad ﷺ.', 'order' => 80],
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
