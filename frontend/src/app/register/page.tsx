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
  CardFooter,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Brain, Eye, EyeOff } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { Turnstile } from "@/components/ui/Turnstile";

export default function RegisterPage() {
  const { toast } = useAlert();
  const { register } = useAuth();
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [turnstileToken, setTurnstileToken] = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!name || !email || !password) {
      toast("Sila isi semua maklumat.", "error");
      return;
    }
    if (password.length < 8) {
      toast("Kata laluan mestilah sekurang-kurangnya 8 aksara.", "error");
      return;
    }
    if (!turnstileToken) {
      toast("Sila sahkan anda bukan bot.", "error");
      return;
    }
    setIsLoading(true);
    try {
      // register takes: name, email, password, password_confirmation, turnstileToken
      await register(name, email, password, password, turnstileToken);
      const searchParams = new URLSearchParams(window.location.search);
      const redirect = searchParams.get("redirect") || "/";
      window.location.href = redirect;
    } catch (err: any) {
      toast("Pendaftaran gagal. Sila cuba lagi atau gunakan email lain.", "error");
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
            <CardTitle className="text-2xl">Daftar Akaun</CardTitle>
            <CardDescription>Mula hafal 20 ayat setiap hari</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="name">Nama</Label>
              <Input
                id="name"
                placeholder="Nama anda"
                value={name}
                onChange={(e) => setName(e.target.value)}
                required
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input
                id="email"
                type="email"
                placeholder="nama@email.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="password">Kata Laluan</Label>
              <div className="relative">
                <Input
                  id="password"
                  type={showPassword ? "text" : "password"}
                  placeholder="Minimum 8 aksara"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  className="pr-10"
                  required
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
            <Turnstile onVerify={(token) => setTurnstileToken(token)} />
            <Button className="w-full" type="submit" disabled={isLoading}>
              {isLoading ? "Mendaftar..." : "Daftar Percuma"}
            </Button>
          </CardContent>
        </form>
        <CardFooter className="justify-center">
          <p className="text-sm text-muted-foreground">
            Sudah ada akaun?{" "}
            <Link
              href="/login"
              className="text-primary hover:underline font-medium"
            >
              Log Masuk
            </Link>
          </p>
        </CardFooter>
      </Card>
    </div>
  );
}

