"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardFooter,
  CardDescription,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Brain, Check, Sparkles, Loader2 } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { Turnstile } from "@/components/ui/Turnstile";

interface PlanRecord {
  id: string;
  name: string;
  price_myr: number;
  slug: string;
  is_active: boolean;
  stripe_price_id?: string | null;
}

export default function PricingPage() {
  const { token } = useAuth();
  const { toast } = useAlert();
  const router = useRouter();
  const [plans, setPlans] = useState<PlanRecord[]>([]);
  const [toyyibpayStatus, setToyyibpayStatus] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [turnstileToken, setTurnstileToken] = useState("");
  const [couponTurnstileToken, setCouponTurnstileToken] = useState("");
  
  // Dialog state
  const [showSubscriptionDialog, setShowSubscriptionDialog] = useState(false);
  const [selectedPlan, setSelectedPlan] = useState<PlanRecord | null>(null);
  const [isToyyibPayPromo, setIsToyyibPayPromo] = useState(false);

  // Coupon state
  const [couponCode, setCouponCode] = useState("");
  const [redeeming, setRedeeming] = useState(false);
  const [redeemMessage, setRedeemMessage] = useState("");
  const [showCouponInput, setShowCouponInput] = useState(false);

  const fetchPlans = async () => {
    try {
      const res = await fetch("/api/plans", {
        headers: { Accept: "application/json" },
      });
      if (res.ok) {
        const data = await res.json();
        setPlans(Array.isArray(data) ? data : data.data || []);
      }
    } catch {
      /* silently fallback */
    }
  };

  const fetchToyyibpayStatus = async () => {
    try {
      const headers: Record<string, string> = { Accept: "application/json" };
      if (token) headers.Authorization = `Bearer ${token}`;
      const res = await fetch("/api/subscription/toyyibpay/status", { headers });
      if (res.ok) {
        const data = await res.json();
        setToyyibpayStatus(data);
      }
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    const init = async () => {
      setLoading(true);
      await Promise.all([fetchPlans(), fetchToyyibpayStatus()]);
      setLoading(false);
    };
    init();
  }, [token]);

  const handleSubscribeClick = (plan: PlanRecord) => {
    if (!token) {
      router.push("/login");
      return;
    }
    setSelectedPlan(plan);
    setIsToyyibPayPromo(false);
    setTurnstileToken("");
    setShowSubscriptionDialog(true);
  };

  const handleSubscribe = async () => {
    if (!token) {
      router.push("/login");
      return;
    }
    if (!turnstileToken) {
      toast("Sila lengkapkan pengesahan bot sebelum melanggan.", "error");
      return;
    }
    if (!selectedPlan?.stripe_price_id) {
      router.push("/");
      return;
    }
    try {
      const res = await fetch("/api/subscription/create-checkout", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
        body: JSON.stringify({ plan_id: selectedPlan.id, "cf-turnstile-response": turnstileToken }),
      });
      if (res.ok) {
        const data = await res.json();
        if (data.url) {
          window.location.href = data.url;
        }
      } else {
        toast("Gagal membuat sesi pembayaran.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  const handleToyyibPaySubscribeClick = () => {
    if (!token) {
      router.push("/login");
      return;
    }
    setIsToyyibPayPromo(true);
    setSelectedPlan(null);
    setTurnstileToken("");
    setShowSubscriptionDialog(true);
  };

  const handleToyyibPaySubscribe = async () => {
    if (!token) {
      router.push("/login");
      return;
    }
    if (!turnstileToken) {
      toast("Sila lengkapkan pengesahan bot sebelum melanggan.", "error");
      return;
    }
    try {
      const res = await fetch("/api/subscription/toyyibpay/create-bill", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
        body: JSON.stringify({
          success_url: window.location.origin + "/subscription?success=1",
          "cf-turnstile-response": turnstileToken,
        }),
      });
      if (res.ok) {
        const data = await res.json();
        if (data.url) {
          window.location.href = data.url;
        }
      } else {
        const errData = await res.json();
        toast(errData.message || "Gagal membuat bil ToyyibPay.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  const handleRedeemCoupon = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!token) {
      router.push("/login");
      return;
    }
    if (!couponCode.trim()) return;
    if (!couponTurnstileToken) {
      setRedeemMessage("Sila lengkapkan pengesahan bot sebelum menebus kupon.");
      return;
    }
    setRedeeming(true);
    setRedeemMessage("");
    try {
      const res = await fetch("/api/coupons/redeem", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
        body: JSON.stringify({ code: couponCode, "cf-turnstile-response": couponTurnstileToken }),
      });
      const data = await res.json();
      if (res.ok && data.valid) {
        setRedeemMessage("Kupon berjaya ditebus! Akses Premium anda telah diaktifkan.");
        setCouponCode("");
        setTimeout(() => {
          router.push("/");
        }, 1500);
      } else {
        setRedeemMessage(data.message || "Kupon tidak sah atau sudah tamat tempoh.");
      }
    } catch {
      setRedeemMessage("Ralat menyambung ke pelayan.");
    } finally {
      setRedeeming(false);
    }
  };

  const isPromoAvailable = toyyibpayStatus?.is_available;

  return (
    <div className="min-h-screen bg-background">
      <header className="border-b border-border bg-background/80 backdrop-blur-sm sticky top-0 z-50">
        <nav className="max-w-7xl mx-auto px-4 h-16 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <Brain className="w-6 h-6 text-primary" />
            <span className="text-lg font-bold">Vocabulary</span>
          </Link>
          <Link href={token ? "/" : "/login"}>
            <Button variant="ghost" size="sm">
              {token ? "Dashboard" : "Log Masuk"}
            </Button>
          </Link>
        </nav>
      </header>

      <main className="max-w-6xl mx-auto px-4 py-16">
        <div className="text-center space-y-4 mb-12">
          <Badge variant="secondary">
            <Sparkles className="w-3.5 h-3.5 mr-1.5" />
            Langganan Mudah
          </Badge>
          <h1 className="text-3xl sm:text-4xl font-bold">Pilih Plan Anda</h1>
          <p className="text-muted-foreground max-w-lg mx-auto">
            Naik taraf ke Lifetime atau langgan bulanan Stripe bila-bila masa.
          </p>
        </div>

        {loading ? (
          <div className="flex justify-center py-12">
            <Loader2 className="w-8 h-8 animate-spin text-primary" />
          </div>
        ) : (
          <div className={`grid md:grid-cols-${isPromoAvailable ? "2" : "1"} gap-6 max-w-${isPromoAvailable ? "3xl" : "md"} mx-auto`}>

            {/* ToyyibPay Lifetime Promo */}
            {isPromoAvailable && (
              <Card className="border-warning ring-1 ring-warning relative bg-gradient-to-br from-warning/5 to-background">
                <CardHeader className="text-center pt-6">
                  <div className="flex justify-center mb-2">
                    <Badge className="bg-warning text-warning-foreground font-semibold flex items-center gap-1">
                      <Sparkles className="w-3.5 h-3.5 fill-warning-foreground" /> PROMO LIFETIME (Terhad)
                    </Badge>
                  </div>
                  <CardTitle>Akses Seumur Hidup</CardTitle>
                  <div className="mt-2">
                    <span className="text-4xl font-bold">RM100</span>
                    <span className="text-muted-foreground text-sm"> /sekali bayar</span>
                  </div>
                  <p className="text-[11px] text-warning font-bold bg-warning/10 py-1 px-3 rounded-full mt-2 inline-block mx-auto">
                    🔥 Tinggal {toyyibpayStatus.quota_remaining}/100 kuota sahaja!
                  </p>
                </CardHeader>
                <CardContent>
                  <ul className="space-y-3">
                    {[
                      "Guna seumur hidup tanpa bulanan",
                      "Semua bahasa & semua level",
                      "Akses penuh tanpa had",
                      "Pembayaran ToyyibPay (FPX)",
                      "Jimat RM240 setahun!",
                      "Sokongan VIP priority",
                    ].map((f) => (
                      <li key={f} className="flex items-start gap-2 text-sm">
                        <Check className="w-4 h-4 text-success shrink-0 mt-0.5" />
                        <span>{f}</span>
                      </li>
                    ))}
                  </ul>
                </CardContent>
                <CardFooter>
                  <Button className="w-full bg-warning text-black hover:bg-warning/80 font-bold shadow-sm" onClick={handleToyyibPaySubscribeClick}>
                    Dapatkan Lifetime RM100
                  </Button>
                </CardFooter>
              </Card>
            )}

            {/* Dynamic Plans from API (Stripe) */}
            {plans.map((plan) => (
              <Card
                key={plan.id}
                className="border-primary ring-1 ring-primary relative"
              >
                <CardHeader className="text-center pt-6">
                  <div className="flex justify-center mb-2">
                    <Badge className="bg-primary text-primary-foreground">
                      Paling Popular
                    </Badge>
                  </div>
                  <CardTitle>{plan.name}</CardTitle>
                  <div className="mt-2">
                    <span className="text-4xl font-bold">
                      RM{typeof plan.price_myr === "number" ? plan.price_myr.toFixed(0) : plan.price_myr}
                    </span>
                    <span className="text-muted-foreground text-sm">/bulan</span>
                  </div>
                </CardHeader>
                <CardContent>
                  <ul className="space-y-3">
                    {[
                      "Semua bahasa",
                      "Semua level",
                      "20+ ayat sehari",
                      "Auto-billing (boleh matikan)",
                      "Priority support",
                    ].map((f) => (
                      <li key={f} className="flex items-start gap-2 text-sm">
                        <Check className="w-4 h-4 text-success shrink-0 mt-0.5" />
                        <span>{f}</span>
                      </li>
                    ))}
                  </ul>
                </CardContent>
                <CardFooter>
                  <Button className="w-full" onClick={() => handleSubscribeClick(plan)}>
                    Langgan Sekarang
                  </Button>
                </CardFooter>
              </Card>
            ))}
          </div>
        )}

        <Dialog open={showSubscriptionDialog} onOpenChange={setShowSubscriptionDialog}>
          <DialogContent className="sm:max-w-md text-center">
            <DialogHeader>
              <DialogTitle className="text-center">Sahkan Langganan</DialogTitle>
              <DialogDescription className="text-center">
                Sila sahkan anda bukan bot untuk meneruskan dengan {isToyyibPayPromo ? "Promosi Lifetime ToyyibPay" : selectedPlan?.name}.
              </DialogDescription>
            </DialogHeader>
            <div className="flex justify-center py-4">
              <Turnstile onVerify={(token) => setTurnstileToken(token)} />
            </div>
            <DialogFooter className="sm:justify-center">
              <Button 
                onClick={isToyyibPayPromo ? handleToyyibPaySubscribe : handleSubscribe}
                disabled={!turnstileToken}
                className="w-full sm:w-auto"
              >
                Teruskan Pembayaran
              </Button>
            </DialogFooter>
          </DialogContent>
        </Dialog>

        {/* Coupon Redemption Section */}
        <div className="text-center mt-12">
          {!showCouponInput ? (
            <p className="text-sm text-muted-foreground">
              Ada kupon?{" "}
              <button
                onClick={() => setShowCouponInput(true)}
                className="text-primary hover:underline font-medium"
              >
                Tebus di sini
              </button>
            </p>
          ) : (
            <div className="max-w-md mx-auto">
              <Card className="border-border text-left">
                <CardHeader className="text-center pb-2">
                  <CardTitle className="text-lg">Tebus Kupon Akses</CardTitle>
                </CardHeader>
                <CardContent>
                  <form onSubmit={handleRedeemCoupon} className="space-y-4">
                    <div className="flex gap-2">
                      <Input
                        placeholder="Masukkan kod kupon (cth: FREE2026)"
                        value={couponCode}
                        onChange={(e) => setCouponCode(e.target.value)}
                        className="flex-1"
                      />
                      <Button type="submit" disabled={redeeming || !couponCode.trim()}>
                        {redeeming ? "Memproses..." : "Tebus"}
                      </Button>
                    </div>
                    <Turnstile onVerify={(token) => setCouponTurnstileToken(token)} />
                  </form>
                  {redeemMessage && (
                    <p className={`text-xs mt-3 text-center ${redeemMessage.includes("berjaya") ? "text-success font-semibold" : "text-destructive"}`}>
                      {redeemMessage}
                    </p>
                  )}
                  <div className="text-right mt-3">
                    <button
                      type="button"
                      onClick={() => {
                        setShowCouponInput(false);
                        setRedeemMessage("");
                        setCouponTurnstileToken("");
                      }}
                      className="text-xs text-muted-foreground hover:underline"
                    >
                      Batal
                    </button>
                  </div>
                </CardContent>
              </Card>
            </div>
          )}
        </div>
      </main>
    </div>
  );
}
