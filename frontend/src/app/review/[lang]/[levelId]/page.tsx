"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useParams } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";
import { Check, RotateCcw, ArrowLeft, Loader2, AlertCircle } from "lucide-react";
import { useAuth } from "@/lib/auth";

interface ReviewSentence {
  id: string;
  source_text: string;
  target_text: string;
}

export default function ReviewPage() {
  const params = useParams();
  const langId = params?.lang as string;
  const levelId = params?.levelId as string;
  const { token } = useAuth();
  const [sentences, setSentences] = useState<ReviewSentence[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    if (!token || !langId || !levelId) return;
    const fetchReview = async () => {
      try {
        setLoading(true);
        const res = await fetch(`/api/review/${langId}/${levelId}`, {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
        if (!res.ok) throw new Error("Gagal mengambil ayat untuk ulang kaji.");
        const data = await res.json();
        // Deduplicate by sentence id to prevent duplicate key errors
        const raw: ReviewSentence[] = Array.isArray(data) ? data : [];
        const unique = Array.from(
          new Map(raw.map((s) => [s.id, s])).values()
        );
        setSentences(unique);
      } catch (err: any) {
        setError(err.message || "Ralat berlaku.");
      } finally {
        setLoading(false);
      }
    };
    fetchReview();
  }, [token, langId, levelId]);

  if (loading) {
    return (
      <div className="min-h-screen flex justify-center items-center bg-background">
        <Loader2 className="w-10 h-10 animate-spin text-primary" />
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center bg-background gap-4">
        <AlertCircle className="w-12 h-12 text-destructive" />
        <p className="text-muted-foreground">{error}</p>
        <Link href="/">
          <Button>Kembali ke Dashboard</Button>
        </Link>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background">
      <header className="border-b border-border px-4 py-3 flex items-center gap-3">
        <Link href="/">
          <Button variant="ghost" size="icon">
            <ArrowLeft className="w-5 h-5" />
          </Button>
        </Link>
        <div>
          <h1 className="font-semibold">Ulang Hafal</h1>
          <p className="text-xs text-muted-foreground">
            Ayat belum hafal sahaja
          </p>
        </div>
        <Badge variant="secondary" className="ml-auto">
          {sentences.length} ayat
        </Badge>
      </header>

      <main className="max-w-lg mx-auto px-4 py-6 space-y-4">
        {sentences.length === 0 ? (
          <div className="text-center py-12 space-y-4">
            <p className="text-2xl">🎉</p>
            <p className="text-muted-foreground font-medium">Tahniah! Tiada ayat belum hafal untuk level ini.</p>
            <Link href="/">
              <Button>Kembali ke Dashboard</Button>
            </Link>
          </div>
        ) : (
          <>
            {sentences.map((s, idx) => (
              <Card key={`${s?.id || idx}-${idx}`}>
                <CardContent className="p-5 space-y-3">
                  <p className="text-lg font-medium">&ldquo;{s?.source_text}&rdquo;</p>
                  <Separator />
                  <div className="flex items-start gap-2">
                    <Check className="w-4 h-4 text-success shrink-0 mt-0.5" />
                    <p className="text-success font-medium">{s?.target_text}</p>
                  </div>
                </CardContent>
              </Card>
            ))}

            <div className="flex flex-col gap-3 pt-4">
              <Link href="/quiz">
                <Button size="lg" className="w-full">
                  <RotateCcw className="w-4 h-4 mr-2" /> Mula Ulangan Quiz
                </Button>
              </Link>
              <Link href="/">
                <Button variant="outline" size="lg" className="w-full">
                  Kembali ke Dashboard
                </Button>
              </Link>
            </div>
          </>
        )}
      </main>
    </div>
  );
}
