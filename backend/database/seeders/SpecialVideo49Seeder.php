<?php

namespace Database\Seeders;

use App\Models\Language;
use App\Models\YoutubeVideo;
use App\Models\VideoSubtitle;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class SpecialVideo49Seeder extends Seeder
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

        // Special Bilingual Religious Video #49 (Siri 3 Ep.09): Seeking Cure and Healing in Ramadan - Episode 9 - The Final Stretch - Mufti Menk
        $video = YoutubeVideo::updateOrCreate(
            ['youtube_video_id' => '5AQjsPpNDsw'],
            [
                'language_id'   => $english->id,
                'title'         => 'Seeking Cure and Healing in Ramadan - Episode 9 - The Final Stretch - Mufti Menk',
                'thumbnail_url' => 'https://img.youtube.com/vi/5AQjsPpNDsw/0.jpg',
                'category'      => 'Special',
                'is_premium'    => false,
                'is_free'       => true,
                'is_active'     => true,
                'order'         => 49,
            ]
        );

        VideoSubtitle::where('video_id', $video->id)->delete();

        $subtitles = [
            ['start_time' => 0.719, 'end_time' => 1.98, 'target_text' => 'Assalamu alaykum.', 'source_text' => 'Assalamu\'alaikum.', 'order' => 1],
            ['start_time' => 2.08, 'end_time' => 3.339, 'target_text' => 'We all have bad habits.', 'source_text' => 'Kita semua memiliki tabiat buruk.', 'order' => 2],
            ['start_time' => 3.439, 'end_time' => 4.54, 'target_text' => 'You have to admit it.', 'source_text' => 'Anda harus mengakuinya.', 'order' => 3],
            ['start_time' => 4.64, 'end_time' => 6.86, 'target_text' => 'But we have to work on our bad habits.', 'source_text' => 'Namun kita perlu berusaha memperbaiki tabiat buruk kita.', 'order' => 4],
            ['start_time' => 6.96, 'end_time' => 10.22, 'target_text' => 'These bad habits are such that they can bog us down.', 'source_text' => 'Tabiat buruk ini boleh membebankan dan melemahkan kita.', 'order' => 5],
            ['start_time' => 10.32, 'end_time' => 14.14, 'target_text' => 'Allah gives us a month of Ramadan, a month of purification.', 'source_text' => 'Allah mengurniakan kita bulan Ramadan, sebuah bulan penyucian jiwa.', 'order' => 6],
            ['start_time' => 14.24, 'end_time' => 23.019, 'target_text' => 'Allah gives us the opportunity to give charity both that which is compulsory and that which is voluntary as a means of purification', 'source_text' => 'Allah memberi kita peluang untuk bersedekah, sama ada yang wajib (zakat) mahupun yang sunat, sebagai wadah penyucian', 'order' => 7],
            ['start_time' => 23.119, 'end_time' => 23.74, 'target_text' => 'as well.', 'source_text' => 'jiwa dan harta juga.', 'order' => 8],
            ['start_time' => 23.84, 'end_time' => 31.339, 'target_text' => 'So we need to purify ourselves and seize the opportunity of Ramadan in particular to ensure that we are healed.', 'source_text' => 'Maka kita perlu menyucikan diri dan merebut peluang Ramadan khususnya demi memastikan kita benar-benar sembuh.', 'order' => 9],
            ['start_time' => 31.439, 'end_time' => 32.94, 'target_text' => 'Healed from what?', 'source_text' => 'Sembuh daripada apa?', 'order' => 10],
            ['start_time' => 33.04, 'end_time' => 41.5, 'target_text' => 'Healing from your physical sicknesses, healing from your spiritual maladies, your jealousy, your envy, your hatred, your selfishness', 'source_text' => 'Penyembuhan daripada penyakit jasmani, penyembuhan daripada penyakit rohani, perasaan cemburu, hasad dengki, kebencian, sikap mementingkan diri,', 'order' => 11],
            ['start_time' => 41.6, 'end_time' => 43.02, 'target_text' => 'and so much more.', 'source_text' => 'dan banyak lagi.', 'order' => 12],
            ['start_time' => 43.12, 'end_time' => 47.42, 'target_text' => 'We need to make sure we work on these habits and characters.', 'source_text' => 'Kita perlu memastikan bahawa kita berusaha memperbaiki tabiat dan akhlak pekerti ini.', 'order' => 13],
            ['start_time' => 47.52, 'end_time' => 51.42, 'target_text' => 'The values and morals that we stand for need to be high.', 'source_text' => 'Nilai dan akhlak yang kita junjung mestilah tinggi.', 'order' => 14],
            ['start_time' => 51.52, 'end_time' => 52.86, 'target_text' => 'They need to be checked.', 'source_text' => 'Ia perlu sentiasa diperiksa dan dinilai.', 'order' => 15],
            ['start_time' => 52.96, 'end_time' => 56.199, 'target_text' => 'So Allah gives us a month of', 'source_text' => 'Maka Allah menganugerahkan kita sebulan tempoh', 'order' => 16],
            ['start_time' => 62.039, 'end_time' => 62.939, 'target_text' => 'reflection.', 'source_text' => 'muhasabah diri.', 'order' => 17],
            ['start_time' => 63.039, 'end_time' => 73.66, 'target_text' => 'If you look at the physical aspect, fasting is by far one of the healthiest ways of improving yourself physically and eradicating', 'source_text' => 'Jika anda melihat dari sudut fizikal, berpuasa adalah antara kaedah paling sihat untuk mempertingkatkan kesihatan diri dan menghapuskan', 'order' => 18],
            ['start_time' => 73.76, 'end_time' => 75.26, 'target_text' => 'physical illness.', 'source_text' => 'penyakit jasmani.', 'order' => 19],
            ['start_time' => 75.36, 'end_time' => 85.9, 'target_text' => 'More and more studies as time is passing are proving that fasting actually has so much more in terms of health benefits than', 'source_text' => 'Semakin banyak kajian dari masa ke masa membuktikan bahawa berpuasa sebenarnya mempunyai begitu banyak manfaat kesihatan melebihi apa yang', 'order' => 20],
            ['start_time' => 86.0, 'end_time' => 88.059, 'target_text' => 'we ever knew before.', 'source_text' => 'pernah kita ketahui sebelum ini.', 'order' => 21],
            ['start_time' => 88.159, 'end_time' => 95.42, 'target_text' => 'You look at the intermittent fasting that\'s happening and that\'s being taught even by those who don\'t believe by the non-Muslims.', 'source_text' => 'Lihatlah amalan \'intermittent fasting\' yang sedang meluas diamalkan dan diajarkan hatta oleh mereka yang bukan beragama Islam.', 'order' => 22],
            ['start_time' => 95.52, 'end_time' => 100.699, 'target_text' => 'But we\'ve had the Monday and the Thursday from the sunnah of the prophet sallallahu alaihi wasallam from the beginning.', 'source_text' => 'Sedangkan kita telah memiliki sunnah puasa hari Isnin dan Khamis daripada Nabi SAW sejak dari awal lagi.', 'order' => 23],
            ['start_time' => 100.799, 'end_time' => 105.5, 'target_text' => 'And if you look at this, subhan Allah, we\'re being offered a bonus.', 'source_text' => 'Dan jika anda merenung perkara ini, Subhanallah, kita sebenarnya ditawarkan suatu bonus.', 'order' => 24],
            ['start_time' => 105.6, 'end_time' => 110.699, 'target_text' => 'I\'m not fasting because I want to become healthy, but Allah says, "You fast for me." Guess what?', 'source_text' => 'Daku bukan berpuasa semata-mata kerana ingin menjadi sihat, sebaliknya Allah berfirman, "Kamu berpuasalah kerana-Ku." Tahu apa yang berlaku?', 'order' => 25],
            ['start_time' => 110.799, 'end_time' => 114.54, 'target_text' => 'I\'ve thrown in the fact that you\'re going to become healthy anyway.', 'source_text' => 'Aku sertakan sekali hakikat bahawa tubuhmu pasti akan menjadi sihat juga.', 'order' => 26],
            ['start_time' => 114.64, 'end_time' => 115.82, 'target_text' => 'And it\'s just a bonus.', 'source_text' => 'Dan kesihatan itu hanyalah sekadar bonus tambahan.', 'order' => 27],
            ['start_time' => 115.92, 'end_time' => 117.659, 'target_text' => 'So, I\'m fasting for Allah.', 'source_text' => 'Maka, daku berpuasa ikhlas semata-mata kerana Allah.', 'order' => 28],
            ['start_time' => 117.759, 'end_time' => 119.58, 'target_text' => 'Always purify that intention.', 'source_text' => 'Sentiasalah menyucikan dan membetulkan niat tersebut.', 'order' => 29],
            ['start_time' => 119.68, 'end_time' => 120.619, 'target_text' => 'I\'m fasting for Allah.', 'source_text' => 'Daku berpuasa kerana Allah.', 'order' => 30],
            ['start_time' => 120.719, 'end_time' => 122.22, 'target_text' => 'But after Ramadan, guess what?', 'source_text' => 'Namun selepas Ramadan, teka apa yang berlaku?', 'order' => 31],
            ['start_time' => 122.32, 'end_time' => 123.339, 'target_text' => 'I\'ve lost 6 kilos.', 'source_text' => 'Berat badanku telah susut sebanyak 6 kilogram.', 'order' => 32],
            ['start_time' => 123.439, 'end_time' => 124.46, 'target_text' => 'Mah, I look so healthy.', 'source_text' => 'Masya-Allah, daku kelihatan begitu sihat.', 'order' => 33],
            ['start_time' => 124.56, 'end_time' => 125.5, 'target_text' => 'I\'m feeling good.', 'source_text' => 'Daku berasa sungguh cergas.', 'order' => 34],
            ['start_time' => 125.6, 'end_time' => 126.379, 'target_text' => 'I\'ve energized.', 'source_text' => 'Daku lebih bertenaga.', 'order' => 35],
            ['start_time' => 126.479, 'end_time' => 129.499, 'target_text' => 'I\'m not eating, you know, as much sugar as before.', 'source_text' => 'Daku tidak lagi mengambil gula sebanyak dahulu.', 'order' => 36],
            ['start_time' => 129.599, 'end_time' => 130.7, 'target_text' => 'I\'m watching my carbs.', 'source_text' => 'Daku mengawal pengambilan karbohidrat.', 'order' => 37],
            ['start_time' => 130.8, 'end_time' => 131.34, 'target_text' => 'I\'m watching this.', 'source_text' => 'Daku mengawal pemakanan ini.', 'order' => 38],
            ['start_time' => 131.44, 'end_time' => 131.84, 'target_text' => 'I\'m watching.', 'source_text' => 'Daku sentiasa berhati-hati.', 'order' => 39],
            ['start_time' => 131.92, 'end_time' => 132.46, 'target_text' => 'Mashallah.', 'source_text' => 'Masya-Allah.', 'order' => 40],
            ['start_time' => 132.56, 'end_time' => 133.499, 'target_text' => 'That\'s amazing.', 'source_text' => 'Ia amat mengagumkan.', 'order' => 41],
            ['start_time' => 133.599, 'end_time' => 135.1, 'target_text' => 'How did you achieve that?', 'source_text' => 'Bagaimanakah anda mencapainya?', 'order' => 42],
            ['start_time' => 135.2, 'end_time' => 139.1, 'target_text' => 'Allah tells you, watch what goes into your mouth in Ramadan.', 'source_text' => 'Allah berpesan kepada anda, jagalah apa yang masuk ke dalam mulutmu pada bulan Ramadan.', 'order' => 43],
            ['start_time' => 139.2, 'end_time' => 140.06, 'target_text' => 'Watch it.', 'source_text' => 'Perhatikanlah dan awasilah ia.', 'order' => 44],
            ['start_time' => 140.16, 'end_time' => 141.58, 'target_text' => 'So, I don\'t put anything in my mouth.', 'source_text' => 'Maka, daku tidak memasukkan sebarang makanan atau minuman ke dalam mulutku.', 'order' => 45],
            ['start_time' => 141.68, 'end_time' => 142.08, 'target_text' => 'Why?', 'source_text' => 'Mengapa?', 'order' => 46],
            ['start_time' => 141.92, 'end_time' => 143.499, 'target_text' => 'Because it\'s not good for me.', 'source_text' => 'Kerana ia tidak baik untuk diriku.', 'order' => 47],
            ['start_time' => 143.599, 'end_time' => 145.9, 'target_text' => 'It\'s not acceptable in the eyes of Allah.', 'source_text' => 'Ia tidak diterima di sisi pandangan Allah.', 'order' => 48],
            ['start_time' => 146.0, 'end_time' => 149.9, 'target_text' => 'If Allah tells you something, there has to be broad benefit.', 'source_text' => 'Sekiranya Allah memerintahkan sesuatu perkara, pasti terkandung manfaat yang amat luas.', 'order' => 49],
            ['start_time' => 150.0, 'end_time' => 153.98, 'target_text' => 'Whether human beings know it or don\'t know it is besides the point.', 'source_text' => 'Sama ada manusia mengetahuinya atau tidak mengetahuinya bukanlah persoalan utama.', 'order' => 50],
            ['start_time' => 154.08, 'end_time' => 154.859, 'target_text' => 'They will find out.', 'source_text' => 'Mereka pasti akan mengetahuinya kelak.', 'order' => 51],
            ['start_time' => 154.959, 'end_time' => 155.58, 'target_text' => 'They may find out.', 'source_text' => 'Mereka mungkin mengetahuinya.', 'order' => 52],
            ['start_time' => 155.68, 'end_time' => 156.779, 'target_text' => 'They may not find out.', 'source_text' => 'Atau mereka mungkin tidak mengetahuinya.', 'order' => 53],
            ['start_time' => 156.879, 'end_time' => 159.58, 'target_text' => 'If Allah prohibits something, it\'s not good for you.', 'source_text' => 'Sekiranya Allah mengharamkan sesuatu perkara, ia sesungguhnya memudaratkan anda.', 'order' => 54],
            ['start_time' => 159.68, 'end_time' => 161.18, 'target_text' => 'That\'s why he prohibited it.', 'source_text' => 'Itulah sebabnya Dia mengharamkannya.', 'order' => 55],
            ['start_time' => 161.28, 'end_time' => 165.82, 'target_text' => 'If Allah made something compulsory, it\'s very beneficial for you holistically.', 'source_text' => 'Sekiranya Allah mewajibkan sesuatu perkara, ia amat bermanfaat untuk anda secara menyeluruh.', 'order' => 56],
            ['start_time' => 165.92, 'end_time' => 167.82, 'target_text' => 'That\'s why he made it compulsory.', 'source_text' => 'Itulah sebabnya Dia menjadikannya satu kewajipan.', 'order' => 57],
            ['start_time' => 167.92, 'end_time' => 174.26, 'target_text' => 'If something is permissible, it cannot be harmful unless you overdo things beyond a certain level.', 'source_text' => 'Sekiranya sesuatu itu harus, ia tidak akan memudaratkan melainkan jika anda melampaui batas yang berlebihan.', 'order' => 58],
            ['start_time' => 174.36, 'end_time' => 184.46, 'target_text' => 'However, when we look at Allah subhanahu wa ta\'ala\'s gift for us, Allah Almighty wants to give us an opportunity to cure ourselves', 'source_text' => 'Walau bagaimanapun, apabila kita melihat kurniaan Allah SWT, Allah Yang Maha Kuasa ingin memberi kita peluang menyembuhkan diri', 'order' => 59],
            ['start_time' => 184.56, 'end_time' => 185.58, 'target_text' => 'holistically.', 'source_text' => 'secara holistik dan menyeluruh.', 'order' => 60],
            ['start_time' => 185.68, 'end_time' => 193.18, 'target_text' => 'What\'s the point of a person having such a beautiful, you know, face or such a good body, very healthy?', 'source_text' => 'Apakah gunanya seseorang memiliki wajah yang tampan atau tubuh badan yang begitu tegap dan sihat,', 'order' => 61],
            ['start_time' => 193.28, 'end_time' => 195.02, 'target_text' => 'They don\'t worship Allah.', 'source_text' => 'tetapi mereka tidak beribadah kepada Allah?', 'order' => 62],
            ['start_time' => 195.12, 'end_time' => 197.98, 'target_text' => 'They\'re not interested in the way they talk to others.', 'source_text' => 'Mereka tidak mempedulikan kesantunan tutur kata apabila berbicara dengan orang lain.', 'order' => 63],
            ['start_time' => 198.08, 'end_time' => 199.499, 'target_text' => 'They don\'t they\'re not helpful.', 'source_text' => 'Mereka tidak gemar membantu orang lain.', 'order' => 64],
            ['start_time' => 199.599, 'end_time' => 201.1, 'target_text' => 'They are not charitable.', 'source_text' => 'Mereka tidak bermurah hati bersedekah.', 'order' => 65],
            ['start_time' => 201.2, 'end_time' => 203.34, 'target_text' => 'They don\'t care about the feelings of others.', 'source_text' => 'Mereka langsung tidak mengambil berat tentang perasaan insan lain.', 'order' => 66],
            ['start_time' => 203.44, 'end_time' => 206.54, 'target_text' => 'They don\'t care how they make others feel when they talk.', 'source_text' => 'Mereka tidak peduli bagaimana kata-kata mereka melukakan hati orang lain apabila berbicara.', 'order' => 67],
            ['start_time' => 206.64, 'end_time' => 209.02, 'target_text' => 'There are people who pray five times a day.', 'source_text' => 'Ada orang yang mendirikan solat lima waktu sehari.', 'order' => 68],
            ['start_time' => 209.12, 'end_time' => 215.419, 'target_text' => 'There are people who cover themselves correctly, but they are very difficult to get along with.', 'source_text' => 'Ada orang yang menutup aurat dengan sempurna, namun peribadi mereka amat sukar untuk didekati dan bergaul.', 'order' => 69],
            ['start_time' => 215.519, 'end_time' => 218.54, 'target_text' => 'That\'s a sign there\'s something wrong with your acts of worship.', 'source_text' => 'Itu petanda bahawa ada sesuatu yang tidak kena dengan ibadah anda.', 'order' => 70],
            ['start_time' => 218.64, 'end_time' => 222.38, 'target_text' => 'Because when you\'re close to Allah, you become a softened person.', 'source_text' => 'Kerana apabila anda dekat dengan Allah, hati anda menjadi lembut dan santun.', 'order' => 71],
            ['start_time' => 222.48, 'end_time' => 226.62, 'target_text' => 'You approach even the enemy in a good way, in a respectful way.', 'source_text' => 'Hatta terhadap seteru sekalipun, anda mendekatinya dengan cara yang baik dan penuh rasa hormat.', 'order' => 72],
            ['start_time' => 226.72, 'end_time' => 227.98, 'target_text' => 'You might disagree.', 'source_text' => 'Anda mungkin berbeza pandangan.', 'order' => 73],
            ['start_time' => 228.08, 'end_time' => 234.699, 'target_text' => 'You\'re allowed to disagree, but you are kind and you are respectful in the way you disagree.', 'source_text' => 'Anda dibenarkan untuk berbeza pendapat, namun anda tetap beradab dan saling menghormati ketika menyuarakan perbezaan itu.', 'order' => 74],
            ['start_time' => 234.799, 'end_time' => 236.3, 'target_text' => 'You can disagree strongly.', 'source_text' => 'Anda boleh bertegas dalam perbezaan pendapat.', 'order' => 75],
            ['start_time' => 236.4, 'end_time' => 242.059, 'target_text' => 'You can even disagree with your parents but you are kind and respectful.', 'source_text' => 'Anda bahkan boleh berbeza pandangan dengan ibu bapa anda, tetapi anda tetap berlaku ihsan dan penuh takzim.', 'order' => 76],
            ['start_time' => 242.159, 'end_time' => 245.98, 'target_text' => 'Similarly, when justice is sought, you can seek justice.', 'source_text' => 'Begitu juga apabila menuntut keadilan, anda berhak menuntut keadilan.', 'order' => 77],
            ['start_time' => 246.08, 'end_time' => 247.18, 'target_text' => 'You can seek justice.', 'source_text' => 'Anda berhak menegakkan keadilan.', 'order' => 78],
            ['start_time' => 247.28, 'end_time' => 252.38, 'target_text' => 'You can actually take to task certain people but do it in a beautiful way.', 'source_text' => 'Anda sebenarnya boleh menegur dan meminta pertanggungjawaban orang tertentu, tetapi lakukanlah dengan cara yang paling elok.', 'order' => 79],
            ['start_time' => 252.48, 'end_time' => 255.74, 'target_text' => 'Maintain the dignity of a believer.', 'source_text' => 'Peliharalah maruah dan kewibawaan sebagai seorang mukmin.', 'order' => 80],
            ['start_time' => 255.84, 'end_time' => 257.94, 'target_text' => 'That\'s what we\'re supposed to be doing.', 'source_text' => 'Itulah yang sepatutnya kita laksanakan.', 'order' => 81],
            ['start_time' => 258.04, 'end_time' => 265.58, 'target_text' => 'So, if you take a careful look at your character, the hadith says you shouldn\'t be getting angry when you\'re fasting.', 'source_text' => 'Maka, jika anda meneliti akhlak anda, sabda hadis menegaskan bahawa anda tidak sepatutnya mengikut amarah ketika sedang berpuasa.', 'order' => 82],
            ['start_time' => 265.68, 'end_time' => 267.02, 'target_text' => 'control your temper.', 'source_text' => 'Kawal perasaan marah anda.', 'order' => 83],
            ['start_time' => 267.12, 'end_time' => 268.379, 'target_text' => 'You should not be swearing.', 'source_text' => 'Anda tidak sepatutnya mencarut atau memaki-hamun.', 'order' => 84],
            ['start_time' => 268.479, 'end_time' => 270.86, 'target_text' => 'If you swear, bear false witness.', 'source_text' => 'Jika anda mencaci atau memberi kesaksian palsu,', 'order' => 85],
            ['start_time' => 270.96, 'end_time' => 274.539, 'target_text' => 'Utter utterances that are hurtful and abusive and vulgar.', 'source_text' => 'mengucapkan kata-kata yang menyakitkan, menghina, dan lucah,', 'order' => 86],
            ['start_time' => 274.639, 'end_time' => 276.379, 'target_text' => 'In Ramadan, you wasted it.', 'source_text' => 'pada bulan Ramadan, anda sesungguhnya telah mensia-siakan puasa anda.', 'order' => 87],
            ['start_time' => 276.479, 'end_time' => 278.439, 'target_text' => 'It\'s a', 'source_text' => 'Ia adalah peringatan', 'order' => 88],
            ['start_time' => 285.72, 'end_time' => 286.62, 'target_text' => 'clear-cut.', 'source_text' => 'yang amat jelas.', 'order' => 89],
            ['start_time' => 286.72, 'end_time' => 293.02, 'target_text' => 'Allah says he doesn\'t have any need for the fact that you stayed away from food or drink.', 'source_text' => 'Allah menegaskan bahawa Dia sama sekali tidak memerlukan anda menahan diri daripada makan atau minum', 'order' => 90],
            ['start_time' => 293.12, 'end_time' => 300.7, 'target_text' => 'If you did not stay away from vulgar words, false witness, that which is abusive, that which is hurtful, hateful and so much', 'source_text' => 'sekiranya anda tidak menjauhi kata-kata kesat, saksi dusta, perkataan yang menghina, menyakitkan, penuh kebencian dan bermacam-macam', 'order' => 91],
            ['start_time' => 300.8, 'end_time' => 301.58, 'target_text' => 'more.', 'source_text' => 'lagi celaan.', 'order' => 92],
            ['start_time' => 301.68, 'end_time' => 309.98, 'target_text' => 'So make sure that you have seized the opportunity to push yourself to become a better person.', 'source_text' => 'Oleh itu, pastikan anda merebut peluang ini untuk mendesak diri anda menjadi seorang insan yang lebih baik.', 'order' => 93],
            ['start_time' => 310.08, 'end_time' => 311.26, 'target_text' => 'We spoke about sabar.', 'source_text' => 'Kita telah membicarakan tentang hakikat sabar.', 'order' => 94],
            ['start_time' => 311.36, 'end_time' => 313.58, 'target_text' => 'Ramadan is all about sabra.', 'source_text' => 'Ramadan adalah medan utama melatih kesabaran.', 'order' => 95],
            ['start_time' => 313.68, 'end_time' => 314.7, 'target_text' => 'You have to bear patience.', 'source_text' => 'Anda wajib memiliki kesabaran.', 'order' => 96],
            ['start_time' => 314.8, 'end_time' => 316.46, 'target_text' => 'There are three types of sabar.', 'source_text' => 'Terdapat tiga kategori sabar.', 'order' => 97],
            ['start_time' => 316.56, 'end_time' => 318.78, 'target_text' => 'Patience to do the right thing.', 'source_text' => 'Pertama, sabar dalam melaksanakan ketaatan dan kebenaran.', 'order' => 98],
            ['start_time' => 318.88, 'end_time' => 323.099, 'target_text' => 'It\'s called the strength, you know, the willpower.', 'source_text' => 'Ia dinamakan kekuatan daya azam dan kemahuan diri.', 'order' => 99],
            ['start_time' => 323.199, 'end_time' => 325.58, 'target_text' => 'Patience to stay away from the wrong things.', 'source_text' => 'Kedua, sabar dalam menahan diri daripada melakukan kemungkaran.', 'order' => 100],
            ['start_time' => 325.68, 'end_time' => 329.18, 'target_text' => 'It\'s called the restraining power, the restraint.', 'source_text' => 'Ia dinamakan daya ketahanan diri dalam mengekang hawa nafsu.', 'order' => 101],
            ['start_time' => 329.28, 'end_time' => 332.3, 'target_text' => 'Patience to accept the decree of Allah.', 'source_text' => 'Ketiga, sabar dalam menerima ketentuan dan takdir Allah.', 'order' => 102],
            ['start_time' => 332.4, 'end_time' => 336.78, 'target_text' => 'That\'s called to be happy with the decree of Allah.', 'source_text' => 'Ia dinamakan sifat reda terhadap apa jua ketetapan Allah.', 'order' => 103],
            ['start_time' => 336.88, 'end_time' => 341.099, 'target_text' => 'So when we have the patience to stay away from that which is wrong.', 'source_text' => 'Maka apabila kita memiliki kesabaran untuk menjauhi perkara yang batil,', 'order' => 104],
            ['start_time' => 341.199, 'end_time' => 342.7, 'target_text' => 'We watch our tongues.', 'source_text' => 'kita menjaga lidah dan tutur kata kita.', 'order' => 105],
            ['start_time' => 342.8, 'end_time' => 351.26, 'target_text' => 'Ramadan is not only about watching what goes into your mouth, but equally watch what comes out of your mouth.', 'source_text' => 'Ramadan bukan sekadar menjaga apa yang masuk ke dalam mulut anda, tetapi sama pentingnya menjaga apa yang keluar daripada mulut anda.', 'order' => 106],
            ['start_time' => 351.36, 'end_time' => 352.86, 'target_text' => 'That\'s Ramadan.', 'source_text' => 'Itulah intipati sebenar Ramadan.', 'order' => 107],
            ['start_time' => 352.96, 'end_time' => 359.34, 'target_text' => 'Ramadan, if you have not watched what comes out of your mouth, you could have wasted it just like you would have wasted it', 'source_text' => 'Ramadan, sekiranya anda tidak mengawal apa yang keluar daripada mulut anda, anda mungkin mensia-siakannya sama seperti anda mensia-siakannya', 'order' => 108],
            ['start_time' => 359.44, 'end_time' => 363.02, 'target_text' => 'if you put something into your mouth at the wrong time.', 'source_text' => 'sekiranya anda memasukkan makanan ke dalam mulut pada waktu yang terlarang.', 'order' => 109],
            ['start_time' => 363.12, 'end_time' => 364.219, 'target_text' => 'So remember this.', 'source_text' => 'Maka ingatlah pesanan ini.', 'order' => 110],
            ['start_time' => 364.319, 'end_time' => 369.9, 'target_text' => 'It\'s from the hadith of the prophet sallallahu alaihi wasallam explained a little bit differently where he says don\'t waste', 'source_text' => 'Ia bersumberkan hadis Nabi SAW yang dihuraikan dengan sudut pandang berbeza, di mana Baginda berpesan janganlah mensia-siakan', 'order' => 111],
            ['start_time' => 370.0, 'end_time' => 375.9, 'target_text' => 'your time by not being so conscious about how you are.', 'source_text' => 'waktu anda dengan tidak peka terhadap keperibadian diri anda.', 'order' => 112],
            ['start_time' => 376.0, 'end_time' => 378.7, 'target_text' => 'Ramadan is a habit building month to do what?', 'source_text' => 'Ramadan adalah bulan membina tabiat mulia untuk melakukan apa?', 'order' => 113],
            ['start_time' => 378.8, 'end_time' => 380.539, 'target_text' => 'Become selfless than to be generous.', 'source_text' => 'Menjadi insan yang tidak mementingkan diri, lalu bersikap pemurah,', 'order' => 114],
            ['start_time' => 380.639, 'end_time' => 382.46, 'target_text' => 'than to give than to be kind.', 'source_text' => 'suka memberi, dan bersifat santun.', 'order' => 115],
            ['start_time' => 382.56, 'end_time' => 386.14, 'target_text' => 'If you\'ve given wealth, give a sweet word.', 'source_text' => 'Jika anda telah menyumbangkan harta, hulurkanlah pula tutur kata yang manis.', 'order' => 116],
            ['start_time' => 386.24, 'end_time' => 389.9, 'target_text' => 'A kind word is actually a massive charity.', 'source_text' => 'Sepatah perkataan yang baik sebenarnya merupakan satu sedekah yang amat bernilai.', 'order' => 117],
            ['start_time' => 390.0, 'end_time' => 396.379, 'target_text' => 'You know, a kind word, people don\'t realize, is a charity sometimes more valuable than the monetary charity you\'ve given.', 'source_text' => 'Ketahuilah, kata-kata yang santun, yang sering tidak disedari orang ramai, kadangkala jauh lebih berharga daripada sedekah wang ringgit yang anda hulurkan.', 'order' => 118],
            ['start_time' => 396.479, 'end_time' => 398.7, 'target_text' => 'A smile on the face is a charity.', 'source_text' => 'Senyuman ikhlas pada wajah adalah satu sedekah.', 'order' => 119],
            ['start_time' => 398.8, 'end_time' => 402.7, 'target_text' => 'Imagine what a beautiful word would do if only the smile was good.', 'source_text' => 'Bayangkan betapa besarnya impak ungkapan yang indah sekiranya senyuman itu sendiri sudah begitu terpuji.', 'order' => 120],
            ['start_time' => 402.8, 'end_time' => 405.98, 'target_text' => 'And the smile was amazing and it would get you a big reward.', 'source_text' => 'Dan senyuman itu sungguh menawan serta mendatangkan pahala yang amat besar untuk anda.', 'order' => 121],
            ['start_time' => 406.08, 'end_time' => 410.14, 'target_text' => 'In Ramadan, the last 10 days of Ramadan, you\'re going to multiply that reward.', 'source_text' => 'Pada bulan Ramadan, terutamanya pada 10 hari terakhir Ramadan, anda akan menggandakan lagi pahala tersebut.', 'order' => 122],
            ['start_time' => 410.24, 'end_time' => 411.34, 'target_text' => 'say good words.', 'source_text' => 'Ucapkanlah perkataan-perkataan yang baik.', 'order' => 123],
            ['start_time' => 411.44, 'end_time' => 414.86, 'target_text' => 'We live with people sometimes related or not related.', 'source_text' => 'Kita tinggal bersama insan lain, sama ada kaum kerabat mahupun bukan kerabat.', 'order' => 124],
            ['start_time' => 414.96, 'end_time' => 416.7, 'target_text' => 'We make life difficult for each other.', 'source_text' => 'Kadangkala kita menyusahkan hidup antara satu sama lain.', 'order' => 125],
            ['start_time' => 416.8, 'end_time' => 418.379, 'target_text' => 'We say the nastiest things.', 'source_text' => 'Kita menuturkan kata-kata yang amat pedih dan melukakan hati.', 'order' => 126],
            ['start_time' => 418.479, 'end_time' => 424.939, 'target_text' => 'We are not appreciative of the sacrifice being made by people in the house for our food, our drink, our, you know, sleeping', 'source_text' => 'Kita tidak menghargai pengorbanan yang dilakukan oleh mereka yang berada di rumah demi menyediakan makanan, minuman, tempat', 'order' => 127],
            ['start_time' => 425.039, 'end_time' => 427.98, 'target_text' => 'place, our whatever it might be, the cleanliness, everything.', 'source_text' => 'tidur kita, kebersihan kediaman, dan segala kemudahan kita.', 'order' => 128],
            ['start_time' => 428.08, 'end_time' => 429.26, 'target_text' => 'People serve us.', 'source_text' => 'Ada insan yang berkhidmat memudahkan urusan kita.', 'order' => 129],
            ['start_time' => 429.36, 'end_time' => 431.26, 'target_text' => 'Be they helping hands or family members.', 'source_text' => 'Sama ada mereka pembantu rumah mahupun ahli keluarga kita sendiri.', 'order' => 130],
            ['start_time' => 431.36, 'end_time' => 432.62, 'target_text' => 'Say some good words to them.', 'source_text' => 'Ucapkanlah kata-kata penghargaan yang baik kepada mereka.', 'order' => 131],
            ['start_time' => 432.72, 'end_time' => 433.74, 'target_text' => 'Encourage them.', 'source_text' => 'Berikanlah dorongan dan semangat kepada mereka.', 'order' => 132],
            ['start_time' => 433.84, 'end_time' => 435.18, 'target_text' => 'Praise them now and again.', 'source_text' => 'Pujilah usaha mereka sekali-sekala.', 'order' => 133],
            ['start_time' => 435.28, 'end_time' => 435.98, 'target_text' => 'Thank them.', 'source_text' => 'Ucapkanlah terima kasih kepada mereka.', 'order' => 134],
            ['start_time' => 436.08, 'end_time' => 437.02, 'target_text' => 'Subhan Allah.', 'source_text' => 'Subhanallah.', 'order' => 135],
            ['start_time' => 437.12, 'end_time' => 444.14, 'target_text' => 'You will not be able to thank Allah if you did not thank those who did the goodness to you with the energy given to them by', 'source_text' => 'Anda tidak akan mampu benar-benar bersyukur kepada Allah sekiranya anda tidak berterima kasih kepada insan yang berbuat kebaikan kepada anda dengan tenaga kurniaan', 'order' => 136],
            ['start_time' => 444.24, 'end_time' => 445.98, 'target_text' => 'Allah subhanahu wa ta\'ala.', 'source_text' => 'Allah Subhanahu Wata\'ala.', 'order' => 137],
            ['start_time' => 446.08, 'end_time' => 449.74, 'target_text' => 'So considering all of this, we make Ramadan a meaningful month.', 'source_text' => 'Maka dengan mengambil kira semua perkara ini, marilah kita jadikan Ramadan satu bulan yang penuh bermakna.', 'order' => 138],
            ['start_time' => 449.84, 'end_time' => 453.499, 'target_text' => 'The last stretch, the final stretch.', 'source_text' => 'Fasa pecutan terakhir, detik-detik penamat yang genting.', 'order' => 139],
            ['start_time' => 453.599, 'end_time' => 458.219, 'target_text' => 'Let\'s make sure we\'ve changed truly I\'m a different person.', 'source_text' => 'Pastikan kita benar-benar telah berubah menjadi seorang insan yang berbeza.', 'order' => 140],
            ['start_time' => 458.319, 'end_time' => 459.98, 'target_text' => 'Then you\'re a true believer.', 'source_text' => 'Ketika itulah anda menjadi seorang mukmin sejati.', 'order' => 141],
            ['start_time' => 460.08, 'end_time' => 467.02, 'target_text' => 'If you\'re not a different person and you still have brought all your baggage and all the negativity that you had with you,', 'source_text' => 'Sekiranya anda tidak berubah menjadi insan baharu dan masih membawa segala beban keburukan serta aura negatif bersama anda,', 'order' => 142],
            ['start_time' => 467.12, 'end_time' => 469.34, 'target_text' => 'what was the benefit of your Ramadan?', 'source_text' => 'apakah sebenarnya manfaat Ramadan yang telah anda lalui?', 'order' => 143],
            ['start_time' => 469.44, 'end_time' => 470.46, 'target_text' => 'Why Ramadan?', 'source_text' => 'Mengapakah perlu ada Ramadan?', 'order' => 144],
            ['start_time' => 470.56, 'end_time' => 471.659, 'target_text' => 'Ramadan in and out.', 'source_text' => 'Ramadan datang dan pergi.', 'order' => 145],
            ['start_time' => 471.759, 'end_time' => 474.219, 'target_text' => 'It\'s not just about food and having lavish iftars.', 'source_text' => 'Ia bukan sekadar berkisar tentang menjamu selera dan menikmati hidangan iftar yang mewah.', 'order' => 146],
            ['start_time' => 474.319, 'end_time' => 482.7, 'target_text' => 'No, it\'s about having a lavish change so that you change for the sake of Allah and you came out a transformed person.', 'source_text' => 'Bukan itu! Ia adalah tentang mencapai transformasi perubahan yang agung agar anda berubah kerana Allah dan keluar sebagai insan yang benar-benar diperbaharui jiwanya.', 'order' => 147],
            ['start_time' => 482.8, 'end_time' => 485.659, 'target_text' => 'May Allah help us achieve that transformation.', 'source_text' => 'Semoga Allah membantu kita mencapai transformasi jiwa yang mulia itu.', 'order' => 148],
            ['start_time' => 485.759, 'end_time' => 487.559, 'target_text' => 'Amen.', 'source_text' => 'Aamiin.', 'order' => 149],
            ['start_time' => 488.24, 'end_time' => 490.46, 'target_text' => 'Sallallahu alaihi wasallam.', 'source_text' => 'Sallallahu \'alaihi wasallam.', 'order' => 150],
            ['start_time' => 490.56, 'end_time' => 492.36, 'target_text' => 'Muhammad.', 'source_text' => 'Ke atas Nabi Muhammad SAW.', 'order' => 151],
        ];

        // Bulk insert in chunks of 100 for maximum performance and atomicity
        $now = now();
        $chunks = array_chunk($subtitles, 100);
        foreach ($chunks as $chunk) {
            $insertData = [];
            foreach ($chunk as $item) {
                $insertData[] = [
                    'id'          => (string) Str::uuid(),
                    'video_id'    => $video->id,
                    'start_time'  => $item['start_time'],
                    'end_time'    => $item['end_time'],
                    'target_text' => $item['target_text'],
                    'source_text' => $item['source_text'],
                    'order'       => $item['order'],
                    'created_at'  => $now,
                    'updated_at'  => $now,
                ];
            }
            DB::table('video_subtitles')->insert($insertData);
        }
    }
}
