<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo26Seeder extends Seeder
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

        // Special Bilingual Religious Video #26 (Siri 1 Ep.21): The Siege of Banu Qurayzah | Life of the Final Messenger ﷺ | Ep.21 | Mufti Menk | Ramadan Series
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => 'nFfMy76PfIc'],
            [
                'language_id'   => $english->id,
                'title'         => 'The Siege of Banu Qurayzah | Life of the Final Messenger ﷺ | Ep.21 | Mufti Menk | Ramadan Series',
                'thumbnail_url' => 'https://img.youtube.com/vi/nFfMy76PfIc/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 26,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.32, 'end_time' => 6.8, 'target_text' => 'The Prophet peace be upon him announced, "None of you should pray Asr except at Banu Qurayzah."', 'source_text' => 'Nabi ﷺ mengumumkan, "Jangan ada seorang pun antara kamu yang solat Asar melainkan di perkampungan Bani Quraizah."', 'order' => 1],
            ['start_time' => 6.8, 'end_time' => 14.32, 'target_text' => 'Banu Qurayzah surrendered. The Aws tribe pleaded for leniency toward their former allies. The', 'source_text' => 'Bani Quraizah akhirnya menyerah diri. Kabilah Aus merayu agar diberikan kelonggaran terhadap bekas sekutu mereka. Namun', 'order' => 2],
            ['start_time' => 14.32, 'end_time' => 21.44, 'target_text' => 'lesson was clear. Faith and betrayal cannot share the same city. My beloved brothers and sisters,', 'source_text' => 'pengajarannya amat nyata: Keimanan dan pengkhianatan tidak boleh berkongsi bumbung di kota yang sama. Saudara dan saudariku yang dikasihi,', 'order' => 3],
            ['start_time' => 21.44, 'end_time' => 28.56, 'target_text' => 'every test refines the believer, and every trial reveals the truth within the heart. After the', 'source_text' => 'setiap ujian menyucikan jiwa orang yang beriman, dan setiap dugaan menzahirkan hakikat isi hati yang sebenar. Selepas', 'order' => 4],
            ['start_time' => 28.56, 'end_time' => 36.64, 'target_text' => 'storm of the trench, Medina stood still, its air heavy with exhaustion. Yet filled with gratitude,', 'source_text' => 'berlalunya taufan Perang Khandaq, Madinah hening seketika diselubungi keletihan yang amat sangat. Namun sarat dengan kesyukuran,', 'order' => 5],
            ['start_time' => 36.64, 'end_time' => 43.68, 'target_text' => 'the believers had faced an army from every direction. And Allah Himself had sent a wind', 'source_text' => 'kaum mukminin telah berdepan kepungan bala tentera dari segenap penjuru. Dan Allah sendiri telah menghantar angin kencang', 'order' => 6],
            ['start_time' => 43.68, 'end_time' => 50.4, 'target_text' => 'to protect them. But as the dust settled, a new command descended from the heavens.', 'source_text' => 'untuk melindungi mereka. Namun tatkala debu peperangan baru hendak reda, satu perintah baharu turun dari langit.', 'order' => 7],
            ['start_time' => 50.4, 'end_time' => 56.24, 'target_text' => 'The angels had not laid down their arms and the Prophet of Allah peace be upon him would', 'source_text' => 'Para malaikat belum lagi meletakkan senjata mereka, dan Rasulullah ﷺ', 'order' => 8],
            ['start_time' => 56.24, 'end_time' => 64.64, 'target_text' => 'rise once more not for conquest but for justice. This is not a story of vengeance but of truth.', 'source_text' => 'akan bangkit mara sekali lagi bukan demi penaklukan, melainkan demi menegakkan keadilan. Ini bukan kisah pembalasan dendam, tetapi pembuktian kebenaran.', 'order' => 9],
            ['start_time' => 64.64, 'end_time' => 75.92, 'target_text' => 'A story where betrayal met its consequence and where the mercy of Allah shone even in judgment.', 'source_text' => 'Kisah tatkala pengkhianatan menerima padahnya, dan tatkala rahmat Allah tetap terserlah walaupun dalam penegakan hukuman.', 'order' => 10],
            ['start_time' => 85.52, 'end_time' => 91.84, 'target_text' => 'The wind of the trench still echoed through Medina. Dust had barely settled. The Muslims', 'source_text' => 'Deruan angin Perang Khandaq masih bergema di Madinah. Debu-debu pasir nyaris belum reda. Kaum muslimin', 'order' => 11],
            ['start_time' => 91.84, 'end_time' => 97.84, 'target_text' => 'were exhausted yet victorious. But before the Prophet peace be upon him could remove his armor,', 'source_text' => 'berada dalam keletihan yang amat sangat namun beroleh kemenangan. Namun sebelum sempat Nabi ﷺ menanggalkan baju besinya,', 'order' => 12],
            ['start_time' => 97.84, 'end_time' => 106.32, 'target_text' => 'Jibril may peace be upon him appeared mounted on a white mule clothed in silk and said, "Oh Muhammad,', 'source_text' => 'Malaikat Jibril AS muncul menunggang baghal putih berpakaian sutera seraya berkata, "Wahai Muhammad,', 'order' => 13],
            ['start_time' => 106.32, 'end_time' => 112.56, 'target_text' => 'you have laid down your arms, but the angels have not laid down theirs. Your Lord commands you to', 'source_text' => 'engkau telah meletakkan senjatamu, sedangkan para malaikat belum meletakkan senjata mereka. Tuhanmu memerintahkanmu agar', 'order' => 14],
            ['start_time' => 112.56, 'end_time' => 120.48, 'target_text' => 'march against Banu Qurayzah." The Prophet peace be upon him announced, "None of you should pray except at', 'source_text' => 'mara menggempur Bani Quraizah." Lalu Nabi ﷺ mengumumkan, "Jangan ada seorang pun antara kamu yang solat melainkan di', 'order' => 15],
            ['start_time' => 120.48, 'end_time' => 130.32, 'target_text' => 'Banu Qurayzah." His companions obeyed. Some prayed on the way, others after arriving and neither was blamed.', 'source_text' => 'perkampungan Bani Quraizah." Para sahabat terus patuh. Sebahagian solat dalam perjalanan, sebahagian lagi solat setibanya di sana, dan tiada seorang pun yang dicela.', 'order' => 16],
            ['start_time' => 130.32, 'end_time' => 136.8, 'target_text' => 'Ali ibn Abi Talib, may Allah be pleased with him, carried the standard ahead of the army. When he drew near', 'source_text' => 'Ali ibn Abi Talib, semoga Allah meredhainya, memegang panji utama mara mendahului pasukan. Apabila baginda menghampiri', 'order' => 17],
            ['start_time' => 136.8, 'end_time' => 142.72, 'target_text' => 'the fortresses, the tribe hurled insults and mocked the Messenger peace be upon him.', 'source_text' => 'kubu-kubu pertahanan, kabilah itu melontarkan cacian nista dan mencemuh Rasulullah ﷺ.', 'order' => 18],
            ['start_time' => 142.72, 'end_time' => 149.52, 'target_text' => 'Anger flashed in the eyes of the believers. The Prophet peace be upon him stopped and called out,', 'source_text' => 'Kemarahan menyala di mata kaum beriman. Namun Nabi ﷺ berhenti seraya berseru dengan lantang,', 'order' => 19],
            ['start_time' => 149.52, 'end_time' => 156.88, 'target_text' => '"Has Allah disgraced you and cast His wrath upon you?" The Muslim forces surrounded them for', 'source_text' => '"Adakah Allah telah menghinakan kamu dan mencurahkan kemurkaan-Nya ke atas kamu?" Pasukan tentera Islam mengepung mereka selama', 'order' => 20],
            ['start_time' => 156.88, 'end_time' => 167.84, 'target_text' => '25 days. Inside, fear spread through Banu Qurayzah. Ka\'b ibn Asad, their chief, offered three choices: Accept', 'source_text' => '25 hari. Di dalam kubu, ketakutan mencengkam Bani Quraizah. Ka\'b ibn Asad, ketua mereka, menawarkan tiga pilihan: Memeluk', 'order' => 21],
            ['start_time' => 167.84, 'end_time' => 175.6, 'target_text' => 'Islam and live in peace; kill their own families and fight to the end; or attack the Muslims on', 'source_text' => 'Islam dan hidup dalam damai; membunuh keluarga sendiri lalu bertempur hingga titisan darah terakhir; atau menyerang orang Islam pada', 'order' => 22],
            ['start_time' => 175.6, 'end_time' => 185.12, 'target_text' => 'the Sabbath, breaking their own law. But they refused each one, trapped by fear and pride. When', 'source_text' => 'hari Sabat, dengan melanggar syariat mereka sendiri. Namun mereka menolak setiap pilihan itu, terperangkap oleh ketakutan dan keangkuhan. Tatkala', 'order' => 23],
            ['start_time' => 185.12, 'end_time' => 193.04, 'target_text' => 'they asked to consult Abu Lubabah ibn Abd al-Mundhir, he went to them. The men and women wept and pleaded,', 'source_text' => 'mereka meminta untuk berunding dengan Abu Lubabah bin Abd al-Mundhir, beliau pun pergi menemui mereka. Kaum lelaki dan wanita menangis merayu,', 'order' => 24],
            ['start_time' => 193.04, 'end_time' => 201.04, 'target_text' => '"Should we surrender to Muhammad?" He said, "Yes." But gestured to his throat, meaning that death', 'source_text' => '"Patutkah kami menyerah kepada Muhammad?" Beliau menjawab, "Ya." Tetapi beliau membuat isyarat ke lehernya, membayangkan hukuman mati', 'order' => 25],
            ['start_time' => 201.04, 'end_time' => 209.2, 'target_text' => 'awaited them. Immediately he realized his betrayal of Allah and His Messenger. So he tied himself to', 'source_text' => 'sedang menanti mereka. Serta-merta beliau menyedari keterlanjurannya mengkhianati rahsia Allah dan Rasul-Nya. Lalu beliau mengikat dirinya pada', 'order' => 26],
            ['start_time' => 209.2, 'end_time' => 222.08, 'target_text' => 'a pillar at the Prophet\'s mosque and vowed not to leave until Allah forgave him. Revelation came:', 'source_text' => 'sebatang tiang di Masjid Nabawi dan bernazar tidak akan berganjak sehinggalah Allah mengampuninya. Maka turunlah wahyu:', 'order' => 27],
            ['start_time' => 222.08, 'end_time' => 228, 'target_text' => '"Oh you who believe, do not betray Allah and the Messenger." His repentance was', 'source_text' => '"Wahai orang-orang yang beriman! Janganlah kamu mengkhianati amanah Allah dan Rasul-Nya." Taubat beliau akhirnya', 'order' => 28],
            ['start_time' => 228, 'end_time' => 236.8, 'target_text' => 'accepted and the Prophet peace be upon him personally untied him at dawn. Finally,', 'source_text' => 'diterima oleh Allah, dan Nabi ﷺ sendiri yang membuka ikatan tali itu pada waktu subuh. Akhirnya,', 'order' => 29],
            ['start_time' => 236.8, 'end_time' => 244.64, 'target_text' => 'Banu Qurayzah surrendered. The Aws tribe pleaded for leniency toward their former allies. The Prophet peace', 'source_text' => 'Bani Quraizah menyerah diri. Kabilah Aus merayu memohon belas kasihan terhadap bekas sekutu lama mereka. Nabi ﷺ', 'order' => 30],
            ['start_time' => 244.64, 'end_time' => 252.16, 'target_text' => 'be upon him asked, "Will you be satisfied if one of your own judges between you?" They agreed. He', 'source_text' => 'bertanya, "Adakah kamu reda sekiranya salah seorang daripada kalangan kamu sendiri yang mengadili perkara ini?" Mereka bersetuju. Lalu baginda', 'order' => 31],
            ['start_time' => 252.16, 'end_time' => 261.12, 'target_text' => 'appointed Sa\'d ibn Mu\'adh, chief of the Aws. Wounded at the trench, Sa\'d, may Allah be pleased with him,', 'source_text' => 'melantik Sa\'d ibn Mu\'adh, ketua kabilah Aus. Sa\'d yang tercedera parah dalam Perang Khandaq, semoga Allah meredhainya,', 'order' => 32],
            ['start_time' => 261.12, 'end_time' => 268, 'target_text' => 'was carried on a donkey to the Prophet\'s camp at Rufaydah\'s tent. The Messenger peace be upon', 'source_text' => 'diusung di atas keldai menuju ke khemah rawatan Rufaydah. Rasulullah ﷺ', 'order' => 33],
            ['start_time' => 268, 'end_time' => 276.48, 'target_text' => 'him said, "Stand for your leader." He then asked, "Will you abide by my judgment?" They said yes.', 'source_text' => 'bersabda, "Bangkitlah menghormati pemimpin kamu." Baginda kemudian bertanya, "Adakah kamu akan patuh pada keputusanku?" Mereka menjawab ya.', 'order' => 34],
            ['start_time' => 276.48, 'end_time' => 285.52, 'target_text' => 'Sa\'d declared the men shall be executed, the women and children enslaved and the property divided.', 'source_text' => 'Sa\'d memutuskan bahawa tentera lelaki yang mengkhianati dihukum bunuh, wanita dan anak-anak dijadikan tawanan, serta harta benda dibahagikan.', 'order' => 35],
            ['start_time' => 285.52, 'end_time' => 291.84, 'target_text' => 'The Prophet peace be upon him said, "You have judged by the judgment of Allah from above seven heavens."', 'source_text' => 'Nabi ﷺ bersabda, "Sesungguhnya engkau telah menghakimi mengikut ketetapan hukum Allah dari atas tujuh petala langit."', 'order' => 36],
            ['start_time' => 291.84, 'end_time' => 301.28, 'target_text' => 'The prisoners were taken to the market of Medina and executed in batches. Among them was Huyayy ibn Akhtab who', 'source_text' => 'Para tawanan dibawa ke pasar Madinah dan hukuman dijalankan secara berperingkat. Antara mereka ialah Huyayy ibn Akhtab yang', 'order' => 37],
            ['start_time' => 301.28, 'end_time' => 308.24, 'target_text' => 'said before his death, "By Allah, I do not blame myself for enmity toward you, Muhammad. This is', 'source_text' => 'berkata sebelum dihukum, "Demi Allah, aku tidak menyesali permusuhanku terhadapmu, wahai Muhammad. Tetapi ini adalah', 'order' => 38],
            ['start_time' => 308.24, 'end_time' => 316.48, 'target_text' => 'fate decreed by Allah." Only one woman was executed for a murder she had committed during the siege.', 'source_text' => 'takdir yang telah ditetapkan oleh Allah." Hanya seorang wanita dihukum atas kesalahan membunuh yang dilakukannya ketika pengepungan.', 'order' => 39],
            ['start_time' => 316.48, 'end_time' => 322.8, 'target_text' => 'The Prophet peace be upon him distributed the spoils and sent the captives to Najd to exchange', 'source_text' => 'Nabi ﷺ membahagikan harta rampasan dan menghantar sebahagian tawanan ke Najd untuk ditukarkan', 'order' => 40],
            ['start_time' => 322.8, 'end_time' => 331.2, 'target_text' => 'for horses and weapons. From the captives was Rayhanah bint Zayd, whom the Prophet peace be upon him', 'source_text' => 'dengan kuda dan senjata perang. Antara tawanan tersebut ialah Rayhanah bint Zaid, yang mana Nabi ﷺ', 'order' => 41],
            ['start_time' => 331.2, 'end_time' => 338.32, 'target_text' => 'freed and invited to Islam. She later embraced faith and the Prophet peace be upon him was', 'source_text' => 'telah membebaskannya dan mengajaknya kepada Islam. Beliau kemudian memeluk Islam dan Nabi ﷺ', 'order' => 42],
            ['start_time' => 338.32, 'end_time' => 346.8, 'target_text' => 'gladdened by her conversion. When the judgment was fulfilled, Sa\'d\'s wounds burst open. He raised his', 'source_text' => 'amat gembira dengan keislamannya. Setelah hukuman disempurnakan, luka parah Sa\'d kembali berdarah. Beliau menadah kedua-dua belah', 'order' => 43],
            ['start_time' => 346.8, 'end_time' => 353.68, 'target_text' => 'hands and said, "Oh Allah, if there is still a fight with Quraysh, keep me alive to face them.', 'source_text' => 'tangannya seraya berdoa, "Ya Allah, sekiranya masih ada pertempuran menentang Quraisy, panjangkanlah umurku untuk menghadapinya.', 'order' => 44],
            ['start_time' => 353.68, 'end_time' => 361.04, 'target_text' => 'If not, then let this wound be my martyrdom." His blood flowed until he passed away that night. The', 'source_text' => 'Sekiranya tidak, jadikanlah luka ini sebagai jalan syahidku." Darahnya mengalir sehinggalah beliau menghembuskan nafas terakhir pada malam itu. Maka', 'order' => 45],
            ['start_time' => 361.04, 'end_time' => 367.12, 'target_text' => 'Prophet peace be upon him said, "The throne of Allah has shaken for the death of Sa\'d ibn Mu\'adh, may Allah', 'source_text' => 'Nabi ﷺ bersabda, "Sesungguhnya Arasy Allah bergegar kerana kewafatan Sa\'d ibn Mu\'adh, semoga Allah', 'order' => 46],
            ['start_time' => 367.12, 'end_time' => 374.88, 'target_text' => 'be pleased with him." The battle of Banu Qurayzah ended the treachery within Medina. Its walls stood', 'source_text' => 'meredhainya." Peristiwa Bani Quraizah menamatkan siri pengkhianatan dari dalam Madinah. Kubunya kini berdiri', 'order' => 47],
            ['start_time' => 374.88, 'end_time' => 388.56, 'target_text' => 'silent, its people gone. The lesson was clear: Faith and betrayal cannot share the same city.', 'source_text' => 'sepi, penghuninya telah tiada. Pengajarannya amat nyata: Keimanan dan pengkhianatan tidak boleh berkongsi di kota yang sama.', 'order' => 48],
            ['start_time' => 393.84, 'end_time' => 399.92, 'target_text' => 'So Allah turned back the disbelievers in their rage and Allah was sufficient for the believers.', 'source_text' => 'Lalu Allah mengundurkan orang-orang kafir dalam keadaan marah dan murka, dan cukuplah Allah menjadi Pelindung bagi orang-orang beriman.', 'order' => 49],
            ['start_time' => 399.92, 'end_time' => 407.76, 'target_text' => 'And so the city remained standing, its light preserved, its unity protected. But beneath', 'source_text' => 'Maka kota Madinah kekal berdiri teguh, cahayanya terpelihara, dan kesatuannya terlindung rapi. Namun di bawah', 'order' => 50],
            ['start_time' => 407.76, 'end_time' => 416.64, 'target_text' => 'the surface, a shadow continued to move. The hearts that refused faith grew heavier with envy.', 'source_text' => 'permukaan, bayang-bayang muslihat masih terus bergerak. Hati-hati yang menolak iman semakin sarat dengan hasad dengki.', 'order' => 51],
            ['start_time' => 416.64, 'end_time' => 424.8, 'target_text' => 'The tongues that mocked in secret grew sharper, and alliances beyond the desert began to form.', 'source_text' => 'Lidah-lidah yang mengejek secara sembunyi bertambah tajam, dan pakatan jahat di balik padang pasir mula dibentuk.', 'order' => 52],
            ['start_time' => 424.8, 'end_time' => 432.72, 'target_text' => 'With every victory in the path of Allah comes a new test. In the next episode, insha\'Allah,', 'source_text' => 'Bersama setiap kemenangan di jalan Allah, datanglah ujian baharu. Dalam episod seterusnya, insya-Allah,', 'order' => 53],
            ['start_time' => 432.72, 'end_time' => 440.48, 'target_text' => 'we walk into a moment of whispers and wounds where faith will be shaken, hearts will be tested,', 'source_text' => 'kita akan melangkah ke detik bisikan fitnah dan luka yang mendalam, tatkala iman diuji dan jiwa digoncang,', 'order' => 54],
            ['start_time' => 440.48, 'end_time' => 447.28, 'target_text' => 'and truth will descend like light through the clouds. The whisper of the storm,', 'source_text' => 'namun kebenaran akan turun laksana cahaya menyinari celah-celah awan. Bisikan ribut kencang,', 'order' => 55],
            ['start_time' => 447.28, 'end_time' => 463.52, 'target_text' => 'the story of Banu al-Mustaliq and the slander of \'A\'ishah, may Allah be pleased with her. Sallallahu \'ala Muhammad wa \'ala alihi wa sahbihi ajma\'in.', 'source_text' => 'kisah Bani al-Mustaliq dan fitnah ke atas Ummul Mukminin Aisyah RA. Selawat dan salam ke atas Nabi Muhammad dan seluruh keluarga serta sahabat baginda.', 'order' => 56],
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
