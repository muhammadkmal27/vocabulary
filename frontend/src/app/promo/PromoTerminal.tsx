"use client";

import React from "react";

export function PromoTerminal() {
  return (
    <div className="w-full max-w-2xl mx-auto rounded-xl border border-zinc-800 bg-zinc-950 shadow-2xl font-mono text-xs sm:text-sm text-zinc-300 overflow-hidden animate-fadeIn">
      {/* Terminal Header */}
      <div className="bg-zinc-900 px-4 py-3 border-b border-zinc-800 flex items-center justify-between">
        <div className="flex items-center gap-1.5">
          <div className="w-3 h-3 rounded-full bg-red-500/80" />
          <div className="w-3 h-3 rounded-full bg-yellow-500/80" />
          <div className="w-3 h-3 rounded-full bg-green-500/80" />
        </div>
        <div className="text-zinc-500 font-medium">Struggling_Student_Log.sh</div>
        <div className="w-10" />
      </div>

      {/* Terminal Body */}
      <div className="p-5 space-y-3.5 leading-relaxed overflow-x-auto">
        <div className="flex gap-2">
          <span className="text-zinc-500 shrink-0">$</span>
          <span className="text-violet-400">run learning_habits.py</span>
        </div>
        
        <div className="flex items-start gap-2 text-red-400">
          <span className="text-red-500 shrink-0">[ERROR]</span>
          <span>Menggunakan kaedah hafal kamus tradisional: Membosankan & cepat mengantuk.</span>
        </div>

        <div className="flex items-start gap-2 text-yellow-400">
          <span className="text-yellow-500 shrink-0">[WARN]</span>
          <span>Ebbinghaus Forgetting Curve: Lupa 80% perkataan baru selepas 24 jam pertama!</span>
        </div>

        <div className="flex items-start gap-2 text-red-400">
          <span className="text-red-500 shrink-0">[ERROR]</span>
          <span>Kurang konsisten kerana sibuk bekerja. Tiada masa belajar buku tebal 2 jam sehari.</span>
        </div>

        <div className="flex items-start gap-2 text-yellow-400">
          <span className="text-yellow-500 shrink-0">[WARN]</span>
          <span>Membazir RM200+ untuk seminar/aplikasi premium global yang tidak mesra penutur BM.</span>
        </div>

        <div className="flex items-start gap-2 text-blue-400">
          <span className="text-blue-500 shrink-0">[INFO]</span>
          <span>Mencari sistem pembelajaran saintifik (Spaced Repetition & Micro-learning)...</span>
        </div>

        <div className="flex items-start gap-2 text-green-400 border-t border-zinc-800/60 pt-3 font-semibold">
          <span className="text-green-500 shrink-0">[SUCCESS]</span>
          <span>Sistem Vocabulary ditemui: Mula hafal 20 ayat sehari secara interaktif & konsisten!</span>
        </div>
      </div>
    </div>
  );
}
