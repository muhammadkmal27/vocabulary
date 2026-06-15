"use client";

import React from "react";

export function PromoProblems() {
  return (
    <section className="bg-amber-100/50 py-16 md:py-20 px-4 md:px-6 rounded-t-[3rem] border-t-4 border-white">
      <div className="max-w-5xl mx-auto">
        <h2 className="text-3xl md:text-4xl lg:text-5xl font-black text-center mb-8 md:mb-12 text-slate-800">Ramai Dah Cuba Belajar Sendiri… <br /><span className="text-red-500">Tapi Akhirnya &quot;Bosan &amp; Cepat Lupa&quot;</span></h2>
        <p className="text-center text-slate-600 mb-12 md:mb-16 text-lg md:text-xl font-bold max-w-3xl mx-auto">Saya tahu ramai yang dah muat turun macam-macam aplikasi percuma dan beli buku panduan tebal-tebal.</p>
        <div className="grid md:grid-cols-2 gap-12 items-start">
          
          {/* Left: Current way */}
          <div className="space-y-4 md:space-y-6 md:mt-8">
            <h4 className="font-black text-slate-800 mb-4 md:mb-6 uppercase tracking-wider text-base md:text-lg bg-yellow-200 inline-block px-4 py-2 rounded-2xl rotate-[-2deg]">Ini Cara Biasa</h4>
            <blockquote className="p-4 md:p-6 bg-white border-2 border-slate-100 rounded-3xl shadow-md text-slate-600 font-bold rotate-1 hover:rotate-0 transition-transform text-sm md:text-base">
              &quot;Beli buku grammar yang tebal dan cuba hafal formula.&quot;
            </blockquote>
            <blockquote className="p-4 md:p-6 bg-white border-2 border-slate-100 rounded-3xl shadow-md text-slate-600 font-bold -rotate-1 hover:rotate-0 transition-transform text-sm md:text-base">
              &quot;Guna aplikasi percuma tapi cuma main game teka gambar.&quot;
            </blockquote>
            <blockquote className="p-4 md:p-6 bg-white border-2 border-slate-100 rounded-3xl shadow-md text-slate-600 font-bold rotate-1 hover:rotate-0 transition-transform text-sm md:text-base">
              &quot;Tulis perkataan baru berulang kali dalam buku nota.&quot;
            </blockquote>
          </div>

          {/* Right: Results */}
          <div className="space-y-4 md:space-y-6 mt-8 md:mt-0">
            <h4 className="font-black text-red-500 mb-4 md:mb-6 uppercase tracking-wider text-base md:text-lg bg-red-100 inline-block px-4 py-2 rounded-2xl rotate-[2deg]">Hasilnya Selepas Sebulan…</h4>
            <div className="p-4 md:p-6 bg-red-50 border-2 border-red-200 text-red-800 rounded-3xl flex items-center gap-4 font-bold shadow-sm -rotate-1 text-sm md:text-base">
              <div className="bg-red-200 p-2 rounded-full">
                <svg className="w-5 h-5 md:w-6 md:h-6 flex-shrink-0 text-red-600" fill="currentColor" viewBox="0 0 20 20">
                  <path clipRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" fillRule="evenodd"></path>
                </svg>
              </div>
              Ingat sekejap, lusa dah lupa balik
            </div>
            <div className="p-4 md:p-6 bg-red-50 border-2 border-red-200 text-red-800 rounded-3xl flex items-center gap-4 font-bold shadow-sm rotate-1 text-sm md:text-base">
              <div className="bg-red-200 p-2 rounded-full">
                <svg className="w-5 h-5 md:w-6 md:h-6 flex-shrink-0 text-red-600" fill="currentColor" viewBox="0 0 20 20">
                  <path clipRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" fillRule="evenodd"></path>
                </svg>
              </div>
              Boleh faham sikit bila baca, tapi tak boleh sebut
            </div>
            <div className="p-4 md:p-6 bg-red-50 border-2 border-red-200 text-red-800 rounded-3xl flex items-center gap-4 font-bold shadow-sm -rotate-1 text-sm md:text-base">
              <div className="bg-red-200 p-2 rounded-full">
                <svg className="w-5 h-5 md:w-6 md:h-6 flex-shrink-0 text-red-600" fill="currentColor" viewBox="0 0 20 20">
                  <path clipRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" fillRule="evenodd"></path>
                </svg>
              </div>
              Terlalu banyak rules grammar nak kena ingat
            </div>
          </div>
        </div>

        <div className="mt-12 md:mt-16 text-center space-y-4 md:space-y-6">
          <p className="text-xl md:text-2xl font-black text-red-500 uppercase bg-white inline-block px-6 py-3 md:px-8 md:py-4 rounded-[2rem] shadow-lg rotate-1">Benda ni memang boleh buat stres!! 😫</p>
          <p className="text-slate-700 text-lg md:text-xl font-bold leading-relaxed max-w-2xl mx-auto mt-6 md:mt-8">
            Sebab dalam kepala kita, kita expect asalkan kita rajin membaca, kita akan pandai. 
            Tapi realitinya, otak kita tak direka untuk &quot;menghafal&quot; kamus.
          </p>
        </div>
      </div>
    </section>
  );
}
