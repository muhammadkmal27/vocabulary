"use client";

import { useEffect, useState, useRef } from "react";
import Link from "next/link";
import { useParams, useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { ArrowLeft, Play, Pause, RotateCcw, Volume2, Plus, Loader2, Sparkles, AlertTriangle } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";

// Extend window object for YouTube API
declare global {
  interface Window {
    onYouTubeIframeAPIReady?: () => void;
    YT?: any;
  }
}

interface Subtitle {
  id: string;
  start_time: number;
  end_time: number;
  target_text: string;
  source_text: string;
  order: number;
}

interface YoutubeVideoData {
  id: string;
  title: string;
  youtube_video_id: string;
  category: string;
  subtitles: Subtitle[];
}

export default function InteractivePlayerPage() {
  const params = useParams();
  const router = useRouter();
  const videoId = params?.id as string;
  const { token } = useAuth();
  const { toast } = useAlert();

  const [videoData, setVideoData] = useState<YoutubeVideoData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const [player, setPlayer] = useState<any>(null);
  const [currentTime, setCurrentTime] = useState(0);
  const [activeSubtitle, setActiveSubtitle] = useState<Subtitle | null>(null);
  const [addingSentenceId, setAddingSentenceId] = useState<string | null>(null);

  const playerRef = useRef<HTMLDivElement>(null);
  const rafRef = useRef<number | null>(null);
  const transcriptRefs = useRef<{ [key: string]: HTMLDivElement | null }>({});
  const transcriptContainerRef = useRef<HTMLDivElement>(null); // scroll ONLY within this
  const playerObjRef = useRef<any>(null); // stable ref to YT player

  // 1. Fetch Video & Subtitle Data
  useEffect(() => {
    if (!token || !videoId) return;

    const fetchVideo = async () => {
      try {
        const res = await fetch(`/api/videos/${videoId}`, {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
        if (res.status === 403) {
          setError("Akses terhad. Sila langgan untuk menonton video premium ini.");
          return;
        }
        if (!res.ok) {
          setError("Gagal memuatkan video.");
          return;
        }
        const data = await res.json();
        setVideoData(data);
      } catch (err) {
        setError("Ralat menyambung ke pelayan.");
      } finally {
        setLoading(false);
      }
    };

    fetchVideo();
  }, [token, videoId]);

  // 2. Load YouTube IFrame API
  useEffect(() => {
    if (!videoData) return;

    // Load API Script
    if (!window.YT) {
      const tag = document.createElement("script");
      tag.src = "https://www.youtube.com/iframe_api";
      const firstScriptTag = document.getElementsByTagName("script")[0];
      firstScriptTag.parentNode?.insertBefore(tag, firstScriptTag);
    }

    // Bind global callback
    window.onYouTubeIframeAPIReady = () => {
      initPlayer();
    };

    // If script is already loaded
    if (window.YT && window.YT.Player) {
      initPlayer();
    }

    return () => {
      if (rafRef.current) cancelAnimationFrame(rafRef.current);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [videoData]);

  const initPlayer = () => {
    if (!videoData) return;

    const ytPlayer = new window.YT.Player("youtube-player-iframe", {
      height: "100%",
      width: "100%",
      videoId: videoData.youtube_video_id,
      playerVars: {
        playsinline: 1,
        rel: 0,
        modestbranding: 1,
        controls: 1,
      },
      events: {
        onReady: (event: any) => {
          setPlayer(event.target);
        },
        onStateChange: (event: any) => {
          // Play state is 1
          if (event.data === window.YT.PlayerState.PLAYING) {
            startTrackingTime(event.target);
          } else {
            stopTrackingTime();
          }
        },
      },
    });
  };

  // Binary search: find subtitle active at given time (O log n)
  const findSubtitle = (time: number, subs: Subtitle[]): Subtitle | null => {
    let lo = 0, hi = subs.length - 1;
    while (lo <= hi) {
      const mid = (lo + hi) >> 1;
      const s = subs[mid];
      if (time < s.start_time) {
        hi = mid - 1;
      } else if (time > s.end_time) {
        lo = mid + 1;
      } else {
        return s; // time is within [start_time, end_time]
      }
    }
    return null;
  };

  const startTrackingTime = (activePlayer: any) => {
    playerObjRef.current = activePlayer;
    if (rafRef.current) cancelAnimationFrame(rafRef.current);

    const tick = () => {
      if (playerObjRef.current?.getCurrentTime) {
        const time: number = playerObjRef.current.getCurrentTime();
        setCurrentTime(time);

        const subs = videoData?.subtitles ?? [];
        const matched = findSubtitle(time, subs);
        setActiveSubtitle((prev) => {
          // Only trigger re-render when subtitle actually changes
          if (prev?.id === matched?.id) return prev;
          return matched;
        });
      }
      rafRef.current = requestAnimationFrame(tick);
    };

    rafRef.current = requestAnimationFrame(tick);
  };

  const stopTrackingTime = () => {
    if (rafRef.current) {
      cancelAnimationFrame(rafRef.current);
      rafRef.current = null;
    }
  };

  // Scroll active transcript line into view — within sidebar container ONLY
  // (never scrolls the page, so the video stays visible on mobile)
  useEffect(() => {
    if (!activeSubtitle) return;
    const container = transcriptContainerRef.current;
    const element = transcriptRefs.current[activeSubtitle.id];
    if (!container || !element) return;

    // Calculate relative offset of element inside the scrollable container
    const elTop = element.offsetTop - container.offsetTop;
    const elHeight = element.offsetHeight;
    const cHeight = container.clientHeight;
    const cScroll = container.scrollTop;

    // Detect if mobile layout (<1024px)
    const isMobile = window.innerWidth < 1024;

    if (isMobile) {
      // On mobile: immediately center the active item so the active purple highlight is locked in view
      container.scrollTo({
        top: elTop - cHeight / 2 + elHeight / 2,
        behavior: "smooth",
      });
    } else {
      // On laptop/desktop: only scroll if the active item is near/outside container boundary
      const isVisible = elTop >= cScroll + 50 && elTop + elHeight <= cScroll + cHeight - 50;
      if (!isVisible) {
        container.scrollTo({
          top: elTop - cHeight / 2 + elHeight / 2,
          behavior: "smooth",
        });
      }
    }
  }, [activeSubtitle]);

  // 3. Add sentence to custom level / vocabulary list
  const handleAddSentence = async (subtitle: Subtitle) => {
    toast("Ciri Hafal Ayat dari video ini akan datang tidak lama lagi!", "info");
  };

  if (loading) {
    return (
      <div className="min-h-screen flex justify-center items-center bg-background">
        <Loader2 className="w-10 h-10 animate-spin text-primary" />
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center bg-background gap-4 px-4 text-center">
        <AlertTriangle className="w-16 h-16 text-destructive" />
        <h2 className="text-xl font-bold">Akses Disekat</h2>
        <p className="text-muted-foreground max-w-sm">{error}</p>
        <div className="flex gap-3">
          <Link href="/video">
            <Button variant="outline">Kembali ke Senarai</Button>
          </Link>
          <Link href="/pricing">
            <Button>Langgan Premium</Button>
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background flex flex-col lg:h-screen lg:overflow-hidden pb-4">
      {/* HEADER */}
      <header className="border-b border-border bg-card px-4 py-3 flex items-center gap-3">
        <Button variant="ghost" size="icon" onClick={() => router.push("/video")}>
          <ArrowLeft className="w-5 h-5" />
        </Button>
        <div className="flex-1 min-w-0">
          <h1 className="font-semibold truncate text-sm sm:text-base">{videoData?.title}</h1>
          <p className="text-xs text-muted-foreground truncate">{videoData?.category || "General Video"}</p>
        </div>
        <Badge variant="outline" className="border-primary/30 text-primary shrink-0 gap-1">
          <Sparkles className="w-3.5 h-3.5 fill-current" /> Dual Subtitles
        </Badge>
      </header>

      {/* CORE WORKSPACE */}
      <div className="flex-1 flex flex-col lg:flex-row lg:overflow-hidden">
        {/* LEFT COLUMN: PLAYER & SUBTITLE SCREEN */}
        <div className="flex-1 flex flex-col p-4 gap-4 lg:overflow-y-auto lg:max-h-full">
          {/* VIDEO FRAME */}
          <div ref={playerRef} className="relative aspect-video w-full rounded-xl overflow-hidden bg-black border border-border">
            <div id="youtube-player-iframe" className="w-full h-full" />
          </div>

          {/* DUAL SUBTITLE DISPLAY — fixed height so the video never jumps. Multi-line is fully supported on mobile and will fit within 150px without shifting layout. */}
          <div className="min-h-[140px] lg:h-[140px] shrink-0 rounded-xl border border-amber-500/20 bg-amber-500/5 flex items-center justify-center px-4 py-3 text-center overflow-y-auto">
            {activeSubtitle ? (
              <div className="space-y-1.5 w-full">
                <p className="text-base sm:text-lg lg:text-xl font-extrabold text-primary leading-snug break-words">
                  {activeSubtitle.target_text}
                </p>
                <p className="text-xs sm:text-sm text-muted-foreground font-medium break-words">
                  {activeSubtitle.source_text}
                </p>
              </div>
            ) : (
              <p className="text-muted-foreground/60 text-sm italic">
                Mainkan video untuk melihat sari kata dwi-bahasa
              </p>
            )}
          </div>
        </div>

        {/* RIGHT COLUMN: INTERACTIVE TRANSCRIPT SIDEBAR */}
        <div className="w-full lg:w-96 border-t lg:border-t-0 lg:border-l border-border bg-card flex flex-col h-[400px] lg:h-full">
          <div className="p-4 border-b border-border">
            <h3 className="font-bold text-sm">Transkrip Interaktif</h3>
            <p className="text-xs text-muted-foreground">Klik pada baris untuk melompat ke babak tersebut</p>
          </div>
          <div ref={transcriptContainerRef} className="flex-1 overflow-y-auto p-4 space-y-3 relative">
            {videoData?.subtitles.map((sub) => {
              const isActive = activeSubtitle?.id === sub.id;
              return (
                <div
                  key={sub.id}
                  ref={(el) => {
                    transcriptRefs.current[sub.id] = el;
                  }}
                  onClick={() => player?.seekTo(sub.start_time, true)}
                  className={`p-3 rounded-lg border text-left cursor-pointer transition-all space-y-1.5 group relative ${
                    isActive
                      ? "border-primary bg-primary/10 ring-2 ring-primary/30 shadow-md scale-[1.02]"
                      : "border-border hover:border-muted-foreground/30 hover:bg-muted/50"
                  }`}
                >
                  <div className="flex justify-between items-start gap-2">
                    <p className={`text-sm font-semibold leading-tight ${isActive ? "text-primary font-bold" : ""}`}>
                      {sub.target_text}
                    </p>
                    <Badge variant={isActive ? "default" : "secondary"} className="text-[9px] px-1 py-0 h-4 font-mono shrink-0">
                      {Math.floor(sub.start_time / 60)}:
                      {String(Math.floor(sub.start_time % 60)).padStart(2, "0")}
                    </Badge>
                  </div>
                  <p className="text-xs text-muted-foreground leading-normal">
                    {sub.source_text}
                  </p>

                  <div className="pt-1.5 flex justify-end opacity-0 group-hover:opacity-100 transition-opacity">
                    <Button
                      size="sm"
                      variant="ghost"
                      className="h-7 text-[10px] gap-1 hover:text-primary"
                      onClick={(e) => {
                        e.stopPropagation();
                        handleAddSentence(sub);
                      }}
                      disabled={addingSentenceId === sub.id}
                    >
                      {addingSentenceId === sub.id ? (
                        <Loader2 className="w-3 h-3 animate-spin" />
                      ) : (
                        <Plus className="w-3 h-3" />
                      )}
                      Hafal Ayat
                    </Button>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </div>
  );
}
