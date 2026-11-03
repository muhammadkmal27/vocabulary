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

export default function AdminSpecialVideosPage() {
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
  const [category, setCategory] = useState("Special");
  const [isPremium, setIsPremium] = useState(false);
  const [isFree, setIsFree] = useState(true);
  const [isActive, setIsActive] = useState(true);
  const [order, setOrder] = useState("1");
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
      
      // Fetch only Special videos
      const videoRes = await fetch("/api/admin/videos?category=Special", {
        headers: { Authorization: `Bearer ${token}`, Accept: "application/json" },
      });
      if (!videoRes.ok) throw new Error("Gagal mengambil senarai video khas.");
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
    setCategory("Special");
    setIsPremium(false);
    setIsFree(true);
    setIsActive(true);
    setOrder("1");
    setOpen(true);
  };

  const handleOpenEdit = (video: VideoRecord) => {
    setEditingVideo(video);
    setTitle(video.title);
    setYoutubeVideoId(video.youtube_video_id);
    setLanguageId(video.language?.id || languages[0]?.id || "");
    setCategory(video.category || "Special");
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
          category: category || "Special",
          is_premium: isPremium,
          is_free: isFree,
          is_active: isActive,
          order: parseInt(order) || 1,
        }),
      });

      if (res.ok) {
        toast(editingVideo ? "Video khas berjaya dikemaskini!" : "Video khas berjaya ditambah!", "success");
        setOpen(false);
        fetchVideos();
      } else {
        const errData = await res.json();
        toast(errData.message || "Gagal menyimpan video khas.", "error");
      }
    } catch {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async (video: VideoRecord) => {
    const confirmed = await showConfirm(
      `Adakah anda pasti mahu memadam video khas "${video.title}"? Semua sari kata berkaitan juga akan dipadam.`,
      "Padam Video Khas"
    );
    if (!confirmed || !token) return;
    try {
      const res = await fetch(`/api/admin/videos/${video.id}`, {
        method: "DELETE",
        headers: { Authorization: `Bearer ${token}`, Accept: "application/json" },
      });
      if (res.ok) {
        toast("Video khas berjaya dipadam.", "success");
        fetchVideos();
      } else {
        toast("Gagal memadam video khas.", "error");
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
    } catch {
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
          <div className="p-2 bg-emerald-500/10 rounded-xl text-emerald-500">
            <Video className="w-6 h-6" />
          </div>
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Pengurusan Video Khas (Special)</h1>
            <p className="text-sm text-muted-foreground">Urus playlist video ceramah bilingual, sari kata dwibahasa, dan timing tepat.</p>
          </div>
        </div>
        <Button onClick={handleOpenAdd} className="gap-2 bg-emerald-600 hover:bg-emerald-700 text-white">
          <Plus className="w-4 h-4" /> Tambah Video Khas
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
            <CardTitle className="text-lg">Senarai Playlist Video Khas Agama</CardTitle>
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
                        src={video.thumbnail_url}
                        alt={video.title}
                        className="w-16 h-10 object-cover rounded shadow-sm border border-border"
                      />
                      <div className="max-w-xs sm:max-w-sm">
                        <div className="font-semibold line-clamp-1">{video.title}</div>
                        <div className="text-xs text-muted-foreground flex items-center gap-1">
                          <span>ID: {video.youtube_video_id}</span>
                          <span>•</span>
                          <span>Susunan: {video.order}</span>
                          <a
                            href={`https://youtu.be/${video.youtube_video_id}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-primary hover:underline flex items-center ml-1"
                          >
                            <ExternalLink className="w-3 h-3" />
                          </a>
                        </div>
                      </div>
                    </td>
                    <td className="px-4 py-3">
                      <div className="flex flex-col gap-1 items-start">
                        <Badge variant="outline" className="text-xs">
                          {video.language?.name || "English"}
                        </Badge>
                        <Badge variant="secondary" className="text-xs bg-emerald-500/10 text-emerald-600">
                          {video.category || "Special"}
                        </Badge>
                      </div>
                    </td>
                    <td className="px-4 py-3">
                      {video.is_free ? (
                        <Badge className="bg-green-600 hover:bg-green-600 text-white text-xs">Percuma</Badge>
                      ) : (
                        <Badge className="bg-amber-600 hover:bg-amber-600 text-black font-semibold text-xs">Premium</Badge>
                      )}
                    </td>
                    <td className="px-4 py-3">
                      {video.is_active ? (
                        <Badge variant="outline" className="text-emerald-500 border-emerald-500/30 text-xs">Aktif</Badge>
                      ) : (
                        <Badge variant="outline" className="text-muted-foreground text-xs">Tidak Aktif</Badge>
                      )}
                    </td>
                    <td className="px-4 py-3">
                      <div className="flex items-center gap-2">
                        <Badge variant="secondary" className="gap-1 text-xs">
                          <FileText className="w-3 h-3" />
                          {video.subtitles_count || 0} baris
                        </Badge>
                        <Button
                          size="sm"
                          variant="outline"
                          onClick={() => handleScanSubtitles(video)}
                          disabled={scanningVideoId === video.id}
                          className="h-8 gap-1.5 text-xs border-dashed text-primary hover:text-primary hover:bg-primary/5"
                          title="Imbas sari kata daripada YouTube secara automatik mengikut pemasaan tepat"
                        >
                          {scanningVideoId === video.id ? (
                            <Loader2 className="w-3.5 h-3.5 animate-spin" />
                          ) : (
                            <Sparkles className="w-3.5 h-3.5 text-amber-500" />
                          )}
                          Scan/Import
                        </Button>
                      </div>
                    </td>
                    <td className="px-4 py-3 text-right">
                      <div className="flex items-center justify-end gap-2">
                        <Button
                          size="sm"
                          variant="ghost"
                          onClick={() => handleOpenSubtitleEditor(video)}
                          disabled={loadingEditor}
                          title="Urus Sari Kata"
                          className="h-8 w-8 p-0"
                        >
                          <FileText className="w-4 h-4 text-primary" />
                        </Button>
                        <Button
                          size="sm"
                          variant="ghost"
                          onClick={() => handleOpenEdit(video)}
                          title="Sunting Video"
                          className="h-8 w-8 p-0"
                        >
                          <Pencil className="w-4 h-4 text-muted-foreground" />
                        </Button>
                        <Button
                          size="sm"
                          variant="ghost"
                          onClick={() => handleDelete(video)}
                          title="Padam Video"
                          className="h-8 w-8 p-0 hover:text-destructive"
                        >
                          <Trash2 className="w-4 h-4 text-destructive" />
                        </Button>
                      </div>
                    </td>
                  </tr>
                ))}
                {videos.length === 0 && (
                  <tr>
                    <td colSpan={6} className="text-center py-8 text-muted-foreground">
                      Tiada video khas ditemui. Klik butang &quot;Tambah Video Khas&quot; untuk mula menambah video ceramah.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </CardContent>
        </Card>
      )}

      {/* MODAL ADD / EDIT VIDEO */}
      <Dialog open={open} onOpenChange={setOpen}>
        <DialogContent className="sm:max-w-[425px]">
          <DialogHeader>
            <DialogTitle>{editingVideo ? "Sunting Video Khas" : "Tambah Video Khas Baru"}</DialogTitle>
          </DialogHeader>
          <form onSubmit={handleSubmit} className="space-y-4 pt-2">
            <div className="space-y-2">
              <Label htmlFor="title">Tajuk Video *</Label>
              <Input
                id="title"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="Contoh: Lessons from African Roads & Safari"
                required
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="youtubeVideoId">YouTube Video ID *</Label>
              <Input
                id="youtubeVideoId"
                value={youtubeVideoId}
                onChange={(e) => setYoutubeVideoId(e.target.value)}
                placeholder="Contoh: L6QE6Vp7Oa4"
                required
              />
              <p className="text-[11px] text-muted-foreground">Hanya masukkan kod ID video (bukan keseluruhan URL).</p>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="languageId">Bahasa *</Label>
                <select
                  id="languageId"
                  value={languageId}
                  onChange={(e) => setLanguageId(e.target.value)}
                  className="w-full h-10 px-3 rounded-md border border-input bg-background text-sm"
                  required
                >
                  <option value="" disabled>Pilih Bahasa</option>
                  {languages.map((l) => (
                    <option key={l.id} value={l.id}>{l.name}</option>
                  ))}
                </select>
              </div>

              <div className="space-y-2">
                <Label htmlFor="category">Kategori</Label>
                <Input
                  id="category"
                  value={category}
                  onChange={(e) => setCategory(e.target.value)}
                  placeholder="Special"
                />
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="order">Nombor Susunan (Order)</Label>
              <Input
                id="order"
                type="number"
                value={order}
                onChange={(e) => setOrder(e.target.value)}
              />
            </div>

            <div className="pt-2 space-y-3 border-t border-border">
              <div className="flex items-center justify-between">
                <Label htmlFor="isFree" className="cursor-pointer">Video Percuma?</Label>
                <Switch
                  id="isFree"
                  checked={isFree}
                  onCheckedChange={(checked) => {
                    setIsFree(checked);
                    if (checked) setIsPremium(false);
                  }}
                />
              </div>

              <div className="flex items-center justify-between">
                <Label htmlFor="isPremium" className="cursor-pointer">Khas Premium?</Label>
                <Switch
                  id="isPremium"
                  checked={isPremium}
                  onCheckedChange={(checked) => {
                    setIsPremium(checked);
                    if (checked) setIsFree(false);
                  }}
                />
              </div>

              <div className="flex items-center justify-between">
                <Label htmlFor="isActive" className="cursor-pointer">Status Aktif</Label>
                <Switch
                  id="isActive"
                  checked={isActive}
                  onCheckedChange={setIsActive}
                />
              </div>
            </div>

            <div className="flex justify-end gap-2 pt-4">
              <Button type="button" variant="outline" onClick={() => setOpen(false)}>
                Batal
              </Button>
              <Button type="submit" disabled={submitting}>
                {submitting && <Loader2 className="w-4 h-4 mr-2 animate-spin" />}
                {editingVideo ? "Simpan Perubahan" : "Tambah Video"}
              </Button>
            </div>
          </form>
        </DialogContent>
      </Dialog>

      {/* MODAL EDITOR SARI KATA */}
      <Dialog open={subtitleEditorOpen} onOpenChange={setSubtitleEditorOpen}>
        <DialogContent className="max-w-4xl max-h-[85vh] flex flex-col p-6">
          <DialogHeader className="border-b border-border pb-3">
            <div className="flex items-center justify-between">
              <div>
                <DialogTitle className="text-xl">Sunting Sari Kata: {activeEditorVideo?.title}</DialogTitle>
                <p className="text-xs text-muted-foreground mt-1">
                  Jumlah: {editorSubtitles.length} baris sari kata. Ubah teks dan masa secara langsung.
                </p>
              </div>
              <Button onClick={handleSaveSubtitles} disabled={savingSubtitles} className="gap-2">
                {savingSubtitles ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
                Simpan Semua Perubahan
              </Button>
            </div>
          </DialogHeader>

          <div className="flex-1 overflow-y-auto space-y-3 py-4 pr-1">
            {editorSubtitles.length === 0 ? (
              <div className="text-center py-12 text-muted-foreground">
                Tiada sari kata untuk video ini. Gunakan butang &quot;Scan/Import&quot; untuk jana secara automatik.
              </div>
            ) : (
              editorSubtitles.map((sub, index) => (
                <div key={sub.id || index} className="p-3 bg-muted/40 rounded-lg border border-border/60 flex flex-col sm:flex-row gap-3 items-start sm:items-center">
                  <div className="w-10 text-center font-bold text-xs text-muted-foreground">
                    #{index + 1}
                  </div>
                  
                  <div className="flex items-center gap-1 text-xs shrink-0">
                    <Input
                      type="number"
                      step="0.01"
                      value={sub.start_time}
                      onChange={(e) => handleSubtitleFieldChange(index, "start_time", e.target.value)}
                      className="w-20 h-8 text-xs font-mono"
                      title="Masa Mula (saat)"
                    />
                    <span>-</span>
                    <Input
                      type="number"
                      step="0.01"
                      value={sub.end_time}
                      onChange={(e) => handleSubtitleFieldChange(index, "end_time", e.target.value)}
                      className="w-20 h-8 text-xs font-mono"
                      title="Masa Tamat (saat)"
                    />
                  </div>

                  <div className="flex-1 grid grid-cols-1 sm:grid-cols-2 gap-2 w-full">
                    <Input
                      value={sub.target_text}
                      onChange={(e) => handleSubtitleFieldChange(index, "target_text", e.target.value)}
                      placeholder="Ayat Bahasa Inggeris..."
                      className="h-8 text-xs"
                    />
                    <Input
                      value={sub.source_text}
                      onChange={(e) => handleSubtitleFieldChange(index, "source_text", e.target.value)}
                      placeholder="Terjemahan Bahasa Melayu..."
                      className="h-8 text-xs bg-primary/5"
                    />
                  </div>
                </div>
              ))
            )}
          </div>
        </DialogContent>
      </Dialog>
    </div>
  );
}
