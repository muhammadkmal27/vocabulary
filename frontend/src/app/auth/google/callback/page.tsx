"use client";

import { useEffect, Suspense } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { Card, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Brain } from "lucide-react";
import { useAlert } from "@/components/ui/AlertConfirmProvider";

function CallbackContent() {
  const router = useRouter();
  const { toast } = useAlert();
  const searchParams = useSearchParams();
  const code = searchParams.get("code");

  useEffect(() => {
    if (!code) {
      router.push("/login");
      return;
    }

    const exchangeCode = async () => {
      try {
        const res = await fetch(`/api/auth/google/callback?code=${code}`);
        const data = await res.json();
        
        if (data.token && data.user) {
          localStorage.setItem("auth-token", data.token);
          localStorage.setItem("auth-user", JSON.stringify(data.user));
          // Redirect to dashboard
          window.location.href = "/";
        } else {
          toast(data.message || "Log masuk Google gagal.", "error");
          router.push("/login");
        }
      } catch (err) {
        toast("Ralat menyambung ke pelayan.", "error");
        router.push("/login");
      }
    };

    exchangeCode();
  }, [code, router]);

  return (
    <Card className="w-full max-w-sm border-border">
      <CardHeader className="text-center space-y-3">
        <div className="flex justify-center">
          <Brain className="w-10 h-10 text-primary animate-bounce" />
        </div>
        <CardTitle className="text-2xl">Mengesahkan...</CardTitle>
        <CardDescription>Sila tunggu seketika sementara kami melog masuk anda.</CardDescription>
      </CardHeader>
    </Card>
  );
}

export default function GoogleCallbackPage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-4">
      <Suspense fallback={<div className="text-muted-foreground">Memuatkan...</div>}>
        <CallbackContent />
      </Suspense>
    </div>
  );
}
