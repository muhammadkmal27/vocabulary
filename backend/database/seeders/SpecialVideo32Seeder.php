<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo32Seeder extends Seeder
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

        // Special Bilingual Religious Video #32 (Siri 1 Ep.27): The Battle of Hunayn | Life of the Final Messenger ﷺ | Ep.27 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => '1JCCeBE81WQ'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Battle of Hunayn | Life of the Final Messenger ﷺ | Ep.27 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/1JCCeBE81WQ/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 32,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.64, 'end_time' => 9.68, 'target_text' => '...Ali, may Allah be pleased with him, paid for every loss until no grievance remained. When Khalid ibn al-Walid,', 'source_text' => '...Ali bin Abi Talib RA membayar ganti rugi bagi setiap kehilangan nyawa dan harta sehingga tiada lagi rungutan yang berbaki. Tatkala Khalid bin al-Walid,', 'order' => 1],
            ['start_time' => 9.68, 'end_time' => 14.48, 'target_text' => 'may Allah be pleased with him, arrived, her priestess called out, "O \'Uzza,', 'source_text' => 'semoga Allah meredhainya, tiba, jurukunci berhalanya melaungkan seruan, "Wahai al-\'Uzza,', 'order' => 2],
            ['start_time' => 14.48, 'end_time' => 20.64, 'target_text' => 'protect yourself! Defend your sanctuary!" Even some converts from Quraysh fled in confusion,', 'source_text' => 'pertahankanlah dirimu! Lindungilah tempat suci penyembahanmu!" Malah segelintir kaum Quraisy yang baru memeluk Islam lari bertempiaran dalam kekeliruan,', 'order' => 3],
            ['start_time' => 20.64, 'end_time' => 28.32, 'target_text' => 'crying, "We will not stop until we reach the sea!" My beloved brothers and sisters,', 'source_text' => 'seraya melaungkan, "Kekalahan mereka tidak akan terhenti sehinggalah mereka sampai ke pantai lautan!" Saudara dan saudariku yang dikasihi,', 'order' => 4],
            ['start_time' => 28.32, 'end_time' => 34.72, 'target_text' => 'after the victory of Makkah, the ummah stood strong. But victory can be a test greater than', 'source_text' => 'selepas peristiwa pembukaan kota Makkah, kedudukan umat Islam kelihatan amat kukuh. Namun sesungguhnya kejayaan boleh menjadi ujian yang jauh lebih berat daripada', 'order' => 5],
            ['start_time' => 34.72, 'end_time' => 42, 'target_text' => 'hardship. For when numbers increase and hearts taste triumph, faith is measured not in strength,', 'source_text' => 'penderitaan. Kerana tatkala bilangan tentera bertambah dan sanubari mengecapi kemenangan, keimanan bukan lagi diukur pada kekuatan zahir,', 'order' => 6],
            ['start_time' => 42, 'end_time' => 49.6, 'target_text' => 'but in reliance upon Allah. Hunayn was a reminder written in dust and echoes.', 'source_text' => 'sebaliknya pada tahap kebergantungan mutlak dan tawakal kepada Allah. Lembah Hunain menjadi suatu peringatan abadi yang terpahat di celah debu dan gema sejarah.', 'order' => 7],
            ['start_time' => 49.6, 'end_time' => 68.8, 'target_text' => 'So come with me to the valley where the believers remembered the source of victory.', 'source_text' => 'Maka hayutilah bersama saya lembah tatkala kaum mukminin disedarkan kembali tentang hakikat sumber kemenangan yang sebenar.', 'order' => 8],
            ['start_time' => 68.8, 'end_time' => 76.72, 'target_text' => 'The air of Makkah was still heavy with the echoes of victory. The Ka\'bah stood pure once more, the', 'source_text' => 'Suasana di kota Makkah masih diselubungi kehangatan gema kemenangan. Kaabah kembali suci memancar nur tauhid,', 'order' => 9],
            ['start_time' => 76.72, 'end_time' => 84.8, 'target_text' => 'idols shattered, the city silent in peace. But faith — true faith — is always tested after', 'source_text' => 'berhala-berhala telah hancur berkecai, dan kota suci itu tenang dalam kedamaian. Namun iman — iman yang hakiki — sentiasa diuji selepas', 'order' => 10],
            ['start_time' => 84.8, 'end_time' => 91.44, 'target_text' => 'triumph. Soon after the victory of Makkah, the Prophet peace be upon him sent his companions', 'source_text' => 'mengecapi kemuliaan. Tidak lama selepas pembukaan kota Makkah, Nabi ﷺ mengutuskan para sahabat baginda', 'order' => 11],
            ['start_time' => 91.44, 'end_time' => 98.96, 'target_text' => 'to call the tribes of Arabia to Islam — not to fight, but to invite. Among them was Khalid ibn al-Walid,', 'source_text' => 'untuk menyeru kabilah-kabilah di sekitar Tanah Arab kepada Islam — bukan untuk memerangi, melainkan untuk mengajak secara damai. Antara yang diutuskan ialah Khalid bin al-Walid,', 'order' => 12],
            ['start_time' => 98.96, 'end_time' => 105.2, 'target_text' => 'may Allah be pleased with him, who mistakenly engaged one of the tribes — a tragic event that', 'source_text' => 'semoga Allah meredhainya, yang telah tersilap memerangi salah satu kabilah (Bani Jadhimah) — satu peristiwa duka yang', 'order' => 13],
            ['start_time' => 105.2, 'end_time' => 111.44, 'target_text' => 'left the Prophet peace be upon him grieved. Raising his blessed hands, the Prophet peace', 'source_text' => 'membuatkan Nabi ﷺ amat berdukacita. Sambil mengangkat kedua-dua belah tangan baginda yang mulia, Nabi', 'order' => 14],
            ['start_time' => 111.44, 'end_time' => 119.84, 'target_text' => 'be upon him said, "O Allah, I am free before You from what Khalid has done." He then sent Ali ibn Abi', 'source_text' => 'ﷺ mendoakan, "Ya Allah, sesungguhnya aku berlepas diri di hadapan-Mu daripada apa yang telah dilakukan oleh Khalid." Baginda kemudiannya mengutuskan Ali bin Abi', 'order' => 15],
            ['start_time' => 119.84, 'end_time' => 125.84, 'target_text' => 'Talib, may Allah be pleased with him, with wealth and kindness to compensate the tribe.', 'source_text' => 'Talib RA bersama harta pampasan dan santunan budi untuk membayar ganti rugi kepada kabilah tersebut.', 'order' => 16],
            ['start_time' => 126.72, 'end_time' => 134.56, 'target_text' => 'Ali ibn Abi Talib, may Allah be pleased with him, paid for every loss until no grievance remained.', 'source_text' => 'Ali bin Abi Talib RA membayar ganti rugi terhadap setiap nyawa dan barangan yang musnah sehingga tiada lagi rasa terkilan di hati mereka.', 'order' => 17],
            ['start_time' => 134.56, 'end_time' => 141.52, 'target_text' => 'This act healed hearts and restored justice — a lesson that Islam spreads not by the sword, but', 'source_text' => 'Tindakan berhikmah ini mengubati luka sanubari dan menegakkan keadilan — suatu pengajaran bahawa Islam tersebar bukan dengan pedang, sebaliknya', 'order' => 18],
            ['start_time' => 141.52, 'end_time' => 148, 'target_text' => 'by mercy. Then the Messenger of Allah peace be upon him dispatched Khalid once again, this time', 'source_text' => 'dengan limpahan rahmat. Kemudian Rasulullah ﷺ mengutuskan Khalid sekali lagi, kali ini', 'order' => 19],
            ['start_time' => 148, 'end_time' => 157.6, 'target_text' => 'to demolish al-\'Uzza, the last great idol of Quraysh. She stood in Nakhlah, worshipped for generations. When Khalid ibn al-Walid,', 'source_text' => 'untuk meruntuhkan al-\'Uzza, berhala terbesar terakhir sembahan Quraisy. Berhala itu terpacak di Nakhlah, disembah sejak zaman-berzaman. Tatkala Khalid bin al-Walid,', 'order' => 20],
            ['start_time' => 157.6, 'end_time' => 163.28, 'target_text' => 'may Allah be pleased with him, arrived, her priestess called out, "O \'Uzza, protect yourself!', 'source_text' => 'semoga Allah meredhainya, tiba di hadapannya, jurukunci wanita berhala itu menjerit menyeru, "Wahai al-\'Uzza, pertahankanlah dirimu!', 'order' => 21],
            ['start_time' => 163.28, 'end_time' => 169.6, 'target_text' => 'Defend your sanctuary!" But there was no answer. Khalid struck the idol down with his sword,', 'source_text' => 'Lindungilah tempat suci penyembahanmu!" Namun tiada jawapan sedikit pun. Khalid lantas menetak dan menghancurkan berhala itu dengan pedangnya,', 'order' => 22],
            ['start_time' => 169.6, 'end_time' => 176.72, 'target_text' => 'crying, "Allahu Akbar! Falsehood has fallen!" The symbol of ignorance collapsed in the dust. And', 'source_text' => 'seraya melaungkan, "Allahu Akbar! Telah tumbanglah segala kepalsuan!" Lambang kejahilan itu rebah menyembah debu. Dan', 'order' => 23],
            ['start_time' => 176.72, 'end_time' => 188.48, 'target_text' => 'the valley that once echoed with pagan chants now echoed with "La ilaha illallah." Yet not far away, Hawazin and Thaqif, proud', 'source_text' => 'lembah yang dahulunya bergema dengan mantera syirik kini bergema dengan kalimah "La ilaha illallah." Namun tidak jauh dari situ, kabilah Hawazin dan Thaqif yang angkuh', 'order' => 24],
            ['start_time' => 188.48, 'end_time' => 195.92, 'target_text' => 'tribes of the desert, gathered in fury. They had seen Makkah fall and feared the rise of Islam.', 'source_text' => 'di padang pasir mula berkumpul dalam kemarahan yang membara. Mereka menyaksikan kejatuhan Makkah dan berasa cemas akan penyebaran Islam.', 'order' => 25],
            ['start_time' => 195.92, 'end_time' => 204.24, 'target_text' => 'Their leader Malik ibn \'Awf united the tribes and said, "Bring your wealth, your women, your children.', 'source_text' => 'Pemimpin mereka, Malik bin \'Awf, menghimpunkan kabilah-kabilah tersebut seraya berseru, "Bawalah segala harta kekayaanmu, kaum wanita, dan anak-anakmu ke medan perang.', 'order' => 26],
            ['start_time' => 204.24, 'end_time' => 211.52, 'target_text' => 'Let them stand behind you so you will fight to protect them." The aged warrior Durayd ibn al-Simmah warned,', 'source_text' => 'Biarkan mereka berada di belakang barisanmu agar kamu bertarung bermati-matian untuk mempertahankan mereka." Namun pahlawan veteran yang sudah berusia, Duraid bin al-Simmah, memperingatkan,', 'order' => 27],
            ['start_time' => 211.52, 'end_time' => 219.6, 'target_text' => '"O Malik, your plan is folly! You have made your people vulnerable. When your defeat comes,', 'source_text' => '"Wahai Malik, rancanganmu ini adalah suatu kebodohan! Engkau telah mendedahkan seluruh kaummu kepada bahaya. Tatkala kekalahan menimpamu,', 'order' => 28],
            ['start_time' => 219.6, 'end_time' => 227.28, 'target_text' => 'your family will fall with you." But pride deafened Malik\'s heart. And so while the', 'source_text' => 'keluargamu pasti akan turut menjadi mangsa tawanan." Namun rasa keangkuhan telah membutakan sanubari Malik. Maka tatkala', 'order' => 29],
            ['start_time' => 227.28, 'end_time' => 233.12, 'target_text' => 'Prophet peace be upon him prepared to leave Makkah, an army gathered: 10,000 believers', 'source_text' => 'Nabi ﷺ bersiap sedia untuk berangkat meninggalkan Makkah, satu angkatan bala tentera yang besar berhimpun: 10,000 pejuang mukminin', 'order' => 30],
            ['start_time' => 233.12, 'end_time' => 242.16, 'target_text' => 'joined by 2,000 new Muslims of Quraysh. It was the largest Muslim force yet — 12,000 strong. At dawn,', 'source_text' => 'disertai oleh 2,000 orang Muslim baharu dari kalangan Quraisy. Itulah angkatan tentera Islam terbesar pernah dihimpunkan — seramai 12,000 orang. Tatkala fajar menyingsing,', 'order' => 31],
            ['start_time' => 242.16, 'end_time' => 248.08, 'target_text' => 'the army entered the valley of Hunayn, a narrow gorge between the cliffs of Tihamah.', 'source_text' => 'bala tentera Islam melangkah masuk ke lembah Hunain, sebuah jurang sempit yang diapit tebing-tebing tinggi pergunungan Tihamah.', 'order' => 32],
            ['start_time' => 248.08, 'end_time' => 256.4, 'target_text' => 'Wrapped in mist, hidden in the shadows above, Hawazin lay in wait. When the Muslims descended,', 'source_text' => 'Diselubungi kabus tebal dan bersembunyi di balik bayang-bayang tebing bukit, tentera Hawazin telah bersiap sedia menunggu serang hendap. Sebaik kaum Muslimin menuruni lembah,', 'order' => 33],
            ['start_time' => 256.4, 'end_time' => 264.32, 'target_text' => 'arrows rained from every side. The surprise was fierce. Panic spread. Even some converts', 'source_text' => 'hujan anak panah mencurah-curah membedil dari segenap penjuru. Serangan hendap itu berlaku amat pantas dan dahsyat. Panik mula merebak. Malah segelintir mereka', 'order' => 34],
            ['start_time' => 264.32, 'end_time' => 271.84, 'target_text' => 'from Quraysh fled in confusion, crying, "We will not stop until we reach the sea!" For the first', 'source_text' => 'yang baru memeluk Islam lari bertempiaran seraya melaungkan, "Kekalahan kita tidak akan berhenti sehingga ke gigi laut!" Buat kali pertama', 'order' => 35],
            ['start_time' => 271.84, 'end_time' => 279.44, 'target_text' => 'time since the Hijrah, the Muslim ranks broke. But the Prophet peace be upon him stood firm upon his', 'source_text' => 'sejak peristiwa Hijrah, barisan saf kaum Muslimin berpecah dan berundur. Namun Nabi ﷺ tetap berdiri teguh di atas keldai', 'order' => 36],
            ['start_time' => 279.44, 'end_time' => 286.72, 'target_text' => 'white mule, calling out with the voice of courage: "O servants of Allah, come back to me! I am the', 'source_text' => 'putih baginda, menyeru dengan suara yang sarat keberanian: "Wahai hamba-hamba Allah, kembalilah kepadaku! Akulah', 'order' => 37],
            ['start_time' => 286.72, 'end_time' => 296.08, 'target_text' => 'Messenger of Allah, there is no lie in it! I am the son of Abdul-Muttalib!" At his side stood only a few: Abu Bakr, Umar, Ali,', 'source_text' => 'Rasulullah, tiada kepalsuan padanya! Akulah keturunan Abdul-Muttalib!" Di samping baginda hanya tinggal segelintir sahabat setia: Abu Bakr, Umar, Ali,', 'order' => 38],
            ['start_time' => 296.08, 'end_time' => 302.16, 'target_text' => 'al-Abbas, may Allah be pleased with them, and a handful of steadfast souls. The Prophet peace be', 'source_text' => 'al-Abbas RA, serta sekumpulan kecil sahabat yang tidak berganjak. Nabi', 'order' => 39],
            ['start_time' => 302.16, 'end_time' => 309.68, 'target_text' => 'upon him told his uncle al-Abbas, whose voice was mighty: "Call the people of the tree, the people of', 'source_text' => 'ﷺ lantas memerintahkan bapa saudaranya al-Abbas yang mempunyai suara lantang bergema: "Panggillah para sahabat yang berikrar di bawah pohon, pejuang-pejuang', 'order' => 40],
            ['start_time' => 309.68, 'end_time' => 318.64, 'target_text' => 'Badr and al-Bay\'ah!" And al-Abbas shouted, "O companions of the tree! O Ansar! O believers!" His cry pierced', 'source_text' => 'Perang Badr dan ikrar Bai\'atur Ridwan!" Maka al-Abbas melaungkan sekuat jiwanya, "Wahai para sahabat di bawah pohon! Wahai kaum Ansar! Wahai orang-orang beriman!" Laungan keramat itu membelah', 'order' => 41],
            ['start_time' => 318.64, 'end_time' => 325.44, 'target_text' => 'the valley like thunder. The companions turned back, their hearts reignited. They charged, shouting:', 'source_text' => 'lembah Hunain bagaikan halilintar menyambar. Para sahabat segera berpatah balik dengan hati yang kembali marak bernyala. Mereka menyerbu ke hadapan seraya melaungkan:', 'order' => 42],
            ['start_time' => 325.44, 'end_time' => 334.16, 'target_text' => '"Labbayk! Labbayk!" The Prophet peace be upon him watched the tide turn, then declared, "Now the battle has', 'source_text' => '"Labbayk! Kami menyahut seruanmu!" Nabi ﷺ menyaksikan arus pertempuran mula berubah arah lalu bersabda, "Sekarang kancah pertempuran telah', 'order' => 43],
            ['start_time' => 334.16, 'end_time' => 342.16, 'target_text' => 'heated! Truly, the furnace of war is lit!" He took a handful of dust, cast it toward the enemy, and', 'source_text' => 'memuncak hangat! Sesungguhnya relau peperangan kini telah marak menjulang!" Baginda mengambil segenggam debu tanah, lalu melontarkannya ke arah pihak musuh seraya', 'order' => 44],
            ['start_time' => 342.16, 'end_time' => 349.28, 'target_text' => 'said, "May their faces be filled with dust!" And Allah fulfilled His promise: the enemy\'s eyes were', 'source_text' => 'bersabda, "Semoga wajah-wajah mereka dibutakan debu!" Dan Allah memperkenankan janji-Nya: mata pihak musuh dibutakan kelam,', 'order' => 45],
            ['start_time' => 349.28, 'end_time' => 357.28, 'target_text' => 'struck, their ranks broke, the angels descended unseen, filling the valley in blinding light.', 'source_text' => 'barisan saf mereka porak-peranda, dan para malaikat turun tanpa dapat dilihat mata kasar, memenuhi lembah itu dengan pancaran cahaya Ilahi.', 'order' => 46],
            ['start_time' => 357.28, 'end_time' => 366.56, 'target_text' => 'Hawazin fled — some towards Awtas, others toward al-Ta\'if. The Prophet peace be upon him pursued, but', 'source_text' => 'Tentera Hawazin lari bertempiaran — sebahagiannya menuju ke lembah Awtas, manakala sebahagian lagi ke kota Taif. Nabi ﷺ mengerahkan pemburuan namun', 'order' => 47],
            ['start_time' => 366.56, 'end_time' => 373.28, 'target_text' => 'forbade the killing of women and children. Among those who fought bravely was Abu Qatadah,', 'source_text' => 'melarang keras daripada membunuh kaum wanita dan kanak-kanak. Antara pahlawan yang bertempur gagah berani ialah Abu Qatadah RA,', 'order' => 48],
            ['start_time' => 373.28, 'end_time' => 378.08, 'target_text' => 'who felled a warrior and later received the Prophet peace be upon him\'s word: "Whoever', 'source_text' => 'yang berjaya menumpaskan pahlawan musuh dan menerima sabda Nabi ﷺ: "Sesiapa', 'order' => 49],
            ['start_time' => 378.08, 'end_time' => 386.88, 'target_text' => 'kills a fighter has the right to his spoils." Abu \'Amir al-Ash\'ari, the uncle of Abu Musa, also fell that day —', 'source_text' => 'yang membunuh pejuang musuh, dia berhak ke atas harta rampasan pejuang tersebut." Abu \'Amir al-Asy\'ari, bapa saudara kepada Abu Musa al-Asy\'ari, turut gugur pada hari itu —', 'order' => 50],
            ['start_time' => 386.88, 'end_time' => 392.72, 'target_text' => 'a martyr in the path of Allah. When Abu Musa wept, the Prophet peace be upon him prayed:', 'source_text' => 'sebagai seorang syahid di jalan Allah. Tatkala Abu Musa menangis teresak-esak, Nabi ﷺ mendoakan:', 'order' => 51],
            ['start_time' => 392.72, 'end_time' => 401.04, 'target_text' => '"O Allah, forgive him and grant him the highest rank!" As the dust settled, the valley lay still.', 'source_text' => '"Ya Allah, ampunkanlah dosanya dan kurniakanlah kepadanya darjat yang paling tinggi di sisi-Mu!" Sebaik debu peperangan reda, lembah Hunain kembali hening sunyi.', 'order' => 52],
            ['start_time' => 401.04, 'end_time' => 410.24, 'target_text' => 'Among the fallen lay the old poet warrior Durayd, once famed in Arabia, now silent in defeat. His', 'source_text' => 'Antara jasad yang tewas bergelimpangan ialah penyair pahlawan veteran Duraid, yang dahulunya masyhur di seluruh Tanah Arab, kini terkujur kaku. Kematiannya', 'order' => 53],
            ['start_time' => 410.24, 'end_time' => 416.32, 'target_text' => 'end marked the passing of the age of ignorance. The Prophet peace be upon him stood among the', 'source_text' => 'menandakan berakhirnya saki-baki zaman kejahilan purba. Nabi ﷺ berdiri di hadapan himpunan', 'order' => 54],
            ['start_time' => 416.32, 'end_time' => 422.96, 'target_text' => 'captives and spoils: the wealth of Hawazin, their women and children taken prisoner. But', 'source_text' => 'tawanan perang dan harta rampasan: kekayaan melimpah-ruah Hawazin, serta wanita dan anak-anak yang tertawan. Namun', 'order' => 55],
            ['start_time' => 422.96, 'end_time' => 430.32, 'target_text' => 'he chose mercy once more. He would later release them all, returning every child, every mother,', 'source_text' => 'baginda sekali lagi memilih jalan rahmat. Baginda kemudiannya membebaskan kesemua mereka, mengembalikan setiap anak kepada ibunya,', 'order' => 56],
            ['start_time' => 430.32, 'end_time' => 437.92, 'target_text' => 'every belonging. It was not a day of vengeance, but another day of forgiveness. From Makkah\'s', 'source_text' => 'dan memulangkan segala barangan milik mereka. Ia bukanlah hari membalas dendam, sebaliknya satu lagi lembaran pengampunan agung. Daripada peristiwa pembukaan kota', 'order' => 57],
            ['start_time' => 437.92, 'end_time' => 444.72, 'target_text' => 'conquest to the valley of Hunayn, the story was never about power, but about purification,', 'source_text' => 'Makkah sehinggalah ke lembah Hunain, hakikat sejarah Islam tidak pernah berkisar tentang kekuasaan semata-mata, melainkan penyucian jiwa,', 'order' => 58],
            ['start_time' => 444.72, 'end_time' => 452.48, 'target_text' => 'patience, and faith. When fear spread and hearts faltered, Allah revealed: "Indeed, Allah has given', 'source_text' => 'kesabaran, dan keimanan. Tatkala ketakutan melanda dan hati-hati bergoncang gentar, Allah menurunkan wahyu: "Sesungguhnya Allah telah menolong', 'order' => 59],
            ['start_time' => 452.48, 'end_time' => 459.12, 'target_text' => 'you victory in many regions. And on the day of Hunayn, when your great numbers pleased you,', 'source_text' => 'kamu mencapai kemenangan dalam banyak medan peperangan. Dan pada hari peperangan Hunain, tatkala kamu berasa bangga dengan jumlah tentera kamu yang ramai,', 'order' => 60],
            ['start_time' => 459.12, 'end_time' => 466.08, 'target_text' => 'but they availed you nothing, then you turned back in retreat. Then Allah sent down His tranquility', 'source_text' => 'namun jumlah yang ramai itu tidak memberi sebarang faedah kepada kamu sedikit pun, lalu kamu berpaling lari ke belakang. Kemudian Allah menurunkan ketenteraman-Nya (Sakinah)', 'order' => 61],
            ['start_time' => 466.08, 'end_time' => 496.96, 'target_text' => 'upon His Messenger and upon the believers, and He sent down armies that you did not see."', 'source_text' => 'ke atas Rasul-Nya dan ke atas orang-orang yang beriman, serta Dia menurunkan bala tentera (para malaikat) yang tidak dapat kamu lihat."', 'order' => 62],
            ['start_time' => 496.96, 'end_time' => 503.76, 'target_text' => 'And so ended the Battle of Hunayn — a victory not of strength, but of faith renewed after', 'source_text' => 'Maka berakhirlah Perang Hunain — suatu kemenangan yang tercapai bukan kerana kehebatan kekuatan jasmani, melainkan kerana keimanan yang diperbaharui selepas', 'order' => 63],
            ['start_time' => 503.76, 'end_time' => 510.24, 'target_text' => 'trial. And so Hunayn taught the ummah that strength is not in numbers, but in trust', 'source_text' => 'mengharungi ujian yang getir. Hunain mengajar umat ini bahawa kekuatan sebenar tidak terletak pada jumlah bilangan, sebaliknya pada tawakal', 'order' => 64],
            ['start_time' => 510.24, 'end_time' => 517.04, 'target_text' => 'in Allah. When the believers remembered Him, their hearts steadied and victory returned.', 'source_text' => 'kepada Allah. Tatkala kaum mukminin kembali mengingati-Nya, jiwa mereka menjadi teguh dan kemenangan kembali menyapa.', 'order' => 65],
            ['start_time' => 517.04, 'end_time' => 521.44, 'target_text' => 'In the next episode, insha\'Allah, we travel with the Messenger peace be upon him to', 'source_text' => 'Dalam episod seterusnya, insya-Allah, kita akan berangkat bersama Rasulullah ﷺ menuju ke bumi', 'order' => 66],
            ['start_time' => 521.44, 'end_time' => 534.48, 'target_text' => 'Tabuk — a journey that revealed sincerity and exposed hypocrisy. Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'Tabuk — suatu ekspedisi getir yang menyingkap keikhlasan sejati dan membongkar kepura-puraan kaum munafik. Selawat dan salam ke atas junjungan Nabi Muhammad dan seluruh keluarga serta para sahabat baginda sekalian.', 'order' => 67],
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
