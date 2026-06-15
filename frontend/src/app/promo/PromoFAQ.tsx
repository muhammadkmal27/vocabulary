"use client";

import React from "react";

interface FAQItem {
  question: string;
  answer: string;
}

const FAQS: FAQItem[] = [
  {
    question: "Apakah itu aplikasi Vocabulary?",
    answer: "Vocabulary adalah aplikasi pembelajaran bahasa moden yang memfokuskan kepada hafalan ayat lengkap, bukannya perkataan tunggal secara rawak. Ini membantu pengguna memahami tatabahasa (grammar) dan konteks dengan lebih cepat."
  },
  {
    question: "Bagaimanakah kaedah Spaced Repetition berfungsi?",
    answer: "Kaedah Spaced Repetition (Sistem Pengulangan Berjarak) akan menguji anda dengan perkataan/ayat yang hampir anda lupakan pada sela masa yang dikira secara saintifik. Soalan yang anda tersalah jawab akan diulang dengan lebih kerap sehingga ia kekal dalam memori jangka panjang."
  },
  {
    question: "Adakah terdapat sebarang caj bulanan tersembunyi?",
    answer: "Tiada sama sekali. Pakej Promo 1 Tahun membolehkan anda membuat sekali sahaja pembayaran bernilai RM100 untuk akses penuh selama setahun tanpa sebarang caj tersembunyi mahupun komitmen bulanan."
  },
  {
    question: "Adakah pembayaran ini selamat?",
    answer: "Ya, sangat selamat. Kami menggunakan gateway pembayaran Stripe (Standard Antarabangsa) dan ToyyibPay (Standard Tempatan FPX Malaysia) yang disokong oleh enkripsi SSL ketat untuk menjamin keselamatan transaksi anda."
  },
  {
    question: "Boleh saya gunakan aplikasi ini di telefon pintar?",
    answer: "Ya! Aplikasi ini adalah 100% responsif dan dioptimumkan sepenuhnya untuk pelayar mudah alih (Safari, Chrome) pada iOS dan Android. Anda boleh terus belajar di mana sahaja pada bila-bila masa."
  }
];

export function PromoFAQ() {
  return (
    <section className="py-16 md:py-20 px-4 md:px-6 bg-white rounded-t-[3rem] -mt-8 relative z-40">
      <div className="max-w-3xl mx-auto">
        <h2 className="text-3xl md:text-4xl font-black text-center mb-10 md:mb-16 text-slate-800">Soalan Lazim (FAQ) 🤔</h2>
        <div className="space-y-4 md:space-y-6" data-purpose="faq-accordion">
          {FAQS.map((faq, idx) => (
            <details key={idx} className="group bg-amber-50 rounded-[1.5rem] md:rounded-[2rem] border-4 border-amber-100 p-4 md:p-6 shadow-sm cursor-pointer hover:border-yellow-300 transition-colors" open={idx === 0}>
              <summary className="flex justify-between items-center font-black text-lg md:text-xl list-none text-slate-800">
                {faq.question}
                <span className="bg-yellow-200 text-yellow-800 p-1.5 md:p-2 rounded-full transition-transform group-open:rotate-180 flex-shrink-0 ml-4">
                  <svg className="w-5 h-5 md:w-6 md:h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path d="M19 9l-7 7-7-7" strokeLinecap="round" strokeLinejoin="round" strokeWidth="3"></path>
                  </svg>
                </span>
              </summary>
              <p className="mt-4 md:mt-6 text-slate-600 font-medium leading-relaxed bg-white p-4 md:p-6 rounded-xl md:rounded-2xl text-sm md:text-base">
                {faq.answer}
              </p>
            </details>
          ))}
        </div>
      </div>
    </section>
  );
}
