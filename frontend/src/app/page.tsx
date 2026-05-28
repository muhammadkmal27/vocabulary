"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { useAuth } from "@/lib/auth";
import {
  Brain,
  Flame,
  ArrowRight,
  Lock,
  CheckCircle,
  Home,
  BookOpenCheck,
  User,
  Settings,
  ChevronLeft,
  ChevronRight,
  Loader2,
} from "lucide-react";
import { TheoryBanner } from "@/components/TheoryBanner";

export default function DashboardPage() {
  const { token, user } = useAuth();
  const [currentIdx, setCurrentIdx] = useState(0);
  
  const [languages, setLanguages] = useState<any[]>([]);
  const [selectedLanguage, setSelectedLanguage] = useState<any>(null);
  const [dashboardData, setDashboardData] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const fetchLanguages = async () => {
    try {
      const headers: any = {
        Accept: "application/json",
      };
      if (token) {
        headers.Authorization = `Bearer ${token}`;
      }
      const response = await fetch("/api/languages", { headers });
      if (!response.ok) throw new Error("Gagal mengambil bahasa.");
      const data = await response.json();
      setLanguages(data);
      if (data.length > 0) {
        const savedId = localStorage.getItem("selected_language_id");
        const found = data.find((l: any) => l.id === savedId);
        if (found) {
          setSelectedLanguage(found);
        } else {
          setSelectedLanguage(data[0]);
          localStorage.setItem("selected_language_id", data[0].id);
        }
      } else {
        setLoading(false);
      }
    } catch (err: any) {
      setError(err.message || "Ralat berlaku.");
      setLoading(false);
    }
  };

  const fetchDashboard = async (langId: string) => {
    try {
      setLoading(true);
      const headers: any = {
        Accept: "application/json",
      };
      if (token) {
        headers.Authorization = `Bearer ${token}`;
      }
      const response = await fetch(`/api/dashboard?language_id=${langId}`, { headers });
      if (!response.ok) throw new Error("Gagal mengambil status dashboard.");
      const data = await response.json();
      setDashboardData(data);
      
      const levels = data.levels || [];
      // Find the first unlocked level that is not completed yet (progress < 100)
      let activeIdx = levels.findIndex((lvl: any) => lvl.unlocked && lvl.progress < 100);
      // If all unlocked levels are completed, focus on the last unlocked level
      if (activeIdx === -1) {
        activeIdx = levels.reduce((lastIdx: number, lvl: any, idx: number) => {
          return lvl.unlocked ? idx : lastIdx;
        }, 0);
      }
      setCurrentIdx(activeIdx >= 0 ? activeIdx : 0);
    } catch (err: any) {
      setError(err.message || "Ralat berlaku.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (user?.role === "admin") {
      window.location.href = "/admin/dashboard";
      return;
    }
    fetchLanguages();
  }, [token, user]);

  useEffect(() => {
    if (selectedLanguage) {
      fetchDashboard(selectedLanguage.id);
    }
  }, [selectedLanguage]);

  const levels = dashboardData?.levels || [];
  const currentLevel = levels[currentIdx];
  const prevLevel = currentIdx > 0 ? levels[currentIdx - 1] : null;
  const nextLevel = currentIdx < levels.length - 1 ? levels[currentIdx + 1] : null;

  return (
    <div className="min-h-screen bg-background">
      {/* NAVBAR */}
      <header className="border-b border-border bg-background/80 backdrop-blur-sm sticky top-0 z-50">
        <nav className="max-w-7xl mx-auto px-4 h-16 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Brain className="w-6 h-6 text-primary" />
            <span className="text-lg font-bold">Vocabulary</span>
          </div>
          {/* Desktop Nav */}
          <div className="hidden lg:flex items-center gap-1">
            <Link href="/">
              <Button variant="ghost" size="sm">Rumah</Button>
            </Link>
            {currentLevel && (
              <Link href={`/quiz/${selectedLanguage?.code}/${currentLevel.id}`}>
                <Button variant="ghost" size="sm">Quiz</Button>
              </Link>
            )}
            {token ? (
              <>
                <Link href="/subscription">
                  <Button variant="ghost" size="sm">Langganan</Button>
                </Link>
                <Link href="/profile">
                  <Button variant="ghost" size="sm">Profil</Button>
                </Link>
              </>
            ) : (
              <>
                <Link href="/pricing">
                  <Button variant="ghost" size="sm">Langganan</Button>
                </Link>
                <Link href="/login">
                  <Button size="sm">Log Masuk</Button>
                </Link>
              </>
            )}
          </div>
          {/* Mobile Nav */}
          <div className="flex lg:hidden items-center gap-1">
            {token ? (
              <>
                <Link href="/subscription">
                  <Button variant="ghost" size="sm">Langganan</Button>
                </Link>
                <Link href="/profile">
                  <Button variant="ghost" size="sm">Profil</Button>
                </Link>
              </>
            ) : (
              <>
                <Link href="/pricing">
                  <Button variant="ghost" size="sm">Langganan</Button>
                </Link>
                <Link href="/login">
                  <Button size="sm">Log Masuk</Button>
                </Link>
              </>
            )}
          </div>
        </nav>
      </header>

      {loading ? (
        <div className="min-h-[60vh] flex flex-col justify-center items-center">
          <Loader2 className="w-10 h-10 animate-spin text-primary mb-2" />
          <p className="text-sm text-muted-foreground">Memuatkan dashboard anda...</p>
        </div>
      ) : (
        <main className="max-w-2xl mx-auto px-4 py-6 space-y-6 pb-28 lg:pb-8">
          {/* Theory Banner */}
          <TheoryBanner />

          {/* Language Selector Header */}
          <div className="flex items-center gap-2 overflow-x-auto pb-2">
            {languages.map((lang) => (
              <button
                key={lang.id}
                onClick={() => {
                  setSelectedLanguage(lang);
                  localStorage.setItem("selected_language_id", lang.id);
                }}
                className={`flex items-center gap-2 px-3 py-1.5 rounded-full border text-sm font-medium transition-colors ${selectedLanguage?.id === lang.id ? "bg-primary text-primary-foreground border-primary" : "bg-card text-card-foreground border-border hover:bg-muted"}`}
              >
                <span>{lang.flag}</span>
                <span>{lang.name}</span>
              </button>
            ))}
          </div>

          {currentLevel ? (
            /* Hero Card */
            <Card className="border-primary ring-1 ring-primary bg-card overflow-hidden">
              <div className="h-1.5 bg-muted">
                <div
                  className="h-full bg-primary transition-all"
                  style={{ width: `${currentLevel.progress}%` }}
                />
              </div>
              <CardContent className="p-6 sm:p-8 space-y-5">
                <div className="text-center space-y-1">
                  <p className="text-xs uppercase tracking-widest text-muted-foreground font-medium">
                    Level {currentLevel.order}
                  </p>
                  <h3 className="text-2xl sm:text-3xl font-bold">{currentLevel.name}</h3>
                  <p className="text-sm text-muted-foreground">
                    {currentLevel.progress}% selesai
                  </p>
                </div>
                <div className="flex flex-col gap-2">
                  {currentLevel.progress === 100 ? (
                    <Link href={`/review/${selectedLanguage?.id}/${currentLevel.id}`}>
                      <Button variant="outline" size="lg" className="w-full text-base">
                        Ulang Level (Review)
                      </Button>
                    </Link>
                  ) : currentLevel.unlocked ? (
                    <Link href={`/quiz/${selectedLanguage?.code}/${currentLevel.id}`}>
                      <Button size="lg" className="w-full text-base">
                        {currentLevel.progress > 0 ? "Sambung Belajar" : "Mula Level"}{" "}
                        <ArrowRight className="w-5 h-5 ml-2" />
                      </Button>
                    </Link>
                  ) : (
                    dashboardData?.is_premium ? (
                      <Button size="lg" className="w-full text-base bg-muted text-muted-foreground cursor-not-allowed" disabled>
                        <Lock className="w-4 h-4 mr-2" /> Selesaikan {prevLevel?.name || `Level ${currentLevel.order - 1}`} Dahulu
                      </Button>
                    ) : (
                      <Link href="/pricing" className="w-full">
                        <Button size="lg" className="w-full text-base bg-amber-600 hover:bg-amber-700 text-black font-semibold">
                          <Lock className="w-4 h-4 mr-2" /> Buka dengan Premium
                        </Button>
                      </Link>
                    )
                  )}
                </div>
                <div className="flex items-center justify-between pt-2 border-t border-border">
                  {prevLevel ? (
                    <button
                      onClick={() => setCurrentIdx(currentIdx - 1)}
                      className="flex items-center gap-1 text-sm text-muted-foreground hover:text-foreground transition-colors"
                    >
                      <ChevronLeft className="w-4 h-4" />
                      <div className="text-left">
                        <p className="text-[10px] uppercase tracking-wide">Sebelumnya</p>
                        <p className="font-medium text-xs">{prevLevel.name}</p>
                      </div>
                    </button>
                  ) : (
                    <div />
                  )}
                  <div className="flex items-center gap-1 text-sm text-muted-foreground">
                    <Flame className="w-4 h-4 text-orange-500" />
                    <span className="font-bold">{dashboardData?.streak || 7}</span> hari
                  </div>
                  {nextLevel ? (
                    <button
                      onClick={() => setCurrentIdx(currentIdx + 1)}
                      className="flex items-center gap-1 text-sm text-muted-foreground hover:text-foreground transition-colors text-right"
                    >
                      <div className="text-right">
                        <p className="text-[10px] uppercase tracking-wide">Seterusnya</p>
                        <p className="font-medium text-xs">{nextLevel.name}</p>
                      </div>
                      <ChevronRight className="w-4 h-4" />
                    </button>
                  ) : (
                    <div />
                  )}
                </div>
              </CardContent>
            </Card>
          ) : (
            <div className="text-center py-12 text-muted-foreground">
              Tiada tahap ditemui bagi bahasa ini.
            </div>
          )}

          {/* All Levels */}
          {levels.length > 0 && (
            <details className="group">
              <summary className="text-sm text-muted-foreground cursor-pointer hover:text-foreground transition-colors list-none flex items-center gap-1 select-none">
                <span>📋 Semua Level ({levels.length})</span>
                <ChevronRight className="w-3.5 h-3.5 group-open:rotate-90 transition-transform" />
              </summary>
              <div className="mt-3 space-y-1">
                {levels.map((lvl: any, i: number) => (
                  <button
                    key={lvl.id}
                    onClick={() => setCurrentIdx(i)}
                    className={`w-full flex items-center gap-3 px-3 py-2 rounded-lg text-left transition-colors ${i === currentIdx ? "bg-primary/10 border border-primary/30" : "hover:bg-muted"}`}
                  >
                    <div
                      className={`w-6 h-6 rounded-full flex items-center justify-center text-xs font-bold ${lvl.progress === 100 ? "bg-green-500/20 text-green-500" : i === currentIdx ? "bg-primary/20 text-primary" : "bg-muted text-muted-foreground"}`}
                    >
                      {lvl.progress === 100 ? "✓" : lvl.order}
                    </div>
                    <div className="flex-1">
                      <p className="text-sm font-medium">{lvl.name}</p>
                      <p className="text-[10px] text-muted-foreground">
                        {lvl.unlocked ? `${lvl.progress}%` : "🔒 Terkunci"}
                      </p>
                    </div>
                    {lvl.progress === 100 && (
                      <CheckCircle className="w-4 h-4 text-green-500" />
                    )}
                  </button>
                ))}
              </div>
            </details>
          )}
        </main>
      )}

      {/* MOBILE BOTTOM NAV */}
      <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-border bg-background/95 backdrop-blur-sm lg:hidden">
        <div className="flex items-center justify-around h-16 px-2">
          <Link href="/" className="flex flex-col items-center gap-0.5 text-primary">
            <Home className="w-5 h-5" />
            <span className="text-[10px] font-medium">Rumah</span>
          </Link>
          {currentLevel && (
            <Link href={`/quiz/${selectedLanguage?.code}/${currentLevel.id}`} className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground transition-colors">
              <BookOpenCheck className="w-5 h-5" />
              <span className="text-[10px] font-medium">Quiz</span>
            </Link>
          )}
          <Link href="/subscription" className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground transition-colors">
            <Settings className="w-5 h-5" />
            <span className="text-[10px] font-medium">Langganan</span>
          </Link>
          <Link href="/profile" className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground transition-colors">
            <User className="w-5 h-5" />
            <span className="text-[10px] font-medium">Profil</span>
          </Link>
        </div>
      </nav>
    </div>
  );
}
