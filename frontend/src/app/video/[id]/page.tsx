"use client";

import dynamic from "next/dynamic";

const VideoPlayer = dynamic(() => import("@/components/video/VideoPlayer"), {
  ssr: false,
  loading: () => (
    <div className="min-h-screen bg-slate-950 flex flex-col items-center justify-center gap-4 text-white">
      <div className="animate-spin rounded-full h-10 w-10 border-t-2 border-b-2 border-emerald-500"></div>
      <p className="text-sm text-slate-400">Memuatkan pemain video...</p>
    </div>
  ),
});

export default function Page() {
  return <VideoPlayer basePath="/video" />;
}
