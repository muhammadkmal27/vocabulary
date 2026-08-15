"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Home, BookOpenCheck, Video, Settings, User } from "lucide-react";
import { useAuth } from "@/lib/auth";

export default function BottomNav() {
  const pathname = usePathname();
  const { token } = useAuth();
  const [quizUrl, setQuizUrl] = useState("/");

  useEffect(() => {
    if (!token) return;

    const fetchActiveQuiz = async () => {
      try {
        const langId = localStorage.getItem("selected_language_id");
        if (!langId) return;

        // Fetch languages to get the code
        const langRes = await fetch("/api/languages", {
          headers: { Authorization: `Bearer ${token}`, Accept: "application/json" },
        });
        if (!langRes.ok) return;
        const languages = await langRes.json();
        const activeLang = languages.find((l: any) => l.id === langId);
        if (!activeLang) return;

        // Fetch dashboard to get active level
        const dashRes = await fetch(`/api/dashboard?language_id=${langId}`, {
          headers: { Authorization: `Bearer ${token}`, Accept: "application/json" },
        });
        if (!dashRes.ok) return;
        const dashData = await dashRes.json();

        // Find first incomplete unlocked level
        const currentLevel = dashData.levels?.find((l: any) => l.progress < 100 && l.unlocked) 
          || dashData.levels?.[dashData.levels.length - 1]; // or last level

        if (currentLevel) {
          setQuizUrl(`/quiz/${activeLang.code}/${currentLevel.id}`);
        }
      } catch (e) {
        console.error("Failed to load active quiz for nav", e);
      }
    };

    fetchActiveQuiz();
  }, [token]);

  const navItems = [
    {
      label: "Rumah",
      href: "/",
      icon: Home,
      active: pathname === "/",
    },
    {
      label: "Quiz",
      href: quizUrl,
      icon: BookOpenCheck,
      active: pathname.startsWith("/quiz"),
    },
    {
      label: "Video",
      href: "/video",
      icon: Video,
      active: pathname.startsWith("/video"),
    },
    {
      label: "Langganan",
      href: "/subscription",
      icon: Settings,
      active: pathname === "/subscription",
    },
    {
      label: "Profil",
      href: "/profile",
      icon: User,
      active: pathname === "/profile",
    },
  ];

  return (
    <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-border bg-background/95 backdrop-blur-sm lg:hidden">
      <div className="flex items-center justify-between h-16 w-full px-2">
        {navItems.map((item, index) => {
          const Icon = item.icon;
          return (
            <Link
              key={index}
              href={item.href}
              className={`flex-1 flex flex-col items-center justify-center gap-1 transition-colors text-center min-w-0 ${
                item.active
                  ? "text-primary"
                  : "text-muted-foreground hover:text-foreground"
              }`}
            >
              <Icon className="w-5 h-5 shrink-0" />
              <span className="text-[10px] font-medium truncate w-full px-1">{item.label}</span>
            </Link>
          );
        })}
      </div>
    </nav>
  );
}
