"use client";

import { useEffect, useState, useRef, Suspense } from "react";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import Link from "next/link";
import { useSearchParams, useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardFooter,
  CardDescription,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Switch } from "@/components/ui/switch";
import {
  Brain,
  CreditCard,
  Calendar,
  ToggleLeft,
  Home,
  BookOpenCheck,
  User,
  Loader2,
  AlertCircle,
  ArrowRight,
  CheckCircle2,
} from "lucide-react";
import { useAuth } from "@/lib/auth";

interface SubscriptionDetails {
  id: string;
  stripe_status: string;
  auto_renew: boolean;
  ends_at: string | null;
  updated_at: string;
  payment_gateway?: string;
  is_lifetime?: boolean;
  plan: {
    id: string;
    name: string;
    price_myr: number;
  };
}

function SubscriptionContent() {
  const { token } = useAuth();
  const { toast } = useAlert();
  const searchParams = useSearchParams();
  const router = useRouter();
  const [subData, setSubData] = useState<{ has_active: boolean; subscription: SubscriptionDetails | null } | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [toggling, setToggling] = useState(false);
  const [verifying, setVerifying] = useState(false);
  const hasVerifiedRef = useRef(false);

  const fetchSubscriptionStatus = async () => {
    if (!token) return;
    try {
      setLoading(true);
      setError("");
      const res = await fetch("/api/subscription/status", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (!res.ok) throw new Error("Gagal memuatkan status langganan.");
      const data = await res.json();
      setSubData(data);
    } catch (err: any) {
      setError(err.message || "Ralat sambungan pelayan.");
    } finally {
      setLoading(false);
    }
  };

  // Verify payment when returning from payment page
  useEffect(() => {
    if (!token || hasVerifiedRef.current) return;

    const success = searchParams.get("success");
    const statusId = searchParams.get("status_id");
    const billcode = searchParams.get("billcode");
    const sessionId = searchParams.get("session_id");

    if (success === "1" && statusId === "1" && billcode) {
      hasVerifiedRef.current = true;
      const verifyPayment = async () => {
        setVerifying(true);
        setLoading(true);
        try {
          const res = await fetch("/api/subscription/toyyibpay/verify-return", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${token}`,
              Accept: "application/json",
            },
            body: JSON.stringify({ billcode }),
          });
          const data = await res.json();
          if (data.activated) {
            toast(data.message || "Langganan Lifetime berjaya diaktifkan!", "success");
          } else {
            toast(data.message || "Pembayaran belum dapat disahkan.", "error");
          }
        } catch {
          toast("Ralat menyambung ke pelayan untuk pengesahan pembayaran.", "error");
        } finally {
          setVerifying(false);
          // Clean URL params to prevent re-triggering
          router.replace("/subscription", { scroll: false });
          // Re-fetch subscription status
          await fetchSubscriptionStatus();
        }
      };
      verifyPayment();
    } else if (success === "1" && sessionId) {
      hasVerifiedRef.current = true;
      const verifyStripe = async () => {
        setVerifying(true);
        setLoading(true);
        try {
          const res = await fetch("/api/subscription/stripe/verify-return", {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${token}`,
              Accept: "application/json",
            },
            body: JSON.stringify({ session_id: sessionId }),
          });
          const data = await res.json();
          if (data.activated) {
            toast(data.message || "Langganan Premium Stripe berjaya diaktifkan!", "success");
          } else {
            toast(data.message || "Pembayaran Stripe belum dapat disahkan.", "error");
          }
        } catch {
          toast("Ralat menyambung ke pelayan untuk pengesahan pembayaran Stripe.", "error");
        } finally {
          setVerifying(false);
          router.replace("/subscription", { scroll: false });
          await fetchSubscriptionStatus();
        }
      };
      verifyStripe();
    } else {
      fetchSubscriptionStatus();
    }
  }, [token, searchParams]);

  const handleToggleAutoRenew = async () => {
    if (!token || !subData?.subscription || toggling || subData?.subscription?.is_lifetime) return;
    try {
      setToggling(true);
      const res = await fetch("/api/subscription/toggle-renew", {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          subscription_id: subData.subscription.id,
        }),
      });
      if (!res.ok) throw new Error("Gagal mengemaskini auto-billing.");
      const updatedSub = await res.json();
      setSubData({
        has_active: updatedSub.stripe_status === "active",
        subscription: updatedSub,
      });
      toast(`Auto-Billing telah ${updatedSub.auto_renew ? "diaktifkan" : "dimatikan"}.`, "success");
    } catch (err: any) {
      toast(err.message || "Ralat mengemaskini langganan.", "error");
    } finally {
      setToggling(false);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-background flex flex-col items-center justify-center gap-3">
        <Loader2 className="w-8 h-8 animate-spin text-primary" />
        <p className="text-muted-foreground text-sm">
          {verifying ? "Mengesahkan pembayaran ToyyibPay anda..." : "Memproses status langganan..."}
        </p>
        {verifying && (
          <p className="text-xs text-muted-foreground/70">Sila tunggu, jangan tutup halaman ini.</p>
        )}
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center p-4">
        <Card className="w-full max-w-md border-destructive/30">
          <CardHeader className="text-center">
            <AlertCircle className="w-10 h-10 text-destructive mx-auto mb-2" />
            <CardTitle>Ralat Berlaku</CardTitle>
            <CardDescription>{error}</CardDescription>
          </CardHeader>
          <CardFooter className="justify-center">
            <Button onClick={fetchSubscriptionStatus}>Cuba Semula</Button>
          </CardFooter>
        </Card>
      </div>
    );
  }

  const sub = subData?.subscription;
  const isLifetime = sub?.is_lifetime;
  const isCoupon = sub?.payment_gateway === "coupon";

  return (
    <div className="min-h-screen bg-background pb-20 lg:pb-8">
      <header className="border-b border-border bg-background/80 backdrop-blur-sm sticky top-0 z-50">
        <nav className="max-w-4xl mx-auto px-4 h-16 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <Brain className="w-6 h-6 text-primary" />
            <span className="text-lg font-bold">Vocabulary</span>
          </Link>
          <Link href="/profile">
            <Button variant="ghost" size="sm">
              Profil
            </Button>
          </Link>
        </nav>
      </header>

      <main className="max-w-2xl mx-auto px-4 py-8 space-y-6">
        <h1 className="text-2xl font-bold">Urus Langganan</h1>

        {!subData?.has_active || !sub ? (
          <Card className="border-primary/20 bg-primary/5">
            <CardHeader className="space-y-1">
              <CardTitle className="text-xl">Mod Percuma</CardTitle>
              <CardDescription>
                Akses anda terhad. Naik taraf ke Premium untuk membuka semua bahasa dan level pembelajaran.
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="text-3xl font-bold text-primary">RM0.00</div>
              <p className="text-sm text-muted-foreground mt-1">Pelan Asas Percuma</p>
            </CardContent>
            <CardFooter>
              <Link href="/pricing" className="w-full">
                <Button className="w-full flex items-center justify-center gap-2">
                  Dapatkan Premium <ArrowRight className="w-4 h-4" />
                </Button>
              </Link>
            </CardFooter>
          </Card>
        ) : (
          <>
            {/* Current Plan */}
            <Card>
              <CardHeader>
                <CardTitle className="text-lg flex items-center gap-2">
                  <CreditCard className="w-5 h-5 text-primary" />
                  Plan Semasa
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-lg">{sub.plan?.name || "Pelan Premium"}</p>
                    <p className="text-sm text-muted-foreground">
                      {isCoupon
                        ? "Akses Premium Percuma"
                        : isLifetime
                        ? "RM100 / sekali bayar"
                        : `RM${sub.plan?.price_myr || 20} / bulan`}
                    </p>
                  </div>
                  <Badge className="bg-success/20 text-success border-success/30">
                    {sub.stripe_status === "active" ? "Aktif" : sub.stripe_status.toUpperCase()}
                  </Badge>
                </div>
                <div className="flex items-center gap-2 text-sm text-muted-foreground">
                  <Calendar className="w-4 h-4" />
                  <span>
                    {isLifetime ? (
                      <strong>Akses Seumur Hidup (Selamanya)</strong>
                    ) : (
                      <>
                        Tamat/Pembaharuan pada:{" "}
                        <strong>
                          {sub.ends_at
                            ? new Date(sub.ends_at).toLocaleDateString("ms-MY", {
                                day: "numeric",
                                month: "long",
                                year: "numeric",
                              })
                            : new Date(new Date(sub.updated_at).setMonth(new Date(sub.updated_at).getMonth() + 1)).toLocaleDateString("ms-MY", {
                                day: "numeric",
                                month: "long",
                                year: "numeric",
                              })}
                        </strong>
                      </>
                    )}
                  </span>
                </div>
              </CardContent>
            </Card>

            {/* Auto-Billing Toggle (Only show if not lifetime/coupon) */}
            {!isLifetime && !isCoupon && (
              <Card>
                <CardContent className="p-6">
                  <div className="flex items-center justify-between">
                    <div className="space-y-1">
                      <div className="flex items-center gap-2">
                        <ToggleLeft className="w-5 h-5 text-primary" />
                        <span className="font-medium">Auto-Billing</span>
                      </div>
                      <p className="text-sm text-muted-foreground pr-4">
                        Bila OFF, langganan tamat pada tarikh pembaharuan.
                        <br />
                        Bila ON, caj automatik setiap bulan.
                      </p>
                    </div>
                    <Switch
                      checked={sub.auto_renew}
                      onCheckedChange={handleToggleAutoRenew}
                      disabled={toggling}
                    />
                  </div>
                </CardContent>
              </Card>
            )}

            {/* Cancel Zone (Only show if not lifetime/coupon) */}
            {!isLifetime && !isCoupon && (
              <Card className="border-destructive/30">
                <CardHeader>
                  <CardTitle className="text-lg text-destructive">Zon Bahaya</CardTitle>
                  <CardDescription>
                    Membatalkan pembaharuan automatik langganan anda.
                  </CardDescription>
                </CardHeader>
                <CardFooter>
                  <Button
                    variant="destructive"
                    className="w-full"
                    onClick={handleToggleAutoRenew}
                    disabled={toggling || !sub.auto_renew}
                  >
                    {toggling ? "Memproses..." : sub.auto_renew ? "Batal Pembaharuan Langganan" : "Langganan Telah Dibatalkan"}
                  </Button>
                </CardFooter>
              </Card>
            )}
          </>
        )}
      </main>

      {/* Mobile Bottom Nav */}
      <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-border bg-background/95 backdrop-blur-sm lg:hidden">
        <div className="flex items-center justify-around h-16 px-2">
          <Link
            href="/"
            className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground transition-colors"
          >
            <Home className="w-5 h-5" />
            <span className="text-[10px] font-medium">Rumah</span>
          </Link>
          <Link
            href="/quiz"
            className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground transition-colors"
          >
            <BookOpenCheck className="w-5 h-5" />
            <span className="text-[10px] font-medium">Quiz</span>
          </Link>
          <Link href="/subscription" className="flex flex-col items-center gap-0.5 text-primary">
            <CreditCard className="w-5 h-5" />
            <span className="text-[10px] font-medium">Langganan</span>
          </Link>
          <Link
            href="/profile"
            className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground transition-colors"
          >
            <User className="w-5 h-5" />
            <span className="text-[10px] font-medium">Profil</span>
          </Link>
        </div>
      </nav>
    </div>
  );
}

export default function SubscriptionPage() {
  return (
    <Suspense fallback={
      <div className="min-h-screen bg-background flex flex-col items-center justify-center gap-3">
        <Loader2 className="w-8 h-8 animate-spin text-primary" />
        <p className="text-muted-foreground text-sm">Memproses status langganan...</p>
      </div>
    }>
      <SubscriptionContent />
    </Suspense>
  );
}
