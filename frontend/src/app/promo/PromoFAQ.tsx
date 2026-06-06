"use client";

import React, { useState } from "react";
import { HelpCircle, ChevronDown, ChevronUp } from "lucide-react";

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
  const [openIdx, setOpenIdx] = useState<number | null>(null);

  const toggle = (idx: number) => {
    setOpenIdx(openIdx === idx ? null : idx);
  };

  return (
    <div className="w-full max-w-2xl mx-auto space-y-4">
      <div className="flex items-center gap-2 mb-6 justify-center">
        <HelpCircle className="w-5 h-5 text-primary" />
        <h3 className="text-xl sm:text-2xl font-bold">Soalan Lazim (FAQ)</h3>
      </div>

      <div className="space-y-3">
        {FAQS.map((faq, idx) => {
          const isOpen = openIdx === idx;
          return (
            <div
              key={idx}
              className="border border-border rounded-xl bg-card overflow-hidden transition-all duration-200"
            >
              <button
                onClick={() => toggle(idx)}
                className="w-full px-5 py-4 flex items-center justify-between text-left font-semibold text-sm sm:text-base hover:bg-muted/30 transition-colors"
              >
                <span>{faq.question}</span>
                {isOpen ? (
                  <ChevronUp className="w-4 h-4 text-primary shrink-0 ml-3" />
                ) : (
                  <ChevronDown className="w-4 h-4 text-muted-foreground shrink-0 ml-3" />
                )}
              </button>
              
              <div
                className={`transition-all duration-300 overflow-hidden ${
                  isOpen ? "max-h-[500px] border-t border-border/50" : "max-h-0"
                }`}
              >
                <div className="p-5 text-sm text-muted-foreground leading-relaxed">
                  {faq.answer}
                </div>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
