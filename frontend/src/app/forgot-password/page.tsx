"use client";

import { useState } from "react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  CardDescription,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Brain, ArrowLeft } from "lucide-react";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { Turnstile } from "@/components/ui/Turnstile";
import api from "@/lib/api";

export default function ForgotPasswordPage() {
  const { toast } = useAlert();
  const [email, setEmail] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [turnstileToken, setTurnstileToken] = useState("");
  const [isSent, setIsSent] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!email) {
      toast("Sila masukkan email anda.", "error");
      return;
    }
    if (!turnstileToken) {
      toast("Sila sahkan anda bukan bot.", "error");
      return;
    }
    setIsLoading(true);
    try {
      const res = await api.post("/forgot-password", {
        email,
        "cf-turnstile-response": turnstileToken,
      });

      if (res && res.message) {
        if (res.message.toLowerCase().includes("hantar") || res.message.toLowerCase().includes("sent") || res.message.toLowerCase().includes("success")) {
          toast(res.message, "success");
          setIsSent(true);
        } else {
          toast(res.message, "error");
        }
      } else {
        toast("Gagal menghantar pautan set semula.", "error");
      }
    } catch (err) {
      toast("Ralat sambungan ke pelayan.", "error");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-4">
      <Card className="w-full max-w-sm border-border">
        <form onSubmit={handleSubmit}>
          <CardHeader className="text-center space-y-3">
            <div className="flex justify-center">
              <Brain className="w-10 h-10 text-primary" />
            </div>
            <CardTitle className="text-2xl">Lupa Kata Laluan</CardTitle>
            <CardDescription>
              {isSent
                ? "Sila semak peti masuk e-mel anda."
                : "Masukkan e-mel untuk menerima pautan set semula kata laluan."}
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            {!isSent ? (
              <>
                <div className="space-y-2">
                  <Label htmlFor="email">Email</Label>
                  <Input
                    id="email"
                    type="email"
                    placeholder="nama@email.com"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                    disabled={isLoading}
                  />
                </div>
                <Turnstile onVerify={(token) => setTurnstileToken(token)} />
                <Button className="w-full" type="submit" disabled={isLoading}>
                  {isLoading ? "Menghantar..." : "Hantar Pautan"}
                </Button>
              </>
            ) : (
              <div className="text-center p-3 bg-primary/10 text-primary rounded-xl text-sm font-medium">
                Pautan set semula kata laluan telah dihantar. Sila periksa e-mel anda (termasuk folder spam).
              </div>
            )}
          </CardContent>
          <div className="px-6 pb-6 text-center">
            <Link
              href="/login"
              className="text-xs text-muted-foreground hover:text-foreground flex items-center justify-center gap-1.5 transition-colors"
            >
              <ArrowLeft className="w-3.5 h-3.5" /> Kembali ke Log Masuk
            </Link>
          </div>
        </form>
      </Card>
    </div>
  );
}
