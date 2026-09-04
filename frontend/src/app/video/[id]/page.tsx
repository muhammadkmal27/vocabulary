"use client";

import { useEffect, useState, useRef } from "react";
import Link from "next/link";
import { useParams, useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { ArrowLeft, Play, Pause, RotateCcw, Volume2, Plus, Loader2, Sparkles, AlertTriangle, CheckCircle2, Circle } from "lucide-react";
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
  category: string;
  subtitles: Subtitle[];
  user_progress?: UserVideoProgress;
}

export default function InteractivePlayerPage() {
  const params = useParams();
  const router = useRouter();
  const videoId = params?.id as string;
  const { token, isLoading: authLoading } = useAuth();
  const { toast } = useAlert();

  const [videoData, setVideoData] = useState<YoutubeVideoData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const [player, setPlayer] = useState<any>(null);
  const [currentTime, setCurrentTime] = useState(0);
  const [activeSubtitle, setActiveSubtitle] = useState<Subtitle | null>(null);
  const [addingSentenceId, setAddingSentenceId] = useState<string | null>(null);
  const [playerReady, setPlayerReady] = useState(false);
  const [isCompleted, setIsCompleted] = useState(false);
  const [isTogglingComplete, setIsTogglingComplete] = useState(false);

  const playerRef = useRef<HTMLDivElement>(null);
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const transcriptRefs = useRef<{ [key: string]: HTMLDivElement | null }>({});
  const transcriptContainerRef = useRef<HTMLDivElement>(null); // scroll ONLY within this
  const playerObjRef = useRef<any>(null); // stable ref to YT player
  const lastSubtitleRef = useRef<Subtitle | null>(null);   // persist last matched subtitle
  const subtitlesRef = useRef<Subtitle[]>([]);              // always-current subtitles for closures
  const lastKnownTimeRef = useRef<number>(0);               // last good time from getCurrentTime()
  const lastKnownWallRef = useRef<number>(Date.now());      // wall-clock when time last changed
  const lastSyncTimeRef = useRef<number>(0);                // throttle backend progress sync
  const hasAutoCompletedRef = useRef<boolean>(false);       // prevent duplicate 85% toast

  // Dictionary Hover & Click features
  const [hoveredWord, setHoveredWord] = useState<string | null>(null);
  const [wordTranslation, setWordTranslation] = useState<string>("");
  const [loadingWord, setLoadingWord] = useState(false);
  const [popupPos, setPopupPos] = useState<{ x: number; y: number } | null>(null);
  const [translationCache, setTranslationCache] = useState<{ [key: string]: string }>({});

  const handleWordHoverOrClick = async (word: string, e: React.MouseEvent) => {
    // 1. Pause video automatically
    if (playerObjRef.current && typeof playerObjRef.current.pauseVideo === "function") {
      playerObjRef.current.pauseVideo();
    } else if (player && typeof player.pauseVideo === "function") {
      player.pauseVideo();
    }

    const cleanWord = word.replace(/[.,\/#!$%\^&\*;:{}=\-_`~()?"']/g, "").trim().toLowerCase();
    if (!cleanWord) return;

    setHoveredWord(cleanWord);
    setLoadingWord(true);

    const rect = (e.target as HTMLElement).getBoundingClientRect();
    setPopupPos({
      x: rect.left + window.scrollX + rect.width / 2,
      y: rect.top + window.scrollY - 10,
    });

    if (translationCache[cleanWord]) {
      setWordTranslation(translationCache[cleanWord]);
      setLoadingWord(false);
      return;
    }

    // 1. Semak Kamus Tempatan Dahulu (100% Tepat untuk perkataan lazim)
    const localDictionary: { [key: string]: string } = {
      "practice": "berlatih / latihan",
      "every": "setiap / tiap-tiap",
      "everything": "segalanya / semua perkara",
      "shopping": "membeli-belah",
      "grocery": "barangan runcit / dapur",
      "store": "kedai / pasar raya",
      "market": "pasar",
      "forbidden": "larangan / terlarang",
      "city": "kota / bandar",
      "palace": "istana",
      "emperor": "maharaja",
      "natural": "semula jadi / santai",
      "friend": "kawan / rakan",
      "blender": "pengisar",
      "cart": "troli",
      "aisle": "lorong barangan",
      "poutine": "hidangan kentang poutine",
      "cake": "kek",
      "bread": "roti",
    };

    if (localDictionary[cleanWord]) {
      const localResult = localDictionary[cleanWord];
      setTranslationCache((prev) => ({ ...prev, [cleanWord]: localResult }));
      setWordTranslation(localResult);
      setLoadingWord(false);
      return;
    }

    // 2. Fetch Kamus Pantas
    try {
      const res = await fetch(
        `https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=ms&dt=t&q=${encodeURIComponent(cleanWord)}`
      );
      if (res.ok) {
        const json = await res.json();
        const translatedText = json?.[0]?.[0]?.[0] || "Terjemahan tidak dijumpai";
        const cleanTranslation = translatedText.toLowerCase();
        setTranslationCache((prev) => ({ ...prev, [cleanWord]: cleanTranslation }));
        setWordTranslation(cleanTranslation);
      } else {
        setWordTranslation("Tiada terjemahan");
      }
    } catch {
      setWordTranslation("Gagal memuatkan");
    } finally {
      setLoadingWord(false);
    }
  };

  const handleWordLeave = () => {
    setHoveredWord(null);
    setWordTranslation("");
    setPopupPos(null);

    // Resume video playback when user leaves word / unhover
    if (playerObjRef.current && typeof playerObjRef.current.playVideo === "function") {
      playerObjRef.current.playVideo();
    } else if (player && typeof player.playVideo === "function") {
      player.playVideo();
    }
  };

  // Helper to render interactive words (hover & click)
  const renderInteractiveText = (text: string) => {
    const words = text.split(/(\s+)/);
    return words.map((chunk, index) => {
      if (/^\s+$/.test(chunk)) {
        return <span key={index}>{chunk}</span>;
      }
      return (
        <span
          key={index}
          className="cursor-pointer hover:bg-amber-500/20 hover:text-amber-300 rounded px-0.5 transition-colors border-b border-dashed border-amber-500/40"
          onClick={(e) => handleWordHoverOrClick(chunk, e)}
          onMouseEnter={(e) => handleWordHoverOrClick(chunk, e)}
          onMouseLeave={handleWordLeave}
          title="Klik atau layang untuk lihat terjemahan"
        >
          {chunk}
        </span>
      );
    });
  };

  // 1. Fetch Video Data & Subtitles
  useEffect(() => {
    if (authLoading) return;

    const fetchVideo = async () => {
      try {
        const headers: Record<string, string> = {
          Accept: "application/json",
        };
        if (token) {
          headers["Authorization"] = `Bearer ${token}`;
        }
        const res = await fetch(`/api/videos/${videoId}`, { headers });
        if (res.status === 401) {
          setError("Sila log masuk untuk menonton video premium.");
          return;
        }
        if (res.status === 403) {
          setError("Akses terhad. Sila langgan untuk menonton video premium ini.");
          return;
        }
        if (!res.ok) {
          setError("Gagal memuatkan video.");
          return;
        }
        const data = await res.json();
        if (data.subtitles && Array.isArray(data.subtitles)) {
          data.subtitles.sort((a: Subtitle, b: Subtitle) => a.start_time - b.start_time);
          subtitlesRef.current = data.subtitles;
        }
        if (data.user_progress?.is_completed) {
          setIsCompleted(true);
          hasAutoCompletedRef.current = true;
        }
        setVideoData(data);
      } catch (err) {
        setError("Ralat menyambung ke pelayan.");
      } finally {
        setLoading(false);
      }
    };

    fetchVideo();
  }, [token, videoId, authLoading]);

  // 2. Load YouTube IFrame API
  useEffect(() => {
    if (!videoData) return;

    if (!window.YT) {
      const tag = document.createElement("script");
      tag.src = "https://www.youtube.com/iframe_api";
      const firstScriptTag = document.getElementsByTagName("script")[0];
      firstScriptTag.parentNode?.insertBefore(tag, firstScriptTag);
    }

    window.onYouTubeIframeAPIReady = () => {
      initPlayer();
    };

    if (window.YT && window.YT.Player) {
      initPlayer();
    }

    return () => {
      if (intervalRef.current) clearInterval(intervalRef.current);
      if (playerObjRef.current?.getCurrentTime && token && videoId) {
        try {
          const curTime = playerObjRef.current.getCurrentTime();
          const duration = playerObjRef.current.getDuration ? playerObjRef.current.getDuration() : 0;
          if (curTime > 0 && duration > 0) {
            fetch(`/api/videos/${videoId}/progress`, {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
                Accept: "application/json",
                Authorization: `Bearer ${token}`,
              },
              body: JSON.stringify({
                last_watched_seconds: Math.round(curTime * 100) / 100,
                duration_seconds: Math.round(duration * 100) / 100,
              }),
              keepalive: true,
            }).catch(() => {});
          }
        } catch {}
      }
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [videoData, token, videoId]);

  const hasInitialSeekDoneRef = useRef<boolean>(false);     // guarantee seek once

  const initPlayer = () => {
    if (!videoData) return;

    const lastWatched = Math.floor(videoData.user_progress?.last_watched_seconds || 0);
    const shouldResume = lastWatched > 5 && !videoData.user_progress?.is_completed;
    const startSeconds = shouldResume ? lastWatched : 0;

    const playerVarsObj: any = {
      playsinline: 1,
      rel: 0,
      modestbranding: 1,
      controls: 1,
    };
    if (startSeconds > 0) {
      playerVarsObj.start = startSeconds;
    }

    const ytPlayer = new window.YT.Player("youtube-player-iframe", {
      height: "100%",
      width: "100%",
      videoId: videoData.youtube_video_id,
      playerVars: playerVarsObj,
      events: {
        onReady: (event: any) => {
          setPlayer(event.target);
          playerObjRef.current = event.target;
          setPlayerReady(true);

          if (shouldResume) {
            try {
              event.target.seekTo(startSeconds, true);
              const mins = Math.floor(startSeconds / 60);
              const secs = String(startSeconds % 60).padStart(2, "0");
              toast(`Menyambung tontonan dari minit ${mins}:${secs}`, "info");
            } catch {}
          }

          startTrackingTime(event.target);
        },
        onStateChange: (event: any) => {
          playerObjRef.current = event.target;

          // Double check seek on first PLAYING (1) or BUFFERING (3)
          if (shouldResume && !hasInitialSeekDoneRef.current && (event.data === 1 || event.data === 3)) {
            hasInitialSeekDoneRef.current = true;
            try {
              const cur = event.target.getCurrentTime();
              if (cur < 3 && startSeconds > 5) {
                event.target.seekTo(startSeconds, true);
              }
            } catch {}
          }

          // Save progress immediately on PAUSED (2)
          if (event.data === 2 && event.target?.getCurrentTime) {
            try {
              const curTime = event.target.getCurrentTime();
              const duration = event.target.getDuration ? event.target.getDuration() : 0;
              syncProgressToBackend(curTime, duration);
            } catch {}
          }

          if (!intervalRef.current) {
            startTrackingTime(event.target);
          }
        },
      },
    });
  };

  // Sync progress to backend periodically (every 5 seconds)
  const syncProgressToBackend = async (time: number, duration: number) => {
    if (!token || !videoId || duration <= 0) return;

    // Check auto completion at >= 85%
    const ratio = time / duration;
    if (ratio >= 0.85 && !hasAutoCompletedRef.current) {
      hasAutoCompletedRef.current = true;
      setIsCompleted(true);
      toast("Tahniah! Anda telah selesai menonton video ini 🎉", "success");
    }

    try {
      await fetch(`/api/videos/${videoId}/progress`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({
          last_watched_seconds: Math.round(time * 100) / 100,
          duration_seconds: Math.round(duration * 100) / 100,
        }),
      });
    } catch {
      // silently ignore background sync errors
    }
  };

  // Manual Toggle Complete (Tick / Untick)
  const handleToggleManualComplete = async () => {
    if (!token) {
      toast("Sila log masuk untuk menanda kemajuan video.", "error");
      return;
    }

    setIsTogglingComplete(true);
    const nextState = !isCompleted;
    setIsCompleted(nextState);

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
        toast(data.message, "success");
      } else {
        setIsCompleted(!nextState);
        toast("Gagal mengemaskini status video.", "error");
      }
    } catch {
      setIsCompleted(!nextState);
      toast("Ralat rangkaian.", "error");
    } finally {
      setIsTogglingComplete(false);
    }
  };

  const findSubtitle = (time: number, subs: Subtitle[]): Subtitle | null => {
    if (!subs || !subs.length) return null;

    for (let i = 0; i < subs.length; i++) {
      const s = subs[i];
      const next = subs[i + 1];

      if (time >= s.start_time && time <= s.end_time) {
        return s;
      }

      if (next && time > s.end_time && time < next.start_time) {
        const gap = next.start_time - s.end_time;
        if (gap <= 1.5 || time <= s.end_time + 1.2) {
          return s;
        }
      }
    }
    return null;
  };

  const startTrackingTime = (activePlayer: any) => {
    playerObjRef.current = activePlayer;
    if (intervalRef.current) clearInterval(intervalRef.current);

    intervalRef.current = setInterval(() => {
      const p = playerObjRef.current;
      if (!p?.getCurrentTime) return;
      try {
        const rawTime: number = p.getCurrentTime();
        const duration: number = p.getDuration ? p.getDuration() : 0;
        const nowWall = Date.now();

        if (Math.abs(rawTime - lastKnownTimeRef.current) > 0.05) {
          lastKnownTimeRef.current = rawTime;
          lastKnownWallRef.current = nowWall;
        }

        const frozenMs = nowWall - lastKnownWallRef.current;
        const playerState = p.getPlayerState?.() ?? -1;
        const isPlaying = playerState === 1;
        const effectiveTime =
          frozenMs > 3000 && isPlaying
            ? lastKnownTimeRef.current + frozenMs / 1000
            : rawTime;

        setCurrentTime(effectiveTime);

        // Sync to backend every 5 seconds while playing
        if (isPlaying && nowWall - lastSyncTimeRef.current > 5000) {
          lastSyncTimeRef.current = nowWall;
          syncProgressToBackend(effectiveTime, duration);
        }

        const subs = subtitlesRef.current;
        const matched = findSubtitle(effectiveTime, subs);
        const toShow = matched ?? lastSubtitleRef.current;

        setActiveSubtitle((prev) => {
          if (prev?.id === toShow?.id) return prev;
          return toShow;
        });

        if (matched) lastSubtitleRef.current = matched;
      } catch (e) {
        // ignore
      }
    }, 100);
  };

  // Scroll active transcript line into view
  useEffect(() => {
    if (!activeSubtitle) return;
    const container = transcriptContainerRef.current;
    const el = transcriptRefs.current[activeSubtitle.id];
    if (container && el) {
      const containerRect = container.getBoundingClientRect();
      const elRect = el.getBoundingClientRect();
      const relativeTop = elRect.top - containerRect.top + container.scrollTop;
      const isMobile = typeof window !== "undefined" && window.innerWidth < 1024;
      const targetScroll = isMobile
        ? relativeTop - 16
        : relativeTop - container.clientHeight / 2 + elRect.height / 2;

      container.scrollTo({
        top: Math.max(0, targetScroll),
        behavior: "smooth",
      });
    }
  }, [activeSubtitle]);

  // Hafal Ayat Action
  const handleAddSentence = (sub: Subtitle) => {
    toast("Ciri Hafal Ayat dari video ini akan datang tidak lama lagi!", "info");
  };

  if (loading || authLoading) {
    return (
      <div className="min-h-screen bg-background flex flex-col items-center justify-center gap-4">
        <Loader2 className="w-10 h-10 animate-spin text-primary" />
        <p className="text-muted-foreground text-sm">Menyediakan pemain video dwi-sari kata...</p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen bg-background flex flex-col items-center justify-center p-4">
        <div className="max-w-md w-full bg-card p-6 rounded-2xl border border-border text-center space-y-4 shadow-lg">
          <div className="w-12 h-12 bg-destructive/10 text-destructive rounded-full flex items-center justify-center mx-auto">
            <AlertTriangle className="w-6 h-6" />
          </div>
          <h2 className="text-xl font-bold">Akses Disekat</h2>
          <p className="text-muted-foreground text-sm">{error}</p>
          <div className="flex gap-2 justify-center pt-2">
            <Link href="/video">
              <Button variant="outline">Kembali ke Senarai</Button>
            </Link>
            <Link href="/pricing">
              <Button>Langgan Premium</Button>
            </Link>
          </div>
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

        {/* TICK BOX TOGGLE BUTTON */}
        <Button
          variant="outline"
          size="sm"
          onClick={handleToggleManualComplete}
          disabled={isTogglingComplete}
          className={`gap-1.5 shrink-0 transition-all ${
            isCompleted
              ? "bg-emerald-500/10 border-emerald-500/40 text-emerald-400 hover:bg-emerald-500/20"
              : "hover:border-primary/50 text-muted-foreground hover:text-foreground"
          }`}
          title={isCompleted ? "Klik untuk tandakan belum selesai" : "Klik untuk tandakan selesai"}
        >
          {isTogglingComplete ? (
            <Loader2 className="w-3.5 h-3.5 animate-spin" />
          ) : isCompleted ? (
            <CheckCircle2 className="w-3.5 h-3.5 text-emerald-400" />
          ) : (
            <Circle className="w-3.5 h-3.5" />
          )}
          <span className="hidden sm:inline text-xs font-semibold">
            {isCompleted ? "Selesai" : "Tanda Selesai"}
          </span>
        </Button>

        <Badge variant="outline" className="border-primary/30 text-primary shrink-0 gap-1 hidden md:flex">
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

            {/* SKELETON LOADING OVERLAY */}
            {!playerReady && (
              <div className="absolute inset-0 flex flex-col items-center justify-center bg-black/95 z-10 gap-4">
                <div className="w-full h-full absolute inset-0 overflow-hidden">
                  <div
                    className="absolute inset-0 opacity-10"
                    style={{
                      background: "linear-gradient(90deg, transparent 0%, rgba(255,255,255,0.15) 50%, transparent 100%)",
                      backgroundSize: "200% 100%",
                      animation: "shimmer 1.8s infinite",
                    }}
                  />
                </div>
                <div className="relative z-10 flex flex-col items-center gap-3">
                  <div className="relative">
                    <div className="w-14 h-14 rounded-full border-4 border-primary/20 border-t-primary animate-spin" />
                    <div className="absolute inset-0 flex items-center justify-center">
                      <div className="w-5 h-5 rounded-full bg-primary/60 animate-pulse" />
                    </div>
                  </div>
                  <p className="text-white/70 text-sm font-medium animate-pulse">Memuatkan video...</p>
                  <p className="text-white/40 text-xs">Sila tunggu sebentar</p>
                </div>
              </div>
            )}
          </div>

          {/* DUAL SUBTITLE DISPLAY */}
          <div className="min-h-[140px] lg:h-[140px] shrink-0 rounded-xl border border-amber-500/20 bg-amber-500/5 flex items-center justify-center px-4 py-3 text-center overflow-y-auto">
            {activeSubtitle ? (
              <div className="space-y-1.5 w-full">
                <p className="text-base sm:text-lg lg:text-xl font-extrabold text-primary leading-snug break-words">
                  {renderInteractiveText(activeSubtitle.target_text)}
                </p>
                <p className="text-xs sm:text-sm text-muted-foreground font-medium break-words">
                  {activeSubtitle.source_text}
                </p>
              </div>
            ) : (
              <div className="space-y-1 text-muted-foreground/60">
                <Volume2 className="w-6 h-6 mx-auto opacity-50 mb-1" />
                <p className="text-xs sm:text-sm italic">
                  Sari kata dwi-bahasa akan muncul secara automatik mengikut audio perbualan...
                </p>
              </div>
            )}
          </div>
        </div>

        {/* RIGHT COLUMN: INTERACTIVE TRANSCRIPT SIDEBAR */}
        <div className="w-full lg:w-96 border-t lg:border-t-0 lg:border-l border-border bg-card flex flex-col h-[400px] lg:h-full">
          <div className="p-4 border-b border-border flex items-center justify-between">
            <div>
              <h3 className="font-bold text-sm">Transkrip Interaktif</h3>
              <p className="text-xs text-muted-foreground">Klik pada baris untuk melompat ke babak tersebut</p>
            </div>
            {isCompleted && (
              <Badge className="bg-emerald-600/90 text-white gap-1 text-[10px] px-2 py-0.5">
                <CheckCircle2 className="w-3 h-3" /> Selesai
              </Badge>
            )}
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
                  className={`p-3 rounded-lg border text-left cursor-pointer transition-all space-y-1.5 group relative ${isActive
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

                  <div className="pt-1.5 flex justify-end lg:opacity-0 lg:group-hover:opacity-100 transition-opacity">
                    <Button
                      size="sm"
                      variant="ghost"
                      className="h-7 text-[10px] gap-1 hover:text-primary"
                      onClick={(e) => {
                        e.stopPropagation();
                        handleAddSentence(sub);
                      }}
                    >
                      <Plus className="w-3 h-3" />
                      Hafal Ayat
                    </Button>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </div>

      {hoveredWord && popupPos && (
        <div
          className="absolute z-50 transform -translate-x-1/2 -translate-y-full bg-slate-950/95 border border-amber-500/30 text-white p-3 rounded-lg shadow-xl max-w-[220px] text-center backdrop-blur-sm pointer-events-auto"
          style={{
            left: `${popupPos.x}px`,
            top: `${popupPos.y}px`,
          }}
          onMouseLeave={handleWordLeave}
        >
          <div className="text-[10px] text-amber-400/80 font-bold uppercase tracking-wider mb-1">
            Maksud: {hoveredWord}
          </div>
          {loadingWord ? (
            <div className="flex justify-center py-1">
              <Loader2 className="w-4 h-4 animate-spin text-amber-500" />
            </div>
          ) : (
            <div className="text-xs font-semibold leading-relaxed text-slate-100">
              {wordTranslation}
            </div>
          )}
          <div className="absolute top-full left-1/2 transform -translate-x-1/2 -translate-y-[1px] w-0 h-0 border-l-[6px] border-l-transparent border-r-[6px] border-r-transparent border-t-[6px] border-t-slate-950" />
        </div>
      )}
    </div>
  );
}
