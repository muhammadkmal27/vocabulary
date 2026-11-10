"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {
  Users,
  CreditCard,
  Languages,
  BookOpen,
  TrendingUp,
  DollarSign,
  Loader2,
  AlertCircle,
} from "lucide-react";
import { useAuth } from "@/lib/auth";

interface DashboardStats {
  live_now: number;
  total_visitors: number;
  live_visitors?: Array<{
    id: string;
    user_name: string;
    user_email?: string | null;
    last_page: string;
    last_seen_seconds_ago: number;
  }>;
  total_users: number;
  active_subscriptions: number;
  total_languages: number;
  total_levels: number;
  total_sentences: number;
  recent_users: Array<{
    id: string;
    name: string;
    email: string;
    created_at: string;
  }>;
  monthly_revenue: number;
  active_stripe_count: number;
  active_toyyibpay_count: number;
}

export default function AdminDashboardPage() {
  const { token } = useAuth();
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const fetchStats = async (isBackground = false) => {
      if (!token) return;
      try {
        if (!isBackground) setLoading(true);
        setError("");
        const res = await fetch("/api/admin/dashboard", {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
        if (!res.ok) throw new Error("Gagal memuatkan statistik dashboard.");
        const data = await res.json();
        setStats(data);
      } catch (err: any) {
        if (!isBackground) setError(err.message || "Ralat sambungan pelayan.");
      } finally {
        if (!isBackground) setLoading(false);
      }
    };

    fetchStats();

    // Auto-refresh metrik masa nyata setiap 15 saat
    const interval = setInterval(() => {
      fetchStats(true);
    }, 15000);

    return () => clearInterval(interval);
  }, [token]);

  if (loading) {
    return (
      <div className="p-6 flex flex-col justify-center items-center min-h-[40vh] gap-2">
        <Loader2 className="w-8 h-8 animate-spin text-primary" />
        <p className="text-muted-foreground text-sm">Memuatkan data dashboard...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="p-6">
        <Card className="border-destructive/30 bg-destructive/5 text-destructive p-4 flex items-center gap-3">
          <AlertCircle className="w-5 h-5 shrink-0" />
          <p className="text-sm font-medium">{error}</p>
        </Card>
      </div>
    );
  }

  if (!stats) return null;

  const cardItems = [
    {
      icon: Users,
      label: "Jumlah Pengguna",
      value: stats.total_users.toLocaleString(),
      color: "text-primary",
    },
    {
      icon: CreditCard,
      label: "Langganan Aktif",
      value: stats.active_subscriptions.toLocaleString(),
      color: "text-success",
    },
    {
      icon: Languages,
      label: "Bahasa",
      value: stats.total_languages.toLocaleString(),
      color: "text-warning",
    },
    {
      icon: BookOpen,
      label: "Jumlah Ayat",
      value: stats.total_sentences.toLocaleString(),
      color: "text-primary",
    },
  ];

  return (
    <div className="p-6 space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2">
        <h1 className="text-2xl font-bold">Dashboard Admin</h1>
        <div className="flex items-center gap-2 text-xs text-muted-foreground">
          <span className="relative flex h-2 w-2">
            <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
            <span className="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
          </span>
          <span>Pemantauan Pelawat Aktif Masa Nyata</span>
        </div>
      </div>

      {/* 🟢 Live now & 👥 Total visitors Card (Exact visual match) */}
      <div className="bg-[#18181b] text-white rounded-2xl p-6 border border-zinc-800 shadow-xl relative overflow-hidden">
        {/* Ambient background glow */}
        <div className="absolute -top-12 -right-12 w-48 h-48 bg-emerald-500/10 rounded-full blur-3xl pointer-events-none" />

        <div className="grid grid-cols-2 gap-6 relative z-10">
          {/* Live now */}
          <div className="space-y-1">
            <div className="flex items-center gap-2 text-zinc-400 text-sm font-medium">
              <span className="relative flex h-2.5 w-2.5">
                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-500"></span>
              </span>
              <span>Live now</span>
            </div>
            <div className="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight text-white flex items-baseline gap-2">
              {(stats.live_now || 0).toLocaleString()}
              <span className="text-[11px] font-normal text-emerald-400 bg-emerald-500/10 px-2 py-0.5 rounded-full border border-emerald-500/20 hidden sm:inline-block">
                aktif masa nyata
              </span>
            </div>
          </div>

          {/* Total visitors */}
          <div className="space-y-1">
            <div className="flex items-center gap-2 text-zinc-400 text-sm font-medium">
              <Users className="w-4 h-4 text-zinc-400" />
              <span>Total visitors</span>
            </div>
            <div className="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight text-white">
              {(stats.total_visitors || 0).toLocaleString()}
            </div>
          </div>
        </div>

        {/* Live Visitor Details Bar */}
        {stats.live_visitors && stats.live_visitors.length > 0 && (
          <div className="mt-4 pt-4 border-t border-zinc-800/80 flex flex-wrap items-center justify-between text-xs text-zinc-400 gap-2 relative z-10">
            <span className="flex items-center gap-1.5 flex-wrap">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 shrink-0"></span>
              <span className="font-medium text-zinc-300">Pelawat aktif:</span>{" "}
              {stats.live_visitors.map((v) => (
                <span key={v.id} className="bg-zinc-800/80 px-2 py-0.5 rounded text-zinc-300">
                  {v.user_name} <span className="text-zinc-500">({v.last_page})</span>
                </span>
              ))}
            </span>
            <span className="text-zinc-500 shrink-0">Auto-refresh setiap 15s</span>
          </div>
        )}
      </div>

      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        {cardItems.map(({ icon: Icon, label, value, color }) => (
          <Card key={label}>
            <CardContent className="p-6 flex items-center gap-4">
              <Icon className={`w-8 h-8 ${color}`} />
              <div>
                <div className="text-2xl font-bold">{value}</div>
                <div className="text-sm text-muted-foreground">{label}</div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Revenue Card */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <DollarSign className="w-5 h-5 text-success" />
            Revenue Bulan Ini
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="text-3xl font-bold">RM{stats.monthly_revenue.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</div>
        </CardContent>
      </Card>

      {/* Recent Users List */}
      <Card>
        <CardHeader>
          <CardTitle className="text-lg flex items-center gap-2">
            <Users className="w-5 h-5 text-primary" />
            Pendaftaran Baru
          </CardTitle>
        </CardHeader>
        <CardContent>
          {stats.recent_users.length === 0 ? (
            <p className="text-sm text-muted-foreground">Tiada pengguna baru didaftarkan.</p>
          ) : (
            <div className="divide-y divide-border">
              {stats.recent_users.map((user) => (
                <div key={user.id} className="py-3 flex items-center justify-between">
                  <div>
                    <p className="font-semibold text-sm">{user.name}</p>
                    <p className="text-xs text-muted-foreground">{user.email}</p>
                  </div>
                  <p className="text-xs text-muted-foreground">
                    {new Date(user.created_at).toLocaleDateString("ms-MY", {
                      day: "numeric",
                      month: "short",
                      year: "numeric",
                    })}
                  </p>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
