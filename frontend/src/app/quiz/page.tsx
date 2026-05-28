"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { useAuth } from "@/lib/auth";
import { Loader2 } from "lucide-react";

export default function GeneralQuizPage() {
  const router = useRouter();
  const { token } = useAuth();
  const [error, setError] = useState("");

  useEffect(() => {
    if (!token) {
      router.push("/login");
      return;
    }

    const initRedirect = async () => {
      try {
        // 1. Fetch active languages
        const langResponse = await fetch("/api/languages", {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
        if (!langResponse.ok) throw new Error("Gagal mengambil bahasa.");
        const languages = await langResponse.json();

        if (languages.length > 0) {
          const firstLang = languages[0];
          
          // 2. Fetch dashboard to get first level
          const dashResponse = await fetch(`/api/dashboard?language_id=${firstLang.id}`, {
            headers: {
              Authorization: `Bearer ${token}`,
              Accept: "application/json",
            },
          });
          if (!dashResponse.ok) throw new Error("Gagal mengambil level.");
          const dashData = await dashResponse.json();

          if (dashData.levels && dashData.levels.length > 0) {
            const firstLevel = dashData.levels[0];
            router.push(`/quiz/${firstLang.code}/${firstLevel.id}`);
            return;
          }
        }
        
        // Fallback
        router.push("/");
      } catch (err: any) {
        setError(err.message || "Ralat berlaku.");
        router.push("/");
      }
    };

    initRedirect();
  }, [token]);

  return (
    <div className="min-h-screen flex flex-col justify-center items-center bg-background">
      <Loader2 className="w-10 h-10 animate-spin text-primary mb-2" />
      <p className="text-sm text-muted-foreground">Menghalakan anda ke kuiz...</p>
    </div>
  );
}
