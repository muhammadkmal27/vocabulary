"use client";

import { useEffect, useState } from "react";
import Image from "next/image";
import { X, Sparkles, HeartHandshake, Film, CheckCircle2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";

interface SpecialNoticeModalProps {
  isOpen?: boolean;
  onClose?: () => void;
}

export default function SpecialNoticeModal({
  isOpen = true,
  onClose,
}: SpecialNoticeModalProps) {
  const [open, setOpen] = useState(isOpen);

  useEffect(() => {
    setOpen(isOpen);
  }, [isOpen]);

  const handleClose = () => {
    setOpen(false);
    if (onClose) {
      onClose();
    }
  };

  if (!open) return null;

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-4 bg-black/80 backdrop-blur-sm animate-in fade-in duration-200"
      onClick={handleClose}
      role="dialog"
      aria-modal="true"
    >
      <div
        className="relative w-full max-w-xl max-h-[92vh] flex flex-col bg-card border border-emerald-500/30 rounded-3xl shadow-2xl overflow-hidden animate-in zoom-in-95 duration-200"
        onClick={(e) => e.stopPropagation()}
      >
        {/* TOP ACCENT BAR */}
        <div className="h-1.5 w-full bg-gradient-to-r from-emerald-500 via-teal-400 to-cyan-500" />

        {/* CLOSE BUTTON */}
        <button
          type="button"
          onClick={handleClose}
          aria-label="Tutup notis"
          className="absolute top-4 right-4 z-20 p-2 rounded-full bg-muted/80 hover:bg-muted text-muted-foreground hover:text-foreground transition-all shadow-sm focus:outline-none focus:ring-2 focus:ring-primary"
        >
          <X className="w-5 h-5" />
        </button>

        {/* SCROLLABLE MODAL CONTENT */}
        <div className="overflow-y-auto px-5 py-6 sm:px-7 sm:py-7 space-y-5">
          {/* HEADER BADGE & TITLE */}
          <div className="space-y-2 pr-8">
            <Badge className="bg-emerald-500/15 text-emerald-500 border border-emerald-500/30 font-semibold gap-1.5 py-1 px-3">
              <Sparkles className="w-3.5 h-3.5 fill-current" />
              Ciri Baharu (Special Feature)
            </Badge>
            <h3 className="text-xl sm:text-2xl font-extrabold tracking-tight text-foreground leading-snug">
              Selamat Datang ke Edisi Khas Ceramah Agama! 🌟
            </h3>
          </div>

          {/* STATUS KOLEKSI VIDEO */}
          <div className="p-3.5 sm:p-4 rounded-2xl bg-emerald-500/10 border border-emerald-500/20 text-xs sm:text-sm leading-relaxed space-y-1.5 text-foreground/90">
            <div className="flex items-center gap-2 font-bold text-emerald-500">
              <Film className="w-4 h-4 shrink-0" />
              <span>Koleksi Video Masih Baharu & Akan Terus Ditambah!</span>
            </div>
            <p>
              Ini merupakan <strong>ciri terbaharu</strong> di Bijak English, jadi pilihan video ceramah buat masa ini masih sedikit. Namun usah risau, pihak <strong>developer akan terus menambah lebih banyak siri ceramah agama antarabangsa secara berterusan ke depan</strong> untuk manfaat pembelajaran anda.
            </p>
          </div>

          {/* INSPIRASI DARI THREADS */}
          <div className="space-y-2.5">
            <div className="flex items-center gap-2 text-xs sm:text-sm font-bold text-foreground">
              <HeartHandshake className="w-4 h-4 text-primary shrink-0" />
              <span>Inspirasi Pembangunan Ciri Ini (Perkongsian Threads)</span>
            </div>
            <p className="text-xs text-muted-foreground leading-relaxed">
              Ciri ini dibangunkan khas kerana terinspirasi daripada perkongsian tular di Threads yang membincangkan rahsia lancar Bahasa Inggeris secara semulajadi dan berkesan:
            </p>

            {/* GAMBAR THREADS SCREENSHOT */}
            <div className="relative rounded-2xl overflow-hidden border border-border shadow-md bg-muted/40">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src="/special-inspiration.png"
                alt="Inspirasi Belajar English Melalui Ceramah Agama dari Threads"
                className="w-full h-auto object-contain block hover:scale-[1.01] transition-transform duration-300"
              />
            </div>
          </div>

          {/* KENAPA KAEDAH INI SANGAT BERKESAN */}
          <div className="space-y-2 pt-1">
            <h4 className="text-xs sm:text-sm font-bold text-foreground flex items-center gap-1.5">
              <span>💡</span> Mengapa Teknik Ini Sangat Terbukti & Berkesan?
            </h4>
            <div className="grid grid-cols-1 gap-2 text-xs sm:text-sm text-muted-foreground">
              <div className="flex items-start gap-2 bg-muted/40 p-2.5 rounded-xl border border-border/50">
                <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                <span>
                  <strong className="text-foreground">Sebutan Jelas & Beradab:</strong> Ceramah Mufti Menk menggunakan gaya bahasa antarabangsa yang tenang, artikulasi jelas, dan kosa kata sopan.
                </span>
              </div>
              <div className="flex items-start gap-2 bg-muted/40 p-2.5 rounded-xl border border-border/50">
                <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                <span>
                  <strong className="text-foreground">Dwi-Sari Kata Interaktif:</strong> Bantuan teks dwi-bahasa serentak membolehkan anda ketuk mana-mana perkataan untuk maksud terus Bahasa Melayu.
                </span>
              </div>
              <div className="flex items-start gap-2 bg-muted/40 p-2.5 rounded-xl border border-border/50">
                <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                <span>
                  <strong className="text-foreground">Dua Ganjaran Sekaligus:</strong> Niat belajar English tercapai, pahala mendengar tazkirah agama pun dapat. Insha-Allah dalam masa 2 bulan konsisten, kelancaran bertambah!
                </span>
              </div>
            </div>
          </div>

          {/* ACTION BUTTON */}
          <div className="pt-2">
            <Button
              onClick={handleClose}
              className="w-full py-5 text-sm sm:text-base font-bold bg-emerald-600 hover:bg-emerald-700 text-white rounded-2xl shadow-lg shadow-emerald-600/25 transition-all gap-2"
            >
              Faham & Mula Tonton Video Khas ✨
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
}

