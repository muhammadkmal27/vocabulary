"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useParams, useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import {
  ArrowRight,
  Eye,
  Check,
  X,
  ChevronLeft,
  Lightbulb,
  Loader2,
  AlertCircle,
} from "lucide-react";

export default function QuizPage() {
  const { toast } = useAlert();
  const params = useParams();
  const router = useRouter();
  const { token } = useAuth();

  const langCode = params?.lang as string;
  const levelId = params?.levelId as string;

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [session, setSession] = useState<any>(null);
  
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answer, setAnswer] = useState("");
  const [showResult, setShowResult] = useState(false);
  const [revealed, setRevealed] = useState(false);
  const [isCorrect, setIsCorrect] = useState<boolean | null>(null);
  const [answersState, setAnswersState] = useState<any[]>([]);
  const [completedResults, setCompletedResults] = useState<any>(null);

  // Practice States
  const [practiceInput, setPracticeInput] = useState("");
  const [practiceCount, setPracticeCount] = useState(0);
  const [showPracticeHint, setShowPracticeHint] = useState(false);
  const [practiceFeedback, setPracticeFeedback] = useState<"correct" | "incorrect" | null>(null);

  const startQuiz = async () => {
    if (!langCode || !levelId) return;
    try {
      setLoading(true);
      setError("");

      if (!token) {
        // Guest mode: fetch sentences from public Level 1 endpoint
        const response = await fetch(`/api/public/levels/${levelId}/sentences`, {
          headers: {
            Accept: "application/json",
          },
        });
        if (!response.ok) {
          const errData = await response.json();
          throw new Error(errData.message || "Akses terhad. Sila log masuk/langgan.");
        }
        const sentences = await response.json();
        if (sentences.length === 0) {
          throw new Error("Tahap ini tiada soalan lagi yang sedia.");
        }
        // Map to dummy session structure
        const dummyAnswers = sentences.map((s: any, idx: number) => ({
          id: `guest_ans_${idx}`,
          sentence: s,
        }));
        setSession({
          id: "guest_session",
          answers: dummyAnswers,
          correct_count: 0,
        });
        return;
      }

      // 1. Fetch languages to find language_id matching the code
      const langResponse = await fetch("/api/languages", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (!langResponse.ok) throw new Error("Gagal mengambil konfigurasi bahasa.");
      const languages = await langResponse.json();
      const matchedLang = languages.find((l: any) => l.code === langCode);
      if (!matchedLang) throw new Error(`Bahasa "${langCode}" tidak dijumpai.`);

      // 2. Start quiz session
      const startResponse = await fetch("/api/quiz/start", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
        body: JSON.stringify({
          language_id: matchedLang.id,
          level_id: levelId,
        }),
      });

      if (!startResponse.ok) {
        const errData = await startResponse.json();
        throw new Error(errData.message || "Gagal memulakan sesi kuiz.");
      }

      const sessionData = await startResponse.json();
      if (!sessionData.answers || sessionData.answers.length === 0) {
        throw new Error("Tahap ini tiada soalan lagi yang sedia.");
      }
      setSession(sessionData);
    } catch (err: any) {
      setError(err.message || "Ralat berlaku.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    startQuiz();
  }, [token, langCode, levelId]);

  if (loading) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center bg-background">
        <Loader2 className="w-10 h-10 animate-spin text-primary mb-2" />
        <p className="text-sm text-muted-foreground">Menjana kuiz anda...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-background p-4">
        <Card className="w-full max-w-md border-destructive/30 bg-destructive/5">
          <CardContent className="p-6 text-center space-y-4">
            <AlertCircle className="w-12 h-12 text-destructive mx-auto" />
            <h2 className="text-lg font-semibold text-destructive">Gagal Memuatkan Kuiz</h2>
            <p className="text-sm text-muted-foreground">{error}</p>
            <Link href="/">
              <Button className="w-full">Kembali ke Utama</Button>
            </Link>
          </CardContent>
        </Card>
      </div>
    );
  }

  const questions = session?.answers || [];
  const total = questions.length;
  const currentAnswerObj = questions[currentIndex];
  const currentSentence = currentAnswerObj?.sentence;

  const handleSubmit = async () => {
    if (!answer.trim() || !session) return;
    if (!token) {
      const normalize = (text: string) => {
        return text.replace(/[.,!?\'’‘]/g, "").replace(/\s+/g, " ").trim().toLowerCase();
      };
      const isCorrectAns = normalize(answer) === normalize(currentSentence?.target_text || "");
      setIsCorrect(isCorrectAns);
      setShowResult(true);
      setAnswersState([...answersState, { id: currentAnswerObj.id, correct: isCorrectAns }]);
      if (isCorrectAns) {
        setSession((prev: any) => ({
          ...prev,
          correct_count: (prev.correct_count || 0) + 1,
        }));
      }
      return;
    }
    try {
      const response = await fetch(`/api/quiz/${session.id}/answer`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
        body: JSON.stringify({
          answer_id: currentAnswerObj.id,
          user_answer: answer,
        }),
      });

      if (!response.ok) throw new Error("Gagal menghantar jawapan.");
      const resultData = await response.json();
      setIsCorrect(resultData.is_correct);
      setShowResult(true);
      setAnswersState([...answersState, { id: currentAnswerObj.id, correct: resultData.is_correct }]);
    } catch (err: any) {
      toast(err.message, "error");
    }
  };

  const handleReveal = async () => {
    if (!session) return;
    if (!token) {
      setRevealed(true);
      setIsCorrect(false);
      setShowResult(true);
      setAnswersState([...answersState, { id: currentAnswerObj.id, correct: false }]);
      return;
    }
    try {
      const response = await fetch(`/api/quiz/${session.id}/reveal/${currentAnswerObj.id}`, {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });

      if (!response.ok) throw new Error("Gagal mendedahkan jawapan.");
      const resultData = await response.json();
      setRevealed(true);
      setIsCorrect(false);
      setShowResult(true);
      setAnswersState([...answersState, { id: currentAnswerObj.id, correct: false }]);
    } catch (err: any) {
      toast(err.message, "error");
    }
  };

  const handleCheckPractice = () => {
    const cleanTarget = (currentSentence?.target_text || "").replace(/[.,!?\'’‘]/g, "").replace(/\s+/g, " ").trim().toLowerCase();
    const cleanVal = practiceInput.replace(/[.,!?\'’‘]/g, "").replace(/\s+/g, " ").trim().toLowerCase();
    if (cleanVal === cleanTarget) {
      setPracticeCount(prev => prev + 1);
      setPracticeFeedback("correct");
      setPracticeInput("");
      setShowPracticeHint(false);
      setTimeout(() => setPracticeFeedback(null), 1500);
    } else {
      setPracticeFeedback("incorrect");
    }
  };

  const handleNext = async () => {
    if (currentIndex < total - 1) {
      setCurrentIndex(currentIndex + 1);
      setAnswer("");
      setShowResult(false);
      setRevealed(false);
      setIsCorrect(null);
      setPracticeInput("");
      setPracticeCount(0);
      setShowPracticeHint(false);
      setPracticeFeedback(null);
    } else {
      if (!token) {
        const correctCount = session.correct_count || 0;
        const percentage = Math.round((correctCount / total) * 100);
        setCompletedResults({
          score: `${correctCount}/${total}`,
          percentage: percentage,
          next_level_id: null,
        });
        return;
      }
      // Complete session
      try {
        setLoading(true);
        const response = await fetch(`/api/quiz/${session.id}/complete`, {
          method: "POST",
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
        if (!response.ok) throw new Error("Gagal melengkapkan sesi.");
        const results = await response.json();
        setCompletedResults(results);
      } catch (err: any) {
        toast(err.message, "error");
      } finally {
        setLoading(false);
      }
    }
  };

  // Results screen
  if (completedResults) {
    const score = completedResults.score;
    const percentage = completedResults.percentage;

    return (
      <div className="min-h-screen flex items-center justify-center bg-background p-4">
        <Card className="w-full max-w-md border-border">
          <CardContent className="p-8 space-y-6 text-center">
            <div className="text-5xl">🎉</div>
            <div className="space-y-2">
              <div className="text-5xl font-bold text-primary">
                {score}
              </div>
              <p className="text-muted-foreground font-medium">
                Selesai! Anda mendapat {percentage}% betul dalam level ini!
              </p>
            </div>
            <div className="flex flex-col gap-3">
              {completedResults.next_level_id && (
                <Button
                  size="lg"
                  className="w-full bg-green-600 hover:bg-green-700 text-white font-semibold shadow-md transition-all duration-300"
                  onClick={() => {
                    router.push(`/quiz/${langCode}/${completedResults.next_level_id}`);
                    setCompletedResults(null);
                    setSession(null);
                    setCurrentIndex(0);
                    setAnswersState([]);
                    setAnswer("");
                    setShowResult(false);
                    setIsCorrect(null);
                  }}
                >
                  Dah hafal. teruskan ke level seterusnya <ArrowRight className="w-4 h-4 ml-2 animate-pulse" />
                </Button>
              )}
              <Button
                variant="outline"
                size="lg"
                className="w-full"
                onClick={() => {
                  setCompletedResults(null);
                  setSession(null);
                  setCurrentIndex(0);
                  setAnswersState([]);
                  setAnswer("");
                  setShowResult(false);
                  setIsCorrect(null);
                  startQuiz();
                }}
              >
                <RotateCcwIcon className="w-4 h-4 mr-2" /> Belum hafal. cuba semula
              </Button>
              <Link href="/">
                <Button size="lg" className="w-full" variant="ghost">
                  <Check className="w-4 h-4 mr-2" /> Kembali ke Rumah
                </Button>
              </Link>
            </div>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col bg-background">
      {/* Top Bar */}
      <div className="border-b border-border px-4 py-3 flex items-center justify-between">
        <Link href="/">
          <Button variant="ghost" size="sm">
            <ChevronLeft className="w-4 h-4 mr-1" /> Keluar
          </Button>
        </Link>
        <Badge variant="secondary">
          {currentIndex + 1} / {total}
        </Badge>
        <div className="w-20" />
      </div>

      {/* Progress */}
      <div className="px-4 pt-2">
        <div className="w-full bg-muted rounded-full h-2">
          <div
            className="bg-primary h-2 rounded-full transition-all duration-500"
            style={{
              width: `${((currentIndex + (showResult ? 1 : 0)) / total) * 100}%`,
            }}
          />
        </div>
      </div>

      {/* Main */}
      <div className="flex-1 flex items-center justify-center p-4">
        <Card className="w-full max-w-lg border-border">
          <CardContent className="p-8 space-y-6">
            <div className="text-center space-y-4">
              <p className="text-sm text-muted-foreground">
                Terjemahkan ke English:
              </p>
              <h2 className="text-2xl sm:text-3xl font-bold leading-relaxed">
                &ldquo;{currentSentence?.source_text}&rdquo;
              </h2>
              <div className="flex items-start gap-2 text-[11px] text-muted-foreground bg-muted/40 p-2.5 rounded-lg border border-border/50 text-left max-w-md mx-auto">
                <Lightbulb className="w-3.5 h-3.5 text-warning shrink-0 mt-0.5" />
                <span>Tip: Jika awak susah mengingat, menulis di kertas adalah kaedah terbaik untuk menghafal.</span>
              </div>
            </div>

            {!showResult ? (
              <div className="space-y-3">
                <Input
                  placeholder="Taip jawapan anda di sini..."
                  value={answer}
                  onChange={(e) => setAnswer(e.target.value)}
                  onKeyDown={(e) =>
                    e.key === "Enter" && answer.trim() && handleSubmit()
                  }
                  className="text-lg py-6 text-center"
                  autoFocus
                />
                <div className="flex gap-3">
                  <Button
                    onClick={handleSubmit}
                    disabled={!answer.trim()}
                    className="flex-1"
                    size="lg"
                  >
                    <ArrowRight className="w-4 h-4 mr-2" /> Semak Jawapan
                  </Button>
                  <Button
                    onClick={handleReveal}
                    variant="secondary"
                    size="lg"
                    className="bg-warning text-black hover:bg-warning/80"
                  >
                    <Eye className="w-4 h-4 mr-2" /> Bagi Jawapan
                  </Button>
                </div>
              </div>
            ) : (
              <div className="space-y-4">
                <div
                  className={`p-4 rounded-lg border ${isCorrect ? "border-green-500/30 bg-green-500/10" : "border-yellow-500/30 bg-yellow-500/10"}`}
                >
                  <div className="flex items-center gap-2 mb-2">
                    {isCorrect ? (
                      <>
                        <Check className="w-5 h-5 text-green-500" />
                        <span className="font-semibold text-green-500">
                          Betul!
                        </span>
                      </>
                    ) : (
                      <>
                        <X className="w-5 h-5 text-yellow-600" />
                        <span className="font-semibold text-yellow-600">
                          {revealed ? "Jawapan Didedahkan" : "Salah"}
                        </span>
                      </>
                    )}
                  </div>
                  {!isCorrect && (
                    <div className="space-y-2">
                      <div>
                        <p className="text-xs text-muted-foreground mb-0.5">
                          Jawapan Anda:
                        </p>
                        <p className="text-sm line-through text-muted-foreground">
                          {answer || "(tiada jawapan)"}
                        </p>
                      </div>
                      <div>
                        <p className="text-xs text-muted-foreground mb-0.5">
                          Jawapan Betul:
                        </p>
                        <p className="text-lg font-semibold">{currentSentence?.target_text}</p>
                      </div>
                    </div>
                  )}
                </div>

                {/* Ruang Latihan Menulis untuk Menghafal */}
                <div className="p-4 rounded-lg border border-dashed border-border bg-muted/25 space-y-3">
                  <div className="flex items-center justify-between">
                    <p className="text-xs font-semibold text-muted-foreground flex items-center gap-1.5">
                      ✍️ Ruang Latihan Menulis (Ulang & Hafal)
                    </p>
                    {practiceCount > 0 && (
                      <Badge className="bg-success/20 text-success border-success/30 font-medium">
                        Dah tulis: {practiceCount} kali
                      </Badge>
                    )}
                  </div>

                  <div className="flex gap-2">
                    <Input
                      placeholder="Taip semula jawapan betul di sini..."
                      value={practiceInput}
                      onChange={(e) => {
                        setPracticeInput(e.target.value);
                        setPracticeFeedback(null);
                      }}
                      onKeyDown={(e) => {
                        if (e.key === "Enter" && practiceInput.trim()) {
                          handleCheckPractice();
                        }
                      }}
                      className={`text-sm py-4 text-center border-dashed focus-visible:ring-primary ${
                        practiceFeedback === "correct"
                          ? "border-green-500 bg-green-500/5 focus-visible:ring-green-500"
                          : practiceFeedback === "incorrect"
                          ? "border-red-500 bg-red-500/5 focus-visible:ring-red-500"
                          : ""
                      }`}
                    />
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={handleCheckPractice}
                      disabled={!practiceInput.trim()}
                    >
                      Semak
                    </Button>
                    <Button
                      variant="ghost"
                      size="sm"
                      onClick={() => setShowPracticeHint(!showPracticeHint)}
                      className="px-2"
                      title="Tunjuk Klu"
                    >
                      <Lightbulb className={`w-4 h-4 ${showPracticeHint ? "text-warning fill-warning" : "text-muted-foreground"}`} />
                    </Button>
                  </div>

                  {practiceFeedback === "incorrect" && (
                    <p className="text-[11px] text-red-500 font-medium text-center">
                      ❌ Ejaan belum tepat. Sila cuba lagi!
                    </p>
                  )}
                  {practiceFeedback === "correct" && (
                    <p className="text-[11px] text-green-600 font-medium text-center">
                      🎉 Bagus! Sepadan. Sila ulang tulis lagi.
                    </p>
                  )}

                  {showPracticeHint && (
                    <div className="p-2.5 rounded bg-warning/10 border border-warning/20 text-xs text-amber-800 dark:text-amber-300 text-center font-medium">
                      🔑 Klu Jawapan: <span className="font-bold select-all">&ldquo;{currentSentence?.target_text}&rdquo;</span>
                    </div>
                  )}
                </div>

                <Button onClick={handleNext} size="lg" className="w-full">
                  {currentIndex === total - 1 ? "Lihat Keputusan" : "Soalan Seterusnya"}{" "}
                  <ArrowRight className="w-4 h-4 ml-2" />
                </Button>
              </div>
            )}
          </CardContent>
        </Card>
      </div>

      <div className="px-4 pb-4">
        <div className="max-w-lg mx-auto flex items-center gap-2 text-xs text-muted-foreground">
          <Lightbulb className="w-3.5 h-3.5 text-warning" />
          <span>
            Tip: Taip jawapan penuh. Jangan risau tentang huruf besar/kecil atau tanda baca.
          </span>
        </div>
      </div>
    </div>
  );
}

function RotateCcwIcon(props: React.SVGProps<SVGSVGElement>) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      {...props}
    >
      <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8" />
      <path d="M3 3v5h5" />
    </svg>
  );
}
