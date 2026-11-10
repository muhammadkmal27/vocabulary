"use client";

import { useEffect, useState, useRef } from "react";
import Link from "next/link";
import { useParams, useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { ArrowLeft, Play, Pause, RotateCcw, Volume2, Plus, Loader2, Sparkles, AlertTriangle, CheckCircle2, Circle, ChevronRight, ChevronUp, ChevronDown, Lock } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { localDictionary } from "@/lib/localDictionary";
import { findMatchingPhrase, cleanToken } from "@/lib/phraseDictionary";
import { findBaseForm, type BaseFormInfo } from "@/lib/baseFormDictionary";

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
  is_premium?: boolean;
  is_free?: boolean;
  is_user_premium?: boolean;
  user_progress?: UserVideoProgress;
  next_video_id?: string | null;
  next_video_title?: string | null;
}

interface VideoPlayerProps {
  basePath?: "/video" | "/special";
}

export default function VideoPlayer({ basePath = "/video" }: VideoPlayerProps) {
  const params = useParams();
  const router = useRouter();
  const videoId = params?.id as string;
  const { user, token, isLoading: authLoading } = useAuth();
  const { toast } = useAlert();

  const [videoData, setVideoData] = useState<YoutubeVideoData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Freemium video logic: 10 minutes (600s) free subtitle preview; full subtitles require premium
  const TEN_MINUTES_SECONDS = 600;
  const isUserPremium = Boolean(videoData?.is_user_premium || user?.subscribed || user?.role === "admin");
  const isTimeLocked = (seconds: number) => !isUserPremium && seconds >= TEN_MINUTES_SECONDS;

  const [player, setPlayer] = useState<any>(null);
  const [currentTime, setCurrentTime] = useState(0);
  const [activeSubtitle, setActiveSubtitle] = useState<Subtitle | null>(null);
  const [addingSentenceId, setAddingSentenceId] = useState<string | null>(null);
  const [playerReady, setPlayerReady] = useState(false);
  const [isCompleted, setIsCompleted] = useState(false);
  const [isTogglingComplete, setIsTogglingComplete] = useState(false);
  const [nextVideoId, setNextVideoId] = useState<string | null>(null);
  const [nextVideoTitle, setNextVideoTitle] = useState<string | null>(null);

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
  const currentSubIndexRef = useRef<number>(-1);            // track current index for snappy navigation
  const manualNavLockRef = useRef<number>(0);               // lock auto-interval during manual arrow jumps

  // Dictionary Hover & Click features (Word & Phrase Collocation Detection)
  const [hoveredWord, setHoveredWord] = useState<string | null>(null);
  const [wordTranslation, setWordTranslation] = useState<string>("");
  const [detectedPhrase, setDetectedPhrase] = useState<{ phrase: string; translation: string } | null>(null);
  const [detectedBaseForm, setDetectedBaseForm] = useState<BaseFormInfo | null>(null);
  const [loadingWord, setLoadingWord] = useState(false);
  const [popupPos, setPopupPos] = useState<{
    x: number;
    y: number;
    arrowX: number;
    showBelow: boolean;
    width: number;
  } | null>(null);
  const [translationCache, setTranslationCache] = useState<{ [key: string]: string }>({});

  const speakWord = (text: string) => {
    if (typeof window !== "undefined" && "speechSynthesis" in window) {
      window.speechSynthesis.cancel();
      const utterance = new SpeechSynthesisUtterance(text);
      utterance.lang = "en-US";
      utterance.rate = 0.9;
      window.speechSynthesis.speak(utterance);
    }
  };

  const handleWordHoverOrClick = async (
    word: string,
    fullSentence: string,
    wordIndex: number,
    e: React.MouseEvent,
    isClick = false
  ) => {
    // Sekiranya feature dwi-sari kata terkunci selepas 10 minit untuk bukan premium, abaikan klik kamus
    if (isTimeLocked(currentTime)) return;

    // 1. Pause video automatically
    if (playerObjRef.current && typeof playerObjRef.current.pauseVideo === "function") {
      playerObjRef.current.pauseVideo();
    } else if (player && typeof player.pauseVideo === "function") {
      player.pauseVideo();
    }

    const cleanWord = cleanToken(word);
    if (!cleanWord) return;

    // Mainkan audio sebutan perkataan hanya jika diklik
    if (isClick) {
      speakWord(cleanWord);
    }

    setHoveredWord(cleanWord);
    setLoadingWord(true);

    // 2. Detect phrase / collocation around this clicked word (Vocarb Ayat)
    const sentenceTokens = fullSentence.split(/\s+/).filter(Boolean);
    const phraseMatch = findMatchingPhrase(sentenceTokens, wordIndex);
    setDetectedPhrase(phraseMatch);

    // 3. Detect base form / kata asal (Bahagian 1C)
    const baseFormMatch = findBaseForm(cleanWord);
    setDetectedBaseForm(baseFormMatch);

    const rect = (e.target as HTMLElement).getBoundingClientRect();
    const viewportWidth = window.innerWidth;
    const padding = 12; // Margin selamat dari sisi skrin telefon
    const popupWidth = Math.min(270, Math.max(180, viewportWidth - padding * 2));
    const halfWidth = popupWidth / 2;

    const targetCenterX = rect.left + window.scrollX + rect.width / 2;

    // Pastikan kotak popup tidak terkeluar dari skrin (kiri mahupun kanan)
    const minCenterX = window.scrollX + padding + halfWidth;
    const maxCenterX = window.scrollX + viewportWidth - padding - halfWidth;
    const clampedCenterX = Math.max(minCenterX, Math.min(maxCenterX, targetCenterX));

    // Laraskan anak panah supaya menunjuk tepat ke perkataan yang ditekan
    const relativeArrowX = targetCenterX - (clampedCenterX - halfWidth);
    const clampedArrowX = Math.max(16, Math.min(popupWidth - 16, relativeArrowX));

    // Elakkan terkeluar di bahagian atas skrin (cth: video di atas subtitle)
    const showBelow = rect.top < 130;
    const popupY = showBelow
      ? rect.bottom + window.scrollY + 8
      : rect.top + window.scrollY - 8;

    setPopupPos({
      x: clampedCenterX,
      y: popupY,
      arrowX: clampedArrowX,
      showBelow,
      width: popupWidth,
    });

    if (translationCache[cleanWord]) {
      setWordTranslation(translationCache[cleanWord]);
      setLoadingWord(false);
      return;
    }

    // 3. Semak Kamus Tempatan Dahulu (100% Tepat untuk perkataan lazim & singkatan cth: we'll, don't, it's)
    const localResult = localDictionary[cleanWord] || localDictionary[cleanWord.replace(/'/g, "")];
    if (localResult) {
      setTranslationCache((prev) => ({ ...prev, [cleanWord]: localResult }));
      setWordTranslation(localResult);
      setLoadingWord(false);
      return;
    }

    // 4. Fetch Kamus Pantas (Fallback jika perkataan tiada dalam kamus)
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
    setDetectedPhrase(null);
    setDetectedBaseForm(null);
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
    const chunks = text.split(/(\s+)/);
    let tokenIndex = 0;

    return chunks.map((chunk, index) => {
      if (/^\s+$/.test(chunk)) {
        return <span key={index}>{chunk}</span>;
      }

      const currentIndex = tokenIndex++;
      return (
        <span
          key={index}
          className="cursor-pointer hover:bg-amber-500/20 hover:text-amber-300 rounded px-0.5 transition-colors border-b border-dashed border-amber-500/40"
          onClick={(e) => handleWordHoverOrClick(chunk, text, currentIndex, e, true)}
          onMouseEnter={(e) => handleWordHoverOrClick(chunk, text, currentIndex, e, false)}
          onMouseLeave={handleWordLeave}
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
        // Redirect if category doesn't match current route basePath
        if (data.category === "Special" && basePath === "/video") {
          router.replace(`/special/${videoId}`);
          return;
        } else if (data.category !== "Special" && basePath === "/special") {
          router.replace(`/video/${videoId}`);
          return;
        }
        if (data.subtitles && Array.isArray(data.subtitles)) {
          data.subtitles.sort((a: Subtitle, b: Subtitle) => a.start_time - b.start_time);
          subtitlesRef.current = data.subtitles;
        }
        if (data.user_progress?.is_completed) {
          setIsCompleted(true);
          hasAutoCompletedRef.current = true;
        }
        if (data.next_video_id) {
          setNextVideoId(data.next_video_id);
          setNextVideoTitle(data.next_video_title || null);
        } else {
          // Fallback: fetch /api/videos to locate next video in sequence
          try {
            const isSpecial = basePath === "/special" || data.category === "Special";
            const listUrl = isSpecial ? "/api/videos?category=Special" : "/api/videos";
            const listRes = await fetch(listUrl, { headers });
            if (listRes.ok) {
              const listData = await listRes.json();
              if (Array.isArray(listData) && listData.length > 0) {
                const currentIndex = listData.findIndex((v: any) => v.id === videoId);
                if (currentIndex !== -1) {
                  const next = listData[currentIndex + 1] || (listData.length > 1 ? listData[0] : null);
                  if (next) {
                    setNextVideoId(next.id);
                    setNextVideoTitle(next.title);
                  }
                }
              }
            }
          } catch {}
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

  const handleNextVideo = () => {
    if (playerObjRef.current?.getCurrentTime && token && videoId) {
      try {
        const curTime = playerObjRef.current.getCurrentTime();
        const duration = playerObjRef.current.getDuration ? playerObjRef.current.getDuration() : 0;
        if (curTime > 0 && duration > 0) {
          syncProgressToBackend(curTime, duration);
        }
      } catch {}
    }

    if (nextVideoId) {
      router.push(`${basePath}/${nextVideoId}`);
    } else {
      router.push(basePath);
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

        // Semasa pengguna menekan butang lompat transkrip, sekat selang auto-tracking daripada menimpa sari kata baharu
        if (Date.now() < manualNavLockRef.current) {
          return;
        }

        const subs = subtitlesRef.current;
        const matched = findSubtitle(effectiveTime, subs);
        const toShow = matched ?? lastSubtitleRef.current;

        setActiveSubtitle((prev) => {
          if (prev?.id === toShow?.id) return prev;
          if (toShow) {
            currentSubIndexRef.current = subs.findIndex((s) => s.id === toShow.id);
          }
          return toShow;
        });

        if (matched) lastSubtitleRef.current = matched;
      } catch (e) {
        // ignore
      }
    }, 100);
  };

  // Scroll active transcript line into view secara sentiasa lancar (di bahagian atas pada mobile mengikut rekaan asal)
  useEffect(() => {
    if (!activeSubtitle) return;
    const container = transcriptContainerRef.current;
    const el = transcriptRefs.current[activeSubtitle.id];
    if (container && el) {
      const containerRect = container.getBoundingClientRect();
      const elRect = el.getBoundingClientRect();
      const relativeTop = elRect.top - containerRect.top + container.scrollTop;
      const isMobile = typeof window !== "undefined" && window.innerWidth < 1024;

      // Pada versi mobile, sentiasa letakkan kad aktif di bahagian paling atas (top - 16) mengikut rekaan asal
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

  // Lompat ke minit transkrip babak sebelumnya atau seterusnya (Atas / Bawah)
  const navigateSubtitle = (direction: "prev" | "next") => {
    const subs = subtitlesRef.current;
    if (!subs || subs.length === 0) return;

    // Kunci auto-tracking selama 800ms bagi menghalang YouTube masa lama daripada menarik balik transkrip
    manualNavLockRef.current = Date.now() + 800;

    // Tentukan indeks semasa secara stabil daripada ref indeks atau activeSubtitle
    let currentIndex = currentSubIndexRef.current;
    if (currentIndex === -1 || currentIndex >= subs.length) {
      if (activeSubtitle) {
        currentIndex = subs.findIndex((s) => s.id === activeSubtitle.id);
      }
    }

    if (currentIndex === -1) {
      const curTime =
        playerObjRef.current && typeof playerObjRef.current.getCurrentTime === "function"
          ? playerObjRef.current.getCurrentTime()
          : currentTime;

      currentIndex = subs.findIndex((s) => curTime >= s.start_time && curTime <= s.end_time);
      if (currentIndex === -1) {
        currentIndex = subs.findIndex((s) => s.start_time > curTime);
        if (currentIndex === -1) {
          currentIndex = subs.length - 1;
        } else if (direction === "prev") {
          currentIndex = Math.max(0, currentIndex);
        }
      }
    }

    let targetIndex = currentIndex;
    if (direction === "prev") {
      targetIndex = Math.max(0, currentIndex - 1);
    } else {
      targetIndex = Math.min(subs.length - 1, currentIndex + 1);
    }

    // Kemas kini ref indeks serta-merta supaya klik berturut-turut bertindak balas tanpa kelewatan
    currentSubIndexRef.current = targetIndex;
    const targetSub = subs[targetIndex];
    if (!targetSub) return;

    // Segerakkan paparan & masa serta-merta
    lastKnownTimeRef.current = targetSub.start_time;
    lastKnownWallRef.current = Date.now();
    setCurrentTime(targetSub.start_time);
    setActiveSubtitle(targetSub);
    lastSubtitleRef.current = targetSub;

    // Lompatkan pemain video ke masa babak sari kata tersebut
    if (playerObjRef.current && typeof playerObjRef.current.seekTo === "function") {
      playerObjRef.current.seekTo(targetSub.start_time, true);
    } else if (player && typeof player.seekTo === "function") {
      player.seekTo(targetSub.start_time, true);
    }
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
            <Link href={basePath}>
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
        <Button variant="ghost" size="icon" onClick={() => router.push(basePath)}>
          <ArrowLeft className="w-5 h-5" />
        </Button>
        <div className="flex-1 min-w-0">
          <h1 className="font-semibold truncate text-sm sm:text-base">{videoData?.title}</h1>
          <p className="text-xs text-muted-foreground truncate">{videoData?.category || "General Video"}</p>
        </div>

        {/* ACTIONS CONTAINER */}
        <div className="flex items-center gap-1.5 sm:gap-2 shrink-0">
          {/* TICK BOX TOGGLE BUTTON */}
          <Button
            variant="outline"
            size="sm"
            onClick={handleToggleManualComplete}
            disabled={isTogglingComplete}
            className={`h-8 sm:h-9 px-2 sm:px-3 gap-1.5 shrink-0 transition-all ${
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

          {/* NEXT VIDEO BUTTON (DESKTOP & MOBILE) */}
          <Button
            variant={isCompleted ? "default" : "outline"}
            size="sm"
            onClick={handleNextVideo}
            disabled={!nextVideoId}
            className={`h-8 sm:h-9 px-2.5 sm:px-3.5 text-xs font-semibold gap-1 sm:gap-1.5 shrink-0 transition-all shadow-sm ${
              isCompleted
                ? "bg-primary text-primary-foreground hover:bg-primary/90 shadow-primary/25 ring-1 ring-primary/40"
                : "hover:border-primary/50 text-foreground hover:text-primary"
            }`}
            title={nextVideoTitle ? `Seterusnya: ${nextVideoTitle}` : "Ke video seterusnya"}
          >
            <span className="sm:hidden text-[11px] font-semibold">Next</span>
            <span className="hidden sm:inline text-xs font-semibold">Seterusnya</span>
            <ChevronRight className="w-3.5 h-3.5 -mr-0.5 sm:w-4 sm:h-4" />
          </Button>
        </div>
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
          <div className="min-h-[140px] lg:h-[140px] shrink-0 rounded-xl border border-amber-500/20 bg-amber-500/5 flex items-center justify-center px-4 py-3 text-center overflow-hidden relative">
            {activeSubtitle ? (
              isTimeLocked(currentTime) ? (
                <div className="relative w-full h-full flex flex-col items-center justify-center">
                  {/* Blurred text behind */}
                  <div className="space-y-1.5 w-full filter blur-[5px] opacity-35 select-none pointer-events-none">
                    <p className="text-base sm:text-lg lg:text-xl font-extrabold text-primary leading-snug break-words">
                      {activeSubtitle.target_text}
                    </p>
                    <p className="text-xs sm:text-sm text-muted-foreground font-medium break-words">
                      {activeSubtitle.source_text}
                    </p>
                  </div>

                  {/* Lock overlay with button matching uploaded image */}
                  <div className="absolute inset-0 flex flex-col items-center justify-center gap-2 bg-background/60 backdrop-blur-[2px] rounded-lg p-2 z-10">
                    <p className="text-xs font-medium text-muted-foreground">
                      Dwi-sari kata selepas 10 minit dihadkan kepada pengguna Premium
                    </p>
                    <Link href="/pricing" target="_blank" rel="noopener noreferrer">
                      <button
                        type="button"
                        className="inline-flex items-center justify-center gap-2 px-5 py-2.5 rounded-lg bg-amber-600 hover:bg-amber-700 text-black font-extrabold text-sm shadow-md transition-all active:scale-95 cursor-pointer"
                      >
                        <Lock className="w-4 h-4 text-black stroke-[2.5]" />
                        <span>Buka dengan Premium</span>
                      </button>
                    </Link>
                  </div>
                </div>
              ) : (
                <div className="space-y-1.5 w-full">
                  <p className="text-base sm:text-lg lg:text-xl font-extrabold text-primary leading-snug break-words">
                    {renderInteractiveText(activeSubtitle.target_text)}
                  </p>
                  <p className="text-xs sm:text-sm text-muted-foreground font-medium break-words">
                    {activeSubtitle.source_text}
                  </p>
                </div>
              )
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
          <div className="p-3 sm:p-4 border-b border-border flex items-center justify-between gap-2">
            <div className="min-w-0 flex-1">
              <h3 className="font-bold text-sm truncate">Transkrip Interaktif</h3>
              <p className="text-[11px] sm:text-xs text-muted-foreground truncate">Klik pada baris untuk melompat ke babak tersebut</p>
            </div>
            <div className="flex items-center gap-1.5 shrink-0">
              {isCompleted && (
                <Badge className="bg-emerald-600/90 text-white gap-1 text-[10px] px-2 py-0.5 shrink-0">
                  <CheckCircle2 className="w-3 h-3" /> Selesai
                </Badge>
              )}
              {/* BUTTON ANAK PANAH ATAS & BAWAH WARNA UNGU (KHAS UNTUK MOBILE SAHAJA, HIDE DI DESKTOP/LAPTOP) */}
              <div className="flex lg:hidden items-center gap-1">
                <button
                  type="button"
                  onClick={() => navigateSubtitle("prev")}
                  className="w-7 h-7 sm:w-8 sm:h-8 rounded-lg bg-primary text-primary-foreground hover:bg-primary/90 shadow-sm shadow-primary/25 flex items-center justify-center active:scale-95 transition-all cursor-pointer"
                  title="Minit transkrip sebelumnya"
                  aria-label="Minit transkrip sebelumnya"
                >
                  <ChevronUp className="w-4 h-4" />
                </button>
                <button
                  type="button"
                  onClick={() => navigateSubtitle("next")}
                  className="w-7 h-7 sm:w-8 sm:h-8 rounded-lg bg-primary text-primary-foreground hover:bg-primary/90 shadow-sm shadow-primary/25 flex items-center justify-center active:scale-95 transition-all cursor-pointer"
                  title="Minit transkrip seterusnya"
                  aria-label="Minit transkrip seterusnya"
                >
                  <ChevronDown className="w-4 h-4" />
                </button>
              </div>
            </div>
          </div>
          <div ref={transcriptContainerRef} className="flex-1 overflow-y-auto p-4 space-y-3 relative">
            {videoData?.subtitles.map((sub, index) => {
              const isActive = activeSubtitle?.id === sub.id;
              const isLocked = isTimeLocked(sub.start_time);
              const isFirstLocked = isLocked && (index === 0 || (videoData.subtitles[index - 1] && videoData.subtitles[index - 1].start_time < TEN_MINUTES_SECONDS));

              return (
                <div key={sub.id} className="space-y-3">
                  {isFirstLocked && (
                    <div className="sticky top-0 z-20 my-3 p-4 rounded-xl border border-amber-500/40 bg-card/95 shadow-xl backdrop-blur-md text-center space-y-2.5">
                      <div className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-amber-500/10 border border-amber-500/30 text-amber-500 text-xs font-bold">
                        <Sparkles className="w-3.5 h-3.5 fill-current" />
                        <span>Feature Terbatas (Selepas 10 Minit)</span>
                      </div>
                      <p className="text-xs text-muted-foreground leading-relaxed">
                        Transkrip interaktif & dwi-sari kata penuh selepas minit ke-10 dikhaskan untuk pengguna Premium.
                      </p>
                      <Link href="/pricing" className="block w-full" target="_blank" rel="noopener noreferrer">
                        <button
                          type="button"
                          className="w-full inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-lg bg-amber-600 hover:bg-amber-700 text-black font-extrabold text-sm shadow-md transition-all active:scale-95 cursor-pointer"
                        >
                          <Lock className="w-4 h-4 text-black stroke-[2.5]" />
                          <span>Buka dengan Premium</span>
                        </button>
                      </Link>
                    </div>
                  )}

                  <div
                    ref={(el) => {
                      transcriptRefs.current[sub.id] = el;
                    }}
                    onClick={() => {
                      if (isLocked) {
                        toast("Dwi-sari kata dan transkrip selepas 10 minit memerlukan langganan Premium.", "info");
                        return;
                      }
                      manualNavLockRef.current = Date.now() + 800;
                      currentSubIndexRef.current = subtitlesRef.current.findIndex((s) => s.id === sub.id);
                      setActiveSubtitle(sub);
                      if (playerObjRef.current && typeof playerObjRef.current.seekTo === "function") {
                        playerObjRef.current.seekTo(sub.start_time, true);
                      } else if (player && typeof player.seekTo === "function") {
                        player.seekTo(sub.start_time, true);
                      }
                    }}
                    className={`p-3 rounded-lg border text-left transition-all space-y-1.5 group relative ${
                      isLocked
                        ? "border-border/60 filter blur-[3.5px] opacity-40 select-none pointer-events-none cursor-not-allowed"
                        : isActive
                        ? "border-primary bg-primary/10 ring-2 ring-primary/30 shadow-md scale-[1.02] cursor-pointer"
                        : "border-border hover:border-muted-foreground/30 hover:bg-muted/50 cursor-pointer"
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

                    {!isLocked && (
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
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </div>

      {hoveredWord && popupPos && (
        <div
          className={`absolute z-50 transform -translate-x-1/2 ${
            popupPos.showBelow ? "translate-y-0" : "-translate-y-full"
          } pointer-events-auto transition-all`}
          style={{
            left: `${popupPos.x}px`,
            top: `${popupPos.y}px`,
            width: `${popupPos.width}px`,
          }}
          onMouseLeave={handleWordLeave}
        >
          {/* Kad Utama (dengan border, background & overflow-hidden) */}
          <div className="rounded-xl overflow-hidden border border-sky-500/40 bg-slate-950/95 shadow-2xl backdrop-blur-md text-white">
            {/* Petak Atas: Terjemahan Frasa / Vocarb Ayat */}
            {detectedPhrase && (
              <div className="bg-sky-950/90 border-b border-sky-500/30 px-3 py-2 text-left flex items-start justify-between gap-2">
                <div className="flex-1">
                  <div className="text-[10px] text-sky-400 font-bold uppercase tracking-wider mb-0.5 flex items-center gap-1.5">
                    <span className="w-1.5 h-1.5 rounded-full bg-sky-400 inline-block animate-pulse" />
                    <span>Frasa: {detectedPhrase.phrase}</span>
                  </div>
                  <div className="text-xs font-bold text-sky-100 leading-snug">
                    {detectedPhrase.translation}
                  </div>
                </div>
                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    handleWordLeave();
                  }}
                  className="text-sky-400/70 hover:text-white p-0.5 text-xs font-bold leading-none cursor-pointer"
                  title="Tutup"
                >
                  ✕
                </button>
              </div>
            )}

            {/* Petak Bawah: Terjemahan Perkataan Tunggal */}
            <div className="p-2.5 text-left bg-slate-950/95 flex items-start justify-between gap-2">
              <div className="flex-1">
                <div className="text-[10px] text-amber-400/90 font-bold uppercase tracking-wider mb-0.5">
                  {detectedPhrase ? `Perkataan: ${hoveredWord}` : `Maksud: ${hoveredWord}`}
                </div>
                {loadingWord ? (
                  <div className="flex justify-start py-1">
                    <Loader2 className="w-3.5 h-3.5 animate-spin text-amber-500" />
                  </div>
                ) : (
                  <div className="text-xs font-semibold leading-relaxed text-slate-200">
                    {wordTranslation}
                  </div>
                )}
              </div>
              {!detectedPhrase && (
                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    handleWordLeave();
                  }}
                  className="text-slate-400 hover:text-white p-0.5 text-xs font-bold leading-none cursor-pointer"
                  title="Tutup"
                >
                  ✕
                </button>
              )}
            </div>

            {/* Petak 3 (Bahagian 1C): Bentuk Asal / Kata Dasar Tatabahasa */}
            {detectedBaseForm && (
              <div className="bg-emerald-950/90 border-t border-emerald-500/30 px-3 py-2 text-left">
                <div className="text-[10px] text-emerald-400 font-bold uppercase tracking-wider mb-0.5 flex items-center gap-1.5 flex-wrap">
                  <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 inline-block animate-pulse" />
                  <span>Kata Asal: {detectedBaseForm.base}</span>
                  <span className="text-emerald-300/80 font-normal normal-case text-[9px] bg-emerald-900/60 px-1.5 py-0.5 rounded border border-emerald-500/20">
                    {detectedBaseForm.category}
                  </span>
                </div>
                <div className="text-xs font-bold text-emerald-100 leading-snug">
                  {detectedBaseForm.meaning}
                </div>
              </div>
            )}
          </div>

          {/* Panah Penunjuk Tooltip (Menunjuk tepat ke perkataan yang ditekan) */}
          {popupPos.showBelow ? (
            <div
              className={`absolute bottom-full transform -translate-x-1/2 translate-y-[1px] w-0 h-0 border-l-[6px] border-l-transparent border-r-[6px] border-r-transparent border-b-[6px] ${
                detectedPhrase ? "border-b-sky-950" : "border-b-slate-950"
              }`}
              style={{ left: `${popupPos.arrowX}px` }}
            />
          ) : (
            <div
              className={`absolute top-full transform -translate-x-1/2 -translate-y-[1px] w-0 h-0 border-l-[6px] border-l-transparent border-r-[6px] border-r-transparent border-t-[6px] ${
                detectedBaseForm ? "border-t-emerald-950" : "border-t-slate-950"
              }`}
              style={{ left: `${popupPos.arrowX}px` }}
            />
          )}
        </div>
      )}
    </div>
  );
}
