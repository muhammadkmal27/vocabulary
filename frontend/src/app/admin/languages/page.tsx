"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
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
import { Plus, Pencil, Trash2, Search, Loader2 } from "lucide-react";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";

export default function AdminLanguagesPage() {
  const { token } = useAuth();
  const { toast, showConfirm } = useAlert();
  const [languages, setLanguages] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");

  // Create/Edit form state
  const [open, setOpen] = useState(false);
  const [editingLang, setEditingLang] = useState<any>(null);
  const [name, setName] = useState("");
  const [code, setCode] = useState("");
  const [flag, setFlag] = useState("");
  const [isActive, setIsActive] = useState(true);
  const [submitting, setSubmitting] = useState(false);

  const fetchLanguages = async () => {
    if (!token) return;
    try {
      setLoading(true);
      const res = await fetch("/api/admin/languages", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        const data = await res.json();
        setLanguages(data);
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

  const handleOpenCreate = () => {
    setEditingLang(null);
    setName("");
    setCode("");
    setFlag("");
    setIsActive(true);
    setOpen(true);
  };

  const handleOpenEdit = (lang: any) => {
    setEditingLang(lang);
    setName(lang.name);
    setCode(lang.code);
    setFlag(lang.flag || "");
    setIsActive(lang.is_active ?? true);
    setOpen(true);
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!name || !code) return;
    setSubmitting(true);
    try {
      const url = editingLang
        ? `/api/admin/languages/${editingLang.id}`
        : "/api/admin/languages";
      const method = editingLang ? "PUT" : "POST";
      const res = await fetch(url, {
        method,
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
          Accept: "application/json",
        },
        body: JSON.stringify({
          name,
          code,
          flag,
          is_active: isActive,
        }),
      });
      if (res.ok) {
        setOpen(false);
        fetchLanguages();
      } else {
        const errData = await res.json();
        toast(errData.message || "Gagal menyimpan bahasa.", "error");
      }
    } catch (err) {
      toast("Ralat menyambung ke pelayan.", "error");
    } finally {
      setSubmitting(false);
    }
  };

  const handleDelete = async (id: string) => {
    const confirmed = await showConfirm("Adakah anda pasti mahu memadam bahasa ini? Semua level dan ayat di bawahnya juga akan dipadam.");
    if (!confirmed) {
      return;
    }
    try {
      const res = await fetch(`/api/admin/languages/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        fetchLanguages();
      } else {
        toast("Gagal memadam bahasa.", "error");
      }
    } catch (err) {
      toast("Ralat menyambung ke pelayan.", "error");
    }
  };

  const filtered = languages.filter((l) =>
    l.name.toLowerCase().includes(search.toLowerCase()) ||
    l.code.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="p-6 space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">Bahasa</h1>
        <Dialog open={open} onOpenChange={setOpen}>
          <DialogTrigger render={<Button onClick={handleOpenCreate} />}>
            <Plus className="w-4 h-4 mr-2" /> Tambah Bahasa
          </DialogTrigger>
          <DialogContent className="sm:max-w-md">
            <DialogHeader>
              <DialogTitle>{editingLang ? "Edit Bahasa" : "Tambah Bahasa Baru"}</DialogTitle>
            </DialogHeader>
            <form onSubmit={handleSubmit} className="space-y-4 pt-2">
              <div className="space-y-2">
                <Label htmlFor="lang-name">Nama Bahasa</Label>
                <Input
                  id="lang-name"
                  placeholder="Contoh: German, Japanese"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  required
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="lang-code">Kod Bahasa (ISO)</Label>
                <Input
                  id="lang-code"
                  placeholder="Contoh: de, ja"
                  value={code}
                  onChange={(e) => setCode(e.target.value)}
                  required
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="lang-flag">Emoji Bendera</Label>
                <Input
                  id="lang-flag"
                  placeholder="Contoh: 🇩🇪, 🇯🇵"
                  value={flag}
                  onChange={(e) => setFlag(e.target.value)}
                />
              </div>
              <div className="flex items-center gap-2 pt-2">
                <input
                  type="checkbox"
                  id="lang-active"
                  checked={isActive}
                  onChange={(e) => setIsActive(e.target.checked)}
                  className="rounded border-gray-300"
                />
                <Label htmlFor="lang-active">Aktif dan boleh diakses</Label>
              </div>
              <Button type="submit" className="w-full" disabled={submitting}>
                {submitting ? "Menyimpan..." : "Simpan Bahasa"}
              </Button>
            </form>
          </DialogContent>
        </Dialog>
      </div>

      <Card>
        <CardHeader>
          <div className="flex items-center gap-4">
            <div className="relative flex-1">
              <Search className="w-4 h-4 absolute left-3 top-1/2 -translate-y-1/2 text-muted-foreground" />
              <Input
                placeholder="Cari bahasa..."
                className="pl-10"
                value={search}
                onChange={(e) => setSearch(e.target.value)}
              />
            </div>
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
                  <TableHead>Bendera</TableHead>
                  <TableHead>Kod</TableHead>
                  <TableHead>Nama</TableHead>
                  <TableHead>Status</TableHead>
                  <TableHead className="text-right">Tindakan</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {filtered.map((lang) => (
                  <TableRow key={lang.id}>
                    <TableCell className="text-2xl">{lang.flag || "🌐"}</TableCell>
                    <TableCell className="font-mono">{lang.code}</TableCell>
                    <TableCell className="font-medium">
                      <Link href={`/admin/levels?language_id=${lang.id}`} className="hover:underline text-primary font-semibold">
                        {lang.name}
                      </Link>
                    </TableCell>
                    <TableCell>
                      <Badge variant={lang.is_active ?? true ? "default" : "secondary"}>
                        {lang.is_active ?? true ? "Aktif" : "Tidak Aktif"}
                      </Badge>
                    </TableCell>
                    <TableCell className="text-right space-x-2">
                      <Button variant="ghost" size="icon" onClick={() => handleOpenEdit(lang)}>
                        <Pencil className="w-4 h-4" />
                      </Button>
                      <Button variant="ghost" size="icon" onClick={() => handleDelete(lang.id)}>
                        <Trash2 className="w-4 h-4 text-destructive" />
                      </Button>
                    </TableCell>
                  </TableRow>
                ))}
                {filtered.length === 0 && (
                  <TableRow>
                    <TableCell colSpan={5} className="text-center text-muted-foreground py-6">
                      Tiada bahasa ditemui.
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
