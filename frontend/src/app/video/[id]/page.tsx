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

  const playerRef = useRef<HTMLDivElement>(null);
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const transcriptRefs = useRef<{ [key: string]: HTMLDivElement | null }>({});
  const transcriptContainerRef = useRef<HTMLDivElement>(null); // scroll ONLY within this
  const playerObjRef = useRef<any>(null); // stable ref to YT player
  const lastSubtitleRef = useRef<Subtitle | null>(null);   // persist last matched subtitle
  const subtitlesRef = useRef<Subtitle[]>([]);              // always-current subtitles for closures
  const lastKnownTimeRef = useRef<number>(0);               // last good time from getCurrentTime()
  const lastKnownWallRef = useRef<number>(Date.now());      // wall-clock when time last changed

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
      "each": "setiap / masing-masing",
      "bedroom": "bilik tidur",
      "balcony": "balkoni",
      "washroom": "bilik air / tandas",
      "living": "hidup / ruang tamu",
      "kitchen": "dapur",
      "dining": "makan / ruang makan",
      "laundry": "dobi / tempat basuh baju",
      "shadowing": "teknik meniru sebutan (shadowing)",
      "pronunciation": "sebutan",
      "accent": "loghat / pelat",
      "vocabulary": "kosa kata / perbendaharaan kata",
      "phrases": "frasa / ungkapan",
      "segments": "segmen / bahagian",
      "beginning": "permulaan / awal",
      "understand": "faham",
      "feelings": "perasaan",
      "fine": "khabar baik / sihat / ok",
      "welcome": "selamat datang",
      "slow": "perlahan",
      "comprehensible": "mudah difahami",
      "input": "input / kemasukan",
      "vlog": "vlog (video log)",
      "home": "rumah",
      "house": "rumah",
      "today": "hari ini",
      "room": "bilik",
      "rooms": "bilik-bilik",
    };

    if (localDictionary[cleanWord]) {
      const translation = localDictionary[cleanWord];
      setWordTranslation(translation);
      setTranslationCache(prev => ({ ...prev, [cleanWord]: translation }));
      setLoadingWord(false);
      return;
    }

    // 2. Jika tiada, gunakan Google Translate API (Lebih tepat untuk perkataan tunggal berbanding MyMemory)
    try {
      const res = await fetch(`https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=ms&dt=t&q=${encodeURIComponent(cleanWord)}`);
      if (res.ok) {
        const json = await res.json();
        const translatedText = json?.[0]?.[0]?.[0] || "Terjemahan tidak dijumpai";
        const cleanTranslation = translatedText.toLowerCase();
        setWordTranslation(cleanTranslation);
        setTranslationCache(prev => ({ ...prev, [cleanWord]: cleanTranslation }));
      } else {
        setWordTranslation("Ralat memuatkan makna");
      }
    } catch (err) {
      setWordTranslation("Gagal menyambung kamus");
    } finally {
      setLoadingWord(false);
    }
  };

  const handleWordLeave = () => {
    setHoveredWord(null);
    if (playerObjRef.current && typeof playerObjRef.current.playVideo === "function") {
      playerObjRef.current.playVideo();
    } else if (player && typeof player.playVideo === "function") {
      player.playVideo();
    }
  };

  const renderInteractiveText = (text: string) => {
    const tokens = text.split(/(\s+)/);
    return tokens.map((token, i) => {
      const isWord = /[a-zA-Z]+/.test(token);
      if (isWord) {
        const wordClean = token.replace(/[.,\/#!$%\^&\*;:{}=\-_`~()?"']/g, "");
        const punctuation = token.slice(wordClean.length);

        return (
          <span key={i} className="inline-block">
            <span
              className="cursor-pointer hover:text-amber-400 hover:underline transition-all duration-150 decoration-amber-400 decoration-2 underline-offset-4"
              onMouseEnter={(e) => handleWordHoverOrClick(wordClean, e)}
              onMouseLeave={handleWordLeave}
              onClick={(e) => handleWordHoverOrClick(wordClean, e)}
            >
              {wordClean}
            </span>
            {punctuation}
          </span>
        );
      }
      return <span key={i}>{token}</span>;
    });
  };

  // 1. Fetch Video & Subtitle Data
  useEffect(() => {
    if (!videoId) return;
    // Wait until auth is fully hydrated from localStorage before fetching.
    // On page refresh, token starts as null — skip until authLoading=false.
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
          // Update ref immediately so the interval closure always has current data
          subtitlesRef.current = data.subtitles;
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
      if (intervalRef.current) clearInterval(intervalRef.current);
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
          playerObjRef.current = event.target;
          setPlayerReady(true); // hide skeleton overlay
          // Start always-on tracking immediately on player ready
          startTrackingTime(event.target);
        },
        onStateChange: (event: any) => {
          playerObjRef.current = event.target;
          // Keep tracking alive regardless of state (buffering, paused, playing)
          // Restart interval if not already running
          if (!intervalRef.current) {
            startTrackingTime(event.target);
          }
        },
      },
    });
  };

  const syncSubtitleAtCurrentTime = (activePlayer: any) => {
    if (!activePlayer?.getCurrentTime) return;
    try {
      const time: number = activePlayer.getCurrentTime();
      setCurrentTime(time);
      const subs = videoData?.subtitles ?? [];
      const matched = findSubtitle(time, subs);
      setActiveSubtitle((prev) => {
        if (prev?.id === matched?.id) return prev;
        return matched;
      });
    } catch (e) {
      // ignore
    }
  };

  // Resilient subtitle matching with gap-bridging (eliminates flickering between speech pauses)
  const findSubtitle = (time: number, subs: Subtitle[]): Subtitle | null => {
    if (!subs || !subs.length) return null;

    for (let i = 0; i < subs.length; i++) {
      const s = subs[i];
      const next = subs[i + 1];

      // Exact match within subtitle active window
      if (time >= s.start_time && time <= s.end_time) {
        return s;
      }

      // Smooth gap bridging: If between current end and next start, keep subtitle for short pauses (< 1.5s)
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
    // Clear any existing interval first
    if (intervalRef.current) clearInterval(intervalRef.current);

    // Use setInterval 100ms — runs during buffering/pausing, unlike RAF which stops
    intervalRef.current = setInterval(() => {
      const p = playerObjRef.current;
      if (!p?.getCurrentTime) return;
      try {
        const rawTime: number = p.getCurrentTime();
        const nowWall = Date.now();

        // Detect if getCurrentTime() is frozen (unchanged for >3s)
        // This happens when YouTube buffers on slow internet
        if (Math.abs(rawTime - lastKnownTimeRef.current) > 0.05) {
          // Time is moving — update anchors
          lastKnownTimeRef.current = rawTime;
          lastKnownWallRef.current = nowWall;
        }

        // If time frozen but player says PLAYING (state=1), use wall-clock estimate
        const frozenMs = nowWall - lastKnownWallRef.current;
        const playerState = p.getPlayerState?.() ?? -1;
        const isPlaying = playerState === 1;
        const effectiveTime =
          frozenMs > 3000 && isPlaying
            ? lastKnownTimeRef.current + frozenMs / 1000  // wall-clock estimate
            : rawTime;                                     // use real time

        setCurrentTime(effectiveTime);

        // Use subtitlesRef (not videoData state) to avoid stale closure bug
        const subs = subtitlesRef.current;
        const matched = findSubtitle(effectiveTime, subs);

        // If nothing found, keep showing last known subtitle (resilient to gaps)
        const toShow = matched ?? lastSubtitleRef.current;
        setActiveSubtitle((prev) => {
          if (prev?.id === toShow?.id) return prev;
          return toShow;
        });

        if (matched) lastSubtitleRef.current = matched;
      } catch (e) {
        // swallow errors from YT player during buffering
      }
    }, 100);
  };

  const stopTrackingTime = () => {
    if (intervalRef.current) {
      clearInterval(intervalRef.current);
      intervalRef.current = null;
    }
  };

  // Scroll active transcript line into view — within sidebar container ONLY
  // (never scrolls the page, so the video stays visible on mobile)
  useEffect(() => {
    if (!activeSubtitle) return;
    const container = transcriptContainerRef.current;
    const element = transcriptRefs.current[activeSubtitle.id];
    if (!container || !element) return;

    // Detect if we are on mobile (less than 1024px width for Tailwind lg breakpoint)
    const isMobile = window.innerWidth < 1024;

    if (isMobile) {
      // Calculate strict top offset relative to the scroll container's current viewport
      const containerRect = container.getBoundingClientRect();
      const elementRect = element.getBoundingClientRect();
      const relativeTop = elementRect.top - containerRect.top + container.scrollTop;

      container.scrollTo({
        top: relativeTop - 8,
        behavior: "smooth",
      });
    } else {
      // For desktop: Center the active item in container viewport
      const elTop = element.offsetTop - container.offsetTop;
      const elHeight = element.offsetHeight;
      const cHeight = container.clientHeight;
      container.scrollTo({
        top: elTop - cHeight / 2 + elHeight / 2,
        behavior: "smooth",
      });
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

            {/* SKELETON LOADING OVERLAY — visible until YT player fires onReady */}
            {!playerReady && (
              <div className="absolute inset-0 flex flex-col items-center justify-center bg-black/95 z-10 gap-4">
                {/* Shimmer video placeholder */}
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
                {/* Center loading indicator */}
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

          {/* DUAL SUBTITLE DISPLAY — fixed height so the video never jumps. Multi-line is fully supported on mobile and will fit within 150px without shifting layout. */}
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
          {/* Arrow */}
          <div className="absolute top-full left-1/2 transform -translate-x-1/2 -translate-y-[1px] w-0 h-0 border-l-[6px] border-l-transparent border-r-[6px] border-r-transparent border-t-[6px] border-t-slate-950" />
        </div>
      )}
    </div>
  );
}
