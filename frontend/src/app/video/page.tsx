"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Play, Lock, Sparkles, Loader2, Video, CheckCircle2, Circle, RotateCcw } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import BottomNav from "@/components/BottomNav";

interface UserVideoProgress {
  is_completed: boolean;
  last_watched_seconds: number;
  duration_seconds: number;
  progress_percent: number;
  last_watched_at: string | null;
}

interface YoutubeVideoData {
  id: string;
  title: string;
  youtube_video_id: string;
  thumbnail_url: string;
  category: string;
  is_premium: boolean;
  is_free: boolean;
  is_locked: boolean;
  user_progress?: UserVideoProgress;
}

export default function VideoPage() {
  const { token, isLoading: authLoading } = useAuth();
  const { toast } = useAlert();
  const [videos, setVideos] = useState<YoutubeVideoData[]>([]);
  const [loading, setLoading] = useState(true);
  const [togglingId, setTogglingId] = useState<string | null>(null);

  useEffect(() => {
    if (authLoading) return;

    const fetchVideos = async () => {
      try {
        const headers: Record<string, string> = {
          Accept: "application/json",
        };
        if (token) {
          headers["Authorization"] = `Bearer ${token}`;
        }
        const res = await fetch("/api/videos", { headers });
        if (res.ok) {
          const data = await res.json();
          setVideos(data);
        }
      } catch (err) {
        console.error("Gagal mengambil senarai video", err);
      } finally {
        setLoading(false);
      }
    };

    fetchVideos();
  }, [token, authLoading]);

  const handleToggleComplete = async (e: React.MouseEvent, videoId: string) => {
    e.preventDefault();
    e.stopPropagation();

    if (!token) {
      toast("Sila log masuk untuk menanda kemajuan video.", "error");
      return;
    }

    setTogglingId(videoId);

    // Optimistic UI update
    const previousVideos = [...videos];
    setVideos((prev) =>
      prev.map((v) => {
        if (v.id === videoId) {
          const currentStatus = v.user_progress?.is_completed || false;
          const nextStatus = !currentStatus;
          return {
            ...v,
            user_progress: {
              is_completed: nextStatus,
              last_watched_seconds: nextStatus ? (v.user_progress?.duration_seconds || 0) : 0,
              duration_seconds: v.user_progress?.duration_seconds || 0,
              progress_percent: nextStatus ? 100 : 0,
              last_watched_at: new Date().toISOString(),
            },
          };
        }
        return v;
      })
    );

    try {
      const res = await fetch(`/api/videos/${videoId}/toggle-complete`, {
        method: "POST",
        headers: {
          Accept: "application/json",
          Authorization: `Bearer ${token}`,
        },
      });

      if (res.ok) {
        const data = await res.json();
        toast(data.message || (data.is_completed ? "Video ditandakan sebagai selesai 🎉" : "Video ditandakan sebagai belum selesai"), "success");
      } else {
        // Rollback on error
        setVideos(previousVideos);
        toast("Gagal mengemaskini status video.", "error");
      }
    } catch (err) {
      console.error(err);
      setVideos(previousVideos);
      toast("Ralat rangkaian semasa mengemaskini status.", "error");
    } finally {
      setTogglingId(null);
    }
  };

  return (
    <div className="min-h-screen bg-background">
      {/* HEADER */}
      <header className="border-b border-border bg-card px-4 py-4 sticky top-0 z-40">
        <div className="max-w-5xl mx-auto flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <Video className="w-6 h-6 text-primary" />
            <h1 className="text-xl font-bold">Vocabulary Video</h1>
          </Link>
          <div className="hidden lg:flex items-center gap-2">
            <Link href="/">
              <Button variant="ghost" size="sm">Rumah</Button>
            </Link>
            <Link href="/video">
              <Button variant="secondary" size="sm">Video</Button>
            </Link>
            <Link href="/subscription">
              <Button variant="ghost" size="sm">Langganan</Button>
            </Link>
            <Link href="/profile">
              <Button variant="ghost" size="sm">Profil</Button>
            </Link>
          </div>
          <Badge variant="outline" className="border-primary/30 text-primary lg:hidden">
            Dwi-Sari Kata
          </Badge>
        </div>
      </header>

      <main className="max-w-5xl mx-auto px-4 py-6 space-y-8 pb-24 lg:pb-8">
        {/* HERO BANNER - HIGHLIGHT DUAL SUBTITLES */}
        <section className="relative overflow-hidden rounded-2xl bg-gradient-to-r from-amber-500/10 via-orange-500/10 to-transparent border border-amber-500/20 p-6 sm:p-8">
          <div className="absolute right-0 top-0 translate-x-10 -translate-y-10 w-40 h-40 bg-primary/20 blur-3xl rounded-full" />
          <div className="max-w-2xl space-y-4">
            <Badge className="bg-amber-500 hover:bg-amber-600 text-black font-semibold gap-1 py-1">
              <Sparkles className="w-3 h-3 fill-current" /> Ciri Eksklusif
            </Badge>
            <h2 className="text-2xl sm:text-4xl font-extrabold tracking-tight leading-tight">
              Kuasai Percakapan Sebenar dengan <span className="text-primary bg-primary/10 px-2 py-0.5 rounded-lg border border-primary/20">Dual Subtitles</span>
            </h2>
            <p className="text-muted-foreground text-sm sm:text-base leading-relaxed">
              Tonton video YouTube pilihan khas kami yang dilengkapi dengan dwi-sari kata (Bahasa Inggeris + terjemahan Bahasa Melayu) serentak. Klik pada transkrip interaktif untuk melompat ke babak kegemaran anda atau simpan ayat terus ke sesi kuiz harian anda!
            </p>
          </div>
        </section>

        {/* SENARAI VIDEO */}
        <section className="space-y-4">
          <div className="flex items-center justify-between">
            <h3 className="text-lg font-bold">Senarai Video Pembelajaran</h3>
            {videos.length > 0 && token && (
              <span className="text-xs text-muted-foreground">
                Selesai:{" "}
                <span className="font-bold text-emerald-400">
                  {videos.filter((v) => v.user_progress?.is_completed).length}
                </span>{" "}
                / {videos.length} video
              </span>
            )}
          </div>

          {loading ? (
            <div className="flex justify-center py-12">
              <Loader2 className="w-8 h-8 animate-spin text-primary" />
            </div>
          ) : videos.length === 0 ? (
            <div className="text-center py-12 text-muted-foreground">
              Tiada video yang dijumpai buat masa ini.
            </div>
          ) : (
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
              {videos.map((video) => {
                const isCompleted = video.user_progress?.is_completed || false;
                const progressPercent = video.user_progress?.progress_percent || 0;
                const hasWatchedSome = progressPercent > 0 && !isCompleted;

                return (
                  <Card key={video.id} className="overflow-hidden border-border bg-card group hover:border-primary/50 transition-all flex flex-col h-full relative">
                    {/* THUMBNAIL */}
                    <div className="relative aspect-video bg-muted overflow-hidden">
                      {/* eslint-disable-next-line @next/next/no-img-element */}
                      <img
                        src={video.thumbnail_url || `https://img.youtube.com/vi/${video.youtube_video_id}/mqdefault.jpg`}
                        alt={video.title}
                        className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                      />
                      <div className="absolute inset-0 bg-black/40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                        {video.is_locked ? (
                          <Lock className="w-10 h-10 text-white" />
                        ) : (
                          <Play className="w-10 h-10 text-white fill-white" />
                        )}
                      </div>

                      {/* BADGES KIRI (Percuma / Premium) */}
                      <div className="absolute top-2 left-2 flex gap-1 z-10">
                        {video.is_free && (
                          <Badge className="bg-green-600 hover:bg-green-600 text-white text-[11px] px-2 py-0.5">Percuma</Badge>
                        )}
                        {video.is_premium && (
                          <Badge className="bg-amber-600 hover:bg-amber-600 text-black font-semibold text-[11px] px-2 py-0.5">Premium</Badge>
                        )}
                      </div>

                      {/* BADGES KANAN (Status Selesai / Tick box) */}
                      <div className="absolute top-2 right-2 z-10 flex items-center gap-1.5">
                        {isCompleted && (
                          <Badge className="bg-emerald-600 hover:bg-emerald-600 text-white gap-1 text-[11px] px-2 py-0.5 shadow-md">
                            <CheckCircle2 className="w-3.5 h-3.5" /> Selesai
                          </Badge>
                        )}
                        {token && !video.is_locked && (
                          <button
                            type="button"
                            onClick={(e) => handleToggleComplete(e, video.id)}
                            disabled={togglingId === video.id}
                            title={isCompleted ? "Tandakan belum selesai" : "Tandakan sudah selesai"}
                            className={`p-1 rounded-full transition-all shadow-md backdrop-blur-md ${
                              isCompleted
                                ? "bg-emerald-500/90 text-white hover:bg-emerald-600"
                                : "bg-black/60 text-white/80 hover:bg-black/80 hover:text-white"
                            }`}
                          >
                            {togglingId === video.id ? (
                              <Loader2 className="w-4 h-4 animate-spin" />
                            ) : isCompleted ? (
                              <CheckCircle2 className="w-4 h-4 fill-emerald-500 text-white" />
                            ) : (
                              <Circle className="w-4 h-4" />
                            )}
                          </button>
                        )}
                      </div>

                      {/* PROGRESS BAR DI BAWAH THUMBNAIL */}
                      {progressPercent > 0 && (
                        <div className="absolute bottom-0 left-0 right-0 h-1.5 bg-black/60 overflow-hidden">
                          <div
                            className={`h-full transition-all duration-300 ${
                              isCompleted ? "bg-emerald-500" : "bg-primary"
                            }`}
                            style={{ width: `${progressPercent}%` }}
                          />
                        </div>
                      )}
                    </div>

                    {/* CONTENT */}
                    <CardContent className="p-4 flex flex-col justify-between flex-grow gap-4">
                      <div className="space-y-1.5">
                        <div className="flex items-center justify-between text-xs text-muted-foreground font-semibold">
                          <span className="uppercase tracking-wider">{video.category || "General"}</span>
                          {hasWatchedSome && (
                            <span className="text-primary text-[11px]">
                              {progressPercent}% ditonton
                            </span>
                          )}
                        </div>
                        <h4 className="font-bold text-base leading-snug line-clamp-2">
                          {video.title}
                        </h4>
                      </div>

                      <div className="space-y-2">
                        {video.is_locked ? (
                          <Link href="/pricing" className="w-full block">
                            <Button className="w-full bg-amber-600 hover:bg-amber-700 text-black font-semibold gap-2">
                              <Lock className="w-4 h-4" /> Buka dengan Premium
                            </Button>
                          </Link>
                        ) : (
                          <Link href={`/video/${video.id}`} className="w-full block">
                            {isCompleted ? (
                              <Button variant="outline" className="w-full gap-2 border-emerald-500/40 text-emerald-400 hover:bg-emerald-500/10">
                                <RotateCcw className="w-4 h-4" /> Tonton Semula
                              </Button>
                            ) : hasWatchedSome ? (
                              <Button className="w-full gap-2">
                                <Play className="w-4 h-4 fill-current" /> Sambung Tonton ({progressPercent}%)
                              </Button>
                            ) : (
                              <Button className="w-full gap-2">
                                <Play className="w-4 h-4 fill-current" /> Mula Belajar
                              </Button>
                            )}
                          </Link>
                        )}
                      </div>
                    </CardContent>
                  </Card>
                );
              })}
            </div>
          )}
        </section>
      </main>

      <BottomNav />
    </div>
  );
}
