"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Play, Lock, Sparkles, Loader2, Video } from "lucide-react";
import { useAuth } from "@/lib/auth";
import BottomNav from "@/components/BottomNav";

interface YoutubeVideoData {
  id: string;
  title: string;
  youtube_video_id: string;
  thumbnail_url: string;
  category: string;
  is_premium: boolean;
  is_free: boolean;
  is_locked: boolean;
}

export default function VideoPage() {
  const { token } = useAuth();
  const [videos, setVideos] = useState<YoutubeVideoData[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!token) return;

    const fetchVideos = async () => {
      try {
        const res = await fetch("/api/videos", {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
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
  }, [token]);

  return (
    <div className="min-h-screen bg-background pb-48 lg:pb-20">
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

      <main className="max-w-5xl mx-auto px-4 py-6 space-y-8">
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
          <h3 className="text-lg font-bold">Senarai Video Pembelajaran</h3>

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
              {videos.map((video) => (
                <Card key={video.id} className="overflow-hidden border-border bg-card group hover:border-primary/50 transition-all flex flex-col h-full">
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
                    {/* BADGES */}
                    <div className="absolute top-2 left-2 flex gap-1">
                      {video.is_free && (
                        <Badge className="bg-green-600 hover:bg-green-600 text-white">Percuma</Badge>
                      )}
                      {video.is_premium && (
                        <Badge className="bg-amber-600 hover:bg-amber-600 text-black font-semibold">Premium</Badge>
                      )}
                    </div>
                  </div>

                  {/* CONTENT */}
                  <CardContent className="p-4 flex flex-col justify-between flex-grow gap-4">
                    <div className="space-y-1.5">
                      <p className="text-xs text-muted-foreground font-semibold uppercase tracking-wider">
                        {video.category || "General"}
                      </p>
                      <h4 className="font-bold text-base leading-snug line-clamp-2">
                        {video.title}
                      </h4>
                    </div>

                    <div>
                      {video.is_locked ? (
                        <Link href="/pricing" className="w-full">
                          <Button className="w-full bg-amber-600 hover:bg-amber-700 text-black font-semibold gap-2">
                            <Lock className="w-4 h-4" /> Buka dengan Premium
                          </Button>
                        </Link>
                      ) : (
                        <Link href={`/video/${video.id}`} className="w-full">
                          <Button className="w-full gap-2">
                            <Play className="w-4 h-4 fill-current" /> Mula Belajar
                          </Button>
                        </Link>
                      )}
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          )}
        </section>
      </main>

      <BottomNav />
    </div>
  );
}
