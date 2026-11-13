<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo28Seeder extends Seeder
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

        // Special Bilingual Religious Video #28 (Siri 1 Ep.23): The Treaty of Hudaybiyyah | Life of the Final Messenger ﷺ | Ep.23 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'FwbSkCofNA4'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Treaty of Hudaybiyyah | Life of the Final Messenger ﷺ | Ep.23 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/FwbSkCofNA4/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 28,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.16, 'end_time' => 6.56, 'target_text' => 'and had sworn by Allah, "Muhammad shall not enter Makkah by force,"', 'source_text' => 'dan telah bersumpah demi Allah, "Muhammad sama sekali tidak akan memasuki Makkah secara paksa,"', 'order' => 1],
            ['start_time' => 6.56, 'end_time' => 14.08, 'target_text' => 'to fight to the end if needed. The pledge of Ridwan: the Muslims would return', 'source_text' => 'untuk berjuang hingga ke titisan darah terakhir jika perlu. Bai\'ah ar-Ridwan dimeterai: kaum muslimin akan pulang', 'order' => 2],
            ['start_time' => 14.08, 'end_time' => 23.2, 'target_text' => 'this year without performing Umrah, but could return the next year for three days.', 'source_text' => 'pada tahun ini tanpa menunaikan Umrah, namun dibenarkan kembali pada tahun hadapan selama tiga hari.', 'order' => 3],
            ['start_time' => 23.2, 'end_time' => 28.72, 'target_text' => 'My beloved brothers and sisters, not every victory comes through battle and not every', 'source_text' => 'Saudara dan saudariku yang dikasihi, bukan setiap kemenangan lahir daripada medan pertempuran, dan bukan setiap', 'order' => 4],
            ['start_time' => 28.72, 'end_time' => 34.88, 'target_text' => 'triumph looks like triumph when it arrives. Sometimes Allah writes victory in silence,', 'source_text' => 'kejayaan kelihatan seperti kejayaan sewaktu ia mula menjelma. Kadang-kala Allah menulis kemenangan dalam keheningan,', 'order' => 5],
            ['start_time' => 34.88, 'end_time' => 40.96, 'target_text' => 'in patience, in surrender to His wisdom. After years of struggle,', 'source_text' => 'dalam kesabaran, dan dalam ketundukan pasrah kepada hikmah kebijaksanaan-Nya. Setelah bertahun-tahun berjuang,', 'order' => 6],
            ['start_time' => 40.96, 'end_time' => 48.48, 'target_text' => 'the believers set out not to fight but to worship. Yet the path to the Sacred House was blocked.', 'source_text' => 'kaum mukminin berangkat bukan untuk berperang melainkan untuk beribadah. Namun laluan menuju ke Baitullah telah dihalang.', 'order' => 7],
            ['start_time' => 49.04, 'end_time' => 55.04, 'target_text' => 'What followed was not a clash of swords, but a test of trust. So come with me to', 'source_text' => 'Apa yang menyusul bukanlah pertembungan mata pedang, tetapi ujian keimanan dan kepatuhan. Maka marilah bersama saya ke', 'order' => 8],
            ['start_time' => 55.04, 'end_time' => 69.04, 'target_text' => 'the valley of al-Hudaybiyyah, where patience opened a door that battle could not.', 'source_text' => 'lembah Hudaibiyyah, tatkala kesabaran membuka pintu yang tidak mampu dibuka oleh medan peperangan.', 'order' => 9],
            ['start_time' => 76.88, 'end_time' => 83.44, 'target_text' => 'The air was still over the sands of al-Medina. In the sixth year after Hijrah,', 'source_text' => 'Suasana hening menyelubungi pasir bumi Madinah. Pada tahun keenam Hijrah,', 'order' => 10],
            ['start_time' => 83.44, 'end_time' => 89.68, 'target_text' => 'the Messenger of Allah, peace be upon him, called upon his companions. They would go to Makkah, not', 'source_text' => 'Rasulullah ﷺ menyeru para sahabat baginda. Mereka akan berangkat menuju ke Makkah, bukan', 'order' => 11],
            ['start_time' => 89.68, 'end_time' => 99.12, 'target_text' => 'for war, but for Umrah, the minor pilgrimage. They carried no swords unsheathed, no banners of battle,', 'source_text' => 'untuk berperang, melainkan bagi menunaikan Umrah. Mereka tidak membawa pedang terhunus, tiada panji peperangan,', 'order' => 12],
            ['start_time' => 99.12, 'end_time' => 109.76, 'target_text' => 'only the calm resolve of faith. 1,400 men set out with him, leading 70 camels marked for sacrifice.', 'source_text' => 'hanyalah keazaman iman yang tenang. Seramai 1,400 orang berangkat bersama baginda, memimpin 70 ekor unta korban (*hadyu*).', 'order' => 13],
            ['start_time' => 109.76, 'end_time' => 116.56, 'target_text' => 'The Prophet peace be upon him said, "We come as visitors to the House of Allah, not as fighters."', 'source_text' => 'Nabi ﷺ bersabda, "Kami datang semata-mata sebagai penziarah ke Baitullah, bukan sebagai pejuang perang."', 'order' => 14],
            ['start_time' => 116.56, 'end_time' => 125.04, 'target_text' => 'They traveled until they reached \'Usfan. There they learned that Quraysh had heard of their coming', 'source_text' => 'Mereka bermusafir sehinggalah tiba di \'Usfan. Di sana mereka mendapat khabar bahawa kaum Quraisy telah mengetahui kedatangan mereka', 'order' => 15],
            ['start_time' => 125.04, 'end_time' => 133.28, 'target_text' => 'and had sworn by Allah, "Muhammad shall not enter Makkah by force." The Prophet peace be upon him', 'source_text' => 'dan telah bersumpah demi Allah, "Muhammad sama sekali tidak akan memasuki Makkah secara paksa." Nabi ﷺ', 'order' => 16],
            ['start_time' => 133.28, 'end_time' => 140.16, 'target_text' => 'turned to his companions and said, "Woe to Quraysh! What harm would it be if they let me', 'source_text' => 'berpaling kepada para sahabat seraya bersabda, "Kesian sungguh kaum Quraisy! Apakah ruginya jika mereka membiarkan aku', 'order' => 17],
            ['start_time' => 140.16, 'end_time' => 148.72, 'target_text' => 'visit the House of my Lord? If they allow, they will see Islam spread in peace. If they refuse,', 'source_text' => 'menziarahi Rumah Tuhanku? Sekiranya mereka membenarkan, mereka akan melihat Islam tersebar dengan aman. Namun jika mereka enggan,', 'order' => 18],
            ['start_time' => 148.72, 'end_time' => 158.72, 'target_text' => 'I shall strive until Allah completes His command." He took an unmarked rough path to avoid conflict,', 'source_text' => 'aku akan terus berjuang sehinggalah Allah menyempurnakan urusan-Nya." Baginda memilih jalan berbatu yang sukar demi mengelakkan pertumpahan darah,', 'order' => 19],
            ['start_time' => 158.72, 'end_time' => 170.32, 'target_text' => 'a road few dared to tread. Through rocky valleys and steep ascents they marched in silence until', 'source_text' => 'laluan yang jarang dilalui sesiapa. Merentasi lembah berbatuan dan laluan curam berbukit mereka berarak dalam diam sehinggalah', 'order' => 20],
            ['start_time' => 170.32, 'end_time' => 180.24, 'target_text' => 'the Prophet\'s camel al-Qaswa\', peace be upon him, knelt near al-Hudaybiyyah and would not move. Some said', 'source_text' => 'unta tunggangan Nabi ﷺ, al-Qaswa\', melutut berhampiran Hudaibiyyah dan enggan berganjak. Ada yang berkata', 'order' => 21],
            ['start_time' => 180.24, 'end_time' => 187.6, 'target_text' => 'it had become stubborn, but the Prophet peace be upon him said, "She has not refused to move.', 'source_text' => 'unta itu merajuk degil, namun Nabi ﷺ bersabda, "Bukan sifat al-Qaswa\' untuk enggan bergerak.', 'order' => 22],
            ['start_time' => 187.6, 'end_time' => 195.28, 'target_text' => 'The Same One who stopped the elephant has stopped her." He camped there on the', 'source_text' => 'Zat yang pernah menahan tentera bergajah Abrahah itulah yang kini menahannya." Lalu baginda berkhemah di situ, betul-betul di', 'order' => 23],
            ['start_time' => 195.28, 'end_time' => 207.2, 'target_text' => 'very border of the Sacred Land. Messengers came and went between the two sides. Among them was', 'source_text' => 'sempadan tanah haram Makkah. Utusan silih berganti berulang-alik antara kedua-dua belah pihak. Antara mereka ialah', 'order' => 24],
            ['start_time' => 207.2, 'end_time' => 214.16, 'target_text' => '\'Urwah ibn Mas\'ud who, after seeing the Prophet\'s companions surround him in reverence, returned', 'source_text' => '\'Urwah ibn Mas\'ud, yang setelah menyaksikan betapa para sahabat memuliakan Nabi ﷺ penuh takzim, pulang kepada Quraisy', 'order' => 25],
            ['start_time' => 214.16, 'end_time' => 222.24, 'target_text' => 'saying, "I have met kings: Caesar, Chosroes, and the Negus. But never have I seen a king honored', 'source_text' => 'seraya berkata, "Aku pernah mengadap raja-raja besar: Maharaja Rom (Kaisar), Parsi (Kisra), dan Habsyah (Najasyi). Namun belum pernah kusaksikan seorang raja dimuliakan', 'order' => 26],
            ['start_time' => 222.24, 'end_time' => 231.52, 'target_text' => 'by his people as Muhammad is by his companions." Another one of them, Suhayl ibn \'Amr, arrived to negotiate on', 'source_text' => 'oleh rakyatnya sebagaimana Muhammad dimuliakan oleh para sahabatnya." Kemudian seorang lagi utusan, Suhayl ibn \'Amr, tiba berunding bagi', 'order' => 27],
            ['start_time' => 231.52, 'end_time' => 238.16, 'target_text' => 'behalf of Quraysh. The Prophet peace be upon him said, "The matter has become easy, for they have', 'source_text' => 'pihak Quraisy. Nabi ﷺ bersabda, "Urusan kita kini telah dipermudahkan, kerana mereka telah', 'order' => 28],
            ['start_time' => 238.16, 'end_time' => 248.16, 'target_text' => 'sent Suhayl, and his name means ease." They agreed upon terms: There would be peace for 10 years. Whoever', 'source_text' => 'mengutus Suhayl, dan namanya membawa erti kemudahan." Mereka memeterai syarat perjanjian: Gencatan senjata selama 10 tahun. Sesiapa yang', 'order' => 29],
            ['start_time' => 248.16, 'end_time' => 257.04, 'target_text' => 'wished to ally with Muhammad could do so. Whoever wished to ally with Quraysh could do so too. The', 'source_text' => 'ingin bersekutu dengan Muhammad bebas berbuat demikian; sesiapa yang ingin bersekutu dengan Quraisy juga bebas berbuat demikian. Kaum', 'order' => 30],
            ['start_time' => 257.04, 'end_time' => 265.6, 'target_text' => 'Muslims would return this year without performing Umrah, but could return the next year for three days.', 'source_text' => 'muslimin hendaklah pulang pada tahun ini tanpa menunaikan Umrah, namun dibenarkan kembali pada tahun hadapan selama tiga hari.', 'order' => 31],
            ['start_time' => 265.6, 'end_time' => 273.92, 'target_text' => 'As the treaty was being written, Abu Jandal ibn Suhayl, the son of the very negotiator, escaped from Makkah in', 'source_text' => 'Tatkala perjanjian sedang ditulis, Abu Jandal bin Suhayl, anak kepada wakil perunding Quraisy itu sendiri, berjaya melarikan diri dari Makkah dalam', 'order' => 32],
            ['start_time' => 273.92, 'end_time' => 280.64, 'target_text' => 'chains, crying out, "Oh people of Islam! Will you return me to the polytheists to torture me for my', 'source_text' => 'keadaan berantai seraya merayu hiba, "Wahai umat Islam! Adakah kamu akan menyerahkan aku kembali kepada kaum musyrikin untuk diseksa kerana', 'order' => 33],
            ['start_time' => 280.64, 'end_time' => 287.6, 'target_text' => 'faith?" Suhayl struck his own son and demanded his return, saying, "We have concluded our', 'source_text' => 'agamaku?" Suhayl lantas memukul anaknya dan menuntut agar dia dipulangkan seraya berkata, "Kami telah memeterai', 'order' => 34],
            ['start_time' => 287.6, 'end_time' => 295.84, 'target_text' => 'pact before this man came." The Prophet peace be upon him, with deep sorrow, said, "Oh Abu Jandal,', 'source_text' => 'perjanjian ini sebelum pemuda ini tiba." Nabi ﷺ dengan nada pilu dan hiba bersabda, "Wahai Abu Jandal,', 'order' => 35],
            ['start_time' => 295.84, 'end_time' => 302.64, 'target_text' => 'be patient and seek reward from Allah. Allah will soon grant you and those with you a way', 'source_text' => 'bersabarlah dan harapkanlah ganjaran pahala daripada Allah. Sesungguhnya Allah akan segera membuka jalan keluar bagi kamu dan mereka yang tertindas bersama kamu."', 'order' => 36],
            ['start_time' => 302.64, 'end_time' => 312.64, 'target_text' => 'out." The companions\' hearts ached. But obedience and trust in Allah prevailed. Before the treaty,', 'source_text' => 'Hati para sahabat bagai dihiris sembilu menanggung kepedihan itu, namun ketaatan dan tawakal kepada Allah tetap mendahului segalanya. Sebelum perjanjian itu dimeterai,', 'order' => 37],
            ['start_time' => 312.64, 'end_time' => 319.84, 'target_text' => 'when news had spread that \'Uthman, may Allah be pleased with him, might have been killed in Makkah,', 'source_text' => 'tatkala tersebar khabar angin bahawa Saidina Uthman RA telah dibunuh di Makkah,', 'order' => 38],
            ['start_time' => 319.84, 'end_time' => 330.64, 'target_text' => 'the companions had pledged under a tree to fight to the end if needed — the Pledge of Ridwan. Allah revealed:', 'source_text' => 'para sahabat telah berbai\'ah di bawah pohon untuk berjuang hingga ke titisan darah terakhir — itulah Bai\'ah ar-Ridwan. Maka Allah menurunkan firman-Nya:', 'order' => 39],
            ['start_time' => 330.64, 'end_time' => 339.6, 'target_text' => '"Indeed, Allah was pleased with the believers when they pledged allegiance to you under the tree."', 'source_text' => '"Demi sesungguhnya, Allah telah reda kepada orang-orang yang beriman tatkala mereka berbai\'ah kepadamu di bawah pohon itu."', 'order' => 40],
            ['start_time' => 345.92, 'end_time' => 351.84, 'target_text' => 'After the treaty, some companions were uneasy. \'Umar, may Allah be pleased with him,', 'source_text' => 'Selepas perjanjian dimeterai, timbul rasa gelisah di hati sebahagian sahabat. Saidina Umar RA', 'order' => 41],
            ['start_time' => 351.84, 'end_time' => 358.08, 'target_text' => 'asked, "Are we not upon the truth? Why accept humiliation?" The Prophet peace', 'source_text' => 'bertanya, "Bukankah kita berada di atas kebenaran? Mengapa kita harus menerima kerendahan dalam agama kita?" Nabi ﷺ', 'order' => 42],
            ['start_time' => 358.08, 'end_time' => 364, 'target_text' => 'be upon him replied, "I am the Messenger of Allah, and I will not disobey Allah.', 'source_text' => 'menjawab dengan tegas dan tenang, "Sesungguhnya aku adalah pesuruh Allah, dan aku sama sekali tidak akan mengingkari perintah Allah.', 'order' => 43],
            ['start_time' => 364, 'end_time' => 376.32, 'target_text' => 'He will make His command prevail." On the return to Medina, revelation descended:', 'source_text' => 'Dialah yang akan memenangkan urusan-Nya." Dalam perjalanan pulang ke Madinah, wahyu Ilahi pun turun:', 'order' => 44],
            ['start_time' => 376.32, 'end_time' => 383.68, 'target_text' => '"Indeed, We have given you a clear victory, that Allah may forgive you what preceded of your sin', 'source_text' => '"Sesungguhnya Kami telah membuka bagi kamu kemenangan yang nyata. Supaya Allah mengampuni dosa-dosamu yang telah lalu', 'order' => 45],
            ['start_time' => 383.68, 'end_time' => 391.68, 'target_text' => 'and what will follow." The Prophet\'s face, peace be upon him, lit with joy. The companions rejoiced,', 'source_text' => 'dan yang akan datang." Wajah Nabi ﷺ berseri-seri penuh kegembiraan. Para sahabat turut bersukacita,', 'order' => 46],
            ['start_time' => 391.68, 'end_time' => 399.76, 'target_text' => 'realizing this peace was greater than any battle, for through it Islam spread across', 'source_text' => 'menyedari bahawa perdamaian ini adalah kejayaan yang jauh lebih agung daripada mana-mana pertempuran, kerana melaluinya Islam tersebar luas ke seluruh', 'order' => 47],
            ['start_time' => 399.76, 'end_time' => 406.56, 'target_text' => 'Arabia. The Prophet peace be upon him raised his gaze towards the sky and smiled. No swords', 'source_text' => 'Semenanjung Tanah Arab. Nabi ﷺ menatap ke langit seraya tersenyum. Tiada sebilah pedang pun', 'order' => 48],
            ['start_time' => 406.56, 'end_time' => 415.28, 'target_text' => 'had clashed, no cities had burnt, yet this was victory. There was never a conquest', 'source_text' => 'yang berlaga, tiada kota yang terbakar, namun inilah kemenangan hakiki. Belum pernah berlaku suatu pembukaan', 'order' => 49],
            ['start_time' => 415.28, 'end_time' => 423.6, 'target_text' => 'in Islam greater than al-Hudaybiyyah, for through it hearts opened to Islam. And so what seemed', 'source_text' => 'dalam sejarah Islam yang lebih agung daripada Perjanjian Hudaibiyyah, kerana melaluinya hati-hati manusia terbuka menerima Islam. Apa yang pada awalnya disangka', 'order' => 50],
            ['start_time' => 423.6, 'end_time' => 429.76, 'target_text' => 'like loss was in truth a victory written by Allah. For the treaty slowed swords,', 'source_text' => 'sebagai kerugian, hakikatnya adalah kemenangan gemilang yang telah dicatatkan oleh Allah. Perjanjian itu menyarungkan pedang,', 'order' => 51],
            ['start_time' => 429.76, 'end_time' => 436.24, 'target_text' => 'but it opened hearts. It allowed the message to spread freely. And soon the time would come', 'source_text' => 'tetapi ia membuka pintu sanubari manusia. Ia membolehkan risalah dakwah berkembang luas tanpa sekatan. Dan tidak lama kemudian, masanya akan tiba', 'order' => 52],
            ['start_time' => 436.24, 'end_time' => 441.92, 'target_text' => 'for the Messenger of Allah, peace be upon him, to return to Makkah, not as a seeker,', 'source_text' => 'untuk Rasulullah ﷺ kembali menjejakkan kaki ke Kota Makkah, bukan lagi sebagai pemohon suaka,', 'order' => 53],
            ['start_time' => 441.92, 'end_time' => 453.68, 'target_text' => 'but as a victor. In the next episode, insha\'Allah, we witness the march of faith: The conquest of Khaybar.', 'source_text' => 'melainkan sebagai pemenang yang agung. Dalam episod berikutnya, insya-Allah, kita akan menyaksikan perarakan keimanan: Pembukaan Kota Khaibar.', 'order' => 54],
            ['start_time' => 453.68, 'end_time' => 459.28, 'target_text' => 'Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'Semoga selawat dan salam tercurah ke atas Nabi Muhammad dan seluruh keluarga serta para sahabat baginda sekalian.', 'order' => 55],
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
