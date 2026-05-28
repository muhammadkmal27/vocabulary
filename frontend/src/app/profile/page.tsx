"use client";

import { useState, useEffect } from "react";
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
import { Badge } from "@/components/ui/badge";
import { useTheme } from "next-themes";
import { Separator } from "@/components/ui/separator";
import { User, Lock, Save, Globe, LogOut, ArrowLeft, Home, BookOpenCheck, Settings, Sun, Moon, Loader2 } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import api from "@/lib/api";

export default function ProfilePage() {
  const { toast } = useAlert();
  const { user, token, logout, updateUser, isLoading } = useAuth();
  const [selectedLang, setSelectedLang] = useState("");
  const [languages, setLanguages] = useState<any[]>([]);
  const [loadingLanguages, setLoadingLanguages] = useState(true);
  const { theme, setTheme } = useTheme();

  // Profile Info States
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [isSavingProfile, setIsSavingProfile] = useState(false);

  // Password States
  const [currentPw, setCurrentPw] = useState("");
  const [newPw, setNewPw] = useState("");
  const [newPwConfirm, setNewPwConfirm] = useState("");
  const [isSavingPassword, setIsSavingPassword] = useState(false);

  useEffect(() => {
    if (user) {
      setName(user.name || "");
      setEmail(user.email || "");
    }
  }, [user]);

  useEffect(() => {
    const fetchLanguagesAndProgress = async () => {
      if (!token) return;
      try {
        setLoadingLanguages(true);
        const res = await fetch("/api/languages", {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
        if (!res.ok) throw new Error("Gagal memuatkan bahasa.");
        const langs = await res.json();
        
        const detailedLangs = await Promise.all(
          langs.map(async (lang: any) => {
            try {
              const dashRes = await fetch(`/api/dashboard?language_id=${lang.id}`, {
                headers: {
                  Authorization: `Bearer ${token}`,
                  Accept: "application/json",
                },
              });
              if (dashRes.ok) {
                const dashData = await dashRes.json();
                const totalProgress = dashData.levels && dashData.levels.length > 0
                  ? Math.round(dashData.levels.reduce((acc: number, l: any) => acc + l.progress, 0) / dashData.levels.length)
                  : 0;
                return {
                  ...lang,
                  levels: dashData.levels ? dashData.levels.length : 0,
                  progress: totalProgress,
                };
              }
            } catch (e) {
              // ignore
            }
            return { ...lang, levels: 0, progress: 0 };
          })
        );
        setLanguages(detailedLangs);
        
        const savedId = localStorage.getItem("selected_language_id");
        if (savedId && detailedLangs.some((l: any) => l.id === savedId)) {
          setSelectedLang(savedId);
        } else if (detailedLangs.length > 0) {
          setSelectedLang(detailedLangs[0].id);
          localStorage.setItem("selected_language_id", detailedLangs[0].id);
        }
      } catch (err) {
        console.error(err);
      } finally {
        setLoadingLanguages(false);
      }
    };
    
    fetchLanguagesAndProgress();
  }, [token]);

  const handleSaveProfile = async () => {
    if (!name.trim() || !email.trim()) {
      toast("Nama dan email tidak boleh kosong.", "error");
      return;
    }
    setIsSavingProfile(true);
    try {
      const res = await api.put("/profile", { name, email });
      if (res && !res.errors) {
        updateUser(res);
        toast("Profil berjaya disimpan!", "success");
      } else {
        toast(res.message || "Gagal mengemaskini profil.", "error");
      }
    } catch (err) {
      toast("Ralat sambungan pelayan.", "error");
    } finally {
      setIsSavingProfile(false);
    }
  };

  const handleUpdatePassword = async () => {
    if (!currentPw || !newPw || !newPwConfirm) {
      toast("Sila isi semua ruangan kata laluan.", "error");
      return;
    }
    if (newPw.length < 8) {
      toast("Kata laluan baru mestilah sekurang-kurangnya 8 aksara.", "error");
      return;
    }
    if (newPw !== newPwConfirm) {
      toast("Pengesahan kata laluan baru tidak sepadan.", "error");
      return;
    }
    setIsSavingPassword(true);
    try {
      const res = await api.put("/profile/password", {
        current_password: currentPw,
        new_password: newPw,
        new_password_confirmation: newPwConfirm,
      });
      if (res && res.message) {
        const isSuccess = res.message.toLowerCase().includes("updated") || res.message.toLowerCase().includes("berjaya") || res.message.toLowerCase().includes("success");
        toast(res.message, isSuccess ? "success" : "error");
        if (isSuccess) {
          setCurrentPw("");
          setNewPw("");
          setNewPwConfirm("");
        }
      } else {
        toast("Gagal menukar kata laluan.", "error");
      }
    } catch (err) {
      toast("Ralat sambungan pelayan.", "error");
    } finally {
      setIsSavingPassword(false);
    }
  };

  if (isLoading) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <p className="text-muted-foreground animate-pulse">Memuatkan profil...</p>
      </div>
    );
  }

  if (!token) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center p-4">
        <Card className="w-full max-w-sm border-border">
          <CardHeader className="text-center space-y-3">
            <div className="flex justify-center">
              <div className="w-20 h-20 rounded-full bg-muted flex items-center justify-center text-3xl font-bold text-muted-foreground">
                ?
              </div>
            </div>
            <CardTitle className="text-2xl">Mod Tetamu</CardTitle>
            <CardDescription>
              Log masuk untuk menyimpan progress.
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-3">
            <Link href="/login">
              <Button className="w-full">Log Masuk</Button>
            </Link>
            <Link href="/register">
              <Button variant="outline" className="w-full">
                Daftar Akaun
              </Button>
            </Link>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background">
      {/* Navbar */}
      <header className="border-b border-border bg-background/80 backdrop-blur-sm sticky top-0 z-50">
        <nav className="max-w-4xl mx-auto px-4 h-16 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <ArrowLeft className="w-5 h-5" />
            <span className="text-lg font-bold">Vocabulary</span>
          </Link>
          <Button
            variant="ghost"
            size="sm"
            onClick={logout}
          >
            <LogOut className="w-4 h-4 mr-1" /> Log Keluar
          </Button>
        </nav>
      </header>

      <main className="max-w-2xl mx-auto px-4 py-8 space-y-6 pb-28 lg:pb-8">
        <h1 className="text-2xl font-bold">Profil & Tetapan</h1>


        {/* Theme Toggle */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg flex items-center gap-2">
              <Sun className="w-5 h-5 text-primary" /> Tema Paparan
            </CardTitle>
            <CardDescription>Pilih tema cerah atau gelap</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="flex gap-3">
              <button
                onClick={() => setTheme("light")}
                className={`flex-1 flex items-center gap-3 p-4 rounded-xl border transition-all cursor-pointer ${theme === "light" ? "border-primary bg-primary/10 ring-1 ring-primary" : "border-border hover:border-primary/50"}`}
              >
                <Sun className="w-5 h-5" />
                <div className="text-left">
                  <p className="font-medium text-sm">Cerah</p>
                  <p className="text-xs text-muted-foreground">Default</p>
                </div>
              </button>
              <button
                onClick={() => setTheme("dark")}
                className={`flex-1 flex items-center gap-3 p-4 rounded-xl border transition-all cursor-pointer ${theme === "dark" ? "border-primary bg-primary/10 ring-1 ring-primary" : "border-border hover:border-primary/50"}`}
              >
                <Moon className="w-5 h-5" />
                <div className="text-left">
                  <p className="font-medium text-sm">Gelap</p>
                  <p className="text-xs text-muted-foreground">Malam</p>
                </div>
              </button>
            </div>
          </CardContent>
        </Card>

        {/* Maklumat Peribadi */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg flex items-center gap-2">
              <User className="w-5 h-5 text-primary" /> Maklumat Peribadi
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="name">Nama</Label>
              <Input
                id="name"
                value={name}
                onChange={(e) => setName(e.target.value)}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input
                id="email"
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
            </div>
            <Button size="sm" onClick={handleSaveProfile} disabled={isSavingProfile}>
              <Save className="w-4 h-4 mr-2" /> {isSavingProfile ? "Menyimpan..." : "Simpan"}
            </Button>
          </CardContent>
        </Card>

        {/* Tukar Kata Laluan */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg flex items-center gap-2">
              <Lock className="w-5 h-5 text-primary" /> Tukar Kata Laluan
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="current-pw">Kata Laluan Semasa</Label>
              <Input
                id="current-pw"
                type="password"
                placeholder="••••••••"
                value={currentPw}
                onChange={(e) => setCurrentPw(e.target.value)}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="new-pw">Kata Laluan Baru</Label>
              <Input
                id="new-pw"
                type="password"
                placeholder="Minimum 8 aksara"
                value={newPw}
                onChange={(e) => setNewPw(e.target.value)}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="new-pw-confirm">Sahkan Kata Laluan Baru</Label>
              <Input
                id="new-pw-confirm"
                type="password"
                placeholder="Sahkan kata laluan baru"
                value={newPwConfirm}
                onChange={(e) => setNewPwConfirm(e.target.value)}
              />
            </div>
            <Button variant="outline" size="sm" onClick={handleUpdatePassword} disabled={isSavingPassword}>
              {isSavingPassword ? "Memproses..." : "Tukar Kata Laluan"}
            </Button>
          </CardContent>
        </Card>

        {/* Pilih Bahasa — Radio */}
        <Card>
          <CardHeader>
            <CardTitle className="text-lg flex items-center gap-2">
              <Globe className="w-5 h-5 text-primary" /> Bahasa Pembelajaran
            </CardTitle>
            <CardDescription>
              Pilih SATU bahasa. Dashboard hanya tunjuk bahasa ni.
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-3">
            {loadingLanguages ? (
              <div className="flex justify-center py-4 items-center gap-2">
                <Loader2 className="w-5 h-5 animate-spin text-primary" />
                <p className="text-sm text-muted-foreground">Memuatkan bahasa...</p>
              </div>
            ) : languages.length === 0 ? (
              <p className="text-sm text-muted-foreground text-center py-4">Tiada bahasa aktif.</p>
            ) : (
              languages.map((lang) => {
                const isSelected = selectedLang === lang.id;
                return (
                  <label
                    key={lang.id}
                    className={`w-full flex items-center gap-4 p-4 rounded-xl border transition-all cursor-pointer
                      ${isSelected ? "border-primary bg-primary/10 ring-1 ring-primary" : "border-border bg-card hover:border-primary/50"}`}
                  >
                    <input
                      type="radio"
                      name="language"
                      value={lang.id}
                      checked={isSelected}
                      onChange={() => {
                        setSelectedLang(lang.id);
                        localStorage.setItem("selected_language_id", lang.id);
                      }}
                      className="sr-only"
                    />
                    <div
                      className={`w-5 h-5 rounded-full border-2 shrink-0 flex items-center justify-center ${isSelected ? "border-primary" : "border-muted-foreground"}`}
                    >
                      {isSelected && (
                        <div className="w-2.5 h-2.5 rounded-full bg-primary" />
                      )}
                    </div>
                    <span className="text-2xl">{lang.flag}</span>
                    <div className="flex-1">
                      <p className="font-semibold">{lang.name}</p>
                      <p className="text-xs text-muted-foreground">
                        {lang.levels > 0
                          ? `${lang.levels} level · ${lang.progress}%`
                          : "Belum ada level"}
                      </p>
                    </div>
                    {isSelected && (
                      <Badge className="text-xs bg-primary">
                        {lang.progress}%
                      </Badge>
                    )}
                  </label>
                );
              })
            )}
            {!loadingLanguages && languages.length > 0 && (
              <p className="text-xs text-muted-foreground pt-1">
                ✅ Sedang belajar:{" "}
                <strong>
                  {languages.find((l) => l.id === selectedLang)?.name || "-"}
                </strong>
              </p>
            )}
          </CardContent>
        </Card>

        {/* Danger Zone */}
        <Card className="border-destructive/30">
          <CardContent className="p-4 flex items-center justify-between">
            <div>
              <p className="font-medium text-destructive">Padam Akaun</p>
              <p className="text-xs text-muted-foreground">
                Tidak boleh dikembalikan
              </p>
            </div>
            <Button variant="destructive" size="sm">
              Padam
            </Button>
          </CardContent>
        </Card>
      </main>

      {/* Mobile Bottom Nav */}
      <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-border bg-background/95 backdrop-blur-sm lg:hidden">
        <div className="flex items-center justify-around h-16 px-2">
          <Link
            href="/"
            className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground"
          >
            <Home className="w-5 h-5" />
            <span className="text-[10px]">Rumah</span>
          </Link>
          <Link
            href="/quiz"
            className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground"
          >
            <BookOpenCheck className="w-5 h-5" />
            <span className="text-[10px]">Quiz</span>
          </Link>
          <Link
            href="/subscription"
            className="flex flex-col items-center gap-0.5 text-muted-foreground hover:text-foreground"
          >
            <Settings className="w-5 h-5" />
            <span className="text-[10px]">Langganan</span>
          </Link>
          <Link
            href="/profile"
            className="flex flex-col items-center gap-0.5 text-primary"
          >
            <User className="w-5 h-5" />
            <span className="text-[10px]">Profil</span>
          </Link>
        </div>
      </nav>
    </div>
  );
}
