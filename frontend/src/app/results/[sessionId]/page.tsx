"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useParams } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";
import { Check, X, ArrowRight, RotateCcw, Trophy, Loader2, AlertCircle } from "lucide-react";
import { useAuth } from "@/lib/auth";

interface AnswerResult {
  id: string;
  user_answer: string | null;
  is_correct: boolean;
  revealed: boolean;
  sentence: {
    source_text: string;
    target_text: string;
  };
}

interface SessionResult {
  id: string;
  correct_count: number;
  total_questions: number;
  answers: AnswerResult[];
  level?: { name: string };
}

export default function ResultsPage() {
  const params = useParams();
  const sessionId = params?.sessionId as string;
  const { token } = useAuth();
  const [session, setSession] = useState<SessionResult | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    if (!token || !sessionId) return;
    const fetchSession = async () => {
      try {
        setLoading(true);
        const res = await fetch(`/api/quiz/${sessionId}`, {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
        if (!res.ok) throw new Error("Gagal mengambil keputusan sesi.");
        const data = await res.json();
        setSession(data);
      } catch (err: any) {
        setError(err.message || "Ralat berlaku.");
      } finally {
        setLoading(false);
      }
    };
    fetchSession();
  }, [token, sessionId]);

  if (loading) {
    return (
      <div className="min-h-screen flex justify-center items-center bg-background">
        <Loader2 className="w-10 h-10 animate-spin text-primary" />
      </div>
    );
  }

  if (error || !session) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center bg-background gap-4">
        <AlertCircle className="w-12 h-12 text-destructive" />
        <p className="text-muted-foreground">{error || "Sesi tidak ditemui."}</p>
        <Link href="/">
          <Button>Kembali ke Dashboard</Button>
        </Link>
      </div>
    );
  }

  const correct = session.correct_count;
  const total = session.total_questions;
  const score = total > 0 ? Math.round((correct / total) * 100) : 0;

  return (
    <div className="min-h-screen bg-background">
      <main className="max-w-lg mx-auto px-4 py-8 space-y-6">
        {/* Score */}
        <div className="text-center space-y-4">
          <Trophy className="w-16 h-16 mx-auto text-primary" />
          <div className="text-5xl font-bold">
            {correct}/{total}
          </div>
          <p className="text-muted-foreground">
            {score >= 80
              ? "Hebat! 🎉"
              : score >= 50
                ? "Bagus, teruskan usaha! 💪"
                : "Jangan putus asa! 🔄"}
          </p>
          <Badge variant="secondary" className="text-lg px-4 py-1.5">
            {score}% Ketepatan
          </Badge>
        </div>

        {/* Per-question Breakdown */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg">Semakan Jawapan</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            {(session.answers || []).map((r) => (
              <div key={r.id} className="space-y-2">
                <div className="flex items-start gap-2">
                  {r.is_correct ? (
                    <Check className="w-5 h-5 text-success shrink-0 mt-1" />
                  ) : (
                    <X className="w-5 h-5 text-destructive shrink-0 mt-1" />
                  )}
                  <div className="space-y-1">
                    <p className="font-medium">&ldquo;{r.sentence?.source_text}&rdquo;</p>
                    {!r.is_correct && (
                      <>
                        {r.user_answer && (
                          <p className="text-sm text-muted-foreground line-through">
                            {r.user_answer}
                          </p>
                        )}
                        <p className="text-sm text-success font-medium">
                          ✓ {r.sentence?.target_text}
                        </p>
                      </>
                    )}
                  </div>
                </div>
                <Separator className="mt-2" />
              </div>
            ))}
          </CardContent>
        </Card>

        {/* Actions */}
        <div className="flex flex-col gap-3">
          <Link href="/quiz">
            <Button
              size="lg"
              className="w-full bg-warning text-black hover:bg-warning/80"
            >
              <RotateCcw className="w-4 h-4 mr-2" /> Belum hafal. cuba semula
            </Button>
          </Link>
          <Link href="/">
            <Button variant="outline" size="lg" className="w-full">
              <ArrowRight className="w-4 h-4 mr-2" /> Dah hafal. teruskan ke level seterusnya
            </Button>
          </Link>
        </div>
      </main>
    </div>
  );
}
