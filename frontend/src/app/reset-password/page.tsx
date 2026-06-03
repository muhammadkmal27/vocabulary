"use client";

import { useState, Suspense } from "react";
import { useSearchParams } from "next/navigation";
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
import { Brain, Eye, EyeOff, CheckCircle } from "lucide-react";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { Turnstile } from "@/components/ui/Turnstile";
import api from "@/lib/api";

function ResetPasswordForm() {
  const { toast } = useAlert();
  const searchParams = useSearchParams();
  const token = searchParams.get("token") || "";
  const email = searchParams.get("email") || "";

  const [password, setPassword] = useState("");
  const [passwordConfirm, setPasswordConfirm] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [showPasswordConfirm, setShowPasswordConfirm] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [turnstileToken, setTurnstileToken] = useState("");
  const [isSuccess, setIsSuccess] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!token || !email) {
      toast("Token atau email tidak sah.", "error");
      return;
    }
    if (!password || !passwordConfirm) {
      toast("Sila isi semua ruangan kata laluan.", "error");
      return;
    }
    if (password.length < 8) {
      toast("Kata laluan mestilah sekurang-kurangnya 8 aksara.", "error");
      return;
    }
    if (password !== passwordConfirm) {
      toast("Sahkan kata laluan tidak sepadan.", "error");
      return;
    }
    if (!turnstileToken) {
      toast("Sila sahkan anda bukan bot.", "error");
      return;
    }
    setIsLoading(true);
    try {
      const res = await api.post("/reset-password", {
        token,
        email,
        password,
        password_confirmation: passwordConfirm,
        "cf-turnstile-response": turnstileToken,
      });

      if (res && res.message) {
        const isOk = res.message.toLowerCase().includes("berjaya") || res.message.toLowerCase().includes("success") || res.message.toLowerCase().includes("reset");
        toast(res.message, isOk ? "success" : "error");
        if (isOk) {
          setIsSuccess(true);
        }
      } else {
        toast("Gagal menetapkan semula kata laluan.", "error");
      }
    } catch (err) {
      toast("Ralat sambungan ke pelayan.", "error");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <Card className="w-full max-w-sm border-border">
      <form onSubmit={handleSubmit}>
        <CardHeader className="text-center space-y-3">
          <div className="flex justify-center">
            <Brain className="w-10 h-10 text-primary" />
          </div>
          <CardTitle className="text-2xl">Set Semula Kata Laluan</CardTitle>
          <CardDescription>
            {isSuccess
              ? "Kata laluan anda telah berjaya dikemaskini."
              : `Menetapkan kata laluan baru untuk ${email}`}
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          {!isSuccess ? (
            <>
              <div className="space-y-2">
                <Label htmlFor="password">Kata Laluan Baru</Label>
                <div className="relative">
                  <Input
                    id="password"
                    type={showPassword ? "text" : "password"}
                    placeholder="Minimum 8 aksara"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    required
                    disabled={isLoading}
                    className="pr-10"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground transition-colors"
                  >
                    {showPassword ? (
                      <EyeOff className="w-4 h-4" />
                    ) : (
                      <Eye className="w-4 h-4" />
                    )}
                  </button>
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="password-confirm">Sahkan Kata Laluan Baru</Label>
                <div className="relative">
                  <Input
                    id="password-confirm"
                    type={showPasswordConfirm ? "text" : "password"}
                    placeholder="Sahkan kata laluan baru"
                    value={passwordConfirm}
                    onChange={(e) => setPasswordConfirm(e.target.value)}
                    required
                    disabled={isLoading}
                    className="pr-10"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPasswordConfirm(!showPasswordConfirm)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground transition-colors"
                  >
                    {showPasswordConfirm ? (
                      <EyeOff className="w-4 h-4" />
                    ) : (
                      <Eye className="w-4 h-4" />
                    )}
                  </button>
                </div>
              </div>

              <Turnstile onVerify={(token) => setTurnstileToken(token)} />

              <Button className="w-full" type="submit" disabled={isLoading}>
                {isLoading ? "Mengemaskini..." : "Simpan Kata Laluan Baru"}
              </Button>
            </>
          ) : (
            <div className="space-y-4">
              <div className="flex items-center gap-2 text-green-600 bg-green-50 dark:bg-green-950/20 dark:text-green-400 p-3 rounded-xl text-sm font-medium">
                <CheckCircle className="w-5 h-5 shrink-0" />
                <span>Kata laluan anda telah berjaya disimpan. Anda boleh log masuk sekarang.</span>
              </div>
              <Link href="/login" className="block">
                <Button className="w-full">Log Masuk</Button>
              </Link>
            </div>
          )}
        </CardContent>
      </form>
    </Card>
  );
}

export default function ResetPasswordPage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-4">
      <Suspense fallback={
        <Card className="w-full max-w-sm border-border">
          <CardHeader className="text-center">
            <Brain className="w-10 h-10 text-primary mx-auto animate-pulse" />
            <CardTitle className="text-2xl mt-4">Memuatkan...</CardTitle>
          </CardHeader>
        </Card>
      }>
        <ResetPasswordForm />
      </Suspense>
    </div>
  );
}
