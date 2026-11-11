<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo9Seeder extends Seeder
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

        // Special Bilingual Religious Video #9 (Siri 1 Ep.4): The Man Makkah Trusted | Life of the Final Messenger ﷺ | Ep.4 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'Vdug1pNex54'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Man Makkah Trusted | Life of the Final Messenger ﷺ | Ep.4 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/Vdug1pNex54/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 9,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.24, 'end_time' => 8.87, 'target_text' => 'Muhammad peace be upon him learned the discipline of responsibility. A youth who met every task with', 'source_text' => 'Nabi Muhammad ﷺ mempelajari disiplin tanggungjawab. Seorang pemuda yang menghadapi setiap amanah dengan', 'order' => 1],
            ['start_time' => 8.88, 'end_time' => 18.87, 'target_text' => 'calm precision. When the walls of the Kaa weakened from flood and time, Pures gathered to rebuild it.', 'source_text' => 'ketenangan yang jitu. Apabila dinding-dinding Kaabah menjadi rapuh akibat banjir dan peredaran zaman, kaum Quraisy berhimpun untuk membinanya semula.', 'order' => 2],
            ['start_time' => 18.88, 'end_time' => 24.23, 'target_text' => 'My beloved brothers and sisters, today we continue our journey through the life of Muhammad peace be', 'source_text' => 'Wahai saudara-saudariku yang dikasihi, hari ini kita meneruskan penjelajahan menelusuri kehidupan Nabi Muhammad', 'order' => 3],
            ['start_time' => 24.24, 'end_time' => 30.71, 'target_text' => 'upon him. The one whom Allah chose to purify hearts, elevate character, and teach the world', 'source_text' => 'ﷺ. Insan yang dipilih oleh Allah untuk menyucikan sanubari, meninggikan kemuliaan akhlak, dan mengajar sekalian alam', 'order' => 4],
            ['start_time' => 30.72, 'end_time' => 39.51, 'target_text' => 'the meaning of mercy. Before revelation descended, before the cave of Herra, before the Quran touched', 'source_text' => 'erti sebenar sebuah rahmat. Sebelum turunnya wahyu, sebelum bertafakur di Gua Hira\', sebelum ayat-ayat Al-Quran menyentuh', 'order' => 5],
            ['start_time' => 39.52, 'end_time' => 47.75, 'target_text' => 'the earth, Allah was shaping the character of the one who would carry his final message.', 'source_text' => 'muka bumi, Allah terlebih dahulu membentuk keperibadian agung insan yang bakal memikul risalah terakhir-Nya.', 'order' => 6],
            ['start_time' => 47.76, 'end_time' => 55.59, 'target_text' => 'in the streets of Mecca, in its markets, in its gatherings and disputes. A young man walked with a', 'source_text' => 'Di lorong-lorong kota Mekah, di pasar-pasarnya, dalam perhimpunan dan pertikaian penduduknya, berjalan seorang pemuda dengan', 'order' => 7],
            ['start_time' => 55.6, 'end_time' => 64.63, 'target_text' => 'heart filled with light. A man who never bowed to idols. A man whose words were truth. A man whose', 'source_text' => 'hati yang sarat dengan cahaya. Seorang insan yang tidak pernah sujud kepada berhala. Seorang lelaki yang kata-katanya adalah kebenaran. Seorang tokoh yang', 'order' => 8],
            ['start_time' => 64.64, 'end_time' => 73.67, 'target_text' => 'presence softened even the harshest soul. He did not come to lead armies. He did not come to seek', 'source_text' => 'kehadirannya mampu melembutkan jiwa yang paling keras sekalipun. Baginda tidak hadir untuk memimpin bala tentera, bukan pula untuk memburu', 'order' => 9],
            ['start_time' => 73.68, 'end_time' => 82.15, 'target_text' => 'power. He simply lived with honesty, humility, and grace. And the world around him began to', 'source_text' => 'kekuasaan. Baginda sekadar hidup dengan kejujuran, ketundukan tawaduk, dan budi pekerti yang luhur. Dan masyarakat di sekelilingnya mula', 'order' => 10],
            ['start_time' => 82.16, 'end_time' => 88.95, 'target_text' => 'whisper the name Al Amin, the trustworthy. So come with me. Let us witness how Allah', 'source_text' => 'berbisik menyebut gelaran Al-Amin, insan yang paling dipercayai. Maka marilah bersama saya. Mari kita saksikan bagaimana Allah', 'order' => 11],
            ['start_time' => 88.96, 'end_time' => 104.35, 'target_text' => 'prepared his messenger, not through wealth, not through comfort, but through character. [music]', 'source_text' => 'mempersiapkan Rasul-Nya—bukan melalui timbunan harta, bukan melalui kemewahan, tetapi melalui keindahan akhlak peribadi.', 'order' => 12],
            ['start_time' => 104.36, 'end_time' => 109.43, 'target_text' => '[music]', 'source_text' => '[Muzik Penghubung]', 'order' => 13],
            ['start_time' => 109.44, 'end_time' => 115.51, 'target_text' => 'In the heart of Mecca, surrounded by the mountains that guarded its sacred valleys,', 'source_text' => 'Di tengah-tengah kota Mekah, dikelilingi oleh banjaran gunung-ganang yang mengawal lembah-lembah sucinya,', 'order' => 14],
            ['start_time' => 115.52, 'end_time' => 121.67, 'target_text' => 'a young man was growing into the fullness of his character. Quiet,', 'source_text' => 'seorang pemuda sedang membesar menuju kematangan peribadinya yang sempurna. Tenang,', 'order' => 15],
            ['start_time' => 121.68, 'end_time' => 129.75, 'target_text' => 'steadfast, and radiant with honesty. The years of hardship had molded him and the warmth of faith', 'source_text' => 'teguh pendirian, dan memancarkan kejujuran. Tahun-tahun kesukaran hidup telah mendidiknya dan kehangatan iman', 'order' => 16],
            ['start_time' => 129.76, 'end_time' => 138.55, 'target_text' => 'illuminated every step he took. Under the care of his uncle Abu Talib, Muhammad peace be upon him', 'source_text' => 'menyinari setiap langkah yang diaturnya. Di bawah jagaan bapa saudaranya, Abu Talib, Nabi Muhammad ﷺ', 'order' => 17],
            ['start_time' => 138.56, 'end_time' => 146.31, 'target_text' => 'learned the discipline of responsibility and the beauty of humility. He was a boy who had tasted', 'source_text' => 'mempelajari disiplin tanggungjawab dan keindahan sifat tawaduk. Baginda adalah seorang anak yang pernah merasai', 'order' => 18],
            ['start_time' => 146.32, 'end_time' => 154.87, 'target_text' => 'loss but carried no bitterness. A youth who met every task with calm precision and unshakable', 'source_text' => 'keperitan kehilangan insan tersayang namun tidak menyimpan dendam di hati. Seorang pemuda yang mendepani setiap amanah dengan ketenangan jitu dan keikhlasan yang', 'order' => 19],
            ['start_time' => 154.88, 'end_time' => 163.59, 'target_text' => 'sincerity. The people of Mecca watched him as he walked through their streets, calm amid the noise,', 'source_text' => 'tidak berbelah bahagi. Penduduk Mekah memerhatikannya tatkala baginda berjalan di lorong-lorong mereka—tenang di tengah keriuhan,', 'order' => 20],
            ['start_time' => 163.6, 'end_time' => 170.47, 'target_text' => 'gentle amid arrogance. He greeted the elderly with respect, played with the children, and', 'source_text' => 'berlemah lembut di tengah keangkuhan. Baginda menyantuni warga tua dengan penuh hormat, bermesra dengan anak-anak kecil, dan', 'order' => 21],
            ['start_time' => 170.48, 'end_time' => 178.95, 'target_text' => 'helped anyone who asked. Even before revelation, his life was a message. He never worshiped idols,', 'source_text' => 'membantu sesiapa sahaja yang meminta pertolongan. Malah sebelum wahyu turun sekalipun, kehidupannya sudah menjadi sebuah teladan. Baginda tidak pernah menyembah berhala,', 'order' => 22],
            ['start_time' => 178.96, 'end_time' => 187.51, 'target_text' => 'never lied, never broke a promise. His word was trusted more than the written contract of others.', 'source_text' => 'tidak pernah berdusta, dan tidak pernah memungkiri janji. Kata-katanya lebih dipercayai melebihi perjanjian bertulis orang lain.', 'order' => 23],
            ['start_time' => 187.52, 'end_time' => 194.63, 'target_text' => 'It was in these early years that the title al the trustworthy spread through the valleys of', 'source_text' => 'Pada tahun-tahun awal inilah gelaran Al-Amin (yang amanah) tersebar merentasi lembah-lembah', 'order' => 24],
            ['start_time' => 194.64, 'end_time' => 203.43, 'target_text' => 'Quraysh like a fragrance in the desert air. When he reached his youth, Makkah was not at peace.', 'source_text' => 'Quraisy bagaikan harum semerbak di udara padang pasir. Tatkala baginda meningkat dewasa, kota Mekah tidak berada dalam keadaan aman.', 'order' => 25],
            ['start_time' => 203.44, 'end_time' => 213.91, 'target_text' => 'A dispute between Qur and the tribes of Pace had flared into bloodshed. It was called Alij, the war', 'source_text' => 'Pertikaian antara kaum Quraisy dan kabilah Qais telah mencetuskan pertumpahan darah. Peperangan ini dinamakan Perang Fijar,', 'order' => 26],
            ['start_time' => 213.92, 'end_time' => 224.79, 'target_text' => 'of the sacred months. For violence had dared to enter the time Allah had decreed for peace. The', 'source_text' => 'peperangan pada bulan-bulan haram. Kerana keganasan telah berani mencemari waktu yang telah Allah tetapkan untuk keamanan.', 'order' => 27],
            ['start_time' => 224.8, 'end_time' => 232.63, 'target_text' => 'young Muhammad peace be upon him. He stood beside his uncle gathering scattered arrows and passing', 'source_text' => 'Pemuda mulia Muhammad ﷺ berdiri di sisi bapa-bapa saudaranya mengumpulkan anak panah yang bertaburan lalu menyerahkannya', 'order' => 28],
            ['start_time' => 232.64, 'end_time' => 239.91, 'target_text' => 'them quietly into their hands. Even in the shadow of chaos, [music] his calm presence softened', 'source_text' => 'secara senyap ke tangan mereka. Walaupun di bawah bayangan kekacauan, kehadiran baginda yang tenang melembutkan', 'order' => 29],
            ['start_time' => 239.92, 'end_time' => 247.83, 'target_text' => 'hearts. He learned that the true strength lies not in anger but in restraint and that courage', 'source_text' => 'sanubari. Baginda menyedari bahawa kekuatan sebenar bukanlah pada kemarahan tetapi pada kawalan diri, dan keberanian', 'order' => 30],
            ['start_time' => 247.84, 'end_time' => 255.67, 'target_text' => 'without mercy is only another form of weakness. As the years moved on, his character deepened. In the', 'source_text' => 'tanpa belas kasihan hanyalah suatu bentuk kelemahan. Seiring berlalunya tahun, kematangan peribadinya semakin mendalam. Di', 'order' => 31],
            ['start_time' => 255.68, 'end_time' => 262.79, 'target_text' => 'markets, he traded with fairness while others cheated for gain. In the stillness of night,', 'source_text' => 'pasar-pasar, baginda berniaga dengan penuh keadilan tatkala peniaga lain menipu demi keuntungan. Dalam keheningan malam,', 'order' => 32],
            ['start_time' => 262.8, 'end_time' => 269.67, 'target_text' => 'he reflected under the stars, searching for the voice of truth that echoed through creation.', 'source_text' => 'baginda bertafakur di bawah taburan bintang, mencari suara kebenaran yang bergema merentasi sekalian alam ciptaan.', 'order' => 33],
            ['start_time' => 269.68, 'end_time' => 275.44, 'target_text' => 'People came to him with disputes, trusting that he would never favor one over another.', 'source_text' => 'Orang ramai datang mengadukan pertikaian kepadanya, yakin bahawa baginda tidak akan sesekali berat sebelah.', 'order' => 34],
            ['start_time' => 276.0, 'end_time' => 282.79, 'target_text' => 'He became the unseen pillar that held the moral weight of Mecca together. Among those who heard', 'source_text' => 'Baginda menjadi tiang ghaib yang memelihara asas moraliti kota Mekah. Antara mereka yang mendengar', 'order' => 35],
            ['start_time' => 282.8, 'end_time' => 290.31, 'target_text' => 'of him was Khadijah bint, may Allah be pleased with her, a woman of noble lineage and unmatched', 'source_text' => 'tentang kehebatannya ialah Sayyidatina Khadijah binti Khuwailid r.a., seorang wanita daripada keturunan bangsawan yang tiada tandingan', 'order' => 36],
            ['start_time' => 290.32, 'end_time' => 299.51, 'target_text' => 'reputation. Wealthy but wise, she valued honesty more than profit. When she learned of Al Amin,', 'source_text' => 'kemuliaan reputasinya. Seorang saudagar kaya yang bijaksana, beliau menghargai kejujuran melebihi keuntungan duniawi. Apabila beliau mendengar tentang sifat Al-Amin,', 'order' => 37],
            ['start_time' => 299.52, 'end_time' => 306.95, 'target_text' => 'she sent him a proposal to lead her trade caravan to the lands of Syria. He accepted with quiet', 'source_text' => 'beliau mengutuskan tawaran kepada baginda untuk memimpin kafilah perniagaannya ke negeri Syam. Baginda menerimanya dengan penuh', 'order' => 38],
            ['start_time' => 306.96, 'end_time' => 316.47, 'target_text' => 'dignity, and with him went her trusted servant, Misara. The journey north was long and harsh.', 'source_text' => 'kemuliaan, dan bersama baginda turut ditemani oleh pembantu setianya, Maisarah. Perjalanan ke utara amat jauh dan mencabar.', 'order' => 39],
            ['start_time' => 316.48, 'end_time' => 323.19, 'target_text' => 'But wherever Muhammad, peace be upon him, went, blessings seemed to follow. He weighed goods with', 'source_text' => 'Namun ke mana sahaja Nabi Muhammad ﷺ melangkah, keberkatan seolah-olah sentiasa mengiringinya. Baginda menimbang barang niaga dengan', 'order' => 40],
            ['start_time' => 323.2, 'end_time' => 330.87, 'target_text' => 'precision, spoke with kindness, and treated his companions with dignity. In the markets of Busra,', 'source_text' => 'penuh ketepatan, bertutur dengan santun budi bahasa, dan melayan rakan-rakan seperjalanannya dengan penuh penghormatan. Di pasar-pasar kota Busra,', 'order' => 41],
            ['start_time' => 330.88, 'end_time' => 337.99, 'target_text' => 'his words inspired trust before he ever struck a deal. When the caravan returned,', 'source_text' => 'kata-katanya menanam rasa percaya sebelum sesuatu urus niaga dimeterai. Tatkala kafilah itu pulang ke Mekah,', 'order' => 42],
            ['start_time' => 338.0, 'end_time' => 345.75, 'target_text' => 'it carried not only profit, but something rarer, the fragrance of sincerity. When Khadijah, may', 'source_text' => 'ia membawa bukan sekadar pulangan keuntungan yang berlipat ganda, bahkan sesuatu yang jauh lebih bernilai—haruman keikhlasan. Apabila Sayyidatina Khadijah r.a.', 'order' => 43],
            ['start_time' => 345.76, 'end_time' => 353.99, 'target_text' => 'Allah be pleased with her, heard Mesara\'s account, she felt a certainty that stilled her heart. She', 'source_text' => 'mendengar perkhabaran daripada Maisarah, terbit keyakinan mendalam yang menenangkan hatinya. Beliau', 'order' => 44],
            ['start_time' => 354.0, 'end_time' => 361.03, 'target_text' => 'saw in him not only an honest merchant, but a man of truth whose [snorts] soul reflected the purity', 'source_text' => 'melihat pada diri baginda bukan sekadar seorang peniaga yang jujur, tetapi seorang insan sejati yang jiwanya memancarkan kesucian', 'order' => 45],
            ['start_time' => 361.04, 'end_time' => 371.92, 'target_text' => 'she had always sought. It was then that the wisdom of the Quran would one day echo her insight.', 'source_text' => 'yang sentiasa didambakannya. Ketika itulah hikmah Al-Quran kelak mengesahkan pandangan jauh beliau:', 'order' => 46],
            ['start_time' => 373.76, 'end_time' => 381.03, 'target_text' => 'Indeed, the best one you can hire is the strong and the trustworthy. With grace and dignity,', 'source_text' => '"Sesungguhnya sebaik-baik orang yang engkau ambil bekerja ialah orang yang kuat lagi amanah dipercayai." (Surah Al-Qasas: 26). Dengan keanggunan dan kemuliaan,', 'order' => 47],
            ['start_time' => 381.04, 'end_time' => 388.07, 'target_text' => 'Khadijah sent word through her confidant, Nafisa, expressing her desire for marriage.', 'source_text' => 'Sayyidatina Khadijah mengutus perkhabaran melalui sahabat kepercayaannya, Nafisah, menyatakan hasratnya untuk berumah tangga.', 'order' => 48],
            ['start_time' => 388.08, 'end_time' => 395.83, 'target_text' => 'When the proposal reached him, he accepted humbly. The wedding was simple [music] but luminous.', 'source_text' => 'Apabila lamaran tersebut sampai kepadanya, baginda menerimanya dengan penuh tawaduk. Majlis perkahwinan mereka sederhana namun bercahaya keberkatannya.', 'order' => 49],
            ['start_time' => 395.84, 'end_time' => 403.51, 'target_text' => 'Qures gathered to witness a union that would bless the earth, a home built upon faith,', 'source_text' => 'Kaum Quraisy berhimpun untuk menyaksikan penyatuan suci yang memayungi bumi, sebuah mahligai yang terbina di atas asas keimanan,', 'order' => 50],
            ['start_time' => 403.52, 'end_time' => 411.03, 'target_text' => 'tenderness, and mutual respect. In that union was the foundation of serenity. She offered', 'source_text' => 'kasih sayang yang tulus, dan saling menghormati. Penyatuan tersebut menjadi asas kepada ketenangan jiwa. Sayyidatina Khadijah memberikan', 'order' => 51],
            ['start_time' => 411.04, 'end_time' => 418.87, 'target_text' => 'him comfort and he gave her certainty. Together they built a household of peace where no harsh', 'source_text' => 'baginda ketenteraman dan baginda memberikan beliau keyakinan. Bersama-sama mereka membina rumahtangga yang damai di mana tiada kata-kata kasar', 'order' => 52],
            ['start_time' => 418.88, 'end_time' => 426.95, 'target_text' => 'word was heard and where the poor were always welcome to their table. In those blessed days,', 'source_text' => 'yang pernah didengari, dan golongan fakir miskin sentiasa dialu-alukan menikmati hidangan di meja mereka. Pada hari-hari yang penuh berkat itu,', 'order' => 53],
            ['start_time' => 426.96, 'end_time' => 434.07, 'target_text' => 'the air of Makkah seemed gentler. Children played around their courtyard and kindness radiated from', 'source_text' => 'udara kota Mekah terasa begitu damai. Anak-anak kecil riang bermain di perkarangan rumah mereka dan kebaikan memancar dari', 'order' => 54],
            ['start_time' => 434.08, 'end_time' => 441.35, 'target_text' => 'their door. The prophet peace be upon him would mend his own clothes, serve his family and share', 'source_text' => 'pintu kediaman mereka. Nabi Muhammad ﷺ sendiri membaiki pakaiannya yang koyak, berkhidmat membantu keluarganya, dan berkongsi', 'order' => 55],
            ['start_time' => 441.36, 'end_time' => 449.83, 'target_text' => 'his food without pride. Their home became a lantern of mercy in a city darkened by greed.', 'source_text' => 'makanannya tanpa sekelumit rasa sombong. Kediaman mereka menjadi pelita rahmat di sebuah kota yang diselubungi ketamakan.', 'order' => 56],
            ['start_time' => 449.84, 'end_time' => 460.79, 'target_text' => 'It was then that the eternal truth of the Quran would later describe the measure of real honor.', 'source_text' => 'Itulah saat di mana kebenaran abadi Al-Quran kelak menggambarkan ukuran kemuliaan yang hakiki:', 'order' => 57],
            ['start_time' => 460.8, 'end_time' => 467.99, 'target_text' => 'The most honored of you in the sight of Allah is the most righteous among you. Years passed', 'source_text' => '"Sesungguhnya orang yang paling mulia di antara kamu di sisi Allah ialah orang yang paling bertakwa di antaramu." (Surah Al-Hujurat: 13). Tahun demi tahun berlalu,', 'order' => 58],
            ['start_time' => 468.0, 'end_time' => 475.03, 'target_text' => 'and the young merchant became the moral compass of Makkah. His fairness in trade and his patience in', 'source_text' => 'dan saudagar muda itu telah menjadi kompas moral bagi seluruh penduduk Mekah. Keadilannya dalam perniagaan dan kesabarannya dalam', 'order' => 59],
            ['start_time' => 475.04, 'end_time' => 482.39, 'target_text' => 'speech made him the one people trusted when no one else could be trusted. Yet even as his name became', 'source_text' => 'bertutur kata menjadikannya rujukan kepercayaan orang ramai tatkala tiada sesiapa lagi yang boleh dipercayai. Namun walaupun namanya kian', 'order' => 60],
            ['start_time' => 482.4, 'end_time' => 489.03, 'target_text' => 'known across Arabia, his heart remained free of pride. He was preparing, though he did not yet', 'source_text' => 'masyhur di seantero Tanah Arab, hatinya kekal suci daripada rasa bangga diri. Baginda sedang dipersiapkan—meskipun baginda belum lagi', 'order' => 61],
            ['start_time' => 489.04, 'end_time' => 497.19, 'target_text' => 'know it, for a role that would reshape the destiny of humankind. When the walls of the Cabba weakened', 'source_text' => 'menyedarinya—bagi memikul peranan agung yang bakal mencorakkan kembali takdir umat manusia. Tatkala dinding-dinding Kaabah menjadi rapuh', 'order' => 62],
            ['start_time' => 497.2, 'end_time' => 504.95, 'target_text' => 'from flood and time, Pures gathered to rebuild it. Tribe by tribe, they carried the stones,', 'source_text' => 'akibat limpahan banjir kilat dan faktor usia, kaum Quraisy berhimpun untuk membinanya semula. Kabilah demi kabilah mengangkut batu-batan,', 'order' => 63],
            ['start_time' => 504.96, 'end_time' => 511.99, 'target_text' => 'working together until the final moment, the placement of the black stone. A dispute', 'source_text' => 'berganding bahu bekerjasama sehinggalah tiba detik kemuncak—iaitu perletakan Hajarul Aswad (Batu Hitam). Satu pertikaian sengit', 'order' => 64],
            ['start_time' => 512.0, 'end_time' => 520.95, 'target_text' => 'erupted. Who would claim the honor? Swords nearly left their sheets before an elder intervened.', 'source_text' => 'tercetus. Siapakah yang berhak meraih kemuliaan tersebut? Pedang-pedang hampir terhunus daripada sarungnya sebelum seorang pembesar tua tampil meleraikannya.', 'order' => 65],
            ['start_time' => 520.96, 'end_time' => 528.79, 'target_text' => 'Let the next man who enters decide," he said. The crowd turned and through the gates walked', 'source_text' => '"Biarlah orang pertama yang melangkah masuk melalui pintu gerbang ini menjadi pemutusnya," cadang beliau. Orang ramai berpaling ke arah pintu gerbang dan melangkahlah masuk', 'order' => 66],
            ['start_time' => 528.8, 'end_time' => 537.19, 'target_text' => 'Muhammad, peace be upon him. A wave of relief washed over the people. "It\'s alin," they cried.', 'source_text' => 'Nabi Muhammad ﷺ. Gelombang kelegaan serta-merta menyelubungi seluruh orang ramai: "Dialah Al-Amin!" laung mereka gembira.', 'order' => 67],
            ['start_time' => 537.2, 'end_time' => 542.95, 'target_text' => 'The prophet peace be upon him listened quietly to each tribe. Then took a piece of cloth,', 'source_text' => 'Nabi Muhammad ﷺ mendengar dengan tenang pandangan setiap kabilah. Kemudian baginda membentangkan sehelai kain,', 'order' => 68],
            ['start_time' => 542.96, 'end_time' => 549.59, 'target_text' => 'placed the black stone upon it, and invited the chiefs of every clan to hold its corners', 'source_text' => 'meletakkan Hajarul Aswad di tengah-tengahnya, lalu menjemput setiap ketua kabilah untuk memegang setiap bucu kain', 'order' => 69],
            ['start_time' => 549.6, 'end_time' => 556.55, 'target_text' => 'together. With their hands united, he lifted the stone and placed it into its sacred', 'source_text' => 'secara bersama-sama. Dengan tangan-tangan mereka bersatu mengangkatnya, baginda kemudiannya mengambil batu tersebut lalu meletakkannya ke posisi', 'order' => 70],
            ['start_time' => 556.56, 'end_time' => 565.67, 'target_text' => 'position with his own blessed hands. In that moment, centuries of pride melted into unity.', 'source_text' => 'asalnya yang suci dengan kedua-dua tangannya yang penuh keberkatan. Pada detik itu, keangkuhan persengketaan selama berabad-abad lebur menjadi kesatuan ummah.', 'order' => 71],
            ['start_time' => 565.68, 'end_time' => 576.63, 'target_text' => 'The people looked to him not as a man of tribe but as a man of truth. The city exhaled. Peace settled', 'source_text' => 'Orang ramai memandangnya bukan sekadar sebagai seorang ahli kabilah, tetapi sebagai seorang tokoh kebenaran sejati. Kota Mekah menarik nafas lega. Kedamaian kembali', 'order' => 72],
            ['start_time' => 576.64, 'end_time' => 585.67, 'target_text' => 'once more over a sanctuary. No one realized that the one who restored the house of Allah that day', 'source_text' => 'menyelubungi tanah haram. Tiada siapa menyangka bahawa insan yang memulihkan rumah Allah pada hari itu,', 'order' => 73],
            ['start_time' => 585.68, 'end_time' => 593.51, 'target_text' => 'would soon be chosen to restore the hearts of humanity. His wisdom had prevented bloodshed.', 'source_text' => 'tidak lama lagi bakal dipilih untuk memulihkan hati dan jiwa sekalian umat manusia. Kebijaksanaannya telah berjaya menghalang pertumpahan darah.', 'order' => 74],
            ['start_time' => 593.52, 'end_time' => 601.35, 'target_text' => 'But his destiny would bring something far greater, revelation. And as night fell over Mecca,', 'source_text' => 'Namun takdir yang menantinya bakal membawa sesuatu yang jauh lebih agung—iaitu wahyu ilahi. Dan tatkala malam melabuhkan tirainya di kota Mekah,', 'order' => 75],
            ['start_time' => 601.36, 'end_time' => 614.47, 'target_text' => 'the Quran would one day describe [music] what was already written in the heavens.', 'source_text' => 'Al-Quran pada suatu hari nanti bakal menggambarkan apa yang sememangnya telah tertulis di langit yang tinggi:', 'order' => 76],
            ['start_time' => 614.48, 'end_time' => 622.95, 'target_text' => 'Blessed is he who sent down the criterion upon his servant that he may be a warner to the worlds.', 'source_text' => '"Maha Berkat Allah yang telah menurunkan Al-Furqan (Al-Quran) kepada hamba-Nya (Muhammad), agar baginda menjadi pemberi peringatan kepada sekalian alam." (Surah Al-Furqan: 1)', 'order' => 77],
            ['start_time' => 622.96, 'end_time' => 629.11, 'target_text' => 'In the next episode, inshallah, we will walk with him to the mountain of where the silence', 'source_text' => 'Dalam episod seterusnya, insya-Allah, kita akan melangkah bersama baginda menuju ke Jabal An-Nur di mana keheningan', 'order' => 78],
            ['start_time' => 629.12, 'end_time' => 635.75, 'target_text' => 'of the night met the voice of eternity. Until then, may Allah soften our hearts,', 'source_text' => 'malam bertemu dengan seruan keabadian wahyu. Sehingga itu, semoga Allah melembutkan sanubari kita,', 'order' => 79],
            ['start_time' => 635.76, 'end_time' => 648.96, 'target_text' => 'beautify our character, and make us among those who follow his example sincerely. Sah Muhammad', 'source_text' => 'mengindahkan akhlak kita, dan menjadikan kita dalam kalangan mereka yang mencontohi sunnah baginda dengan penuh keikhlasan. Sollallahu \'ala Muhammad ﷺ.', 'order' => 80],
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
