"use client";

import React, { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import {
  ArrowRight,
  Eye,
  Check,
  X,
  ChevronLeft,
  Lightbulb,
} from "lucide-react";

interface PromoQuizSimulatorProps {
  onUnlockClick: () => void;
}

// Statically initialize the session to mimic the backend response for the Promo page
const STATIC_SESSION = {
  id: "guest_session",
  answers: [
    { id: "q1", sentence: { source_text: "Awak dah sedia?", target_text: "Are you ready?" } },
    { id: "q2", sentence: { source_text: "Saya membaca sebuah buku", target_text: "I read a book" } },
    { id: "q3", sentence: { source_text: "Kami belajar perbendaharaan kata", target_text: "We learn vocabulary" } },
    { id: "q4", sentence: { source_text: "Di manakah tandas?", target_text: "Where is the toilet?" } },
    { id: "q5", sentence: { source_text: "Siapa nama awak?", target_text: "What is your name?" } },
    { id: "q6", sentence: { source_text: "Berapa harganya?", target_text: "How much is this?" } },
    { id: "q7", sentence: { source_text: "Saya tidak faham", target_text: "I do not understand" } },
    { id: "q8", sentence: { source_text: "Boleh awak tolong saya?", target_text: "Can you help me?" } },
    { id: "q9", sentence: { source_text: "Pukul berapa sekarang?", target_text: "What time is it?" } },
    { id: "q10", sentence: { source_text: "Saya lapar", target_text: "I am hungry" } },
    { id: "q11", sentence: { source_text: "Selamat pagi", target_text: "Good morning" } },
    { id: "q12", sentence: { source_text: "Terima kasih banyak", target_text: "Thank you very much" } },
    { id: "q13", sentence: { source_text: "Maafkan saya", target_text: "I am sorry" } },
    { id: "q14", sentence: { source_text: "Jumpa lagi nanti", target_text: "See you later" } },
    { id: "q15", sentence: { source_text: "Saya suka makan epal", target_text: "I like to eat apples" } },
    { id: "q16", sentence: { source_text: "Dia sedang tidur", target_text: "He is sleeping" } },
    { id: "q17", sentence: { source_text: "Mereka pergi ke sekolah", target_text: "They go to school" } },
    { id: "q18", sentence: { source_text: "Hari ini sangat panas", target_text: "Today is very hot" } },
    { id: "q19", sentence: { source_text: "Awak sangat cantik", target_text: "You are very beautiful" } },
    { id: "q20", sentence: { source_text: "Tahniah atas kejayaan awak", target_text: "Congratulations on your success" } }
  ],
  correct_count: 0,
};

export function PromoQuizSimulator({ onUnlockClick }: PromoQuizSimulatorProps) {
  const [session, setSession] = useState<any>(STATIC_SESSION);
  
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answer, setAnswer] = useState("");
  const [showResult, setShowResult] = useState(false);
  const [revealed, setRevealed] = useState(false);
  const [isCorrect, setIsCorrect] = useState<boolean | null>(null);
  const [completedResults, setCompletedResults] = useState<any>(null);

  // Practice States
  const [practiceInput, setPracticeInput] = useState("");
  const [practiceCount, setPracticeCount] = useState(0);
  const [showPracticeHint, setShowPracticeHint] = useState(false);
  const [practiceFeedback, setPracticeFeedback] = useState<"correct" | "incorrect" | null>(null);
  const [isTypingPractice, setIsTypingPractice] = useState(false);

  const questions = session?.answers || [];
  const total = questions.length;
  const currentAnswerObj = questions[currentIndex];
  const currentSentence = currentAnswerObj?.sentence;

  const normalize = (text: string) => {
    let cleaned = text.replace(/[’‘ʼ`´՚＇]/g, "'");
    return cleaned.replace(/[^\w\s]/g, "").replace(/\s+/g, "").trim().toLowerCase();
  };

  const handleSubmit = () => {
    if (!answer.trim() || !session) return;
    const isCorrectAns = normalize(answer) === normalize(currentSentence?.target_text || "");
    setIsCorrect(isCorrectAns);
    setShowResult(true);
    if (isCorrectAns) {
      setSession((prev: any) => ({
        ...prev,
        correct_count: (prev.correct_count || 0) + 1,
      }));
    }
  };

  const handleReveal = () => {
    setRevealed(true);
    setIsCorrect(false);
    setShowResult(true);
  };

  const handleCheckPractice = () => {
    const cleanTarget = normalize(currentSentence?.target_text || "");
    const cleanVal = normalize(practiceInput);
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

  const handleNext = () => {
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
      setIsTypingPractice(false);
    } else {
      // Complete session
      const correctCount = session.correct_count || 0;
      const percentage = Math.round((correctCount / total) * 100);
      setCompletedResults({
        score: `${correctCount}/${total}`,
        percentage: percentage,
      });
    }
  };

  // Results screen (Modified to prompt promo purchase instead of next level)
  if (completedResults) {
    const score = completedResults.score;
    const percentage = completedResults.percentage;

    return (
      <div className="w-full max-w-[420px] mx-auto bg-white rounded-[40px] border-[12px] border-[#2B2B2B] overflow-hidden shadow-2xl relative aspect-[9/19] flex items-center justify-center font-sans p-4">
        <Card className="w-full border-none shadow-none">
          <CardContent className="p-4 space-y-6 text-center">
            <div className="text-5xl">🎉</div>
            <div className="space-y-2">
              <div className="text-5xl font-bold text-primary">
                {score}
              </div>
              <p className="text-muted-foreground font-medium text-sm">
                Selesai! Anda mendapat {percentage}% betul dalam ujian 15 saat ini!
              </p>
            </div>
            <div className="flex flex-col gap-3">
              <Button
                size="lg"
                className="w-full bg-[#A83232] hover:bg-[#7F1D1D] text-white font-semibold shadow-md transition-all duration-300 h-14"
                onClick={onUnlockClick}
              >
                Tebus Akses Premium Sekarang <ArrowRight className="w-4 h-4 ml-2 animate-pulse" />
              </Button>
              <Button
                variant="outline"
                size="lg"
                className="w-full h-14"
                onClick={() => {
                  setCompletedResults(null);
                  setSession({ ...STATIC_SESSION, correct_count: 0 });
                  setCurrentIndex(0);
                  setAnswer("");
                  setShowResult(false);
                  setIsCorrect(null);
                }}
              >
                <RotateCcwIcon className="w-4 h-4 mr-2" /> Cuba Semula Ujian
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="w-full flex justify-center animate-fadeIn">
      {/* Phone Frame Container */}
      <div className="w-full max-w-[420px] bg-background rounded-[40px] border-[12px] border-[#2B2B2B] overflow-hidden shadow-2xl relative aspect-[9/19] flex flex-col font-sans">
        
        {/* Fake Dynamic Island */}
        <div className="absolute top-2 left-1/2 -translate-x-1/2 w-[100px] h-6 bg-[#2B2B2B] rounded-full z-10 hidden sm:block"></div>

        {/* Sticky Header Wrapper (Exact match from QuizPage) */}
        <div className="sticky top-0 z-50 bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60 border-b border-border pt-10 sm:pt-12">
          {/* Top Bar */}
          <div className="px-4 py-3 flex items-center justify-between">
            <Button variant="ghost" size="sm" onClick={() => {
                setSession({ ...STATIC_SESSION, correct_count: 0 });
                setCurrentIndex(0);
                setAnswer("");
                setShowResult(false);
                setIsCorrect(null);
            }}>
              <ChevronLeft className="w-4 h-4 mr-1" /> Keluar
            </Button>
            <Badge variant="secondary">
              {currentIndex + 1} / {total}
            </Badge>
            <div className="w-20" />
          </div>

          {/* Progress */}
          <div className="px-4 pb-2">
            <div className="w-full bg-muted rounded-full h-1.5">
              <div
                className="bg-primary h-1.5 rounded-full transition-all duration-500"
                style={{
                  width: `${((currentIndex + (showResult ? 1 : 0)) / total) * 100}%`,
                }}
              />
            </div>
          </div>
        </div>

        {/* Main */}
        <div className={`flex-1 overflow-y-auto flex flex-col p-4 ${showResult ? "items-start pt-4 sm:pt-[5vh]" : "items-center justify-center"}`}>
          <Card className="w-full border-none shadow-none bg-transparent">
            <CardContent className={`p-0 ${showResult ? "space-y-4" : "space-y-6"}`}>
              <div className={`text-center ${showResult ? "space-y-3" : "space-y-4"}`}>
                <p className="text-sm text-muted-foreground">
                  Terjemahkan ke English:
                </p>
                <h2 className={`font-bold leading-relaxed ${showResult ? "text-xl sm:text-2xl" : "text-2xl sm:text-3xl"}`}>
                  &ldquo;{currentSentence?.source_text}&rdquo;
                </h2>
                <div className="flex items-start gap-2 text-[11px] text-muted-foreground bg-muted/40 p-2.5 rounded-lg border border-border/50 text-left max-w-[90%] mx-auto">
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
                    className="text-base py-6 text-center border-2 border-primary/20 focus-visible:ring-primary"
                  />
                  <div className="flex gap-2 sm:gap-3">
                    <Button
                      onClick={handleReveal}
                      variant="secondary"
                      size="lg"
                      className="flex-1 bg-warning text-black hover:bg-warning/80 text-[11px] sm:text-sm px-1 sm:px-4"
                    >
                      <Eye className="w-4 h-4 mr-1 sm:mr-2 shrink-0" /> Bagi Jawapan
                    </Button>
                    <Button
                      onClick={handleSubmit}
                      disabled={!answer.trim()}
                      className="flex-1 bg-[#8B5CF6] hover:bg-purple-600 text-white text-[11px] sm:text-sm px-1 sm:px-4"
                      size="lg"
                    >
                      Semak Jawapan <ArrowRight className="w-4 h-4 ml-1 sm:ml-2 shrink-0" />
                    </Button>
                  </div>
                </div>
              ) : (
                <div className="space-y-4 animate-fadeIn pb-4">
                  <div
                    className={`p-3 sm:p-4 rounded-lg border ${isCorrect ? "border-green-500/30 bg-green-500/10" : "border-yellow-500/30 bg-yellow-500/10"}`}
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
                          <p className={`text-lg font-semibold transition-all duration-300 ${isTypingPractice && !showPracticeHint ? "blur-md select-none opacity-40" : ""}`}>
                            {currentSentence?.target_text}
                          </p>
                        </div>
                      </div>
                    )}
                  </div>

                  {/* Ruang Latihan Menulis untuk Menghafal */}
                  <div className="p-3 sm:p-4 rounded-lg border border-dashed border-border bg-muted/25 space-y-3">
                    <div className="flex items-center justify-between">
                      <p className="text-[11px] sm:text-xs font-semibold text-muted-foreground flex items-center gap-1.5">
                        ✍️ Ruang Latihan Menulis (Ulang & Hafal)
                      </p>
                      {practiceCount > 0 && (
                        <Badge className="bg-success/20 text-success border-success/30 font-medium text-[10px]">
                          Dah tulis: {practiceCount} kali
                        </Badge>
                      )}
                    </div>

                    <div className="flex flex-col gap-2">
                      <Input
                        placeholder="Taip semula jawapan betul di sini..."
                        value={practiceInput}
                        onFocus={() => setIsTypingPractice(true)}
                        onBlur={() => {
                          if (!practiceInput.trim()) {
                            setIsTypingPractice(false);
                          }
                        }}
                        onChange={(e) => {
                          setPracticeInput(e.target.value);
                          setPracticeFeedback(null);
                        }}
                        onKeyDown={(e) => {
                          if (e.key === "Enter" && practiceInput.trim()) {
                            handleCheckPractice();
                          }
                        }}
                        className={`w-full text-sm py-4 text-center border-dashed focus-visible:ring-primary ${practiceFeedback === "correct"
                          ? "border-green-500 bg-green-500/5 focus-visible:ring-green-500"
                          : practiceFeedback === "incorrect"
                            ? "border-red-500 bg-red-500/5 focus-visible:ring-red-500"
                            : ""
                          }`}
                      />
                      <div className="flex gap-2">
                        <Button
                          variant="outline"
                          size="sm"
                          onClick={handleCheckPractice}
                          disabled={!practiceInput.trim()}
                          className="flex-1"
                        >
                          Semak
                        </Button>
                        <Button
                          variant="outline"
                          size="sm"
                          onClick={() => setShowPracticeHint(!showPracticeHint)}
                          className={`flex-1 gap-1 transition-all duration-300 ${showPracticeHint
                            ? "bg-warning/20 border-warning/40 hover:bg-warning/30 text-amber-800"
                            : "bg-warning/5 border-warning/20 hover:bg-warning/10 text-amber-700/80"
                            }`}
                        >
                          <Lightbulb className={`w-4 h-4 transition-all duration-300 ${showPracticeHint ? "text-warning fill-warning animate-pulse" : "text-warning/70"}`} />
                          <span className="text-[11px] sm:text-xs font-semibold">Bagi klu</span>
                        </Button>
                      </div>
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
                      <div className="p-2.5 rounded bg-warning/10 border border-warning/20 text-[11px] text-amber-800 dark:text-amber-300 text-center font-medium">
                        🔑 Klu Jawapan: <span className="font-bold select-all">&ldquo;{currentSentence?.target_text}&rdquo;</span>
                      </div>
                    )}
                  </div>

                  <div className="flex gap-2 pt-2">
                    <Button
                      onClick={() => {
                        setCurrentIndex(0);
                        setAnswer("");
                        setShowResult(false);
                        setRevealed(false);
                        setIsCorrect(null);
                        setPracticeInput("");
                        setPracticeCount(0);
                        setShowPracticeHint(false);
                        setPracticeFeedback(null);
                        setIsTypingPractice(false);
                        setSession({ ...STATIC_SESSION, correct_count: 0 });
                      }}
                      variant="outline"
                      size="lg"
                      className="flex-1 text-[11px] sm:text-sm px-1.5 sm:px-4"
                    >
                      <RotateCcwIcon className="w-4 h-4 mr-1.5 sm:mr-2 shrink-0" />
                      Ulang
                    </Button>
                    <Button
                      onClick={handleNext}
                      size="lg"
                      className="flex-1 bg-[#8B5CF6] hover:bg-purple-600 text-white text-[11px] sm:text-sm px-1.5 sm:px-4"
                    >
                      {currentIndex === total - 1 ? "Keputusan" : "Seterusnya"}
                      <ArrowRight className="w-4 h-4 ml-1.5 sm:ml-2 shrink-0" />
                    </Button>
                  </div>
                </div>
              )}
            </CardContent>
          </Card>
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
