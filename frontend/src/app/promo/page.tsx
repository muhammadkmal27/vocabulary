"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle, CardFooter } from "@/components/ui/card";
import { Dialog, DialogContent, DialogDescription, DialogFooter, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Brain, Check, Sparkles, Loader2, ShieldCheck, Lock, Star, Award } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { Turnstile } from "@/components/ui/Turnstile";
import { trackFbEvent } from "@/components/FacebookPixel";

import { PromoQuizSimulator } from "./PromoQuizSimulator";
import { PromoFAQ } from "./PromoFAQ";
import { PromoHero } from "./PromoHero";
import { PromoProblems } from "./PromoProblems";
import { PromoSolution } from "./PromoSolution";

interface PlanRecord {
  id: string;
  name: string;
  price_myr: number;
  slug: string;
  is_active: boolean;
  stripe_price_id?: string | null;
}

export default function PromoLandingPage() {
  const { token } = useAuth();
  const { toast } = useAlert();
  const router = useRouter();

  const [plans, setPlans] = useState<PlanRecord[]>([]);
  const [toyyibpayStatus, setToyyibpayStatus] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [turnstileToken, setTurnstileToken] = useState("");

  const [showSubscriptionDialog, setShowSubscriptionDialog] = useState(false);
  const [selectedPlan, setSelectedPlan] = useState<PlanRecord | null>(null);
  const [isToyyibPayPromo, setIsToyyibPayPromo] = useState(false);

  const fetchPlans = async () => {
    try {
      const res = await fetch("/api/plans", { cache: "no-store", headers: { Accept: "application/json" } });
      if (res.ok) {
        const data = await res.json();
        setPlans(Array.isArray(data) ? data : data.data || []);
      }
    } catch { /* graceful fallback */ }
  };

  const fetchToyyibpayStatus = async () => {
    try {
      const headers: Record<string, string> = { Accept: "application/json" };
      if (token) headers.Authorization = `Bearer ${token}`;
      const res = await fetch("/api/subscription/toyyibpay/status", { cache: "no-store", headers });
      if (res.ok) {
        const data = await res.json();
        setToyyibpayStatus(data);
      }
    } catch { /* graceful fallback */ }
  };

  useEffect(() => {
    const init = async () => {
      setLoading(true);
      await Promise.all([fetchPlans(), fetchToyyibpayStatus()]);
      setLoading(false);
    };
    init();
  }, [token]);

  const handlePlanClick = (plan: PlanRecord | null, isToyyibPay: boolean) => {
    if (!token) {
      router.push("/login?redirect=/promo");
      return;
    }
    trackFbEvent("InitiateCheckout", {
      content_name: isToyyibPay ? "ToyyibPay Lifetime Promo" : plan?.name,
      value: isToyyibPay ? 100.0 : plan?.price_myr,
      currency: "MYR"
    });
    setSelectedPlan(plan);
    setIsToyyibPayPromo(isToyyibPay);
    setTurnstileToken("");
    setShowSubscriptionDialog(true);
  };

  const handleStripeSubscribe = async () => {
    if (!turnstileToken || !selectedPlan?.id) return;
    try {
      const res = await fetch("/api/subscription/create-checkout", {
        method: "POST",
        headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}`, Accept: "application/json" },
        body: JSON.stringify({ plan_id: selectedPlan.id, "cf-turnstile-response": turnstileToken })
      });
      if (res.ok) {
        const data = await res.json();
        if (data.url) window.location.href = data.url;
      } else {
        toast("Gagal memproses langganan Stripe. Sila cuba lagi.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  const handleToyyibPaySubscribe = async () => {
    if (!turnstileToken) return;
    try {
      const res = await fetch("/api/subscription/toyyibpay/create-bill", {
        method: "POST",
        headers: { "Content-Type": "application/json", Authorization: `Bearer ${token}`, Accept: "application/json" },
        body: JSON.stringify({
          success_url: window.location.origin + "/subscription?success=1",
          "cf-turnstile-response": turnstileToken
        })
      });
      if (res.ok) {
        const data = await res.json();
        if (data.url) window.location.href = data.url;
      } else {
        const errData = await res.json();
        toast(errData.message || "Gagal membuat bil ToyyibPay.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  const isPromoAvailable = toyyibpayStatus?.is_available;

  return (
    <div className="min-h-screen bg-amber-50/30 text-slate-800 selection:bg-red-500/30 font-['Nunito',sans-serif]" style={{ fontFamily: "'Nunito', sans-serif" }}>
      {/* Header */}
      <header className="w-full bg-white/80 backdrop-blur-md sticky top-0 z-50 border-b border-amber-100/50">
        <div className="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
          <Link href="/" className="flex items-center gap-2">
            <div className="bg-red-500 text-white p-2 rounded-xl rotate-[-5deg]">
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2.5"></path></svg>
            </div>
            <span className="text-2xl font-black tracking-tight text-slate-800">Vocabulary</span>
          </Link>
          <Link href={token ? "/" : "/login?redirect=/promo"} className="px-6 py-2.5 rounded-full border-2 border-slate-200 text-sm font-bold hover:border-red-500 hover:text-red-500 transition-all bg-white">
            {token ? "Dashboard" : "Log Masuk"}
          </Link>
        </div>
      </header>

      {/* High Converting Hero Section */}
      <PromoHero onCTAClick={() => handlePlanClick(null, true)} />

      {/* Problem Agitation Section */}
      <PromoProblems />

      {/* Qualification Section */}
      <PromoSolution />

      {/* Interactive Quiz Simulator Section */}
      <section className="py-16 md:py-20 px-4 md:px-6 bg-slate-800 text-white rounded-t-[3rem] -mt-8 relative z-20 overflow-hidden">
        <div className="absolute top-0 right-0 w-full h-full opacity-10" style={{ backgroundImage: "radial-gradient(circle at 50% 50%, #fef08a 0%, transparent 60%)" }}></div>
        <div className="max-w-4xl mx-auto text-center relative z-10">
          <h2 className="text-3xl md:text-4xl font-black mb-6">Cuba Demo 15 Saat Kami ⏱️</h2>
          <p className="text-slate-300 mb-10 md:mb-12 text-lg md:text-xl font-bold">Uji keupayaan ingatan visual dan interaktif anda serta-merta!</p>
          <div className="rotate-[-1deg]">
            <PromoQuizSimulator onUnlockClick={() => handlePlanClick(null, true)} />
          </div>
        </div>
      </section>

      {/* Pricing / Plan Section */}
      <section className="py-16 md:py-20 px-4 md:px-6 bg-amber-50 rounded-t-[3rem] -mt-8 relative z-30" id="pricing">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl lg:text-5xl font-black mb-6 text-slate-800">Pilihan Pakej Promo 1 Tahun 🎁</h2>
          <p className="text-red-500 font-black mb-10 md:mb-12 text-lg md:text-xl bg-red-100 inline-block px-4 py-2 md:px-6 md:py-2 rounded-full rotate-2">Terhad untuk 100 orang terawal sahaja!</p>

          {loading ? (
            <div className="flex justify-center py-12">
              <Loader2 className="w-8 h-8 animate-spin text-red-500" />
            </div>
          ) : (
            <div className="flex flex-col md:flex-row justify-center items-stretch gap-8 max-w-4xl mx-auto">
              {/* ToyyibPay Lifetime Plan */}
              {isPromoAvailable && toyyibpayStatus?.plan && (
                <div className="max-w-md mx-auto border-8 border-red-500 rounded-[2rem] md:rounded-[3rem] p-6 md:p-10 bg-white shadow-2xl relative overflow-hidden transform hover:-translate-y-2 transition-transform duration-300 w-full" data-purpose="pricing-card">
                  <div className="absolute top-0 right-0 bg-yellow-400 text-slate-900 text-xs md:text-sm font-black px-4 py-1.5 md:px-6 md:py-2 uppercase tracking-widest rounded-bl-2xl md:rounded-bl-3xl">
                    BEST VALUE 🔥
                  </div>
                  <h4 className="text-xl md:text-2xl font-black text-slate-400 mb-4 mt-6 md:mt-4">{toyyibpayStatus.plan.name}</h4>
                  <div className="flex justify-center items-baseline gap-1.5 md:gap-2 mb-8 md:mb-10">
                    <span className="text-5xl md:text-6xl font-black text-slate-800">RM{parseFloat(toyyibpayStatus.plan.price_myr).toFixed(0)}</span>
                    <span className="text-slate-400 font-bold text-base md:text-lg">/ Sekali bayar</span>
                  </div>
                  <ul className="text-left space-y-4 md:space-y-5 mb-10 text-slate-700 font-bold text-base md:text-lg bg-slate-50 p-5 md:p-6 rounded-2xl md:rounded-3xl">
                    {["Akses penuh untuk 1 tahun", "Semua bahasa & semua level", "Algoritma Spaced Repetition", "Jimat RM140 setahun"].map((f) => (
                      <li key={f} className="flex items-center gap-3 md:gap-4 leading-tight">
                        <div className="bg-green-100 p-1 md:p-1.5 rounded-full shrink-0"><svg className="w-4 h-4 md:w-5 md:h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M5 13l4 4L19 7" strokeLinecap="round" strokeLinejoin="round" strokeWidth="3"></path></svg></div>
                        {f}
                      </li>
                    ))}
                  </ul>
                  <button 
                    onClick={() => handlePlanClick(null, true)}
                    className="w-full bg-red-500 hover:bg-red-600 text-white font-black py-4 md:py-6 rounded-full text-lg md:text-xl shadow-xl shadow-red-500/30 transition-all border-b-4 border-red-700 transform hover:scale-105"
                  >
                    MULA BELAJAR SEKARANG
                  </button>
                  <p className="mt-6 text-sm text-slate-400 font-bold bg-slate-100 py-2 rounded-full">Tinggal {toyyibpayStatus.quota_remaining} quota sahaja!</p>
                </div>
              )}

              {/* Stripe Plans */}
              {plans.map((plan) => (
                <div key={plan.id} className="max-w-md mx-auto border-8 border-slate-200 rounded-[2rem] md:rounded-[3rem] p-6 md:p-10 bg-white shadow-xl relative overflow-hidden transform hover:-translate-y-2 transition-transform duration-300 w-full" data-purpose="pricing-card">
                  <h4 className="text-xl md:text-2xl font-black text-slate-400 mb-4 mt-4">{plan.name}</h4>
                  <div className="flex justify-center items-baseline gap-1.5 md:gap-2 mb-8 md:mb-10">
                    <span className="text-5xl md:text-6xl font-black text-slate-800">RM{plan.price_myr.toFixed(0)}</span>
                    <span className="text-slate-400 font-bold text-base md:text-lg">/ Bulan</span>
                  </div>
                  <ul className="text-left space-y-4 md:space-y-5 mb-10 text-slate-700 font-bold text-base md:text-lg bg-slate-50 p-5 md:p-6 rounded-2xl md:rounded-3xl">
                    {["Akses ke semua bahasa aktif", "Auto-billing bulanan", "Boleh dibatalkan bila-bila masa"].map((f) => (
                      <li key={f} className="flex items-center gap-3 md:gap-4 leading-tight">
                        <div className="bg-blue-100 p-1 md:p-1.5 rounded-full shrink-0"><svg className="w-4 h-4 md:w-5 md:h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M5 13l4 4L19 7" strokeLinecap="round" strokeLinejoin="round" strokeWidth="3"></path></svg></div>
                        {f}
                      </li>
                    ))}
                  </ul>
                  <button 
                    onClick={() => handlePlanClick(plan, false)}
                    className="w-full bg-slate-800 hover:bg-slate-900 text-white font-black py-4 md:py-6 rounded-full text-lg md:text-xl shadow-xl shadow-slate-500/30 transition-all border-b-4 border-slate-950 transform hover:scale-105"
                  >
                    Langgan Bulanan
                  </button>
                </div>
              ))}
            </div>
          )}
        </div>
      </section>

      {/* Collapsible FAQ Section */}
      <PromoFAQ />

      {/* Footer */}
      <footer className="py-8 md:py-12 border-t-4 border-amber-100 bg-amber-50">
        <div className="max-w-7xl mx-auto px-4 md:px-6 text-center">
          <div className="flex flex-col items-center gap-4 md:gap-6">
            <div className="flex items-center gap-2 opacity-50 hover:opacity-100 transition-opacity">
              <div className="bg-slate-400 text-white p-1 md:p-1.5 rounded-lg rotate-[-5deg]">
                <svg className="w-4 h-4 md:w-5 md:h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2"></path></svg>
              </div>
              <span className="font-black text-slate-500 text-base md:text-lg">Vocabulary</span>
            </div>
            <p className="text-xs md:text-sm font-bold text-slate-400 bg-white px-3 py-1.5 md:px-4 md:py-2 rounded-full inline-block shadow-sm">© {new Date().getFullYear()} Vocabulary. Hak Cipta Terpelihara.</p>
          </div>
        </div>
      </footer>

      {/* Bot Verification Turnstile Dialog */}
      <Dialog open={showSubscriptionDialog} onOpenChange={setShowSubscriptionDialog}>
        <DialogContent className="sm:max-w-md text-center">
          <DialogHeader>
            <DialogTitle className="text-center">Sahkan Anda Bukan Bot</DialogTitle>
            <DialogDescription className="text-center">
              Sila selesaikan pengesahan keselamatan Cloudflare Turnstile untuk meneruskan pembayaran dengan selamat.
            </DialogDescription>
          </DialogHeader>
          <div className="flex justify-center py-4">
            <Turnstile onVerify={(t) => setTurnstileToken(t)} />
          </div>
          <DialogFooter className="sm:justify-center">
            <Button
              onClick={isToyyibPayPromo ? handleToyyibPaySubscribe : handleStripeSubscribe}
              disabled={!turnstileToken}
              className="w-full sm:w-auto"
            >
              Teruskan Pembayaran
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
