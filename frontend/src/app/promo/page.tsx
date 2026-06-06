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
    <div className="min-h-screen bg-background text-foreground selection:bg-primary/30">
      {/* Header */}
      <header className="border-b border-border bg-background/80 backdrop-blur-sm sticky top-0 z-50">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <Brain className="w-6 h-6 text-primary" />
            <span className="text-lg font-bold tracking-tight">Vocabulary</span>
          </Link>
          <Link href={token ? "/" : "/login?redirect=/promo"}>
            <Button variant="outline" size="sm">
              {token ? "Dashboard" : "Log Masuk"}
            </Button>
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
      <section className="w-full bg-white border-b border-[#F0DADA] pt-16 pb-16 px-4 md:pt-28 md:pb-24">
        <div className="max-w-3xl mx-auto text-center space-y-4 mb-10">
          <h2 className="text-[28px] sm:text-[34px] font-extrabold text-[#1A1A1A] uppercase tracking-[-0.04em] leading-[1.1]">Cuba Demo 15 Saat Kami</h2>
          <p className="text-base md:text-lg font-medium text-[#555555] max-w-lg mx-auto">
            Gunakan simulator di bawah untuk menguji keupayaan ingatan visual dan interaktif anda serta-merta.
          </p>
        </div>
        <PromoQuizSimulator onUnlockClick={() => handlePlanClick(null, true)} />
      </section>

      {/* Pricing / Plan Section */}
      <section className="w-full bg-[#FFF8F8] border-b border-[#F0DADA] pt-16 pb-16 px-4 md:pt-28 md:pb-24" id="pricing">
        <div className="max-w-3xl mx-auto text-center space-y-4 mb-12">
          <h2 className="text-[30px] sm:text-[38px] md:text-[50px] font-extrabold text-[#1A1A1A] leading-[1.05] tracking-tight text-center">Pilihan Pakej Promo 1 Tahun</h2>
          <p className="text-base md:text-lg font-medium text-[#555555] max-w-lg mx-auto">
            Terhad untuk 100 orang terawal sahaja! Sertai ribuan ahli premium kami hari ini.
          </p>
        </div>

        {loading ? (
          <div className="flex justify-center py-12">
            <Loader2 className="w-8 h-8 animate-spin text-primary" />
          </div>
        ) : (
          <div className="flex flex-col md:flex-row justify-center items-stretch gap-8 max-w-4xl mx-auto">
            {/* ToyyibPay Lifetime Plan */}
            {isPromoAvailable && toyyibpayStatus?.plan && (
              <Card className="w-full max-w-md mx-auto md:mx-0 border-warning ring-2 ring-warning bg-gradient-to-b from-warning/5 to-background relative overflow-hidden flex flex-col justify-between">
                <div className="absolute top-0 right-0 bg-warning text-black text-[10px] font-bold px-3 py-1 uppercase rounded-bl-lg">
                  Terhad
                </div>
                <CardHeader className="text-center pt-8">
                  <Badge variant="outline" className="text-warning border-warning bg-warning/10 font-bold mx-auto mb-2 flex items-center gap-1.5 w-fit">
                    <Star className="w-3.5 h-3.5 fill-warning" /> PROMO 1 TAHUN
                  </Badge>
                  <CardTitle className="text-2xl">{toyyibpayStatus.plan.name}</CardTitle>
                  <div className="mt-3">
                    <span className="text-5xl font-extrabold text-foreground">RM{parseFloat(toyyibpayStatus.plan.price_myr).toFixed(0)}</span>
                    <span className="text-muted-foreground text-xs block mt-1">Sekali bayar sahaja untuk 1 tahun</span>
                  </div>
                  <p className="text-[11px] text-warning font-semibold bg-warning/10 py-1 px-3 rounded-full mt-3 inline-block">
                    🔥 Terhad untuk 100 orang terawal sahaja! (Tinggal {toyyibpayStatus.quota_remaining})
                  </p>
                </CardHeader>
                <CardContent className="space-y-4 py-4">
                  <ul className="space-y-2.5 text-sm">
                    {["Akses penuh untuk 1 tahun", "Semua bahasa & semua level", "20+ ayat sehari secara tanpa had", "Pembayaran mudah melalui FPX (ToyyibPay)", "Jimat RM140 setahun"].map((f) => (
                      <li key={f} className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-success shrink-0 mt-0.5" />
                        <span>{f}</span>
                      </li>
                    ))}
                  </ul>
                </CardContent>
                <CardFooter className="pb-8">
                  <Button onClick={() => handlePlanClick(null, true)} className="w-full bg-warning text-black hover:bg-warning/80 font-bold shadow-md">
                    Dapatkan Akses 1 Tahun
                  </Button>
                </CardFooter>
              </Card>
            )}

            {/* Stripe Plans */}
            {plans.map((plan) => (
              <Card key={plan.id} className="w-full max-w-md mx-auto md:mx-0 border-primary ring-1 ring-primary flex flex-col justify-between relative">
                <CardHeader className="text-center pt-8">
                  <Badge className="bg-primary text-primary-foreground font-semibold mx-auto mb-2 w-fit">
                    Paling Fleksibel
                  </Badge>
                  <CardTitle className="text-2xl">{plan.name}</CardTitle>
                  <div className="mt-3">
                    <span className="text-5xl font-extrabold text-foreground">RM{plan.price_myr.toFixed(0)}</span>
                    <span className="text-muted-foreground text-xs block mt-1">Bilik automatik setiap bulan</span>
                  </div>
                </CardHeader>
                <CardContent className="space-y-4 py-4">
                  <ul className="space-y-2.5 text-sm">
                    {["Akses ke semua bahasa aktif", "Akses ke semua aras penguasaan", "20+ ayat sehari", "Auto-billing (boleh dibatalkan bila-bila)", "Sokongan komuniti"].map((f) => (
                      <li key={f} className="flex items-start gap-2">
                        <Check className="w-4 h-4 text-success shrink-0 mt-0.5" />
                        <span>{f}</span>
                      </li>
                    ))}
                  </ul>
                </CardContent>
                <CardFooter className="pb-8">
                  <Button onClick={() => handlePlanClick(plan, false)} className="w-full font-bold">
                    Langgan Bulanan
                  </Button>
                </CardFooter>
              </Card>
            ))}
          </div>
        )}
      </section>

      {/* Collapsible FAQ Section */}
      <section className="py-20 border-t border-border/50 px-4">
        <PromoFAQ />
      </section>

      {/* Footer */}
      <footer className="border-t border-border/50 py-10 bg-muted/20 text-center text-xs text-muted-foreground">
        <p>&copy; {new Date().getFullYear()} Vocabulary. Hak Cipta Terpelihara.</p>
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
