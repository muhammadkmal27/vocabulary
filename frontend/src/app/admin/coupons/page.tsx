"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Plus, Pencil, Trash2, Copy, Calendar, Loader2 } from "lucide-react";
import { Label } from "@/components/ui/label";

export default function AdminCouponsPage() {
  const { token } = useAuth();
  const { toast, showConfirm } = useAlert();
  const [coupons, setCoupons] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Form State
  const [code, setCode] = useState("");
  const [duration, setDuration] = useState(30);
  const [maxUses, setMaxUses] = useState("");
  const [submitting, setSubmitting] = useState(false);

  const fetchCoupons = async () => {
    if (!token) return;
    try {
      setLoading(true);
      const response = await fetch("/api/admin/coupons", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (!response.ok) throw new Error("Gagal mengambil senarai kupon.");
      const data = await response.json();
      setCoupons(data);
    } catch (err: any) {
      setError(err.message || "Ralat berlaku.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchCoupons();
  }, [token]);

  const handleCreateCoupon = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!token || submitting) return;
    try {
      setSubmitting(true);
      setError("");
      const response = await fetch("/api/admin/coupons", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
        body: JSON.stringify({
          code: code || undefined, // empty code will auto-generate in backend if backend supports it
          duration_days: duration,
          max_uses: maxUses ? parseInt(maxUses) : null,
          discount_percent: 100, // standard 100% free access coupon
          is_active: true,
        }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || "Gagal menjana kupon.");
      }

      setCode("");
      setMaxUses("");
      fetchCoupons();
    } catch (err: any) {
      setError(err.message || "Ralat berlaku.");
    } finally {
      setSubmitting(false);
    }
  };

  const handleDeleteCoupon = async (id: string) => {
    if (!token) return;
    const confirmed = await showConfirm("Adakah anda pasti mahu memadam kupon ini?");
    if (!confirmed) return;
    try {
      const response = await fetch(`/api/admin/coupons/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (!response.ok) throw new Error("Gagal memadam kupon.");
      fetchCoupons();
    } catch (err: any) {
      toast(err.message, "error");
    }
  };

  const handleCopy = (text: string) => {
    navigator.clipboard.writeText(text);
    toast(`Kod kupon ${text} disalin ke papan keratan!`, "success");
  };

  return (
    <div className="p-6 space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">Kupon</h1>
      </div>

      {error && (
        <div className="bg-destructive/15 text-destructive text-sm p-4 rounded-md">
          {error}
        </div>
      )}

      <Card>
        <CardHeader>
          <CardTitle>Senarai Kupon</CardTitle>
        </CardHeader>
        <CardContent>
          {loading ? (
            <div className="flex justify-center py-8">
              <Loader2 className="w-8 h-8 animate-spin text-primary" />
            </div>
          ) : coupons.length === 0 ? (
            <div className="text-center py-8 text-muted-foreground">
              Tiada kupon ditemui. Sila jana kupon baharu di bawah.
            </div>
          ) : (
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Kod</TableHead>
                  <TableHead>Diskaun</TableHead>
                  <TableHead>Tempoh</TableHead>
                  <TableHead>Diguna</TableHead>
                  <TableHead>Had</TableHead>
                  <TableHead>Status</TableHead>
                  <TableHead>Luput</TableHead>
                  <TableHead className="text-right">Tindakan</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {coupons.map((c: any) => (
                  <TableRow key={c.id}>
                    <TableCell className="font-mono font-bold">
                      {c.code}
                    </TableCell>
                    <TableCell>
                      <Badge
                        variant={c.discount_percent === 100 ? "default" : "secondary"}
                      >
                        {c.discount_percent === 100 ? "FREE" : `${c.discount_percent}%`}
                      </Badge>
                    </TableCell>
                    <TableCell>{c.duration_days} hari</TableCell>
                    <TableCell>
                      {c.current_uses}
                      {c.max_uses ? `/${c.max_uses}` : ""}
                    </TableCell>
                    <TableCell>{c.max_uses ?? "∞"}</TableCell>
                    <TableCell>
                      <Badge variant={c.is_active ? "default" : "secondary"}>
                        {c.is_active ? "Aktif" : "Tidak Aktif"}
                      </Badge>
                    </TableCell>
                    <TableCell className="text-sm text-muted-foreground">
                      {c.expires_at ? new Date(c.expires_at).toLocaleDateString() : "Tiada"}
                    </TableCell>
                    <TableCell className="text-right space-x-2">
                      <Button variant="ghost" size="icon" onClick={() => handleCopy(c.code)}>
                        <Copy className="w-4 h-4" />
                      </Button>
                      <Button variant="ghost" size="icon" onClick={() => handleDeleteCoupon(c.id)}>
                        <Trash2 className="w-4 h-4 text-destructive" />
                      </Button>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          )}
        </CardContent>
      </Card>

      {/* Quick Generate */}
      <Card>
        <CardHeader>
          <CardTitle>Jana Kupon Pantas</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleCreateCoupon} className="space-y-4">
            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
              <div className="space-y-2">
                <Label>Kod Kupon</Label>
                <Input
                  placeholder="cth: FREE2026"
                  value={code}
                  onChange={(e) => setCode(e.target.value)}
                />
              </div>
              <div className="space-y-2">
                <Label>Tempoh (hari)</Label>
                <Input
                  type="number"
                  value={duration}
                  onChange={(e) => setDuration(parseInt(e.target.value) || 30)}
                />
              </div>
              <div className="space-y-2">
                <Label>Had Guna (kosong = unlimited)</Label>
                <Input
                  type="number"
                  placeholder="Unlimited"
                  value={maxUses}
                  onChange={(e) => setMaxUses(e.target.value)}
                />
              </div>
            </div>
            <Button type="submit" disabled={submitting}>
              {submitting ? (
                <>
                  <Loader2 className="w-4 h-4 mr-2 animate-spin" /> Menjana...
                </>
              ) : (
                <>
                  <Plus className="w-4 h-4 mr-2" /> Jana Kupon 100% FREE
                </>
              )}
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}
