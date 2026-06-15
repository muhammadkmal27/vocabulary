"use client";

import React from "react";

interface PromoHeroProps {
  onCTAClick: () => void;
}

export function PromoHero({ onCTAClick }: PromoHeroProps) {
  return (
    <section className="pt-12 pb-16 md:py-20 px-6 relative overflow-hidden">
      <div className="absolute top-20 left-10 w-48 h-48 md:w-64 md:h-64 bg-yellow-300 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-pulse"></div>
      <div className="absolute top-40 right-10 w-48 h-48 md:w-72 md:h-72 bg-red-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20"></div>
      <div className="max-w-4xl mx-auto text-center relative z-10">
        
        {/* Feature Badges */}
        <div className="flex flex-wrap justify-center gap-3 mb-10" data-purpose="hero-badges">
          <div className="flex items-center gap-2 px-5 py-2.5 bg-yellow-100 border-2 border-yellow-200 rounded-full shadow-sm rotate-[-2deg]">
            <svg className="w-5 h-5 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path d="M9.75 17L9 21l-1-1m5.25-1l1 1-1-1zM3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5"></path>
            </svg>
            <span className="text-sm font-bold text-yellow-800">100% Online</span>
          </div>
          <div className="flex items-center gap-2 px-5 py-2.5 bg-orange-100 border-2 border-orange-200 rounded-full shadow-sm rotate-[1deg]">
            <svg className="w-5 h-5 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5"></path>
            </svg>
            <span className="text-sm font-bold text-orange-800">Ingatan Kekal</span>
          </div>
          <div className="flex items-center gap-2 px-5 py-2.5 bg-red-100 border-2 border-red-200 rounded-full shadow-sm rotate-[-1deg]">
            <svg className="w-5 h-5 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5"></path>
            </svg>
            <span className="text-sm font-bold text-red-800">Spaced Repetition</span>
          </div>
        </div>

        {/* Main Headline */}
        <h1 className="text-4xl md:text-5xl lg:text-6xl font-black leading-tight tracking-tight mb-6 md:mb-8 text-slate-800">
          Kuasai Bahasa English <br /> Tanpa Perlu <span className="text-red-500 inline-block rotate-2 bg-yellow-200 px-3 py-1 rounded-xl">Menghafal</span> <br /> <span className="text-red-500">Kamus</span> Yang Membosankan
        </h1>
        <p className="text-base md:text-xl text-slate-600 max-w-[800px] mx-auto leading-relaxed mb-10 font-medium">
          Belajar cara ingat ayat lengkap secara automatik menggunakan sistem algoritma saintifik — supaya anda ingat sampai bila-bila!
        </p>

        {/* Benefits White Card */}
        <div className="max-w-2xl mx-auto bg-white border-4 border-amber-100 rounded-3xl p-6 md:p-10 text-left shadow-2xl shadow-amber-200/40 relative" data-purpose="benefits-card">
          <div className="absolute -top-4 -right-4 md:-top-6 md:-right-6 bg-yellow-300 text-yellow-900 font-black px-4 py-1.5 md:px-6 md:py-2 rounded-full rotate-12 shadow-lg text-sm md:text-base">Seronok Gila! 🚀</div>
          <h3 className="text-lg md:text-xl font-black mb-6 text-slate-800">Anda tak akan belajar teori grammar yang memeningkan. Anda akan dapat:</h3>
          <ul className="space-y-5">
            <li className="flex items-start gap-4">
              <span className="flex-shrink-0 mt-1 flex items-center justify-center w-8 h-8 rounded-full bg-red-100 text-red-500">
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path clipRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" fillRule="evenodd"></path>
                </svg>
              </span>
              <p className="font-bold text-base md:text-lg text-slate-700">Latihan interaktif yang direka khas untuk otak anda</p>
            </li>
            <li className="flex items-start gap-4">
              <span className="flex-shrink-0 mt-1 flex items-center justify-center w-8 h-8 rounded-full bg-orange-100 text-orange-500">
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path clipRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" fillRule="evenodd"></path>
                </svg>
              </span>
              <p className="font-bold text-base md:text-lg text-slate-700">Akses penuh ke semua bahasa antarabangsa serentak</p>
            </li>
            <li className="flex items-start gap-4">
              <span className="flex-shrink-0 mt-1 flex items-center justify-center w-8 h-8 rounded-full bg-yellow-100 text-yellow-600">
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path clipRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" fillRule="evenodd"></path>
                </svg>
              </span>
              <p className="font-bold text-base md:text-lg text-slate-700">Ulang kaji automatik yang mengesan kelemahan anda</p>
            </li>
          </ul>
        </div>

        <div className="mt-12 md:mt-16">
          <p className="text-slate-600 font-bold mb-6 md:mb-8 text-base md:text-lg">Sebab cara belajar yang betul bukan suruh anda hafal buku teks, tapi buat otak anda terbiasa dengan ayat perbualan sebenar.</p>
          <button 
            onClick={onCTAClick}
            className="bg-red-500 hover:bg-red-600 text-white font-black py-4 px-8 md:py-5 md:px-12 rounded-full shadow-xl shadow-red-500/30 transition-all transform hover:scale-105 hover:-rotate-1 text-lg md:text-xl border-b-4 border-red-700 w-full sm:w-auto"
          >
            Dapatkan Promo 1 Tahun
          </button>
          <p className="mt-6 text-sm text-slate-500 flex justify-center items-center gap-2 font-bold">
            <svg className="w-5 h-5 text-green-500" fill="currentColor" viewBox="0 0 20 20">
              <path clipRule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fillRule="evenodd"></path>
            </svg>
            Pembayaran Terjamin Selamat
          </p>
        </div>

      </div>
    </section>
  );
}
