"use client";

import { useEffect, useState, Suspense } from "react";
import { useSearchParams, useRouter } from "next/navigation";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
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
import { Plus, Pencil, Trash2, ChevronLeft, Loader2 } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";

function LevelsContent() {
  const { token } = useAuth();
  const { toast, showConfirm } = useAlert();
  const searchParams = useSearchParams();
  const router = useRouter();
  
  // States
  const [languages, setLanguages] = useState<any[]>([]);
  const [selectedLangId, setSelectedLangId] = useState<string>("");
  const [levels, setLevels] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  // Dialog & Form states
  const [open, setOpen] = useState(false);
  const [editingLevel, setEditingLevel] = useState<any>(null);
  const [name, setName] = useState("");
  const [order, setOrder] = useState(1);
  const [submitting, setSubmitting] = useState(false);

  // 1. Fetch all languages to allow selection
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
        
        // If query param is present, use it; otherwise select the first language
        const paramId = searchParams.get("language_id");
        if (paramId) {
          setSelectedLangId(paramId);
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

  // 2. Fetch levels for selected language
  const fetchLevels = async (langId: string) => {
    if (!token || !langId) return;
    try {
      setLoading(true);
      const res = await fetch(`/api/admin/languages/${langId}/levels`, {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        const data = await res.json();
        setLevels(data);
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
      // Sync URL query parameters without full reload for cleaner navigation
      const newUrl = `/admin/levels?language_id=${selectedLangId}`;
      window.history.pushState({ path: newUrl }, "", newUrl);
    }
  }, [selectedLangId]);

  const handleOpenCreate = () => {
    setEditingLevel(null);
    setName("");
    const nextOrder = levels.length > 0 ? Math.max(...levels.map(l => l.order)) + 1 : 1;
    setOrder(nextOrder);
    setOpen(true);
  };

  const handleOpenEdit = (lvl: any) => {
    setEditingLevel(lvl);
    setName(lvl.name);
    setOrder(lvl.order);
    setOpen(true);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!name || !selectedLangId) return;
    setSubmitting(true);
    try {
      const url = editingLevel
        ? `/api/admin/levels/${editingLevel.id}`
        : `/api/admin/languages/${selectedLangId}/levels`;
      const method = editingLevel ? "PUT" : "POST";
      
      const payload: any = { name, order };
      
      const res = await fetch(url, {
        method,
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify(payload),
      });

      if (res.ok) {
        setOpen(false);
        fetchLevels(selectedLangId);
      } else {
        const errData = await res.json();
        toast(errData.message || "Gagal menyimpan level.", "error");
      }
    } catch (err) {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async (id: string) => {
    const confirmed = await showConfirm("Adakah anda pasti mahu memadam level ini? Semua ayat di bawahnya juga akan dipadam.");
    if (!confirmed) {
      return;
    }
    try {
      const res = await fetch(`/api/admin/levels/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        fetchLevels(selectedLangId);
      } else {
        toast("Gagal memadam level.", "error");
      }
    } catch (err) {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  const activeLanguage = languages.find(l => l.id === selectedLangId);

  return (
    <div className="p-6 space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div className="flex items-center gap-2">
          <Link href="/admin/languages">
            <Button variant="ghost" size="icon">
              <ChevronLeft className="w-4 h-4" />
            </Button>
          </Link>
          <h1 className="text-2xl font-bold">
            Level — {activeLanguage ? `${activeLanguage.flag || "🌐"} ${activeLanguage.name}` : "Memuatkan..."}
          </h1>
        </div>

        {/* Dropdown Selector */}
        {languages.length > 0 && (
          <div className="flex items-center gap-2 bg-card border border-border p-2 rounded-lg shadow-sm">
            <span className="text-xs text-muted-foreground font-semibold uppercase px-1">Pilih Bahasa:</span>
            <select
              className="bg-background text-foreground text-sm font-medium border border-input rounded-md px-3 py-1.5 focus:outline-none focus:ring-1 focus:ring-primary cursor-pointer"
              value={selectedLangId}
              onChange={(e) => setSelectedLangId(e.target.value)}
            >
              {languages.map((l) => (
                <option key={l.id} value={l.id}>
                  {l.flag} {l.name}
                </option>
              ))}
            </select>
          </div>
        )}
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>Senarai Level</CardTitle>
            {selectedLangId && (
              <Dialog open={open} onOpenChange={setOpen}>
                <DialogTrigger render={<Button size="sm" onClick={handleOpenCreate} />}>
                  <Plus className="w-4 h-4 mr-2" /> Tambah Level
                </DialogTrigger>
                <DialogContent className="sm:max-w-md">
                  <DialogHeader>
                    <DialogTitle>{editingLevel ? "Edit Level" : "Tambah Level Baru"}</DialogTitle>
                  </DialogHeader>
                  <form onSubmit={handleSubmit} className="space-y-4 pt-2">
                    <div className="space-y-2">
                      <Label htmlFor="level-name">Nama Level</Label>
                      <Input
                        id="level-name"
                        placeholder="Contoh: Beginner 1, Intermediate 2"
                        value={name}
                        onChange={(e) => setName(e.target.value)}
                        required
                      />
                    </div>
                    <div className="space-y-2">
                      <Label htmlFor="level-order">Turutan (Order)</Label>
                      <Input
                        id="level-order"
                        type="number"
                        value={order}
                        onChange={(e) => setOrder(parseInt(e.target.value) || 1)}
                        required
                      />
                    </div>
                    <Button type="submit" className="w-full" disabled={submitting}>
                      {submitting ? "Menyimpan..." : "Simpan Level"}
                    </Button>
                  </form>
                </DialogContent>
              </Dialog>
            )}
          </div>
        </CardHeader>
        <CardContent>
          {loading ? (
            <div className="flex justify-center py-8">
              <Loader2 className="w-8 h-8 animate-spin text-primary" />
            </div>
          ) : (
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>No</TableHead>
                  <TableHead>Nama Level</TableHead>
                  <TableHead className="text-right">Tindakan</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {levels.map((lvl) => (
                  <TableRow key={lvl.id}>
                    <TableCell className="font-mono">{lvl.order}</TableCell>
                    <TableCell className="font-medium">{lvl.name}</TableCell>
                    <TableCell className="text-right space-x-2">
                      <Link href={`/admin/sentences?language_id=${selectedLangId}&level_id=${lvl.id}`}>
                        <Button variant="outline" size="sm">
                          Ayat
                        </Button>
                      </Link>
                      <Button variant="ghost" size="icon" onClick={() => handleOpenEdit(lvl)}>
                        <Pencil className="w-4 h-4" />
                      </Button>
                      <Button variant="ghost" size="icon" onClick={() => handleDelete(lvl.id)}>
                        <Trash2 className="w-4 h-4 text-destructive" />
                      </Button>
                    </TableCell>
                  </TableRow>
                ))}
                {levels.length === 0 && (
                  <TableRow>
                    <TableCell colSpan={3} className="text-center text-muted-foreground py-6">
                      Tiada level ditemui bagi bahasa ini.
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

export default function AdminLevelsPage() {
  return (
    <Suspense fallback={
      <div className="flex justify-center py-8">
        <Loader2 className="w-8 h-8 animate-spin text-primary" />
      </div>
    }>
      <LevelsContent />
    </Suspense>
  );
}
