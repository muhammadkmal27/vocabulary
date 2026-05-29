"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Pencil, Trash2, Loader2, AlertCircle } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { Switch } from "@/components/ui/switch";

interface PlanRecord {
  id: string;
  name: string;
  slug: string;
  price_myr: number;
  stripe_price_id?: string | null;
  is_active: boolean;
  member_limit?: number | null;
  duration_months?: number | null;
}

export default function AdminPlansPage() {
  const { token } = useAuth();
  const { toast, showConfirm } = useAlert();
  const [plans, setPlans] = useState<PlanRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Edit form state
  const [open, setOpen] = useState(false);
  const [editingPlan, setEditingPlan] = useState<PlanRecord | null>(null);
  const [name, setName] = useState("");
  const [priceMyr, setPriceMyr] = useState("");
  const [isActive, setIsActive] = useState(true);
  const [memberLimit, setMemberLimit] = useState("");
  const [durationMonths, setDurationMonths] = useState("");
  const [submitting, setSubmitting] = useState(false);

  const fetchPlans = async () => {
    if (!token) return;
    try {
      setLoading(true);
      setError("");
      const res = await fetch("/api/admin/plans", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (!res.ok) throw new Error("Gagal mengambil senarai plan.");
      const data = await res.json();
      setPlans(Array.isArray(data) ? data : data.data || []);
    } catch (err: any) {
      setError(err.message || "Ralat berlaku.");
    } finally {
      setLoading(false);
    }
  };

  const handleToggleActive = async (plan: PlanRecord) => {
    if (!token) return;
    try {
      const res = await fetch(`/api/admin/plans/${plan.id}`, {
        method: "PUT",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          is_active: !plan.is_active,
        }),
      });

      if (res.ok) {
        toast(`Pakej telah ${!plan.is_active ? "dipaparkan" : "disembunyikan"}.`, "success");
        fetchPlans();
      } else {
        toast("Gagal mengemaskini status pakej.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  const handleOpenEdit = (plan: PlanRecord) => {
    setEditingPlan(plan);
    setName(plan.name);
    setPriceMyr(plan.price_myr.toString());
    setIsActive(plan.is_active);
    setMemberLimit(plan.member_limit ? plan.member_limit.toString() : "");
    setDurationMonths(plan.duration_months ? plan.duration_months.toString() : "");
    setOpen(true);
  };

  const handleSubmitEdit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!name || !priceMyr || !editingPlan) return;
    setSubmitting(true);
    try {
      const res = await fetch(`/api/admin/plans/${editingPlan.id}`, {
        method: "PUT",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          name,
          price_myr: parseFloat(priceMyr),
          is_active: isActive,
          member_limit: memberLimit ? parseInt(memberLimit) : null,
          duration_months: durationMonths ? parseInt(durationMonths) : null,
        }),
      });

      if (res.ok) {
        setOpen(false);
        fetchPlans();
      } else {
        toast("Gagal mengemaskini plan.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async (id: string) => {
    const confirmed = await showConfirm("Adakah anda pasti mahu memadam plan ini?");
    if (!confirmed) return;
    try {
      const res = await fetch(`/api/admin/plans/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        fetchPlans();
      } else {
        toast("Gagal memadam plan.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  useEffect(() => {
    fetchPlans();
  }, [token]);

  if (loading) {
    return (
      <div className="p-6 flex justify-center items-center min-h-[40vh]">
        <Loader2 className="w-8 h-8 animate-spin text-primary" />
      </div>
    );
  }

  if (error) {
    return (
      <div className="p-6 flex flex-col items-center gap-3 min-h-[40vh] justify-center">
        <AlertCircle className="w-10 h-10 text-destructive" />
        <p className="text-sm text-muted-foreground">{error}</p>
        <Button onClick={fetchPlans} variant="outline" size="sm">Cuba Semula</Button>
      </div>
    );
  }

  return (
    <div className="p-6 space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">Plan Harga</h1>
        <Badge variant="secondary">{plans.length} plan</Badge>
      </div>
      <div className="grid md:grid-cols-2 gap-4">
        {plans.length === 0 ? (
          <p className="text-muted-foreground col-span-2 text-center py-8">Tiada plan ditemui.</p>
        ) : (
          plans.map((plan) => (
            <Card key={plan.id}>
              <CardHeader className="flex flex-row items-start justify-between">
                <div>
                  <CardTitle>{plan.name}</CardTitle>
                  <p className="text-sm text-muted-foreground font-mono mb-2">
                    {plan.slug}
                  </p>
                  <Badge variant={plan.is_active ? "default" : "secondary"}>
                    {plan.is_active ? "Dipaparkan" : "Disembunyikan"}
                  </Badge>
                </div>
                <div className="flex items-center gap-2">
                  <span className="text-xs text-muted-foreground font-medium">
                    {plan.is_active ? "Papar" : "Sembunyi"}
                  </span>
                  <Switch
                    checked={plan.is_active}
                    onCheckedChange={() => handleToggleActive(plan)}
                  />
                </div>
              </CardHeader>
              <CardContent className="space-y-3">
                 <div className="text-2xl font-bold">
                  RM{typeof plan.price_myr === "number" ? plan.price_myr.toFixed(2) : plan.price_myr}
                  <span className="text-sm text-muted-foreground">
                    {plan.duration_months ? ` / ${plan.duration_months} bulan` : (plan.slug === "lifetime" ? " /sekali bayar" : " /bulan")}
                  </span>
                </div>
                {plan.slug === "lifetime" && (
                  <div className="space-y-1 text-xs text-muted-foreground">
                    <p>
                      Had Pengguna: <strong className="text-foreground">{plan.member_limit ?? 100} orang</strong>
                    </p>
                    <p>
                      Tempoh Aktif: <strong className="text-foreground">{plan.duration_months ? `${plan.duration_months} bulan` : "Seumur Hidup"}</strong>
                    </p>
                  </div>
                )}
                {plan.stripe_price_id && (
                  <p className="text-xs text-muted-foreground font-mono">
                    Stripe: {plan.stripe_price_id}
                  </p>
                )}
                <div className="flex gap-2">
                  <Button variant="outline" size="sm" onClick={() => handleOpenEdit(plan)}>
                    <Pencil className="w-3.5 h-3.5 mr-1" /> Edit
                  </Button>
                  {plan.slug !== "lifetime" && plan.slug !== "monthly-premium" && (
                    <Button variant="outline" size="sm" onClick={() => handleDelete(plan.id)}>
                      <Trash2 className="w-3.5 h-3.5 mr-1 text-destructive" /> Padam
                    </Button>
                  )}
                </div>
              </CardContent>
            </Card>
          ))
        )}
      </div>

      {/* Edit Plan Dialog */}
      <Dialog open={open} onOpenChange={setOpen}>
        <DialogContent className="max-w-md">
          <DialogHeader>
            <DialogTitle>Kemas Kini Plan Harga</DialogTitle>
          </DialogHeader>
          <form onSubmit={handleSubmitEdit} className="space-y-4 pt-2">
            <div className="space-y-1.5">
              <Label htmlFor="plan_name">Nama Plan</Label>
              <Input
                id="plan_name"
                value={name}
                onChange={(e) => setName(e.target.value)}
                required
              />
            </div>
            <div className="space-y-1.5">
              <Label htmlFor="plan_price">Harga (RM)</Label>
              <Input
                id="plan_price"
                type="number"
                step="0.01"
                min="0"
                value={priceMyr}
                onChange={(e) => setPriceMyr(e.target.value)}
                required
              />
            </div>
            {editingPlan?.slug === "lifetime" && (
              <>
                <div className="space-y-1.5">
                  <Label htmlFor="plan_limit">Had Ahli / Quota Promo</Label>
                  <Input
                    id="plan_limit"
                    type="number"
                    placeholder="Tiada had (Lalai 100)"
                    value={memberLimit}
                    onChange={(e) => setMemberLimit(e.target.value)}
                  />
                </div>
                <div className="space-y-1.5">
                  <Label htmlFor="plan_duration">Tempoh Aktif (Bulan)</Label>
                  <Input
                    id="plan_duration"
                    type="number"
                    min="1"
                    placeholder="Seumur Hidup (Kosongkan)"
                    value={durationMonths}
                    onChange={(e) => setDurationMonths(e.target.value)}
                  />
                </div>
              </>
            )}
            <div className="flex items-center gap-2">
              <input
                id="plan_active"
                type="checkbox"
                checked={isActive}
                onChange={(e) => setIsActive(e.target.checked)}
                className="w-4 h-4 text-primary border-border rounded focus:ring-primary"
              />
              <Label htmlFor="plan_active" className="cursor-pointer">
                Tandakan sebagai Aktif
              </Label>
            </div>
            <div className="flex justify-end gap-2 pt-2">
              <Button type="button" variant="outline" onClick={() => setOpen(false)}>
                Batal
              </Button>
              <Button type="submit" disabled={submitting}>
                {submitting ? "Menyimpan..." : "Simpan Perubahan"}
              </Button>
            </div>
          </form>
        </DialogContent>
      </Dialog>
    </div>
  );
}
