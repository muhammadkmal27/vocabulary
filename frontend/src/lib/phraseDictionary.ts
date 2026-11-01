/**
 * Kamus Frasa & Ungkapan (phraseDictionary)
 * Mengesan gabungan kosa kata ayat (collocations, idioms, phrasal verbs)
 * supaya perkataan diterjemahkan mengikut konteks sebenar ungkapan perbualan.
 */

export const phraseDictionary: Record<string, string> = {
  "a couple of": "beberapa / sepasang",
  "a little": "agak / sedikit",
  "a little bit": "sedikit / sikit",
  "a lot": "banyak",
  "a lot of": "banyak / pelbagai",
  "air conditioner": "penyaman udara / pendingin hawa (aircond)",
  "all right": "baiklah / okey",
  "all the way": "sepenuhnya / sampai habis",
  "as well": "juga / sekali",
  "as well as": "serta / di samping",
  "as you can see": "seperti yang anda dapat lihat",
  "as you know": "seperti yang anda tahu",
  "at the end": "di penghujung / di akhir",
  "at the very end": "di penghujung sekali",
  "brush my teeth": "gosok gigi / berus gigi",
  "brush teeth": "berus gigi / gosok gigi",
  "brush your teeth": "gosok gigi anda",
  "clean up": "kemas / bersihkan",
  "close to": "berdekatan dengan",
  "come with us": "datang dengan kami / ikutlah kami",
  "common mistakes": "kesilapan lazim / biasa",
  "comprehensible input": "input yang mudah difahami",
  "dining room": "ruang makan",
  "do the dishes": "cuci pinggan mangkuk",
  "do the laundry": "basuh baju / basuh pakaian",
  "doesn't have to": "tidak perlu / tak payah",
  "don't have to": "tidak perlu / tak payah",
  "dry off": "lap kering / mengeringkan",
  "each and every": "setiap satu / setiap bilik",
  "fall asleep": "tertidur / terlelap",
  "far away": "jauh",
  "first of all": "pertama sekali",
  "first time": "kali pertama",
  "first time here": "kali pertama di sini",
  "go to bed": "masuk tidur / tidur",
  "good enough": "cukup elok / memadai",
  "hang up": "gantungkan / sidai",
  "have to": "kena / perlu / terpaksa",
  "he's got": "dia ada",
  "here it is": "inilah dia",
  "here we go": "ini dia / jom kita mula",
  "here we have": "di sini kami ada / terdapat",
  "how to": "cara untuk / bagaimana nak",
  "i'll be": "saya akan",
  "i'll show you": "saya akan tunjukkan kepada anda",
  "i'll tell you": "saya akan beritahu anda",
  "i've got": "saya ada / aku ada",
  "in front of": "di hadapan / di depan",
  "in the beginning": "pada permulaan / di awal",
  "kind of": "agak / macam",
  "laundry room": "ruang dobi / bilik basuh baju",
  "less than": "kurang daripada",
  "let me know": "beritahu saya",
  "let's get started": "jom kita mulakan",
  "let's go": "jom pergi / mari kita pergi",
  "lie down": "baring / baringkan badan",
  "light switch": "suis lampu",
  "living room": "ruang tamu",
  "look at": "lihat / tengok",
  "look for": "cari / mencari",
  "lots of": "banyak",
  "make sure": "pastikan",
  "more than": "lebih daripada",
  "my daughter": "anak perempuan saya",
  "my family": "keluarga saya",
  "my husband": "suami saya",
  "my son": "anak lelaki saya",
  "my wife": "isteri saya",
  "next to": "di sebelah / bersebelahan",
  "on top of": "di atas / di bahagian atas",
  "on top of that": "selain itu / di samping itu",
  "out of": "keluar dari / kehabisan",
  "over here": "di sebelah sini",
  "over there": "di sebelah sana",
  "pick up": "ambil / angkat",
  "put away": "simpan semula / kemaskan",
  "right away": "serta-merta / terus",
  "right here": "di sebelah sini / betul-betul di sini",
  "shadowing segment": "segmen latihan sebutan (shadowing)",
  "shadowing segments": "segmen-segmen latihan sebutan",
  "she's got": "dia ada",
  "shoe rack": "rak kasut",
  "sit down": "duduk",
  "slow english": "bahasa Inggeris santai / perlahan",
  "sort of": "agak / seakan-akan",
  "stand up": "berdiri",
  "stick around": "tonton sampai habis / tunggu sebentar",
  "take a bath": "mandi tab",
  "take a look": "tengok / lihat sebentar",
  "take a shower": "mandi pancuran / mandi",
  "take out": "keluarkan / buang",
  "talk about": "bercakap tentang / bercerita pasal",
  "there are": "ada / terdapat",
  "there he is": "di situlah dia / di sana dia",
  "there is": "ada / terdapat",
  "there it is": "di situlah dia / itu dia",
  "there she is": "di situlah dia / di sana dia",
  "there will be": "akan ada",
  "there'll be": "akan ada",
  "there's": "ada / terdapat",
  "they'll be": "mereka akan",
  "they've got": "mereka ada",
  "this right here": "yang di sini / bahagian ini",
  "turn off": "padamkan / matikan (suis)",
  "turn on": "hidupkan / pasang (suis)",
  "up to": "sehingga / sampai",
  "used to": "pernah / dahulu",
  "wake up": "bangun tidur",
  "waking up": "sedang bangun tidur",
  "wash hands": "basuh tangan",
  "wash my hands": "basuh tangan saya",
  "wash the dishes": "basuh pinggan mangkuk",
  "wash your hands": "basuh tangan anda",
  "we'll be": "kami akan / kita akan",
  "we've got": "kami ada / kita ada",
  "welcome back": "selamat kembali / selamat pulang",
  "wipe down": "lap bersih / membersihkan",
  "without further ado": "tanpa berlengah lagi / tanpa buang masa",
  "you know": "awak tahu / seperti yang anda tahu",
  "you'll be": "anda akan",
  "you've got": "awak ada",
};

/**
 * Pembersih token perkataan sambil mengekalkan tanda koma atas/singkatan (cth: we'll, don't, wife's)
 */
export function cleanToken(token: string): string {
  return token
    .replace(/^[^\w']+|[^\w']+$/gu, "")
    .replace(/^'+|'+$/g, "")
    .trim()
    .toLowerCase();
}

/**
 * Mengesan jika perkataan yang ditekan adalah sebahagian daripada frasa di dalam ayat.
 * Menggunakan kaedah carian tetingkap N-gram (4-gram, 3-gram, 2-gram) di sekitar kedudukan perkataan.
 */
export function findMatchingPhrase(
  tokens: string[],
  clickedIndex: number
): { phrase: string; translation: string } | null {
  if (!tokens || tokens.length === 0 || clickedIndex < 0 || clickedIndex >= tokens.length) {
    return null;
  }

  const n = tokens.length;
  let bestMatch: { phrase: string; translation: string } | null = null;
  let bestLen = 0;

  // Semak dari 4 patah perkataan ke bawah (4-gram, 3-gram, 2-gram)
  for (const size of [4, 3, 2]) {
    const minStart = Math.max(0, clickedIndex - size + 1);
    const maxStart = Math.min(n - size, clickedIndex);

    for (let start = minStart; start <= maxStart; start++) {
      const windowTokens = tokens.slice(start, start + size).map(cleanToken);
      const candidatePhrase = windowTokens.join(" ");

      if (phraseDictionary[candidatePhrase]) {
        if (candidatePhrase.length > bestLen) {
          bestMatch = {
            phrase: candidatePhrase,
            translation: phraseDictionary[candidatePhrase],
          };
          bestLen = candidatePhrase.length;
        }
      }
    }
  }

  return bestMatch;
}
