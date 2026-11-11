<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo8Seeder extends Seeder
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

        // Special Bilingual Religious Video #8 (Siri 1 Ep.3): The Orphan of Makkah | Life of the Final Messenger ﷺ | Ep.3 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'kzIu3hrdqRM'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Orphan of Makkah | Life of the Final Messenger ﷺ | Ep.3 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/kzIu3hrdqRM/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 8,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.24, 'end_time' => 4.79, 'target_text' => 'And then Muhammad peace be upon him was born. As he came into the world,', 'source_text' => 'Dan tatkala itu, lahirlah Nabi Muhammad ﷺ. Saat baginda hadir ke alam dunia,', 'order' => 1],
            ['start_time' => 4.8, 'end_time' => 11.75, 'target_text' => 'a light emerged from her and lit the horizons. The idols around the Caba trembled and fell.', 'source_text' => 'sebutir cahaya agung memancar dari rahim bondanya dan menerangi ufuk-ufuk langit. Berhala-berhala di sekeliling Kaabah bergetar lalu rebah menyembah bumi.', 'order' => 2],
            ['start_time' => 11.76, 'end_time' => 22.87, 'target_text' => 'In distant lands, the fire of Persia that had burnt for a thousand years was extinguished.', 'source_text' => 'Di negeri-negeri yang jauh, api sembahan Parsi yang menyala megah selama seribu tahun terpadam sama sekali.', 'order' => 3],
            ['start_time' => 22.88, 'end_time' => 28.15, 'target_text' => 'My beloved brothers and sisters, today we continue our journey through the most blessed', 'source_text' => 'Wahai saudara-saudariku yang dikasihi, hari ini kita meneruskan penjelajahan menelusuri insan paling berkat', 'order' => 4],
            ['start_time' => 28.16, 'end_time' => 35.67, 'target_text' => 'life ever lived. The life of Muhammad peace be upon him. The light sent to guide hearts back', 'source_text' => 'yang pernah hadir di muka bumi. Kehidupan Nabi Muhammad ﷺ. Cahaya yang diutuskan untuk membimbing hati kembali', 'order' => 5],
            ['start_time' => 35.68, 'end_time' => 42.79, 'target_text' => 'to Allah. But his story does not begin with revelation nor with the prophecy nor with the', 'source_text' => 'kepada Allah. Namun kisahnya tidak bermula dengan turunnya wahyu, tidak pula dengan kenabian, dan bukan juga dengan', 'order' => 6],
            ['start_time' => 42.8, 'end_time' => 51.03, 'target_text' => 'first words of the Quran. It begins with mercy before birth. In the quiet valleys of Mecca,', 'source_text' => 'kalimah-kalimah pertama daripada Al-Quran. Ia bermula dengan limpahan rahmat sejak sebelum kelahirannya lagi. Di lembah-lembah hening kota Mekah,', 'order' => 7],
            ['start_time' => 51.04, 'end_time' => 59.91, 'target_text' => 'beneath the watch of ancient mountains, Allah was preparing a miracle. A child chosen before time,', 'source_text' => 'di bawah tatapan gunung-ganang purba, Allah sedang mempersiapkan sebuah mukjizat. Seorang anak yang dipilih sejak azali,', 'order' => 8],
            ['start_time' => 59.92, 'end_time' => 68.31, 'target_text' => 'a heart protected before it ever beat. A light carried from one pure soul to another. This was', 'source_text' => 'sekeping hati yang dipelihara sebelum ia berdegup lagi. Cahaya yang diwarisi daripada satu jiwa yang suci kepada jiwa yang suci seterusnya. Ini', 'order' => 9],
            ['start_time' => 68.32, 'end_time' => 75.59, 'target_text' => 'not simply a birth. It was the unfolding of a promise. a promise that mercy would return to', 'source_text' => 'bukanlah sekadar sebuah kelahiran biasa. Ia adalah pengungkapan sebuah janji ilahi; janji bahawa rahmat bakal kembali memayungi', 'order' => 10],
            ['start_time' => 75.6, 'end_time' => 83.11, 'target_text' => 'the world. So come with me. Let us return to that night. The night when the world changed', 'source_text' => 'seluruh alam. Maka marilah bersama saya. Mari kita kembali ke malam yang bersejarah itu. Malam tatkala seluruh dunia berubah', 'order' => 11],
            ['start_time' => 83.12, 'end_time' => 96.32, 'target_text' => 'without armies, without trumpets, without noise, only light, soft, pure, and divine.', 'source_text' => 'tanpa bantuan bala tentera, tanpa tiupan sangkakala, tanpa kegemparan bising—hanya cahaya yang lembut, suci, dan penuh kebesaran ilahi.', 'order' => 12],
            ['start_time' => 104.64, 'end_time' => 111.43, 'target_text' => 'In the sacred city of Mecca, between the mountains that touch the sky, Allah\'s decree', 'source_text' => 'Di kota suci Mekah, di antara banjaran pergunungan yang mencakar langit, ketetapan takdir Allah', 'order' => 13],
            ['start_time' => 111.44, 'end_time' => 119.59, 'target_text' => 'was unfolding with perfect harmony. The story that began with Zam and the vow of sacrifice was', 'source_text' => 'sedang tersingkap dengan keharmonian yang sempurna. Kisah yang bermula dengan telaga Zamzam dan nazar pengorbanan kini', 'order' => 14],
            ['start_time' => 119.6, 'end_time' => 128.07, 'target_text' => 'leading toward light, a light that would soon illuminate the world. Abdullahbn Abdutalib,', 'source_text' => 'menuju ke arah terbitnya cahaya, sebutir cahaya yang bakal menyinari seluruh alam buana. Abdullah bin Abdul Muttalib,', 'order' => 15],
            ['start_time' => 128.08, 'end_time' => 137.19, 'target_text' => 'noble in lineage and pure in heart, was chosen to marry Aminiwah, a woman of honor and purity.', 'source_text' => 'seorang pemuda mulia garis keturunannya dan suci sanubarinya, telah dipilih untuk memperisterikan Siti Aminah binti Wahb, wanita yang penuh kemuliaan dan kesucian.', 'order' => 16],
            ['start_time' => 137.2, 'end_time' => 144.15, 'target_text' => 'When they were wed, the light of prophethood shone within him. And when he came to her,', 'source_text' => 'Apabila mereka disatukan dalam ikatan perkahwinan, cahaya kenabian bersinar di wajahnya. Dan tatkala beliau bersama isterinya,', 'order' => 17],
            ['start_time' => 144.16, 'end_time' => 153.35, 'target_text' => 'that light was transferred to her womb. A light that would soon bring mercy to mankind. Not long', 'source_text' => 'cahaya tersebut berpindah ke dalam rahim bondanya. Sebutir cahaya yang bakal membawa rahmat agung kepada sekalian umat manusia. Tidak lama', 'order' => 18],
            ['start_time' => 153.36, 'end_time' => 161.51, 'target_text' => 'after Abdullah set out on a journey to trade in the land of Asham on his way back, he fell', 'source_text' => 'selepas itu, Abdullah berangkat bermusafir untuk berniaga ke negeri Syam. Dalam perjalanan pulangnya, beliau jatuh', 'order' => 19],
            ['start_time' => 161.52, 'end_time' => 169.75, 'target_text' => 'ill in the town of Ythre, what would later become al- Medina, and there his soul returned to his', 'source_text' => 'gering di kota Yathrib (yang kelak dinamakan Madinah Al-Munawwarah), dan di sanalah rohnya kembali kepada Sang', 'order' => 20],
            ['start_time' => 169.76, 'end_time' => 178.56, 'target_text' => 'Lord. Amina was left a widow carrying in her womb the most honored child creation would ever know.', 'source_text' => 'Pencipta. Siti Aminah ditinggalkan sebagai seorang balu yang sedang mengandungkan zuriat paling mulia yang pernah disaksikan oleh sekalian makhluk.', 'order' => 21],
            ['start_time' => 179.28, 'end_time' => 185.83, 'target_text' => 'She would often feel that light move within her and dream of a brilliance that reached', 'source_text' => 'Bonda Aminah sering merasakan getaran cahaya itu bergerak di dalam kandungannya dan bermimpi melihat limpahan sinar yang menerangi', 'order' => 22],
            ['start_time' => 185.84, 'end_time' => 193.27, 'target_text' => 'the palaces of Busra in Syria. In her dream, a voice said, "You carry the master of this', 'source_text' => 'mahligai-mahligai istana Busra di Syam. Dalam mimpinya, satu suara berseru: "Sesungguhnya engkau sedang mengandungkan pemimpin agung bagi', 'order' => 23],
            ['start_time' => 193.28, 'end_time' => 202.87, 'target_text' => 'nation. It was the 12th night of Alul. The skies over Mecca were calm. The stars gleaming like', 'source_text' => 'umat ini!" Tibalah malam ke-12 dalam bulan Rabi\'ul Awwal. Langit di atas kota Mekah hening tenang. Bintang-bintang bergemerlapan bagaikan', 'order' => 24],
            ['start_time' => 202.88, 'end_time' => 213.99, 'target_text' => 'pearls. Amina felt the moment arrive. There was no pain like other women\'s pain, rather a peace,', 'source_text' => 'mutiara bercahaya. Bonda Aminah merasakan saat kelahirannya telah tiba. Tiada kesakitan bersalin seperti wanita-wanita lain, sebaliknya dipenuhi ketenangan,', 'order' => 25],
            ['start_time' => 214.0, 'end_time' => 220.39, 'target_text' => 'a stillness. And then Muhammad peace be upon him was born. As he came into the world,', 'source_text' => 'sebuah keheningan jiwa. Dan tatkala itu, lahirlah Nabi Muhammad ﷺ. Saat baginda hadir ke alam dunia,', 'order' => 26],
            ['start_time' => 220.4, 'end_time' => 227.27, 'target_text' => 'a light emerged from her and lit the horizons. The idols around the Caba trembled and fell.', 'source_text' => 'sebutir cahaya memancar dari tubuhnya dan menerangi segenap ufuk. Berhala-berhala di sekeliling Kaabah bergetar lalu tumbang menyembah bumi.', 'order' => 27],
            ['start_time' => 227.28, 'end_time' => 241.91, 'target_text' => 'In distant lands, the fire of Persia that had burnt for a thousand years was extinguished. His', 'source_text' => 'Di negeri-negeri yang jauh, api sembahan Parsi yang menyala berterusan selama seribu tahun terpadam seketika. Bonda', 'order' => 28],
            ['start_time' => 241.92, 'end_time' => 248.79, 'target_text' => 'mother saw his face glowing like the moon and heard his voice say, "May Allah have mercy on you.', 'source_text' => 'Aminah melihat wajah puteranya berseri-seri indah bagaikan bulan purnama dan terdengar suara berseru: "Semoga Allah melimpahkan rahmat-Nya ke atasmu.', 'order' => 29],
            ['start_time' => 248.8, 'end_time' => 255.91, 'target_text' => 'Oh Amina, the Lord of all worlds has blessed you with the leader of humanity." When his grandfather', 'source_text' => 'Wahai Aminah, Tuhan sekalian alam telah mengurniakan kepadamu pemimpin agung bagi seluruh umat manusia." Apabila datuknya,', 'order' => 30],
            ['start_time' => 255.92, 'end_time' => 264.07, 'target_text' => 'Abdul Muttalib heard the news, he hurried to her home. His heart trembling with joy. He lifted the', 'source_text' => 'Abdul Muttalib mendengar perkhabaran gembira tersebut, beliau bergegas ke rumah bonda Aminah dengan hati yang bergetar penuh kegirangan. Beliau memangku', 'order' => 31],
            ['start_time' => 264.08, 'end_time' => 271.75, 'target_text' => 'child, pressed him to his chest, and entered the Caba, raising him toward the sky in gratitude.', 'source_text' => 'bayi mulia itu, mendakapnya rapat ke dadanya, lalu membawanya masuk ke dalam Kaabah sambil mengangkatnya ke langit tanda penuh kesyukuran.', 'order' => 32],
            ['start_time' => 271.76, 'end_time' => 279.51, 'target_text' => 'I name him Muhammad, he said, so that he will be praised in the heavens and the earth. Amina nursed', 'source_text' => '"Aku menamakannya Muhammad," kata beliau, "supaya baginda terpuji di langit dan di bumi." Bonda Aminah menyusukan', 'order' => 33],
            ['start_time' => 279.52, 'end_time' => 285.35, 'target_text' => 'him for a few days and then sought a wet nurse from the tribes of Banusad, who came to Makkah', 'source_text' => 'baginda selama beberapa hari, kemudian mencari ibu susuan daripada kabilah Bani Sa\'ad yang datang berduyun-duyun ke Mekah', 'order' => 34],
            ['start_time' => 285.36, 'end_time' => 294.15, 'target_text' => 'in search of infants to raise among the desert air. Among them was Haleima a sadia whose family', 'source_text' => 'demi mencari bayi untuk disusui dan dibesarkan di udara padang pasir yang bersih. Antara mereka ialah Halimatus Sa\'diyah yang keluarganya', 'order' => 35],
            ['start_time' => 294.16, 'end_time' => 302.07, 'target_text' => 'suffered from drought and hunger. Her donkey was weak. Her she camel gave no milk and her own child', 'source_text' => 'sedang menderita akibat musim kemarau dan kelaparan. Keldainya lemah tidak berdaya, unta betinanya kering tiada susu, dan anaknya sendiri', 'order' => 36],
            ['start_time' => 302.08, 'end_time' => 311.35, 'target_text' => 'cried from thirst. Every other mother found a child to nurse except her. None wished to take an', 'source_text' => 'menangis kehausan. Semua ibu susuan lain telah mendapat anak susuan masing-masing kecuali Halimah. Tiada siapa yang sudi mengambil seorang', 'order' => 37],
            ['start_time' => 311.36, 'end_time' => 319.12, 'target_text' => 'orphan. She said to her husband, "By Allah, I will take that orphan boy for perhaps Allah will bless', 'source_text' => 'anak yatim. Maka berkatalah Halimah kepada suaminya: "Demi Allah, aku akan mengambil anak yatim itu, moga-moga Allah melimpahkan keberkatan kepada', 'order' => 38],
            ['start_time' => 319.84, 'end_time' => 326.55, 'target_text' => 'From the moment she held him, blessings poured upon them. Her breast overflowed with milk. Her', 'source_text' => 'kita!" Sebaik sahaja Halimah memangku baginda di ribanya, limpahan barakah mencurah-curah ke atas mereka. Susu badannya mengalir melimpah-ruah. Unta', 'order' => 39],
            ['start_time' => 326.56, 'end_time' => 334.55, 'target_text' => 'camel gave in abundance, and the wind seemed softer upon their path. The weak donkey that', 'source_text' => 'betinanya mengeluarkan susu yang banyak, dan hembusan angin terasa begitu nyaman sepanjang perjalanan mereka. Keldai kurus yang dahulunya', 'order' => 40],
            ['start_time' => 334.56, 'end_time' => 342.71, 'target_text' => 'lagged behind now outran the other beasts in the caravan. Her husband looked at her and said,', 'source_text' => 'tertinggal di belakang kini berlari laju mendahului binatang-binatang tunggangan lain dalam kafilah tersebut. Suaminya memandangnya lalu berkata:', 'order' => 41],
            ['start_time' => 342.72, 'end_time' => 350.15, 'target_text' => '"Hale Lima, this child has brought us a blessed fortune. Back in the valley of Banusad, the', 'source_text' => '"Wahai Halimah, sesungguhnya anak ini telah membawa nasib keberkatan yang amat luar biasa buat kita!" Kembali ke perkampungan Bani Sa\'ad,', 'order' => 42],
            ['start_time' => 350.16, 'end_time' => 358.23, 'target_text' => 'baraka only grew. The flocks multiplied, the land revived, and every heart around the child found', 'source_text' => 'keberkatan semakin melimpah-ruah. Ternakan kambing membiak subur, tanah tandus menjadi hijau kembali, dan setiap hati di sekeliling anak itu menemui', 'order' => 43],
            ['start_time' => 358.24, 'end_time' => 367.11, 'target_text' => 'peace. He grew strong and beautiful. And wherever he crawled, light seemed to follow him. One day,', 'source_text' => 'kedamaian. Baginda membesar dengan sihat, kuat, dan tampan. Ke mana sahaja baginda merangkak, seolah-olah cahaya sentiasa mengekorinya. Pada suatu hari,', 'order' => 44],
            ['start_time' => 367.12, 'end_time' => 373.67, 'target_text' => 'while he played with his foster brother. Behind the tents, two men dressed in white appeared.', 'source_text' => 'tatkala baginda sedang bermain bersama saudara susuannya di belakang khemah, tiba-tiba muncul dua orang lelaki berpakaian putih bersih (malaikat).', 'order' => 45],
            ['start_time' => 373.68, 'end_time' => 379.51, 'target_text' => 'They laid him down gently, opened his chest and removed a small black clot,', 'source_text' => 'Mereka membaringkan baginda dengan lemah lembut, membelah dadanya lalu mengeluarkan seketul darah hitam kecil,', 'order' => 46],
            ['start_time' => 379.52, 'end_time' => 387.19, 'target_text' => 'saying this was the portion of Shayan within you. They then washed the heart with the water of Zum.', 'source_text' => 'seraya berkata: "Inilah bahagian syaitan yang ada di dalam dirimu." Kemudian mereka mencuci hatinya yang mulia dengan air telaga Zamzam.', 'order' => 47],
            ['start_time' => 387.2, 'end_time' => 396.0, 'target_text' => 'As the angels purified his heart, the words of Allah would later echo that moment of purity.', 'source_text' => 'Tatkala para malaikat menyucikan hatinya, firman Allah kelak menggemakan kembali detik penyucian agung tersebut:', 'order' => 48],
            ['start_time' => 398.32, 'end_time' => 405.59, 'target_text' => 'Successful indeed is the one who purifies the soul and doomed is the one who corrupts it.', 'source_text' => '"Sesungguhnya berjayalah orang yang menyucikan jiwanya, dan sesungguhnya rugilah orang yang mengotorinya." (Surah Asy-Syams: 9-10)', 'order' => 49],
            ['start_time' => 405.6, 'end_time' => 412.79, 'target_text' => 'Surah Shams. When the children ran to Hale Lima crying. Muhammad has been killed. She raced out', 'source_text' => 'Surah Asy-Syams. Apabila kanak-kanak lain berlari mendapatkan Halimah sambil menangis menjerit: "Muhammad telah dibunuh!" Halimah bergegas keluar', 'order' => 50],
            ['start_time' => 412.8, 'end_time' => 420.23, 'target_text' => 'in fear and found him pale but unharmed. She held him close, tears in her eyes and said, "My son,', 'source_text' => 'dalam ketakutan lalu mendapati baginda berada dalam keadaan pucat namun selamat tanpa sebarang kecederaan. Beliau memeluknya erat dengan linangan air mata seraya bertanya: "Anakku,', 'order' => 51],
            ['start_time' => 420.24, 'end_time' => 427.91, 'target_text' => 'what happened?" He replied softly, "Two men came to me, opened my chest, and purified my heart.', 'source_text' => 'apa yang telah berlaku?" Baginda menjawab dengan lembut: "Dua orang lelaki telah datang kepadaku, membelah dadaku, dan menyucikan hatiku."', 'order' => 52],
            ['start_time' => 427.92, 'end_time' => 435.11, 'target_text' => 'She and her husband knew this was no ordinary child." Fearing harm, she returned him to his', 'source_text' => 'Halimah dan suaminya menyedari bahawa anak ini bukanlah anak biasa. Kerana bimbang akan keselamatannya, Halimah menghantar baginda kembali kepada', 'order' => 53],
            ['start_time' => 435.12, 'end_time' => 442.87, 'target_text' => 'mother in Mecca. Amina welcomed her son with joy and they lived peacefully for a time. When he was', 'source_text' => 'bondanya di Mekah. Bonda Aminah menyambut kepulangan puteranya dengan penuh kegembiraan dan mereka hidup dengan aman bahagia buat seketika. Apabila baginda berusia', 'order' => 54],
            ['start_time' => 442.88, 'end_time' => 451.43, 'target_text' => '6 years old, she took him to Ythre. On the way back, she fell ill at a place called Al Abwa.', 'source_text' => '6 tahun, bonda Aminah membawanya menziarahi sanak-saudara di Yathrib. Dalam perjalanan pulang, bondanya jatuh gering di suatu tempat bernama Al-Abwa\'.', 'order' => 55],
            ['start_time' => 451.44, 'end_time' => 459.67, 'target_text' => 'With gentle hands, she held her child close and whispered, "Every living soul shall taste death,', 'source_text' => 'Dengan tangan yang lemah lembut, bonda Aminah memeluk erat anaknya lalu berbisik: "Setiap jiwa yang bernyawa pasti akan merasai mati,', 'order' => 56],
            ['start_time' => 459.68, 'end_time' => 465.75, 'target_text' => 'but Allah will never forsake you." And there she passed away, leaving the boy in the care', 'source_text' => 'namun Allah tidak akan sesekali meninggalkanmu." Dan di sanalah bondanya menghembuskan nafas terakhir, meninggalkan putera kecil ini di bawah jagaan', 'order' => 57],
            ['start_time' => 465.76, 'end_time' => 476.08, 'target_text' => 'of her servant Om. Alone yet not alone, for Allah was with him, guarding him with his protection.', 'source_text' => 'pembantunya, Ummu Aiman. Baginda bersendirian namun hakikatnya tidak pernah sendiri, kerana Allah sentiasa bersamanya, memeliharanya dengan perlindungan-Nya.', 'order' => 58],
            ['start_time' => 479.12, 'end_time' => 486.07, 'target_text' => 'There is no soul but that it has a guardian watching over it. His grandfather Abdul Muttalib', 'source_text' => '"Tiada suatu jiwa pun melainkan ada malaikat penjaga yang sentiasa mengawasinya." (Surah At-Tariq: 4). Datuknya, Abdul Muttalib,', 'order' => 59],
            ['start_time' => 486.08, 'end_time' => 493.51, 'target_text' => 'wept when he saw the orphan child and said, "He is more beloved to me than my own soul. He would', 'source_text' => 'menangis tersedu tatkala melihat cucunya yang yatim piatu itu lalu berkata: "Baginda lebih aku kasihi daripada diriku sendiri." Beliau selalu', 'order' => 60],
            ['start_time' => 493.52, 'end_time' => 500.95, 'target_text' => 'seat the boy beside him on the mat of honor near the Caba." And when others tried to move him away,', 'source_text' => 'mendudukkan cucunya di sisinya di atas hamparan tilam kehormatan berhampiran Kaabah. Dan apabila pembesar lain cuba mengalihkannya,', 'order' => 61],
            ['start_time' => 500.96, 'end_time' => 507.19, 'target_text' => 'he said, "Leave my son. He has his own greatness. But when Muhammad peace be', 'source_text' => 'Abdul Muttalib menegaskan: "Biarkanlah anakku ini, sesungguhnya dia memiliki martabat kemuliaan yang tersendiri!" Namun tatkala Nabi Muhammad ﷺ', 'order' => 62],
            ['start_time' => 507.2, 'end_time' => 513.99, 'target_text' => 'upon him was 8 years old, his grandfather too returned to his lord. With love and trust,', 'source_text' => 'mencecah usia 8 tahun, datuknya pula kembali menghadap Ilahi. Dengan penuh kasih sayang dan amanah,', 'order' => 63],
            ['start_time' => 514.0, 'end_time' => 519.43, 'target_text' => 'he was placed under the guardianship of his uncle Abu Talib, the man who would protect', 'source_text' => 'baginda diserahkan di bawah jagaan bapa saudaranya, Abu Talib—tokoh yang bakal mempertahankannya', 'order' => 64],
            ['start_time' => 519.44, 'end_time' => 527.03, 'target_text' => 'him for the rest of his life. Abu Talib raised him as his own. They traveled together to Syria', 'source_text' => 'sepanjang hayatnya. Abu Talib membesarkannya bagaikan anak kandungnya sendiri. Mereka bermusafir bersama ke negeri Syam', 'order' => 65],
            ['start_time' => 527.04, 'end_time' => 533.83, 'target_text' => 'when the prophet peace be upon him was still a boy. On that journey near the town of Busra,', 'source_text' => 'tatkala Nabi Muhammad ﷺ masih lagi seorang kanak-kanak. Dalam musafir tersebut berhampiran bandar Busra,', 'order' => 66],
            ['start_time' => 533.84, 'end_time' => 542.23, 'target_text' => 'a Christian monk named Bahira saw signs in the young boy\'s face. He invited them to a meal and', 'source_text' => 'seorang rahib Kristian bernama Buhaira melihat tanda-tanda kenabian pada wajah baginda. Buhaira menjemput mereka ke jamuan makan lalu', 'order' => 67],
            ['start_time' => 542.24, 'end_time' => 549.59, 'target_text' => 'examined the mark between his shoulders, the seal of prophethood. Turning to Abu Talib, he warned,', 'source_text' => 'meneliti tanda di antara kedua-dua belikat baginda, iaitu cop mohor kenabian (Khatamun Nubuwwah). Sambil berpaling kepada Abu Talib, beliau berpesan:', 'order' => 68],
            ['start_time' => 549.6, 'end_time' => 557.19, 'target_text' => '"Protect this boy from the Jews, for he will be a prophet sent to the worlds." Years passed.', 'source_text' => '"Peliharalah anak ini daripada ancaman musuh, kerana sesungguhnya baginda adalah nabi agung yang diutuskan untuk sekalian alam!" Tahun demi tahun berlalu.', 'order' => 69],
            ['start_time' => 557.2, 'end_time' => 563.19, 'target_text' => 'The boy grew into youth, strong, pure, and thoughtful. He never bowed to idols,', 'source_text' => 'Baginda membesar menjadi seorang pemuda yang perkasa, berjiwa suci, dan bijaksana. Baginda tidak pernah sujud menyembah berhala,', 'order' => 70],
            ['start_time' => 563.2, 'end_time' => 569.75, 'target_text' => 'never joined the games of sin, never uttered falsehood. His people came to call him Al Amin', 'source_text' => 'tidak pernah terlibat dalam kancah kemungkaran jahiliyyah, dan tidak pernah berdusta. Kaumnya menggelarkan baginda sebagai Al-Amin,', 'order' => 71],
            ['start_time' => 569.76, 'end_time' => 577.03, 'target_text' => 'the trustworthy. In him were gathered the noblest traits, mercy, humility, and truth,', 'source_text' => 'insan yang paling dipercayai dan berintegriti. Pada diri baginda terhimpun sifat-sifat paling terpuji: kasih sayang, ketundukan tawaduk, dan kebenaran,', 'order' => 72],
            ['start_time' => 577.04, 'end_time' => 585.28, 'target_text' => 'preparing him for revelation yet to come. And so Allah\'s mercy upon him was already written.', 'source_text' => 'mempersiapkan baginda bagi memikul risalah wahyu yang bakal tiba. Demikianlah limpahan rahmat Allah ke atas baginda sememangnya telah tertulis:', 'order' => 73],
            ['start_time' => 587.52, 'end_time' => 592.23, 'target_text' => 'And we have not sent you, oh Muhammad, peace be upon him, except as a mercy', 'source_text' => '"Dan tiadalah Kami mengutusmu (wahai Muhammad ﷺ) melainkan sebagai rahmat', 'order' => 74],
            ['start_time' => 592.24, 'end_time' => 597.91, 'target_text' => 'to all creation. Join me tomorrow as we begin the next chapter, the journey to prophethood,', 'source_text' => 'bagi sekalian alam." (Surah Al-Anbiya\': 107). Sertai saya esok tatkala kita memulakan babak seterusnya—perjalanan menuju kenabian,', 'order' => 75],
            ['start_time' => 597.92, 'end_time' => 609.28, 'target_text' => 'the years of truth and trust, and the first signs of revelation that would change the world forever.', 'source_text' => 'zaman penuh kebenaran dan amanah, serta detik-detik terbitnya wahyu pertama yang mengubah perjalanan dunia buat selama-lamanya.', 'order' => 76],
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
