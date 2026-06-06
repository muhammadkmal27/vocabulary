"use client";

import React from "react";
import { Check, Target } from "lucide-react";

export function PromoSolution() {
  return (
    <section className="w-full bg-[#FFF8F8] border-b border-[#F0DADA] pt-16 pb-16 px-4 md:pt-28 md:pb-24">
      <div className="max-w-4xl mx-auto w-full">
        
        <h2 className="text-[30px] sm:text-[38px] md:text-[50px] font-extrabold text-[#1A1A1A] leading-[1.05] tracking-tight text-center mb-8 md:mb-12">
          Tapi Terus Terang Saya Cakap !!!
        </h2>

        <div className="bg-white p-[22px] md:p-10 rounded-[18px] md:rounded-3xl border-t-8 border-[#A83232] shadow-sm flex flex-col">
          
          <h2 className="text-[20px] md:text-[24px] font-extrabold uppercase flex flex-col sm:flex-row items-center sm:items-start gap-3 sm:gap-4 mb-6 md:mb-8 text-[#1A1A1A] leading-[1.25] text-center sm:text-left">
            <div className="w-[42px] h-[42px] md:w-12 md:h-12 bg-[#F8EAEA] rounded-lg flex items-center justify-center shrink-0">
              <Target className="w-6 h-6 text-[#A83232]" />
            </div>
            Sistem Ini Hanya Sesuai Untuk...
          </h2>

          <ul className="list-none grow mb-8 space-y-4">
            {[
              "Orang yang nak jimat masa (hanya perlu 10 minit sehari)",
              "Mereka yang susah nak ingat perkataan lepas dah baca",
              "Sesiapa yang nak melancong dan perlukan bahasa asas dengan cepat",
              "Pelajar yang nak persediaan pantas untuk ujian bahasa",
              "Pekerja profesional yang nak tambah nilai resume dengan bahasa asing",
              "Beginner yang bermula dari zero dan perlukan susunan yang sistematik",
              "Mereka yang dah penat hafal teori grammar yang memeningkan",
              "Orang yang nak sistem ulangkaji secara automatik (AI uruskan bila anda patut ulang)"
            ].map((item, i) => (
              <li key={i} className="flex items-start gap-3 md:gap-4 font-medium text-[15px] md:text-[16px] text-[#555555] leading-[1.55]">
                <Check className="w-[18px] h-[18px] text-[#A83232] shrink-0 mt-[3px] opacity-80" />
                <span>{item}</span>
              </li>
            ))}
          </ul>

          <div className="bg-[#F8EAEA] p-4 md:p-6 rounded-[14px] md:rounded-2xl font-bold text-[#7F1D1D] border border-[#F0DADA] leading-[1.55] text-[15px] md:text-[16px]">
            Kalau anda jenis orang yang suka belajar benda praktikal dan terus nak nampak hasil, sistem Spaced Repetition ini memang 'ngam'. Tak perlu tunggu jadi pakar teori, tak perlu buang masa hafal kamus.
          </div>
        </div>

      </div>
    </section>
  );
}
