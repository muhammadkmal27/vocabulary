"use client";

import { useEffect, useState } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Loader2, AlertCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useAuth } from "@/lib/auth";

interface TransactionRecord {
  id: string;
  user?: { name: string };
  invoice_id?: string;
  amount?: number;
  status?: string;
  created_at: string;
}

export default function AdminTransactionsPage() {
  const { token } = useAuth();
  const [transactions, setTransactions] = useState<TransactionRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  const fetchTransactions = async () => {
    if (!token) return;
    try {
      setLoading(true);
      setError("");
      const res = await fetch("/api/admin/transactions", {
        headers: {
          Authorization: `Bearer ${token}`,
          Accept: "application/json",
        },
      });
      if (!res.ok) throw new Error("Gagal mengambil senarai transaksi.");
      const data = await res.json();
      setTransactions(Array.isArray(data) ? data : data.data || []);
    } catch (err: any) {
      setError(err.message || "Ralat berlaku.");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchTransactions();
  }, [token]);

  if (loading) {
    return (
      <div className="p-6 flex justify-center items-center min-h-[40vh]">
        <Loader2 className="w-8 h-8 animate-spin text-primary" />
      </div>
    );
  }

  if (error) {
    return (
      <div className="p-6 flex flex-col items-center gap-3 min-h-[40vh] justify-center">
        <AlertCircle className="w-10 h-10 text-destructive" />
        <p className="text-sm text-muted-foreground">{error}</p>
        <Button onClick={fetchTransactions} variant="outline" size="sm">Cuba Semula</Button>
      </div>
    );
  }

  return (
    <div className="p-6 space-y-6">
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold">Transaksi</h1>
        <Badge variant="secondary">{transactions.length} rekod</Badge>
      </div>
      <Card>
        <CardContent className="p-0">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Invoice</TableHead>
                <TableHead>Pengguna</TableHead>
                <TableHead>Jumlah</TableHead>
                <TableHead>Status</TableHead>
                <TableHead>Tarikh</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {transactions.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={5} className="text-center py-8 text-muted-foreground">
                    Tiada transaksi ditemui.
                  </TableCell>
                </TableRow>
              ) : (
                transactions.map((t) => (
                  <TableRow key={t.id}>
                    <TableCell className="font-mono text-sm">
                      {t.invoice_id || t.id.substring(0, 12)}
                    </TableCell>
                    <TableCell>{t.user?.name || "-"}</TableCell>
                    <TableCell className="font-medium">
                      RM{typeof t.amount === "number" ? t.amount.toFixed(2) : t.amount || "0.00"}
                    </TableCell>
                    <TableCell>
                      <Badge variant={t.status === "paid" ? "default" : "secondary"}>
                        {t.status === "paid" ? "Dibayar" : t.status || "Tertunggak"}
                      </Badge>
                    </TableCell>
                    <TableCell className="text-sm text-muted-foreground">
                      {t.created_at ? new Date(t.created_at).toLocaleDateString("ms-MY") : "-"}
                    </TableCell>
                  </TableRow>
                ))
              )}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </div>
  );
}
