"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Plus, Pencil, Trash2, Loader2, AlertCircle, ExternalLink, Video, FileText, Save, Sparkles } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { Switch } from "@/components/ui/switch";

interface LanguageRecord {
  id: string;
  name: string;
  code: string;
}

interface Subtitle {
  id: string;
  start_time: number;
  end_time: number;
  target_text: string;
  source_text: string;
  order: number;
}

interface VideoRecord {
  id: string;
  title: string;
  youtube_video_id: string;
  thumbnail_url: string;
  category: string;
  is_premium: boolean;
  is_free: boolean;
  is_active: boolean;
  order: number;
  subtitles_count?: number;
  language?: LanguageRecord | null;
  subtitles?: Subtitle[];
}

export default function AdminVideosPage() {
  const { token } = useAuth();
  const { toast, showConfirm } = useAlert();
  
  const [videos, setVideos] = useState<VideoRecord[]>([]);
  const [languages, setLanguages] = useState<LanguageRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Add/Edit Video Modal
  const [open, setOpen] = useState(false);
  const [editingVideo, setEditingVideo] = useState<VideoRecord | null>(null);
  
  // Video Form Fields
  const [title, setTitle] = useState("");
  const [youtubeVideoId, setYoutubeVideoId] = useState("");
  const [languageId, setLanguageId] = useState("");
  const [category, setCategory] = useState("Beginner");
  const [isPremium, setIsPremium] = useState(true);
  const [isFree, setIsFree] = useState(false);
  const [isActive, setIsActive] = useState(true);
  const [order, setOrder] = useState("0");
  const [submitting, setSubmitting] = useState(false);

  // Subtitle Scanning & Editor States
  const [scanningVideoId, setScanningVideoId] = useState<string | null>(null);
  const [subtitleEditorOpen, setSubtitleEditorOpen] = useState(false);
  const [activeEditorVideo, setActiveEditorVideo] = useState<VideoRecord | null>(null);
  const [editorSubtitles, setEditorSubtitles] = useState<Subtitle[]>([]);
  const [savingSubtitles, setSavingSubtitles] = useState(false);
  const [loadingEditor, setLoadingEditor] = useState(false);

  const fetchVideos = async () => {
    if (!token) return;
    try {
      setLoading(true);
      setError("");
      
      // Fetch videos
      const videoRes = await fetch("/api/admin/videos", {
        headers: { Authorization: `Bearer ${token}`, Accept: "application/json" },
      });
      if (!videoRes.ok) throw new Error("Gagal mengambil senarai video.");
      const videoData = await videoRes.json();
      setVideos(videoData);

      // Fetch languages
      const langRes = await fetch("/api/admin/languages", {
        headers: { Authorization: `Bearer ${token}`, Accept: "application/json" },
      });
      if (langRes.ok) {
        const langData = await langRes.json();
        setLanguages(langData);
      }
    } catch (err: any) {
      setError(err.message || "Ralat berlaku.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchVideos();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [token]);

  const handleOpenAdd = () => {
    setEditingVideo(null);
    setTitle("");
    setYoutubeVideoId("");
    setLanguageId(languages[0]?.id || "");
    setCategory("Beginner");
    setIsPremium(true);
    setIsFree(false);
    setIsActive(true);
    setOrder("0");
    setOpen(true);
  };

  const handleOpenEdit = (video: VideoRecord) => {
    setEditingVideo(video);
    setTitle(video.title);
    setYoutubeVideoId(video.youtube_video_id);
    setLanguageId(video.language?.id || languages[0]?.id || "");
    setCategory(video.category || "Beginner");
    setIsPremium(video.is_premium);
    setIsFree(video.is_free);
    setIsActive(video.is_active);
    setOrder(video.order.toString());
    setOpen(true);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!token) return;
    if (!title || !youtubeVideoId || !languageId) {
      toast("Sila isi semua ruangan wajib.", "error");
      return;
    }

    setSubmitting(true);
    const method = editingVideo ? "PUT" : "POST";
    const url = editingVideo 
      ? `/api/admin/videos/${editingVideo.id}` 
      : "/api/admin/videos";

    try {
      const res = await fetch(url, {
        method,
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          language_id: languageId,
          title,
          youtube_video_id: youtubeVideoId,
          category,
          is_premium: isPremium,
          is_free: isFree,
          is_active: isActive,
          order: parseInt(order) || 0,
        }),
      });

      if (res.ok) {
        toast(editingVideo ? "Video berjaya dikemaskini!" : "Video berjaya ditambah!", "success");
        setOpen(false);
        fetchVideos();
      } else {
        const errData = await res.json();
        toast(errData.message || "Gagal menyimpan video.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async (video: VideoRecord) => {
    const confirmed = await showConfirm(
      `Adakah anda pasti mahu memadam video "${video.title}"? Semua sari kata berkaitan juga akan didelete.`,
      "Padam Video"
    );
    if (!confirmed || !token) return;
    try {
      const res = await fetch(`/api/admin/videos/${video.id}`, {
        method: "DELETE",
        headers: { Authorization: `Bearer ${token}`, Accept: "application/json" },
      });
      if (res.ok) {
        toast("Video berjaya dipadam.", "success");
        fetchVideos();
      } else {
        toast("Gagal memadam video.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  // Scan and Auto-Import Subtitles Action
  const handleScanSubtitles = async (video: VideoRecord) => {
    setScanningVideoId(video.id);
    try {
      const res = await fetch(`/api/admin/videos/${video.id}/import-subtitles`, {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      const data = await res.json();
      if (res.ok) {
        toast(data.message || "Sari kata berjaya diimport!", "success");
        fetchVideos();
      } else {
        toast(data.message || "Gagal mengimport sari kata.", "error");
      }
    } catch (e) {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setScanningVideoId(null);
    }
  };

  // Open Subtitle Editor Modal
  const handleOpenSubtitleEditor = async (video: VideoRecord) => {
    setLoadingEditor(true);
    setActiveEditorVideo(video);
    try {
      const res = await fetch(`/api/admin/videos/${video.id}`, {
        headers: { Authorization: `Bearer ${token}`, Accept: "application/json" },
      });
      if (res.ok) {
        const data = await res.json();
        setEditorSubtitles(data.subtitles || []);
        setSubtitleEditorOpen(true);
      } else {
        toast("Gagal mengambil data sari kata.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setLoadingEditor(false);
    }
  };

  // Handle Input Changes in Subtitle Editor
  const handleSubtitleFieldChange = (index: number, field: keyof Subtitle, value: any) => {
    const updated = [...editorSubtitles];
    updated[index] = {
      ...updated[index],
      [field]: field === "start_time" || field === "end_time" ? parseFloat(value) || 0 : value,
    };
    setEditorSubtitles(updated);
  };

  // Save Modified Subtitles
  const handleSaveSubtitles = async () => {
    if (!token || !activeEditorVideo) return;
    setSavingSubtitles(true);
    try {
      const res = await fetch(`/api/admin/videos/${activeEditorVideo.id}/subtitles`, {
        method: "PUT",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          subtitles: editorSubtitles,
        }),
      });

      if (res.ok) {
        toast("Sari kata berjaya dikemaskini!", "success");
        setSubtitleEditorOpen(false);
        fetchVideos();
      } else {
        toast("Gagal mengemaskini sari kata.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setSavingSubtitles(false);
    }
  };

  return (
    <div className="p-6 space-y-6">
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div className="flex items-center gap-2">
          <Video className="w-6 h-6 text-primary" />
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Pengurusan Video</h1>
            <p className="text-sm text-muted-foreground">Urus playlist video YouTube, sari kata dan tetapan akses.</p>
          </div>
        </div>
        <Button onClick={handleOpenAdd} className="gap-2">
          <Plus className="w-4 h-4" /> Tambah Video
        </Button>
      </div>

      {error && (
        <Card className="border-destructive bg-destructive/10">
          <CardContent className="p-4 flex items-center gap-3 text-destructive">
            <AlertCircle className="w-5 h-5" />
            <p>{error}</p>
          </CardContent>
        </Card>
      )}

      {loading ? (
        <div className="flex justify-center items-center py-20">
          <Loader2 className="w-8 h-8 animate-spin text-primary" />
        </div>
      ) : (
        <Card className="border-border">
          <CardHeader className="p-4 border-b border-border">
            <CardTitle className="text-lg">Senarai Playlist Video</CardTitle>
          </CardHeader>
          <CardContent className="p-0 overflow-x-auto">
            <table className="w-full text-sm text-left">
              <thead className="text-xs uppercase bg-muted text-muted-foreground border-b border-border">
                <tr>
                  <th className="px-4 py-3">Video</th>
                  <th className="px-4 py-3">Bahasa / Kategori</th>
                  <th className="px-4 py-3">Akses</th>
                  <th className="px-4 py-3">Status</th>
                  <th className="px-4 py-3">Sari Kata</th>
                  <th className="px-4 py-3 text-right">Tindakan</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-border">
                {videos.map((video) => (
                  <tr key={video.id} className="hover:bg-muted/50 transition-colors">
                    <td className="px-4 py-3 flex items-center gap-3">
                      {/* eslint-disable-next-line @next/next/no-img-element */}
                      <img
                        src={video.thumbnail_url || `https://img.youtube.com/vi/${video.youtube_video_id}/default.jpg`}
                        alt=""
                        className="w-16 h-10 object-cover rounded bg-muted border border-border"
                      />
                      <div className="min-w-0">
                        <p className="font-bold truncate max-w-xs">{video.title}</p>
                        <a
                          href={`https://youtu.be/${video.youtube_video_id}`}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-xs text-primary hover:underline inline-flex items-center gap-1"
                        >
                          {video.youtube_video_id} <ExternalLink className="w-3 h-3" />
                        </a>
                      </div>
                    </td>
                    <td className="px-4 py-3">
                      <p className="font-medium">{video.language?.name || "-"}</p>
                      <p className="text-xs text-muted-foreground">{video.category || "General"}</p>
                    </td>
                    <td className="px-4 py-3 space-x-1">
                      {video.is_free && <Badge className="bg-green-600">Free</Badge>}
                      {video.is_premium && <Badge className="bg-amber-600 text-black">Premium</Badge>}
                    </td>
                    <td className="px-4 py-3">
                      <Badge variant={video.is_active ? "default" : "secondary"}>
                        {video.is_active ? "Aktif" : "Draf"}
                      </Badge>
                    </td>
                    <td className="px-4 py-3">
                      <div className="flex flex-col gap-1 items-start">
                        <Badge variant="outline">{video.subtitles_count || 0} ayat</Badge>
                        <Button
                          size="sm"
                          variant="secondary"
                          className="h-6 text-[10px] gap-1 py-0 px-2"
                          onClick={() => handleScanSubtitles(video)}
                          disabled={scanningVideoId === video.id}
                        >
                          {scanningVideoId === video.id ? (
                            <>
                              <Loader2 className="w-3 h-3 animate-spin" /> Mengimport...
                            </>
                          ) : (
                            <>
                              <Sparkles className="w-3 h-3 text-amber-500 fill-amber-500" /> Scan/Import
                            </>
                          )}
                        </Button>
                      </div>
                    </td>
                    <td className="px-4 py-3 text-right space-x-1 whitespace-nowrap">
                      <Button
                        variant="ghost"
                        size="icon"
                        title="Edit Sari Kata"
                        onClick={() => handleOpenSubtitleEditor(video)}
                        disabled={loadingEditor && activeEditorVideo?.id === video.id}
                      >
                        <FileText className="w-4 h-4 text-muted-foreground hover:text-foreground" />
                      </Button>
                      <Button variant="ghost" size="icon" title="Edit Video" onClick={() => handleOpenEdit(video)}>
                        <Pencil className="w-4 h-4 text-muted-foreground hover:text-foreground" />
                      </Button>
                      <Button variant="ghost" size="icon" title="Padam Video" onClick={() => handleDelete(video)}>
                        <Trash2 className="w-4 h-4 text-destructive hover:text-destructive" />
                      </Button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </CardContent>
        </Card>
      )}

      {/* ADD/EDIT VIDEO DIALOG */}
      <Dialog open={open} onOpenChange={setOpen}>
        <DialogContent className="max-w-md">
          <DialogHeader>
            <DialogTitle>{editingVideo ? "Kemaskini Video" : "Tambah Video YouTube Baru"}</DialogTitle>
          </DialogHeader>

          <form onSubmit={handleSubmit} className="space-y-4 pt-2">
            <div className="space-y-1">
              <Label htmlFor="language">Bahasa Sasaran</Label>
              <select
                id="language"
                value={languageId}
                onChange={(e) => setLanguageId(e.target.value)}
                className="w-full rounded-md border border-input bg-background px-3 py-2 text-sm"
              >
                {languages.map((lang) => (
                  <option key={lang.id} value={lang.id}>
                    {lang.name} ({lang.code})
                  </option>
                ))}
              </select>
            </div>

            <div className="space-y-1">
              <Label htmlFor="title">Tajuk Video</Label>
              <Input
                id="title"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="cth: How to Talk About Your Home"
                required
              />
            </div>

            <div className="space-y-1">
              <Label htmlFor="video_id">YouTube Video ID</Label>
              <Input
                id="video_id"
                value={youtubeVideoId}
                onChange={(e) => setYoutubeVideoId(e.target.value)}
                placeholder="cth: 030RzwpiK8U"
                required
              />
              <p className="text-[10px] text-muted-foreground">ID di hujung URL youtube: `youtu.be/ID_INI`</p>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-1">
                <Label htmlFor="category">Kategori</Label>
                <Input
                  id="category"
                  value={category}
                  onChange={(e) => setCategory(e.target.value)}
                  placeholder="cth: Beginner"
                />
              </div>

              <div className="space-y-1">
                <Label htmlFor="order">Susunan (Order)</Label>
                <Input
                  id="order"
                  type="number"
                  value={order}
                  onChange={(e) => setOrder(e.target.value)}
                  placeholder="0"
                />
              </div>
            </div>

            <div className="space-y-3 pt-2">
              <div className="flex items-center justify-between">
                <Label htmlFor="is_free" className="flex flex-col">
                  <span>Video Percuma (Free Access)</span>
                  <span className="text-[10px] text-muted-foreground font-normal">Benarkan bukan pelanggan menonton</span>
                </Label>
                <Switch id="is_free" checked={isFree} onCheckedChange={setIsFree} />
              </div>

              <div className="flex items-center justify-between">
                <Label htmlFor="is_premium" className="flex flex-col">
                  <span>Kategori Premium</span>
                  <span className="text-[10px] text-muted-foreground font-normal">Pelanggan berbayar sahaja</span>
                </Label>
                <Switch id="is_premium" checked={isPremium} onCheckedChange={setIsPremium} />
              </div>

              <div className="flex items-center justify-between">
                <Label htmlFor="is_active" className="flex flex-col">
                  <span>Status Aktif</span>
                  <span className="text-[10px] text-muted-foreground font-normal">Paparkan dalam perpustakaan video</span>
                </Label>
                <Switch id="is_active" checked={isActive} onCheckedChange={setIsActive} />
              </div>
            </div>

            <div className="flex justify-end gap-3 pt-2">
              <Button type="button" variant="outline" onClick={() => setOpen(false)}>
                Batal
              </Button>
              <Button type="submit" disabled={submitting}>
                {submitting ? "Menyimpan..." : "Simpan Video"}
              </Button>
            </div>
          </form>
        </DialogContent>
      </Dialog>

      {/* SUBTITLE EDITOR DIALOG */}
      <Dialog open={subtitleEditorOpen} onOpenChange={setSubtitleEditorOpen}>
        <DialogContent 
          className="!max-w-4xl !sm:max-w-4xl max-h-[85vh] flex flex-col"
          style={{ maxWidth: "850px", width: "95%" }}
        >
          <DialogHeader>
            <DialogTitle className="flex justify-between items-center pr-6">
              <span>Edit Sari Kata: {activeEditorVideo?.title}</span>
              <Badge variant="outline">{editorSubtitles.length} baris ayat</Badge>
            </DialogTitle>
          </DialogHeader>

          {/* Subtitles List Container */}
          <div className="flex-1 overflow-y-auto my-4 border border-border rounded-lg bg-card max-h-[50vh]">
            <table className="w-full text-xs text-left border-collapse">
              <thead className="bg-muted text-muted-foreground sticky top-0 border-b border-border z-10">
                <tr>
                  <th className="px-3 py-2 w-20">Mula (s)</th>
                  <th className="px-3 py-2 w-20">Tamat (s)</th>
                  <th className="px-3 py-2">Ayat Sasaran (English)</th>
                  <th className="px-3 py-2">Terjemahan (Bahasa Melayu)</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-border">
                {editorSubtitles.length === 0 ? (
                  <tr>
                    <td colSpan={4} className="text-center py-8 text-muted-foreground italic">
                      Tiada sari kata ditemui. Sila klik butang &quot;Scan/Import&quot; terlebih dahulu.
                    </td>
                  </tr>
                ) : (
                  editorSubtitles.map((sub, idx) => (
                    <tr key={sub.id} className="hover:bg-muted/30">
                      <td className="px-2 py-1.5">
                        <Input
                          type="number"
                          step="0.01"
                          className="h-8 px-1.5 text-xs text-center font-mono"
                          value={sub.start_time}
                          onChange={(e) => handleSubtitleFieldChange(idx, "start_time", e.target.value)}
                        />
                      </td>
                      <td className="px-2 py-1.5">
                        <Input
                          type="number"
                          step="0.01"
                          className="h-8 px-1.5 text-xs text-center font-mono"
                          value={sub.end_time}
                          onChange={(e) => handleSubtitleFieldChange(idx, "end_time", e.target.value)}
                        />
                      </td>
                      <td className="px-2 py-1.5">
                        <textarea
                          rows={1}
                          className="w-full rounded-md border border-input bg-background px-2 py-1 text-xs resize-none"
                          value={sub.target_text}
                          onChange={(e) => handleSubtitleFieldChange(idx, "target_text", e.target.value)}
                        />
                      </td>
                      <td className="px-2 py-1.5">
                        <textarea
                          rows={1}
                          className="w-full rounded-md border border-input bg-background px-2 py-1 text-xs resize-none"
                          value={sub.source_text}
                          onChange={(e) => handleSubtitleFieldChange(idx, "source_text", e.target.value)}
                        />
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>

          <div className="flex justify-between items-center pt-2 border-t border-border">
            <p className="text-[10px] text-muted-foreground max-w-md">
              * Tips: Selepas menekan **Scan/Import** pada video, kesemua sari kata rasmi YouTube diimport secara automatik. Anda boleh memperbetulkan masa dan menterjemah ayat ke Bahasa Melayu di sini.
            </p>
            <div className="flex gap-3 shrink-0">
              <Button type="button" variant="outline" onClick={() => setSubtitleEditorOpen(false)}>
                Batal
              </Button>
              <Button type="button" onClick={handleSaveSubtitles} disabled={savingSubtitles || editorSubtitles.length === 0} className="gap-2">
                {savingSubtitles ? (
                  <>
                    <Loader2 className="w-4 h-4 animate-spin" /> Menyimpan...
                  </>
                ) : (
                  <>
                    <Save className="w-4 h-4" /> Simpan Semua Sari Kata
                  </>
                )}
              </Button>
            </div>
          </div>
        </DialogContent>
      </Dialog>
    </div>
  );
}
