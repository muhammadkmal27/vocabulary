"use client";

import { BroadcastRecord } from "./types";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { CheckCircle2, AlertCircle, Clock, RotateCw } from "lucide-react";

interface BroadcastHistoryProps {
  history: BroadcastRecord[];
  loadingHistory: boolean;
  onRefresh: () => void;
}

export default function BroadcastHistory({
  history,
  loadingHistory,
  onRefresh,
}: BroadcastHistoryProps) {
  const getStatusBadge = (status: string) => {
    switch (status) {
      case "completed":
        return (
          <Badge className="bg-emerald-600 hover:bg-emerald-600 text-white gap-1 text-[11px]">
            <CheckCircle2 className="w-3 h-3" /> Selesai
          </Badge>
        );
      case "partial":
        return (
          <Badge className="bg-amber-600 hover:bg-amber-600 text-black gap-1 text-[11px]">
            <AlertCircle className="w-3 h-3" /> Separa
          </Badge>
        );
      default:
        return (
          <Badge variant="destructive" className="gap-1 text-[11px]">
            <AlertCircle className="w-3 h-3" /> Gagal
          </Badge>
        );
    }
  };

  const formatRecipientType = (type: string) => {
    switch (type) {
      case "all":
        return "Semua Pengguna";
      case "selected":
        return "Pengguna Terpilih";
      case "subscribed":
        return "Pelanggan Premium";
      case "free":
        return "Pengguna Percuma";
      case "test":
        return "Ujian Admin";
      default:
        return type;
    }
  };

  return (
    <div className="p-5 rounded-2xl border border-border bg-card space-y-4">
      <div className="flex items-center justify-between">
        <h3 className="font-bold text-base flex items-center gap-2">
          <Clock className="w-4 h-4 text-primary" /> Sejarah Emel Siaran
        </h3>
        <Button
          type="button"
          variant="ghost"
          size="sm"
          className="h-8 gap-1.5 text-xs text-muted-foreground"
          onClick={onRefresh}
          disabled={loadingHistory}
        >
          <RotateCw className={`w-3.5 h-3.5 ${loadingHistory ? "animate-spin" : ""}`} />
          Muat Semula
        </Button>
      </div>

      {loadingHistory ? (
        <p className="text-xs text-muted-foreground py-6 text-center">Memuatkan sejarah emel...</p>
      ) : history.length === 0 ? (
        <p className="text-xs text-muted-foreground py-6 text-center">Belum ada rekod emel siaran dihantar.</p>
      ) : (
        <div className="overflow-x-auto">
          <table className="w-full text-left text-xs">
            <thead className="bg-muted/50 border-b text-muted-foreground">
              <tr>
                <th className="py-2.5 px-3 font-semibold">Subjek</th>
                <th className="py-2.5 px-3 font-semibold">Sasaran</th>
                <th className="py-2.5 px-3 font-semibold text-center">Penerima</th>
                <th className="py-2.5 px-3 font-semibold text-center">Berjaya / Gagal</th>
                <th className="py-2.5 px-3 font-semibold text-center">Status</th>
                <th className="py-2.5 px-3 font-semibold text-right">Tarikh & Masa</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border">
              {history.map((item) => (
                <tr key={item.id} className="hover:bg-muted/30 transition-colors">
                  <td className="py-2.5 px-3 font-medium max-w-[200px] truncate" title={item.subject}>
                    {item.subject}
                  </td>
                  <td className="py-2.5 px-3 text-muted-foreground">
                    {formatRecipientType(item.recipient_type)}
                  </td>
                  <td className="py-2.5 px-3 text-center font-mono">
                    {item.total_recipients}
                  </td>
                  <td className="py-2.5 px-3 text-center">
                    <span className="text-emerald-500 font-semibold">{item.sent_count}</span>
                    <span className="text-muted-foreground"> / </span>
                    <span className={item.failed_count > 0 ? "text-destructive font-semibold" : "text-muted-foreground"}>
                      {item.failed_count}
                    </span>
                  </td>
                  <td className="py-2.5 px-3 text-center">
                    {getStatusBadge(item.status)}
                  </td>
                  <td className="py-2.5 px-3 text-right text-muted-foreground whitespace-nowrap">
                    {new Date(item.created_at).toLocaleString("ms-MY", {
                      day: "numeric",
                      month: "short",
                      year: "numeric",
                      hour: "2-digit",
                      minute: "2-digit",
                    })}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
