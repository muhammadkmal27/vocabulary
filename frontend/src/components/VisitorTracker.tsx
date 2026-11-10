"use client";

import { useEffect, useRef } from "react";
import { usePathname } from "next/navigation";
import { useAuth } from "@/lib/auth";

export function VisitorTracker() {
  const pathname = usePathname();
  const { token } = useAuth();
  const lastPingTimeRef = useRef<number>(0);
  const visitorIdRef = useRef<string>("");

  useEffect(() => {
    // 1. Dapatkan atau jana visitor_id unik bagi peranti/pelayar ini
    try {
      let vid = localStorage.getItem("be_vid");
      if (!vid || !/^[a-zA-Z0-9_\-]+$/.test(vid)) {
        vid = "v_" + Math.random().toString(36).substring(2, 10) + Date.now().toString(36);
        localStorage.setItem("be_vid", vid);
      }
      visitorIdRef.current = vid;
    } catch {
      // Fallback in case localStorage is disabled
      if (!visitorIdRef.current) {
        visitorIdRef.current = "v_" + Math.random().toString(36).substring(2, 10) + Date.now().toString(36);
      }
    }
  }, []);

  const sendPing = (pathOverride?: string) => {
    const vid = visitorIdRef.current;
    if (!vid) return;

    const now = Date.now();
    // Hadkan kekerapan ping paling banyak sekali setiap 10 saat kecuali tukar laluan
    if (!pathOverride && now - lastPingTimeRef.current < 10000) {
      return;
    }
    lastPingTimeRef.current = now;

    try {
      const headers: Record<string, string> = {
        "Content-Type": "application/json",
        Accept: "application/json",
      };

      if (token) {
        headers["Authorization"] = `Bearer ${token}`;
      }

      fetch("/api/track/ping", {
        method: "POST",
        headers,
        body: JSON.stringify({
          visitor_id: vid,
          path: pathOverride || pathname || "/",
        }),
        keepalive: true,
      }).catch(() => {
        // Senyapkan sebarang ralat rangkaian agar tidak mengganggu sesi pengguna
      });
    } catch {
      // Fallback perlindungan ralat
    }
  };

  // Ping semasa bertukar halaman
  useEffect(() => {
    if (!visitorIdRef.current) {
      try {
        const vid = localStorage.getItem("be_vid");
        if (vid) visitorIdRef.current = vid;
      } catch {}
    }
    sendPing(pathname);
  }, [pathname, token]);

  // Heartbeat berkala pantas (setiap 12 saat) apabila tab pelayar aktif
  useEffect(() => {
    const interval = setInterval(() => {
      if (typeof document !== "undefined" && document.visibilityState === "visible") {
        sendPing();
      }
    }, 12000);

    const handleVisibilityChange = () => {
      if (document.visibilityState === "visible") {
        sendPing();
      }
    };

    // Fungsi pelepasan segera (instant leave) apabila pengguna menutup tab / pelayar
    const sendLeave = () => {
      const vid = visitorIdRef.current;
      if (!vid) return;

      const payload = JSON.stringify({ visitor_id: vid });

      if (typeof navigator !== "undefined" && navigator.sendBeacon) {
        const blob = new Blob([payload], { type: "application/json" });
        navigator.sendBeacon("/api/track/leave", blob);
      } else {
        try {
          fetch("/api/track/leave", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: payload,
            keepalive: true,
          }).catch(() => {});
        } catch {}
      }
    };

    document.addEventListener("visibilitychange", handleVisibilityChange);
    window.addEventListener("pagehide", sendLeave);
    window.addEventListener("beforeunload", sendLeave);

    return () => {
      clearInterval(interval);
      document.removeEventListener("visibilitychange", handleVisibilityChange);
      window.removeEventListener("pagehide", sendLeave);
      window.removeEventListener("beforeunload", sendLeave);
    };
  }, [token]);

  return null;
}

