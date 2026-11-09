"use client";

import { useState } from "react";
import { UserRecipient, RecipientsStats } from "./types";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Search, Users, UserCheck, ShieldCheck, Mail, Sparkles, CheckSquare, Square } from "lucide-react";

interface RecipientSelectorProps {
  recipientType: string;
  setRecipientType: (val: string) => void;
  users: UserRecipient[];
  selectedUserIds: string[];
  setSelectedUserIds: (ids: string[]) => void;
  testEmail: string;
  setTestEmail: (val: string) => void;
  loadingUsers: boolean;
  stats: RecipientsStats;
}

export default function RecipientSelector({
  recipientType,
  setRecipientType,
  users,
  selectedUserIds,
  setSelectedUserIds,
  testEmail,
  setTestEmail,
  loadingUsers,
  stats,
}: RecipientSelectorProps) {
  const [searchTerm, setSearchTerm] = useState("");
  const [userFilter, setUserFilter] = useState<"all" | "paid" | "free">("all");

  const filteredUsers = users.filter((u) => {
    const term = searchTerm.toLowerCase();
    const matchesSearch =
      (u.name && u.name.toLowerCase().includes(term)) ||
      (u.email && u.email.toLowerCase().includes(term));

    if (!matchesSearch) return false;
    if (userFilter === "paid") return !!u.subscribed;
    if (userFilter === "free") return !u.subscribed;
    return true;
  });

  const toggleUser = (id: string) => {
    if (selectedUserIds.includes(id)) {
      setSelectedUserIds(selectedUserIds.filter((item) => item !== id));
    } else {
      setSelectedUserIds([...selectedUserIds, id]);
    }
  };

  const handleSelectAll = () => {
    setSelectedUserIds(filteredUsers.map((u) => u.id));
  };

  const handleDeselectAll = () => {
    setSelectedUserIds([]);
  };

  const TYPE_OPTIONS = [
    {
      id: "all",
      label: "Semua Pengguna",
      icon: Users,
      count: stats.total_all,
      desc: "Hantar ke semua pengguna berdaftar",
    },
    {
      id: "subscribed",
      label: "Semua User Berbayar Sahaja",
      icon: Sparkles,
      count: stats.total_paid,
      desc: "Hanya pengguna langganan aktif / berbayar",
      highlight: true,
    },
    {
      id: "selected",
      label: "Pengguna Pilihan Sendiri",
      icon: UserCheck,
      count: selectedUserIds.length,
      desc: "Tanda secara manual daripada senarai",
    },
    {
      id: "free",
      label: "Pengguna Percuma Sahaja",
      icon: ShieldCheck,
      count: stats.total_free,
      desc: "Pengguna tanpa langganan aktif",
    },
    {
      id: "test",
      label: "Emel Ujian (Admin Test)",
      icon: Mail,
      count: 1,
      desc: "Hantar ke saashouse.mail@gmail.com",
    },
  ];

  return (
    <div className="space-y-4">
      {/* Pilihan Kad Kumpulan Sasaran */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
        {TYPE_OPTIONS.map((opt) => {
          const Icon = opt.icon;
          const isSelected = recipientType === opt.id;
          return (
            <button
              key={opt.id}
              type="button"
              onClick={() => setRecipientType(opt.id)}
              className={`text-left p-3.5 rounded-xl border transition-all flex flex-col justify-between gap-2 ${
                isSelected
                  ? opt.highlight
                    ? "border-amber-500 bg-amber-500/10 shadow-sm ring-2 ring-amber-500/50"
                    : "border-primary bg-primary/10 shadow-sm ring-2 ring-primary/50"
                  : "border-border bg-card hover:bg-muted/50"
              }`}
            >
              <div className="flex items-center justify-between gap-2">
                <div className="flex items-center gap-2 font-semibold text-sm">
                  <Icon
                    className={`w-4 h-4 ${
                      isSelected
                        ? opt.highlight
                          ? "text-amber-500"
                          : "text-primary"
                        : "text-muted-foreground"
                    }`}
                  />
                  <span>{opt.label}</span>
                </div>
                <Badge
                  variant={isSelected ? (opt.highlight ? "default" : "secondary") : "outline"}
                  className={`text-xs font-mono ${
                    isSelected && opt.highlight ? "bg-amber-600 text-black font-bold" : ""
                  }`}
                >
                  {opt.count} orang
                </Badge>
              </div>
              <p className="text-xs text-muted-foreground line-clamp-1">{opt.desc}</p>
            </button>
          );
        })}
      </div>

      {/* Input Emel Ujian */}
      {recipientType === "test" && (
        <div className="p-4 rounded-xl border border-border bg-card space-y-2">
          <label className="text-sm font-semibold flex items-center gap-2">
            <Mail className="w-4 h-4 text-primary" /> Alamat Emel Ujian:
          </label>
          <Input
            value={testEmail}
            onChange={(e) => setTestEmail(e.target.value)}
            placeholder="saashouse.mail@gmail.com"
            className="max-w-md font-mono text-sm"
          />
          <p className="text-xs text-muted-foreground">
            Emel percubaan ini hanya akan dihantar ke alamat di atas untuk mengesahkan susun atur sebelum siaran dibuat kepada pengguna sebenar.
          </p>
        </div>
      )}

      {/* Pemilihan Pengguna Manual */}
      {recipientType === "selected" && (
        <div className="p-4 rounded-xl border border-border bg-card space-y-3">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
            <div className="flex items-center gap-2 flex-1 max-w-md">
              <div className="relative flex-1">
                <Search className="w-4 h-4 absolute left-3 top-2.5 text-muted-foreground" />
                <Input
                  placeholder="Cari nama atau emel..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-9 h-9 text-sm"
                />
              </div>
              <select
                value={userFilter}
                onChange={(e: any) => setUserFilter(e.target.value)}
                className="h-9 px-2 text-xs rounded-md border border-input bg-background"
              >
                <option value="all">Semua</option>
                <option value="paid">💎 Berbayar Sahaja</option>
                <option value="free">Percuma Sahaja</option>
              </select>
            </div>
            <div className="flex items-center gap-2">
              <Button type="button" variant="outline" size="sm" onClick={handleSelectAll}>
                Pilih Semua ({filteredUsers.length})
              </Button>
              <Button type="button" variant="ghost" size="sm" onClick={handleDeselectAll}>
                Nyahpilih
              </Button>
              <Badge variant="secondary" className="font-mono">
                {selectedUserIds.length} Dipilih
              </Badge>
            </div>
          </div>

          {loadingUsers ? (
            <p className="text-xs text-muted-foreground py-4 text-center">Memuatkan senarai pengguna...</p>
          ) : filteredUsers.length === 0 ? (
            <p className="text-xs text-muted-foreground py-4 text-center">Tiada pengguna ditemui.</p>
          ) : (
            <div className="max-h-64 overflow-y-auto space-y-1 divide-y divide-border border rounded-lg p-2 bg-background">
              {filteredUsers.map((u) => {
                const isChecked = selectedUserIds.includes(u.id);
                return (
                  <label
                    key={u.id}
                    className="flex items-center justify-between p-2 rounded cursor-pointer hover:bg-muted/50 text-sm gap-2"
                  >
                    <div className="flex items-center gap-2.5 min-w-0">
                      <input
                        type="checkbox"
                        checked={isChecked}
                        onChange={() => toggleUser(u.id)}
                        className="rounded border-input text-primary focus:ring-primary h-4 w-4"
                      />
                      <div className="min-w-0">
                        <div className="font-medium truncate flex items-center gap-1.5">
                          <span>{u.name || "Tanpa Nama"}</span>
                          {u.subscribed ? (
                            <Badge className="bg-amber-500/15 text-amber-500 hover:bg-amber-500/20 text-[10px] py-0 px-1 border border-amber-500/30">
                              💎 Berbayar
                            </Badge>
                          ) : (
                            <Badge variant="outline" className="text-[10px] py-0 px-1 text-muted-foreground">
                              Percuma
                            </Badge>
                          )}
                        </div>
                        <div className="text-xs text-muted-foreground truncate">{u.email}</div>
                      </div>
                    </div>
                    {u.role === "admin" && (
                      <Badge variant="outline" className="text-[10px] py-0">Admin</Badge>
                    )}
                  </label>
                );
              })}
            </div>
          )}
        </div>
      )}
    </div>
  );
}
