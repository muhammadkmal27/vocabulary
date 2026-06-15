"use client";

import React from "react";

export function PromoSolution() {
  return (
    <section className="py-16 md:py-20 px-4 md:px-6 bg-white rounded-t-[3rem] -mt-8 relative z-10">
      <div className="max-w-5xl mx-auto">
        <h2 className="text-3xl md:text-4xl lg:text-5xl font-black text-center mb-6 text-slate-800">Tapi Terus Terang Saya Cakap !!!</h2>
        <h3 className="text-xl md:text-2xl font-bold text-center text-orange-500 mb-12 md:mb-16 bg-orange-100 px-4 py-2 md:px-6 md:py-2 rounded-full mx-auto block w-fit rotate-[-1deg]">Sistem Ini Hanya Sesuai Untuk...</h3>
        <div className="grid md:grid-cols-2 gap-4 md:gap-6" data-purpose="audience-list">
          <div className="flex items-center gap-4 p-4 md:p-5 bg-yellow-50 border-2 border-yellow-100 rounded-2xl md:rounded-3xl hover:scale-105 transition-transform">
            <div className="bg-yellow-200 p-2 rounded-full">
              <svg className="w-5 h-5 md:w-6 md:h-6 text-yellow-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path d="M5 13l4 4L19 7" strokeLinecap="round" strokeLinejoin="round" strokeWidth="3"></path>
              </svg>
            </div>
            <span className="font-bold text-slate-700 text-base md:text-lg">Orang yang nak jimat masa (hanya perlu 10 minit sehari)</span>
          </div>
          <div className="flex items-center gap-4 p-4 md:p-5 bg-orange-50 border-2 border-orange-100 rounded-2xl md:rounded-3xl hover:scale-105 transition-transform">
            <div className="bg-orange-200 p-2 rounded-full">
              <svg className="w-5 h-5 md:w-6 md:h-6 text-orange-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path d="M5 13l4 4L19 7" strokeLinecap="round" strokeLinejoin="round" strokeWidth="3"></path>
              </svg>
            </div>
            <span className="font-bold text-slate-700 text-base md:text-lg">Mereka yang susah nak ingat perkataan lepas dah baca</span>
          </div>
          <div className="flex items-center gap-4 p-4 md:p-5 bg-red-50 border-2 border-red-100 rounded-2xl md:rounded-3xl hover:scale-105 transition-transform">
            <div className="bg-red-200 p-2 rounded-full">
              <svg className="w-5 h-5 md:w-6 md:h-6 text-red-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path d="M5 13l4 4L19 7" strokeLinecap="round" strokeLinejoin="round" strokeWidth="3"></path>
              </svg>
            </div>
            <span className="font-bold text-slate-700 text-base md:text-lg">Sesiapa yang nak melancong &amp; perlukan bahasa asas cepat</span>
          </div>
          <div className="flex items-center gap-4 p-4 md:p-5 bg-yellow-50 border-2 border-yellow-100 rounded-2xl md:rounded-3xl hover:scale-105 transition-transform">
            <div className="bg-yellow-200 p-2 rounded-full">
              <svg className="w-5 h-5 md:w-6 md:h-6 text-yellow-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path d="M5 13l4 4L19 7" strokeLinecap="round" strokeLinejoin="round" strokeWidth="3"></path>
              </svg>
            </div>
            <span className="font-bold text-slate-700 text-base md:text-lg">Pelajar yang nak persediaan pantas untuk ujian bahasa</span>
          </div>
        </div>
        <div className="mt-12 md:mt-20 bg-red-500 text-white p-6 md:p-10 rounded-[2rem] md:rounded-[3rem] text-center shadow-2xl rotate-1 relative overflow-hidden">
          <div className="absolute -top-10 -left-10 w-24 h-24 md:w-32 md:h-32 bg-yellow-400 rounded-full mix-blend-screen opacity-50"></div>
          <div className="absolute -bottom-10 -right-10 w-28 h-28 md:w-40 md:h-40 bg-orange-400 rounded-full mix-blend-screen opacity-50"></div>
          <p className="text-lg md:text-2xl font-bold leading-relaxed relative z-10">
            Kalau anda jenis orang yang suka belajar benda praktikal dan terus nak nampak hasil, sistem <span className="bg-yellow-300 text-red-900 px-3 py-1 rounded-xl mx-1 inline-block rotate-[-2deg]">Spaced Repetition</span> ini memang &#39;ngam&#39;. Tak perlu tunggu jadi pakar teori!
          </p>
        </div>
      </div>
    </section>
  );
}
