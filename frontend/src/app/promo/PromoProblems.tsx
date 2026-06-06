"use client";

import React from "react";
import { Terminal, XCircle } from "lucide-react";

export function PromoProblems() {
  return (
    <section className="w-full bg-white border-b border-[#F0DADA] pt-16 pb-16 px-4 md:pt-28 md:pb-20">
      <div className="max-w-4xl mx-auto w-full">
        
        {/* Header Section */}
        <h2 className="text-center text-[28px] sm:text-[34px] md:text-[42px] font-extrabold text-[#1A1A1A] uppercase tracking-[-0.04em] leading-[1.1] mb-6">
          Ramai Dah Cuba Belajar Bahasa Sendiri… Tapi Akhirnya <span className="text-[#A83232]">"Bosan & Cepat Lupa"</span>
        </h2>
        
        <p className="text-center text-base md:text-lg font-medium text-[#555555] mb-10 max-w-2xl mx-auto">
          Saya tahu ramai yang dah muat turun macam-macam aplikasi percuma dan beli buku panduan tebal-tebal.
        </p>
        
        {/* Terminal Box */}
        <div className="bg-[#FFF8F8] border border-[#F0DADA] rounded-[18px] p-5 md:p-[30px] font-mono text-sm md:text-[15px] text-[#1A1A1A] max-w-[720px] mx-auto shadow-sm mb-12">
          <div className="flex items-center gap-2 mb-4 pb-3 border-b border-dashed border-[#F0DADA]">
            <Terminal className="w-4 h-4 text-[#A83232]" />
            <span className="text-xs font-bold uppercase tracking-[0.1em] text-[#7F1D1D]">Ini Cara Belajar Yang Anda Biasa Buat</span>
          </div>
          <div className="flex flex-col gap-3 font-medium">
            <div><span className="text-[#A83232] font-bold mr-2">&gt;</span> Beli buku grammar yang tebal dan cuba hafal formula.</div>
            <div><span className="text-[#A83232] font-bold mr-2">&gt;</span> Guna aplikasi percuma tapi cuma main game teka gambar.</div>
            <div><span className="text-[#A83232] font-bold mr-2">&gt;</span> Tulis perkataan baru berulang kali dalam buku nota.</div>
            <div><span className="text-[#A83232] font-bold mr-2">&gt;</span> Tengok movie tanpa subtitle, tapi sepatah pun tak faham.</div>
            <div><span className="text-[#A83232] font-bold mr-2">&gt;</span> Bila cuba bercakap, otak *blank* dan terus senyap.</div>
          </div>
        </div>

        {/* Transition Text */}
        <div className="text-center text-xl md:text-[22px] font-extrabold text-[#1A1A1A] mb-8">
          Tapi bila tengok hasil dia selepas sebulan…
        </div>

        {/* Problem Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 max-w-[860px] mx-auto mb-14">
          {[
            "Ingat sekejap, lusa dah lupa balik",
            "Boleh faham sikit bila baca, tapi tak boleh sebut",
            "Terlalu banyak rules grammar nak kena ingat",
            "Takde motivasi sebab asyik ulang silap yang sama",
            "Rasa buang masa main game tapi tak boleh bina ayat",
            "Tak yakin nak praktis cakap dengan orang sebenar"
          ].map((problem, i) => (
            <div 
              key={i} 
              className="flex items-center gap-3 p-4 md:px-[22px] md:py-[16px] bg-white border border-[#A83232]/20 rounded-2xl shadow-[0_10px_24px_rgba(168,50,50,0.05)] hover:-translate-y-0.5 hover:shadow-[0_16px_30px_rgba(168,50,50,0.1)] hover:border-[#A83232]/40 transition-all duration-250 relative overflow-hidden"
            >
              <div className="absolute left-0 top-[18%] bottom-[18%] w-1 bg-[#A83232] rounded-full opacity-75"></div>
              <div className="w-[28px] h-[28px] rounded-full bg-[#F8EAEA] text-[#A83232] flex items-center justify-center shrink-0">
                <XCircle className="w-4 h-4" />
              </div>
              <span className="text-[15px] md:text-[15.5px] font-bold leading-tight text-[#1A1A1A]">
                {problem}
              </span>
            </div>
          ))}
        </div>

        {/* Realization Insight Box */}
        <div className="text-center text-lg md:text-xl font-medium text-[#555555] mb-8 space-y-2">
          <p>Benda ni memang boleh buat stres walaupun anda dah luang berjam-jam masa!!</p>
          <p>Sebab dalam kepala kita, <span className="font-bold text-[#1A1A1A]">kita expect asalkan kita rajin membaca, kita akan pandai.</span></p>
          <p className="font-extrabold text-2xl text-[#1A1A1A] pt-4">Tapi realitinya, otak kita tak direka untuk "menghafal" kamus.</p>
        </div>

        <div className="max-w-[860px] mx-auto bg-[#F8EAEA] border border-[#F0DADA] rounded-2xl overflow-hidden shadow-[0_8px_22px_rgba(168,50,50,0.06)] flex">
          <div className="w-1.5 md:w-2 bg-[#A83232] shrink-0"></div>
          <div className="p-5 md:px-[36px] md:py-[26px]">
            <p className="text-[15.5px] md:text-[16.5px] leading-relaxed text-[#1A1A1A] mb-3">
              <strong>Kalau teknik belajar salah</strong>, hasil dia pun lambat.
            </p>
            <p className="text-[15.5px] md:text-[16.5px] leading-relaxed text-[#1A1A1A] mb-3">
              <strong>Kalau struktur pembelajaran berterabur</strong>, otak tak dapat tangkap '*pattern*' bahasa tu.
            </p>
            <p className="text-[15.5px] md:text-[16.5px] leading-relaxed text-[#1A1A1A]">
              <strong>Kalau tak ulang kaji ikut *timing* yang tepat</strong>, segala yang dipelajari semalam akan hilang hari ini.
            </p>
          </div>
        </div>

      </div>
    </section>
  );
}
