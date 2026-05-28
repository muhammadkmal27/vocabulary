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
    const fetchStats = async () => {
      if (!token) return;
      try {
        setLoading(true);
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
        setError(err.message || "Ralat sambungan pelayan.");
      } finally {
        setLoading(false);
      }
    };

    fetchStats();
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
      <h1 className="text-2xl font-bold">Dashboard Admin</h1>
      
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
