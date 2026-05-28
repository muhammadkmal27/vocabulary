"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Ticket, Check, X, Gift } from "lucide-react";
import api from "@/lib/api";

export default function CouponRedemption() {
  const [code, setCode] = useState("");
  const [loading, setLoading] = useState(false);
  const [result, setResult] = useState<{
    success: boolean;
    message: string;
    accessUntil?: string;
  } | null>(null);

  const handleRedeem = async () => {
    if (!code.trim()) return;
    setLoading(true);
    setResult(null);
    try {
      const res = await api.post("/coupons/redeem", { code: code.trim() });
      setResult({
        success: true,
        message: res.data.message,
        accessUntil: res.data.access_until,
      });
      setCode("");
    } catch (err: any) {
      setResult({
        success: false,
        message: err.response?.data?.message || "Kupon tidak sah.",
      });
    }
    setLoading(false);
  };

  return (
    <Card className="border-border">
      <CardHeader>
        <CardTitle className="text-lg flex items-center gap-2">
          <Gift className="w-5 h-5 text-primary" /> Guna Kupon
        </CardTitle>
        <CardDescription>
          Masukkan kod kupon untuk akses percuma
        </CardDescription>
      </CardHeader>
      <CardContent className="space-y-4">
        <div className="flex gap-2">
          <Input
            placeholder="Masukkan kod kupon..."
            value={code}
            onChange={(e) => setCode(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && handleRedeem()}
            className="uppercase"
          />
          <Button onClick={handleRedeem} disabled={loading || !code.trim()}>
            {loading ? "..." : "Guna"}
          </Button>
        </div>
        {result && (
          <div
            className={`p-3 rounded-lg text-sm flex items-start gap-2 ${result.success ? "bg-success/10 border border-success/30" : "bg-destructive/10 border border-destructive/30"}`}
          >
            {result.success ? (
              <Check className="w-4 h-4 text-success mt-0.5 shrink-0" />
            ) : (
              <X className="w-4 h-4 text-destructive mt-0.5 shrink-0" />
            )}
            <div>
              <p
                className={result.success ? "text-success" : "text-destructive"}
              >
                {result.message}
              </p>
              {result.accessUntil && (
                <p className="text-muted-foreground text-xs mt-1">
                  Akses sehingga:{" "}
                  {new Date(result.accessUntil).toLocaleDateString("ms-MY")}
                </p>
              )}
            </div>
          </div>
        )}
      </CardContent>
    </Card>
  );
}
