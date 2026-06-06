"use client";

import React from "react";
import { CheckCircle2, MonitorSmartphone, TrendingUp, ArrowRight, ShieldCheck } from "lucide-react";

interface PromoHeroProps {
  onCTAClick: () => void;
}

export function PromoHero({ onCTAClick }: PromoHeroProps) {
  return (
    <section className="w-full bg-[#FFF8F8] border-b border-[#F0DADA] pt-12 pb-16 px-4 md:pt-24 md:pb-28">
      <div className="max-w-4xl mx-auto w-full flex flex-col items-center justify-center gap-10">
        
        {/* Content */}
        <div className="w-full flex flex-col items-center gap-8 text-center">
          
          {/* Badges */}
          <div className="flex flex-wrap justify-center gap-2.5">
            <span className="inline-flex items-center gap-1.5 px-3.5 py-1.5 text-[13px] font-bold bg-white text-[#7F1D1D] border border-[#F0DADA] rounded-full shadow-sm">
              <MonitorSmartphone className="w-4 h-4" />
              100% Online
            </span>
            <span className="inline-flex items-center gap-1.5 px-3.5 py-1.5 text-[13px] font-bold bg-white text-[#7F1D1D] border border-[#F0DADA] rounded-full shadow-sm">
              <TrendingUp className="w-4 h-4" />
              Ingatan Kekal
            </span>
            <span className="inline-flex items-center gap-1.5 px-3.5 py-1.5 text-[13px] font-bold bg-white text-[#7F1D1D] border border-[#F0DADA] rounded-full shadow-sm">
              <ShieldCheck className="w-4 h-4" />
              Spaced Repetition
            </span>
          </div>

          {/* Headline */}
          <h1 className="text-4xl sm:text-5xl md:text-[56px] font-extrabold text-[#1A1A1A] leading-[1.1] tracking-tight max-w-3xl">
            Kuasai Bahasa English Tanpa Perlu <span className="text-[#A83232]">Menghafal Kamus</span> Yang Membosankan
          </h1>

          {/* Subheadline */}
          <p className="text-lg md:text-xl font-medium text-[#555555] leading-relaxed max-w-2xl mx-auto">
            Belajar cara ingat ayat lengkap secara automatik menggunakan sistem algoritma saintifik — supaya anda ingat sampai bila-bila, bukan sekadar hafal untuk lulus periksa.
          </p>

          {/* Supporting Box */}
          <div className="bg-white p-6 md:p-8 rounded-2xl border border-[#F0DADA] shadow-sm text-left max-w-2xl w-full mx-auto mt-2">
            <p className="font-bold text-[#1A1A1A] mb-4 text-[17px]">
              Anda tak akan belajar teori grammar yang memeningkan. Anda akan dapat:
            </p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 font-semibold text-[#333]">
                <CheckCircle2 className="w-5 h-5 text-[#A83232] shrink-0 mt-0.5" />
                <span>1. Latihan interaktif yang direka khas untuk otak anda</span>
              </li>
              <li className="flex items-start gap-3 font-semibold text-[#333]">
                <CheckCircle2 className="w-5 h-5 text-[#A83232] shrink-0 mt-0.5" />
                <span>2. Akses penuh ke semua bahasa antarabangsa serentak</span>
              </li>
              <li className="flex items-start gap-3 font-semibold text-[#333]">
                <CheckCircle2 className="w-5 h-5 text-[#A83232] shrink-0 mt-0.5" />
                <span>3. Ulang kaji automatik yang mengesan kelemahan anda</span>
              </li>
            </ul>
            <p className="text-[15px] text-[#555555] mt-6 pt-5 border-t border-[#F8EAEA] font-medium leading-relaxed">
              Sebab cara belajar yang betul bukan suruh anda hafal buku teks, tapi buat otak anda terbiasa dengan ayat perbualan sebenar.
            </p>
          </div>

          {/* CTA & Microcopy */}
          <div className="mt-6 w-full max-w-[380px] mx-auto">
            <button 
              onClick={onCTAClick}
              className="w-full inline-flex items-center justify-center gap-2 bg-[#A83232] hover:bg-[#7F1D1D] hover:-translate-y-0.5 transition-all duration-300 text-white px-8 py-5 rounded-full font-bold text-[19px] shadow-[0_10px_20px_-10px_rgba(168,50,50,0.5)] border-none cursor-pointer"
            >
              Dapatkan Promo 1 Tahun <ArrowRight className="w-5 h-5" />
            </button>
            <p className="text-sm font-bold text-[#7F1D1D] mt-4 flex items-center justify-center gap-1.5">
              <ShieldCheck className="w-4 h-4" /> Pembayaran Terjamin Selamat
            </p>
          </div>

        </div>
      </div>
    </section>
  );
}
