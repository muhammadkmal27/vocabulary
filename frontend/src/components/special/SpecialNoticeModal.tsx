"use client";

import { useEffect, useState, useRef } from "react";
import {
  X,
  ChevronLeft,
  ChevronRight,
  Sparkles,
  Film,
  HeartHandshake,
  CheckCircle2,
  Lock,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";

interface SpecialNoticeModalProps {
  isOpen?: boolean;
  onClose?: () => void;
}

export default function SpecialNoticeModal({
  isOpen = false,
  onClose,
}: SpecialNoticeModalProps) {
  const [open, setOpen] = useState(isOpen);
  const [currentSlide, setCurrentSlide] = useState(0);
  const [hasReachedEnd, setHasReachedEnd] = useState(false);

  // Touch swipe support
  const touchStartX = useRef<number | null>(null);
  const touchEndX = useRef<number | null>(null);

  const TOTAL_SLIDES = 3;

  useEffect(() => {
    setOpen(isOpen);
    if (isOpen) {
      setCurrentSlide(0);
      setHasReachedEnd(false);
    }
  }, [isOpen]);

  const handleNext = () => {
    if (currentSlide < TOTAL_SLIDES - 1) {
      const next = currentSlide + 1;
      setCurrentSlide(next);
      if (next === TOTAL_SLIDES - 1) {
        setHasReachedEnd(true);
      }
    }
  };

  const handlePrev = () => {
    if (currentSlide > 0) {
      setCurrentSlide(currentSlide - 1);
    }
  };

  const handleClose = () => {
    // Button pangkah tidak boleh ditekan sehingga user habiskan swipe
    if (!hasReachedEnd) return;
    setOpen(false);
    if (onClose) onClose();
  };

  // Touch event handlers for mobile swipe
  const handleTouchStart = (e: React.TouchEvent) => {
    touchStartX.current = e.targetTouches[0].clientX;
  };

  const handleTouchMove = (e: React.TouchEvent) => {
    touchEndX.current = e.targetTouches[0].clientX;
  };

  const handleTouchEnd = () => {
    if (touchStartX.current === null || touchEndX.current === null) return;
    const distance = touchStartX.current - touchEndX.current;
    const isLeftSwipe = distance > 45;
    const isRightSwipe = distance < -45;

    if (isLeftSwipe) {
      handleNext();
    } else if (isRightSwipe) {
      handlePrev();
    }

    touchStartX.current = null;
    touchEndX.current = null;
  };

  if (!open) return null;

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-4 bg-black/85 backdrop-blur-md animate-in fade-in duration-200"
      onClick={hasReachedEnd ? handleClose : undefined}
      role="dialog"
      aria-modal="true"
    >
      {/* OUTER TABLET / FRAME WRAPPER (MIRRORING TOYYIBPAY NOTIS STYLE) */}
      <div
        className="relative w-full max-w-[540px] bg-slate-900/95 border-2 border-slate-700/80 p-2 sm:p-3 rounded-[28px] sm:rounded-[32px] shadow-2xl animate-in zoom-in-95 duration-200 select-none"
        onClick={(e) => e.stopPropagation()}
        onTouchStart={handleTouchStart}
        onTouchMove={handleTouchMove}
        onTouchEnd={handleTouchEnd}
      >
        {/* CLOSE BUTTON (X) - LOCKED / DISABLED UNTIL USER FINISHES SWIPING */}
        <button
          type="button"
          onClick={handleClose}
          disabled={!hasReachedEnd}
          aria-label={
            hasReachedEnd
              ? "Tutup notis"
              : "Sila swipe hingga halaman akhir untuk menutup"
          }
          title={
            hasReachedEnd
              ? "Tutup notis"
              : "Sila swipe hingga ke slide akhir (3/3) untuk membuka butang pangkah"
          }
          className={`absolute -top-3 -right-3 z-40 p-2 sm:p-2.5 rounded-full border shadow-xl transition-all duration-300 ${
            hasReachedEnd
              ? "bg-slate-800 hover:bg-slate-700 text-white border-slate-600 cursor-pointer hover:scale-105 active:scale-95 ring-2 ring-emerald-500/50"
              : "bg-slate-800/80 text-slate-500 border-slate-700/50 cursor-not-allowed opacity-60"
          }`}
        >
          {hasReachedEnd ? (
            <X className="w-4 h-4 sm:w-5 h-5 stroke-[2.5]" />
          ) : (
            <div className="relative">
              <X className="w-4 h-4 sm:w-5 h-5 opacity-40" />
              <Lock className="w-2.5 h-2.5 text-amber-400 absolute -bottom-1 -right-1" />
            </div>
          )}
        </button>

        {/* NAVIGATION ARROW LEFT */}
        {currentSlide > 0 && (
          <button
            type="button"
            onClick={handlePrev}
            aria-label="Slide sebelumnya"
            className="absolute -left-3 sm:-left-4 top-1/2 -translate-y-1/2 z-30 p-2 sm:p-2.5 rounded-full bg-slate-800/90 hover:bg-slate-700 text-white border border-slate-600/80 shadow-xl transition-all hover:scale-110 active:scale-95"
          >
            <ChevronLeft className="w-4 h-4 sm:w-5 sm:h-5 stroke-[2.5]" />
          </button>
        )}

        {/* NAVIGATION ARROW RIGHT */}
        {currentSlide < TOTAL_SLIDES - 1 && (
          <button
            type="button"
            onClick={handleNext}
            aria-label="Slide seterusnya"
            className="absolute -right-3 sm:-right-4 top-1/2 -translate-y-1/2 z-30 p-2 sm:p-2.5 rounded-full bg-slate-800/90 hover:bg-slate-700 text-white border border-slate-600/80 shadow-xl transition-all hover:scale-110 active:scale-95"
          >
            <ChevronRight className="w-4 h-4 sm:w-5 sm:h-5 stroke-[2.5]" />
          </button>
        )}

        {/* INNER SCREEN CARD (NO INTERNAL SCROLLING - FITS PERFECTLY IN MOBILE & DESKTOP) */}
        <div className="relative w-full h-[390px] sm:h-[410px] bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950 text-white rounded-[20px] sm:rounded-[24px] border border-slate-800 overflow-hidden flex flex-col justify-between p-4 sm:p-6">
          {/* SLIDE 1: CIRI BAHARU & PENAMBAHAN VIDEO BERTERUSAN */}
          {currentSlide === 0 && (
            <div className="h-full flex flex-col justify-between animate-in fade-in slide-in-from-right-4 duration-250">
              <div className="space-y-3">
                <div className="flex items-center justify-between">
                  <Badge className="bg-emerald-500/20 text-emerald-400 border border-emerald-500/30 text-[11px] sm:text-xs py-1 px-2.5 font-bold gap-1">
                    <Sparkles className="w-3.5 h-3.5 fill-current" />
                    Ciri Baharu (Edisi Khas)
                  </Badge>
                  <span className="text-[11px] font-semibold text-slate-400 bg-slate-800/80 px-2 py-0.5 rounded-full">
                    Slide 1 / 3
                  </span>
                </div>

                <h3 className="text-lg sm:text-2xl font-black tracking-tight text-white leading-tight">
                  Siri Khas Ceramah Agama Dwi-Bahasa! 🌟
                </h3>

                <div className="p-3 sm:p-4 rounded-xl bg-slate-800/50 border border-slate-700/60 space-y-2">
                  <div className="flex items-center gap-2 text-xs sm:text-sm font-bold text-emerald-400">
                    <Film className="w-4 h-4 shrink-0" />
                    <span>Video Masih Sedikit & Terus Ditambah!</span>
                  </div>
                  <p className="text-[11px] sm:text-xs leading-relaxed text-slate-300">
                    Ini adalah <strong>feature yang baru diperkenalkan</strong>,
                    jadi koleksi video buat masa ini masih sedikit.
                  </p>
                  <p className="text-[11px] sm:text-xs leading-relaxed text-slate-300">
                    Namun jangan bimbang,{" "}
                    <strong className="text-emerald-300">
                      pihak developer akan terus menambah siri ceramah agama
                      antarabangsa secara berterusan ke hadapan
                    </strong>{" "}
                    untuk memperkaya koleksi hafalan dan kosa kata anda!
                  </p>
                </div>
              </div>

              {/* ACTION FOOTER */}
              <div className="pt-2">
                <Button
                  onClick={handleNext}
                  className="w-full h-10 sm:h-11 bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-xs sm:text-sm rounded-xl shadow-lg shadow-emerald-600/30 gap-1.5"
                >
                  <span>Ketahui Teknik Belajar Berkesan</span>
                  <ChevronRight className="w-4 h-4" />
                </Button>
              </div>
            </div>
          )}

          {/* SLIDE 2: GAMBAR THREADS & INSPIRASI PEMBANGUNAN */}
          {currentSlide === 1 && (
            <div className="h-full flex flex-col justify-between animate-in fade-in slide-in-from-right-4 duration-250">
              <div className="space-y-2">
                <div className="flex items-center justify-between">
                  <Badge className="bg-primary/20 text-primary border border-primary/30 text-[11px] sm:text-xs py-1 px-2.5 font-bold gap-1">
                    <HeartHandshake className="w-3.5 h-3.5" />
                    Inspirasi Pembangunan
                  </Badge>
                  <span className="text-[11px] font-semibold text-slate-400 bg-slate-800/80 px-2 py-0.5 rounded-full">
                    Slide 2 / 3
                  </span>
                </div>

                <h3 className="text-base sm:text-lg font-black tracking-tight text-white leading-tight">
                  Diilhamkan Daripada Threads Viral Ini:
                </h3>

                {/* THREADS SCREENSHOT IMAGE - COMPACT WITHOUT SCROLLING */}
                <div className="rounded-xl overflow-hidden border border-slate-700 bg-white/95 p-1.5 shadow-md flex items-center justify-center">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img
                    src="/special-inspiration.png"
                    alt="Threads Viral: Belajar English dengan Ceramah Mufti Menk"
                    className="max-h-[145px] sm:max-h-[160px] w-auto object-contain block mx-auto rounded-lg"
                  />
                </div>

                <p className="text-[11px] sm:text-xs text-center text-slate-300 italic leading-snug">
                  &ldquo;Niat kita nak belajar English, dapat pahala sekali dengar ceramah agama...&rdquo;
                </p>
              </div>

              {/* ACTION FOOTER */}
              <div className="flex gap-2 pt-1">
                <Button
                  variant="outline"
                  onClick={handlePrev}
                  className="w-1/3 h-10 sm:h-11 border-slate-700 text-slate-300 hover:bg-slate-800 text-xs sm:text-sm rounded-xl"
                >
                  Kembali
                </Button>
                <Button
                  onClick={handleNext}
                  className="w-2/3 h-10 sm:h-11 bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-xs sm:text-sm rounded-xl shadow-lg shadow-emerald-600/30 gap-1.5"
                >
                  <span>Kenapa Sangat Berkesan?</span>
                  <ChevronRight className="w-4 h-4" />
                </Button>
              </div>
            </div>
          )}

          {/* SLIDE 3: TEKNIK BELAJAR PALING BERKESAN & BUTANG TUTUP / MULA */}
          {currentSlide === 2 && (
            <div className="h-full flex flex-col justify-between animate-in fade-in slide-in-from-right-4 duration-250">
              <div className="space-y-2.5">
                <div className="flex items-center justify-between">
                  <Badge className="bg-teal-500/20 text-teal-300 border border-teal-500/30 text-[11px] sm:text-xs py-1 px-2.5 font-bold gap-1">
                    <Sparkles className="w-3.5 h-3.5 fill-current" />
                    Teknik Terbukti Berkesan
                  </Badge>
                  <span className="text-[11px] font-semibold text-emerald-400 bg-emerald-950/80 border border-emerald-500/30 px-2 py-0.5 rounded-full flex items-center gap-1">
                    <CheckCircle2 className="w-3 h-3" />
                    Lengkap 3 / 3
                  </span>
                </div>

                <h3 className="text-base sm:text-lg font-black tracking-tight text-white leading-tight">
                  Mengapa Belajar Melalui Ceramah Sangat Berkesan?
                </h3>

                <div className="space-y-1.5 text-[11px] sm:text-xs">
                  <div className="flex items-start gap-2 bg-slate-800/60 p-2 sm:p-2.5 rounded-xl border border-slate-700/60">
                    <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400 shrink-0 mt-0.5" />
                    <span className="text-slate-200 leading-snug">
                      <strong className="text-white">Sebutan & Diksi Jelas:</strong> Penceramah antarabangsa (seperti Mufti Menk) bertutur dengan sebutan tenang, fasih, dan bahasa yang sopan.
                    </span>
                  </div>
                  <div className="flex items-start gap-2 bg-slate-800/60 p-2 sm:p-2.5 rounded-xl border border-slate-700/60">
                    <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400 shrink-0 mt-0.5" />
                    <span className="text-slate-200 leading-snug">
                      <strong className="text-white">Dwi-Sari Kata Interaktif:</strong> Bantuan teks dwibahasa tepat membolehkan anda ketuk mana-mana perkataan untuk maksud terus BM.
                    </span>
                  </div>
                  <div className="flex items-start gap-2 bg-slate-800/60 p-2 sm:p-2.5 rounded-xl border border-slate-700/60">
                    <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400 shrink-0 mt-0.5" />
                    <span className="text-slate-200 leading-snug">
                      <strong className="text-white">Pahala & Kelancaran:</strong> Konsisten dengar setiap hari, insha-Allah dalam masa 2 bulan penguasaan English meningkat sambil mendapat pahala.
                    </span>
                  </div>
                </div>
              </div>

              {/* ACTION FOOTER */}
              <div className="flex gap-2 pt-1">
                <Button
                  variant="outline"
                  onClick={handlePrev}
                  className="w-1/3 h-10 sm:h-11 border-slate-700 text-slate-300 hover:bg-slate-800 text-xs sm:text-sm rounded-xl"
                >
                  Kembali
                </Button>
                <Button
                  onClick={handleClose}
                  className="w-2/3 h-10 sm:h-11 bg-emerald-600 hover:bg-emerald-500 text-white font-black text-xs sm:text-sm rounded-xl shadow-lg shadow-emerald-600/40 gap-1.5"
                >
                  <span>Faham & Mula Tonton ✨</span>
                </Button>
              </div>
            </div>
          )}

          {/* BOTTOM CAROUSEL INDICATOR (MIRRORING TOYYIBPAY ACTIVE ORANGE PILL + INACTIVE DOTS) */}
          <div className="pt-2 flex items-center justify-center gap-1.5">
            {Array.from({ length: TOTAL_SLIDES }).map((_, idx) => (
              <button
                key={idx}
                type="button"
                onClick={() => {
                  setCurrentSlide(idx);
                  if (idx === TOTAL_SLIDES - 1) {
                    setHasReachedEnd(true);
                  }
                }}
                className={`transition-all duration-300 rounded-full ${
                  currentSlide === idx
                    ? "w-8 h-2 bg-amber-500 shadow-sm shadow-amber-500/50"
                    : "w-2 h-2 bg-slate-700 hover:bg-slate-600"
                }`}
                aria-label={`Pergi ke slide ${idx + 1}`}
              />
            ))}
          </div>
        </div>

        {/* HELPER TEXT BELOW FRAME */}
        <div className="text-center pt-2">
          <p className="text-[10px] sm:text-[11px] text-slate-400 font-medium">
            {!hasReachedEnd ? (
              <span className="text-amber-400 font-semibold">
                👉 Sila swipe atau tekan seterusnya hingga slide 3 untuk membuka butang pangkah (✕).
              </span>
            ) : (
              <span className="text-emerald-400 font-semibold">
                ✅ Selesai membaca! Anda kini boleh menekan butang pangkah (✕) atau butang mula di atas.
              </span>
            )}
          </p>
        </div>
      </div>
    </div>
  );
}
