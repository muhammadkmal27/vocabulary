"use client";

import { useEffect, useState, useCallback } from "react";
import { UserRecipient, BroadcastRecord, RecipientsStats } from "./types";
import RecipientSelector from "./RecipientSelector";
import EmailComposer from "./EmailComposer";
import BroadcastHistory from "./BroadcastHistory";
import { useAuth } from "@/lib/auth";
import { useAlert } from "@/components/ui/AlertConfirmProvider";
import { Mail } from "lucide-react";

export default function AdminEmailsPage() {
  const { token } = useAuth();
  const { toast, showConfirm } = useAlert();

  const [recipientType, setRecipientType] = useState<string>("all");
  const [users, setUsers] = useState<UserRecipient[]>([]);
  const [selectedUserIds, setSelectedUserIds] = useState<string[]>([]);
  const [testEmail, setTestEmail] = useState<string>("saashouse.mail@gmail.com");
  const [loadingUsers, setLoadingUsers] = useState<boolean>(false);
  const [stats, setStats] = useState<RecipientsStats>({
    total: 0,
    total_all: 0,
    total_paid: 0,
    total_free: 0,
  });

  const [subject, setSubject] = useState<string>("");
  const [body, setBody] = useState<string>("");
  const [isSending, setIsSending] = useState<boolean>(false);

  const [history, setHistory] = useState<BroadcastRecord[]>([]);
  const [loadingHistory, setLoadingHistory] = useState<boolean>(false);

  const fetchUsers = useCallback(async () => {
    if (!token) return;
    try {
      setLoadingUsers(true);
      const res = await fetch("/api/admin/emails/recipients", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        const data = await res.json();
        setUsers(data.users || []);
        setStats({
          total: data.total ?? (data.users?.length || 0),
          total_all: data.total_all ?? (data.users?.length || 0),
          total_paid: data.total_paid ?? 0,
          total_free: data.total_free ?? 0,
        });
      }
    } catch {
      toast("Gagal memuatkan senarai pengguna.", "error");
    } finally {
      setLoadingUsers(false);
    }
  }, [token, toast]);

  const fetchHistory = useCallback(async () => {
    if (!token) return;
    try {
      setLoadingHistory(true);
      const res = await fetch("/api/admin/emails/history", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (res.ok) {
        const data = await res.json();
        setHistory(data || []);
      }
    } catch {
      // Silently fail for history
    } finally {
      setLoadingHistory(false);
    }
  }, [token]);

  useEffect(() => {
    fetchUsers();
    fetchHistory();
  }, [fetchUsers, fetchHistory]);

  const calculateTargetCount = () => {
    if (recipientType === "test") return 1;
    if (recipientType === "selected") return selectedUserIds.length;
    if (recipientType === "subscribed") return stats.total_paid;
    if (recipientType === "free") return stats.total_free;
    return stats.total_all || users.length;
  };

  const getTargetDescription = () => {
    if (recipientType === "test") return "alamat emel ujian (Admin Test)";
    if (recipientType === "selected") return `${selectedUserIds.length} orang pengguna pilihan`;
    if (recipientType === "subscribed") return `SEMUA (${stats.total_paid}) pengguna berbayar`;
    if (recipientType === "free") return `SEMUA (${stats.total_free}) pengguna percuma`;
    return `SEMUA (${stats.total_all}) pengguna berdaftar`;
  };

  const handleSendBroadcast = async () => {
    const targetCount = calculateTargetCount();
    if (!subject.trim() || !body.trim()) {
      toast("Sila lengkapkan subjek dan kandungan emel.", "error");
      return;
    }
    if (recipientType === "selected" && selectedUserIds.length === 0) {
      toast("Sila pilih sekurang-kurangnya seorang penerima.", "error");
      return;
    }
    if (targetCount === 0) {
      toast("Tiada penerima dijumpai dalam kumpulan sasaran ini.", "error");
      return;
    }

    const confirmed = await showConfirm(
      `Adakah anda pasti ingin menghantar emel ini kepada ${getTargetDescription()}? Emel akan dihantar terus dari saashouse.mail@gmail.com.`,
      "Sahkan Penghantaran Emel"
    );
    if (!confirmed) return;

    try {
      setIsSending(true);
      const payload: any = {
        subject: subject.trim(),
        body: body.trim(),
        recipient_type: recipientType,
      };

      if (recipientType === "selected") {
        payload.user_ids = selectedUserIds;
      } else if (recipientType === "test") {
        payload.test_email = testEmail.trim() || "saashouse.mail@gmail.com";
      }

      const res = await fetch("/api/admin/emails/send", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
        body: JSON.stringify(payload),
      });

      const data = await res.json();
      if (res.ok) {
        toast(data.message || "Emel berjaya dihantar!", "success");
        fetchHistory();
      } else {
        toast(data.message || "Gagal menghantar emel siaran.", "error");
      }
    } catch {
      toast("Ralat sambungan pelayan semasa menghantar emel.", "error");
    } finally {
      setIsSending(false);
    }
  };

  return (
    <div className="p-4 sm:p-8 max-w-5xl mx-auto space-y-6">
      {/* Title */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 border-b pb-4">
        <div>
          <h1 className="text-2xl font-bold flex items-center gap-2">
            <Mail className="w-6 h-6 text-primary" /> Hantar Emel Pengguna (Broadcast)
          </h1>
          <p className="text-xs sm:text-sm text-muted-foreground mt-0.5">
            Hantar hebahan atau pengumuman rasmi kepada semua pengguna, pengguna berbayar sahaja, atau pengguna pilihan.
          </p>
        </div>
      </div>

      {/* Step 1: Pilih Sasaran */}
      <section className="space-y-2">
        <h2 className="text-sm font-bold uppercase tracking-wider text-muted-foreground flex items-center gap-2">
          <span>Langkah 1:</span> Pilih Kumpulan Sasaran
        </h2>
        <RecipientSelector
          recipientType={recipientType}
          setRecipientType={setRecipientType}
          users={users}
          selectedUserIds={selectedUserIds}
          setSelectedUserIds={setSelectedUserIds}
          testEmail={testEmail}
          setTestEmail={setTestEmail}
          loadingUsers={loadingUsers}
          stats={stats}
        />
      </section>

      {/* Step 2: Karang Mesej */}
      <section className="space-y-2">
        <h2 className="text-sm font-bold uppercase tracking-wider text-muted-foreground flex items-center gap-2">
          <span>Langkah 2:</span> Karang Subjek & Kandungan Emel
        </h2>
        <EmailComposer
          subject={subject}
          setSubject={setSubject}
          body={body}
          setBody={setBody}
          onSend={handleSendBroadcast}
          isSending={isSending}
          totalTargetCount={calculateTargetCount()}
        />
      </section>

      {/* Step 3: Sejarah */}
      <section className="space-y-2">
        <h2 className="text-sm font-bold uppercase tracking-wider text-muted-foreground flex items-center gap-2">
          <span>Rekod:</span> Sejarah Penghantaran
        </h2>
        <BroadcastHistory
          history={history}
          loadingHistory={loadingHistory}
          onRefresh={fetchHistory}
        />
      </section>
    </div>
  );
}
