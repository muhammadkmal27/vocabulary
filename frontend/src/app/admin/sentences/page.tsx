"use client";

import { useEffect, useState, Suspense } from "react";
import { useSearchParams, useRouter } from "next/navigation";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import {
  Plus,
  Pencil,
  Trash2,
  ChevronLeft,
  Loader2,
} from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";

function SentencesContent() {
  const { token } = useAuth();
  const { toast, showConfirm } = useAlert();
  const searchParams = useSearchParams();
  const router = useRouter();

  // Navigation states
  const [languages, setLanguages] = useState<any[]>([]);
  const [levels, setLevels] = useState<any[]>([]);
  const [selectedLangId, setSelectedLangId] = useState<string>("");
  const [selectedLevelId, setSelectedLevelId] = useState<string>("");

  const [sentences, setSentences] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  // Form & Dialog States
  const [open, setOpen] = useState(false);
  const [editingSentence, setEditingSentence] = useState<any>(null);
  const [sourceText, setSourceText] = useState("");
  const [targetText, setTargetText] = useState("");
  const [difficulty, setDifficulty] = useState<number>(1);
  const [submitting, setSubmitting] = useState(false);

  // Bulk Input States
  const [bulkRows, setBulkRows] = useState<any[]>([{ source_text: "", target_text: "" }]);
  const [bulkSubmitting, setBulkSubmitting] = useState(false);

  // 1. Fetch languages on mount
  const fetchLanguages = async () => {
    if (!token) return;
    try {
      const res = await fetch("/api/admin/languages", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        const data = await res.json();
        setLanguages(data);

        // Determine initially selected language
        const urlLangId = searchParams.get("language_id");
        if (urlLangId) {
          setSelectedLangId(urlLangId);
        } else if (data.length > 0) {
          setSelectedLangId(data[0].id);
        } else {
          setLoading(false);
        }
      }
    } catch (err) {
      console.error(err);
      setLoading(false);
    }
  };

  // 2. Fetch levels whenever selected language changes
  const fetchLevels = async (langId: string) => {
    if (!token || !langId) return;
    try {
      const res = await fetch(`/api/admin/languages/${langId}/levels`, {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        const data = await res.json();
        setLevels(data);

        // Determine initially selected level
        const urlLvlId = searchParams.get("level_id");
        const found = data.find((l: any) => l.id === urlLvlId);
        if (found) {
          setSelectedLevelId(found.id);
        } else if (data.length > 0) {
          setSelectedLevelId(data[0].id);
        } else {
          setSentences([]);
          setSelectedLevelId("");
          setLoading(false);
        }
      }
    } catch (err) {
      console.error(err);
      setLoading(false);
    }
  };

  // 3. Fetch sentences when level changes
  const fetchSentences = async (langId: string, lvlId: string) => {
    if (!token || !langId || !lvlId) return;
    try {
      setLoading(true);
      const res = await fetch(`/api/admin/languages/${langId}/levels/${lvlId}/sentences`, {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        const data = await res.json();
        setSentences(data);
      }
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchLanguages();
  }, [token]);

  useEffect(() => {
    if (selectedLangId) {
      fetchLevels(selectedLangId);
    }
  }, [selectedLangId]);

  useEffect(() => {
    if (selectedLangId && selectedLevelId) {
      fetchSentences(selectedLangId, selectedLevelId);
      // Sync URL search params
      const newUrl = `/admin/sentences?language_id=${selectedLangId}&level_id=${selectedLevelId}`;
      window.history.pushState({ path: newUrl }, "", newUrl);
    }
  }, [selectedLangId, selectedLevelId]);

  const handleOpenCreate = () => {
    setEditingSentence(null);
    setSourceText("");
    setTargetText("");
    setDifficulty(1);
    setOpen(true);
  };

  const handleOpenEdit = (s: any) => {
    setEditingSentence(s);
    setSourceText(s.source_text);
    setTargetText(s.target_text);
    setDifficulty(s.difficulty ?? 1);
    setOpen(true);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!sourceText || !targetText || !selectedLangId || !selectedLevelId) return;
    setSubmitting(true);
    try {
      const url = editingSentence
        ? `/api/admin/sentences/${editingSentence.id}`
        : `/api/admin/languages/${selectedLangId}/levels/${selectedLevelId}/sentences`;
      const method = editingSentence ? "PUT" : "POST";

      const res = await fetch(url, {
        method,
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          source_text: sourceText,
          target_text: targetText,
          difficulty,
        }),
      });

      if (res.ok) {
        setOpen(false);
        fetchSentences(selectedLangId, selectedLevelId);
      } else {
        const errData = await res.json();
        toast(errData.message || "Gagal menyimpan ayat.", "error");
      }
    } catch (err) {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async (id: string) => {
    const confirmed = await showConfirm("Adakah anda pasti mahu memadam ayat ini?");
    if (!confirmed) return;
    try {
      const res = await fetch(`/api/admin/sentences/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        fetchSentences(selectedLangId, selectedLevelId);
      } else {
        toast("Gagal memadam ayat.", "error");
      }
    } catch (err) {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  // Bulk operations
  const handleAddBulkRow = () => {
    setBulkRows([...bulkRows, { source_text: "", target_text: "" }]);
  };

  const handleBulkRowChange = (index: number, field: string, value: string) => {
    const updated = [...bulkRows];
    updated[index][field] = value;
    setBulkRows(updated);
  };

  const handleBulkSubmit = async () => {
    const validRows = bulkRows.filter(r => r.source_text.trim() && r.target_text.trim());
    if (validRows.length === 0) {
      toast("Sila isi sekurang-kurangnya satu baris BM dan English.", "error");
      return;
    }
    setBulkSubmitting(true);
    try {
      const res = await fetch(`/api/admin/languages/${selectedLangId}/levels/${selectedLevelId}/sentences/bulk`, {
        method: "POST",
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({ sentences: validRows }),
      });
      if (res.ok) {
        setBulkRows([{ source_text: "", target_text: "" }]);
        fetchSentences(selectedLangId, selectedLevelId);
        toast("Kemajuan pukal berjaya disimpan!", "success");
      } else {
        toast("Gagal menyimpan input pukal.", "error");
      }
    } catch (err) {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setBulkSubmitting(false);
    }
  };

  const activeLanguage = languages.find(l => l.id === selectedLangId);
  const activeLevel = levels.find(lvl => lvl.id === selectedLevelId);

  return (
    <div className="p-6 space-y-6">
      <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
        <div className="flex items-center gap-2">
          <Link href={selectedLangId ? `/admin/levels?language_id=${selectedLangId}` : "/admin/languages"}>
            <Button variant="ghost" size="icon">
              <ChevronLeft className="w-4 h-4" />
            </Button>
          </Link>
          <h1 className="text-2xl font-bold">
            Ayat — {activeLevel ? activeLevel.name : "Memuatkan..."}
          </h1>
          <Badge variant="secondary">{sentences.length} ayat</Badge>
        </div>

        {/* Dynamic Dual Selectors */}
        <div className="flex flex-wrap items-center gap-3 bg-card border border-border p-2 rounded-lg shadow-sm">
          {languages.length > 0 && (
            <div className="flex items-center gap-1.5">
              <span className="text-[10px] text-muted-foreground font-bold uppercase">Bahasa:</span>
              <select
                className="bg-background text-foreground text-xs font-semibold border border-input rounded-md px-2.5 py-1.5 focus:outline-none focus:ring-1 focus:ring-primary cursor-pointer"
                value={selectedLangId}
                onChange={(e) => {
                  setSelectedLangId(e.target.value);
                  setSelectedLevelId(""); // Reset level on language change
                }}
              >
                {languages.map((l) => (
                  <option key={l.id} value={l.id}>
                    {l.flag} {l.name}
                  </option>
                ))}
              </select>
            </div>
          )}

          {levels.length > 0 && (
            <div className="flex items-center gap-1.5">
              <span className="text-[10px] text-muted-foreground font-bold uppercase">Level:</span>
              <select
                className="bg-background text-foreground text-xs font-semibold border border-input rounded-md px-2.5 py-1.5 focus:outline-none focus:ring-1 focus:ring-primary cursor-pointer"
                value={selectedLevelId}
                onChange={(e) => setSelectedLevelId(e.target.value)}
              >
                {levels.map((lvl) => (
                  <option key={lvl.id} value={lvl.id}>
                    Level {lvl.order} - {lvl.name}
                  </option>
                ))}
              </select>
            </div>
          )}
        </div>
      </div>

      {/* Quick Actions */}
      <div className="flex gap-2">
        {selectedLevelId && (
          <Dialog open={open} onOpenChange={setOpen}>
            <DialogTrigger render={<Button onClick={handleOpenCreate} />}>
              <Plus className="w-4 h-4 mr-2" /> Tambah Ayat Baru
            </DialogTrigger>
            <DialogContent className="sm:max-w-lg">
              <DialogHeader>
                <DialogTitle>{editingSentence ? "Edit Ayat" : "Tambah Ayat Baru"}</DialogTitle>
              </DialogHeader>
              <form onSubmit={handleSubmit} className="space-y-4 pt-2">
                <div className="space-y-2">
                  <Label htmlFor="source-text">Ayat Bahasa Melayu (BM)</Label>
                  <Textarea
                    id="source-text"
                    placeholder="Taip ayat dalam BM..."
                    className="min-h-[60px]"
                    value={sourceText}
                    onChange={(e) => setSourceText(e.target.value)}
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="target-text">Terjemahan Target ({activeLanguage ? activeLanguage.name : "English"})</Label>
                  <Textarea
                    id="target-text"
                    placeholder={`Taip terjemahan ${activeLanguage ? activeLanguage.name : "English"}...`}
                    className="min-h-[60px]"
                    value={targetText}
                    onChange={(e) => setTargetText(e.target.value)}
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label>Tahap Kesukaran</Label>
                  <div className="flex gap-2">
                    {[1, 2, 3].map((n) => (
                      <Button
                        key={n}
                        type="button"
                        variant={difficulty === n ? "default" : "outline"}
                        size="sm"
                        onClick={() => setDifficulty(n)}
                      >
                        {n === 1 ? "Mudah" : n === 2 ? "Sederhana" : "Sukar"}
                      </Button>
                    ))}
                  </div>
                </div>
                <Button type="submit" className="w-full" disabled={submitting}>
                  {submitting ? "Menyimpan..." : "Simpan Ayat"}
                </Button>
              </form>
            </DialogContent>
          </Dialog>
        )}
      </div>

      {/* Bulk Input */}
      {selectedLevelId && (
        <Card>
          <CardHeader>
            <CardTitle>Input Pukal (BM → {activeLanguage ? activeLanguage.name : "Target"})</CardTitle>
          </CardHeader>
          <CardContent className="space-y-3">
            {bulkRows.map((row, i) => (
              <div
                key={i}
                className="grid grid-cols-1 sm:grid-cols-2 gap-3 p-3 rounded-lg border border-border bg-card"
              >
                <div className="space-y-1">
                  <Label className="text-[10px] text-muted-foreground">BM</Label>
                  <Input
                    value={row.source_text}
                    onChange={(e) => handleBulkRowChange(i, "source_text", e.target.value)}
                    placeholder="Ayat BM"
                    className="text-sm"
                  />
                </div>
                <div className="space-y-1">
                  <Label className="text-[10px] text-muted-foreground">{activeLanguage ? activeLanguage.name : "English"}</Label>
                  <Input
                    value={row.target_text}
                    onChange={(e) => handleBulkRowChange(i, "target_text", e.target.value)}
                    placeholder={`Terjemahan ${activeLanguage ? activeLanguage.name : "English"}`}
                    className="text-sm"
                  />
                </div>
              </div>
            ))}
            <div className="pt-2 space-y-2">
              <Button type="button" variant="outline" size="lg" className="w-full justify-center" onClick={handleAddBulkRow}>
                <Plus className="w-4 h-4 mr-2" /> Tambah Baris Baru
              </Button>
              <Button type="button" size="lg" className="w-full justify-center bg-primary hover:bg-primary/90 text-primary-foreground font-bold shadow-md" onClick={handleBulkSubmit} disabled={bulkSubmitting}>
                {bulkSubmitting ? "Menyimpan Pukal..." : "Simpan Semua Pukal"}
              </Button>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Sentences Table */}
      <Card>
        <CardContent className="p-0">
          {loading ? (
            <div className="flex justify-center py-8">
              <Loader2 className="w-8 h-8 animate-spin text-primary" />
            </div>
          ) : (
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead className="w-10">No</TableHead>
                  <TableHead>Bahasa Melayu</TableHead>
                  <TableHead>{activeLanguage ? activeLanguage.name : "English"}</TableHead>
                  <TableHead className="w-20">Sukar</TableHead>
                  <TableHead className="w-20 text-right">Tindakan</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {sentences.map((s, index) => (
                  <TableRow key={s.id}>
                    <TableCell className="text-muted-foreground">
                      {index + 1}
                    </TableCell>
                    <TableCell className="max-w-[200px] truncate" title={s.source_text}>
                      &ldquo;{s.source_text}&rdquo;
                    </TableCell>
                    <TableCell
                      className="max-w-[200px] truncate text-muted-foreground"
                      title={s.target_text}
                    >
                      {s.target_text}
                    </TableCell>
                    <TableCell>
                      <Badge
                        variant={
                          s.difficulty === 1
                            ? "secondary"
                            : s.difficulty === 2
                              ? "default"
                              : "destructive"
                        }
                        className="text-[10px]"
                      >
                        {s.difficulty === 1
                          ? "Mudah"
                          : s.difficulty === 2
                            ? "Sed"
                            : "Sukar"}
                      </Badge>
                    </TableCell>
                    <TableCell className="text-right space-x-1">
                      <Button variant="ghost" size="icon" onClick={() => handleOpenEdit(s)}>
                        <Pencil className="w-3.5 h-3.5" />
                      </Button>
                      <Button variant="ghost" size="icon" onClick={() => handleDelete(s.id)}>
                        <Trash2 className="w-3.5 h-3.5 text-destructive" />
                      </Button>
                    </TableCell>
                  </TableRow>
                ))}
                {sentences.length === 0 && (
                  <TableRow>
                    <TableCell colSpan={5} className="text-center text-muted-foreground py-6">
                      Tiada ayat ditemui bagi level ini.
                    </TableCell>
                  </TableRow>
                )}
              </TableBody>
            </Table>
          )}
        </CardContent>
      </Card>
    </div>
  );
}

export default function AdminSentencesPage() {
  return (
    <Suspense fallback={
      <div className="flex justify-center py-8">
        <Loader2 className="w-8 h-8 animate-spin text-primary" />
      </div>
    }>
      <SentencesContent />
    </Suspense>
  );
}
