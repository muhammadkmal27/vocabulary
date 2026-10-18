"use client";

import { useEffect, useState, useCallback } from "react";
import { Card, CardContent, CardFooter } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Pencil, Ban, Loader2, AlertCircle, ChevronLeft, ChevronRight, Search } from "lucide-react";
import { useAuth } from "@/lib/auth";

interface UserRecord {
  id: string;
  name: string;
  email: string;
  role: string;
  subscribed?: boolean;
  subscription_source?: string;
  created_at: string;
}

export default function AdminUsersPage() {
  const { token } = useAuth();
  const [users, setUsers] = useState<UserRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Pagination & Search States
  const [currentPage, setCurrentPage] = useState(1);
  const [perPage, setPerPage] = useState(50);
  const [lastPage, setLastPage] = useState(1);
  const [totalUsers, setTotalUsers] = useState(0);
  const [search, setSearch] = useState("");
  const [searchInput, setSearchInput] = useState("");

  const fetchUsers = useCallback(
    async (page = 1, query = search, limit = perPage) => {
      if (!token) return;
      try {
        setLoading(true);
        setError("");
        const params = new URLSearchParams({
          page: page.toString(),
          per_page: limit.toString(),
        });
        if (query.trim()) {
          params.append("search", query.trim());
        }
        const res = await fetch(`/api/admin/users?${params.toString()}`, {
          headers: {
            Authorization: `Bearer ${token}`,
            Accept: "application/json",
          },
        });
        if (!res.ok) throw new Error("Gagal mengambil senarai pengguna.");
        const data = await res.json();

        if (Array.isArray(data)) {
          setUsers(data);
          setTotalUsers(data.length);
          setLastPage(1);
          setCurrentPage(1);
        } else {
          setUsers(data.data || []);
          setTotalUsers(data.total ?? (data.data?.length || 0));
          setLastPage(data.last_page ?? 1);
          setCurrentPage(data.current_page ?? page);
        }
      } catch (err: any) {
        setError(err.message || "Ralat berlaku.");
      } finally {
        setLoading(false);
      }
    },
    [token, search, perPage]
  );

  useEffect(() => {
    fetchUsers(currentPage, search, perPage);
  }, [fetchUsers, currentPage, search, perPage]);

  const handleSearchSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setCurrentPage(1);
    setSearch(searchInput);
  };

  const handleSearchClear = () => {
    setSearchInput("");
    setSearch("");
    setCurrentPage(1);
  };

  const from = totalUsers === 0 ? 0 : (currentPage - 1) * perPage + 1;
  const to = Math.min(currentPage * perPage, totalUsers);

  if (loading && users.length === 0) {
    return (
      <div className="p-6 flex justify-center items-center min-h-[40vh]">
        <Loader2 className="w-8 h-8 animate-spin text-primary" />
      </div>
    );
  }

  if (error && users.length === 0) {
    return (
      <div className="p-6 flex flex-col items-center gap-3 min-h-[40vh] justify-center">
        <AlertCircle className="w-10 h-10 text-destructive" />
        <p className="text-sm text-muted-foreground">{error}</p>
        <Button onClick={() => fetchUsers(currentPage, search, perPage)} variant="outline" size="sm">
          Cuba Semula
        </Button>
      </div>
    );
  }

  return (
    <div className="p-6 space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold">Pengguna</h1>
          <p className="text-sm text-muted-foreground">Pengurusan dan senarai lengkap ahli platform.</p>
        </div>
        <div className="flex items-center gap-3">
          <Badge variant="secondary" className="text-sm px-3 py-1">
            {totalUsers} pengguna
          </Badge>
          <select
            value={perPage}
            onChange={(e) => {
              setPerPage(Number(e.target.value));
              setCurrentPage(1);
            }}
            className="text-xs bg-background border border-input rounded-md px-2 py-1.5 focus:outline-none focus:ring-1 focus:ring-primary"
            aria-label="Bilangan pengguna setiap halaman"
          >
            <option value={20}>20 setiap halaman</option>
            <option value={50}>50 setiap halaman</option>
            <option value={100}>100 setiap halaman</option>
          </select>
        </div>
      </div>

      {/* Search Bar */}
      <form onSubmit={handleSearchSubmit} className="flex gap-2 max-w-md">
        <div className="relative flex-1">
          <Search className="w-4 h-4 absolute left-3 top-1/2 -translate-y-1/2 text-muted-foreground" />
          <Input
            placeholder="Cari nama atau email..."
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            className="pl-9"
          />
        </div>
        <Button type="submit" size="sm">
          Cari
        </Button>
        {search && (
          <Button type="button" variant="outline" size="sm" onClick={handleSearchClear}>
            Reset
          </Button>
        )}
      </form>

      <Card>
        <CardContent className="p-0">
          <div className="relative">
            {loading && (
              <div className="absolute inset-0 bg-background/50 backdrop-blur-[1px] flex items-center justify-center z-10">
                <Loader2 className="w-6 h-6 animate-spin text-primary" />
              </div>
            )}
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Nama</TableHead>
                  <TableHead>Email</TableHead>
                  <TableHead>Peranan</TableHead>
                  <TableHead>Langganan</TableHead>
                  <TableHead>Sumber / Jenis</TableHead>
                  <TableHead>Tarikh Daftar</TableHead>
                  <TableHead className="text-right">Tindakan</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {users.length === 0 ? (
                  <TableRow>
                    <TableCell colSpan={7} className="text-center py-8 text-muted-foreground">
                      {search ? "Tiada pengguna ditemui dengan carian ini." : "Tiada pengguna ditemui."}
                    </TableCell>
                  </TableRow>
                ) : (
                  users.map((u) => (
                    <TableRow key={u.id}>
                      <TableCell className="font-medium">{u.name}</TableCell>
                      <TableCell>{u.email}</TableCell>
                      <TableCell>
                        <Badge variant={u.role === "admin" ? "default" : "secondary"}>
                          {u.role}
                        </Badge>
                      </TableCell>
                      <TableCell>
                        <Badge variant={u.subscribed ? "default" : "secondary"}>
                          {u.subscribed ? "Aktif" : "Tiada"}
                        </Badge>
                      </TableCell>
                      <TableCell>
                        <Badge
                          variant={
                            u.subscription_source && u.subscription_source !== "Tiada"
                              ? "default"
                              : "secondary"
                          }
                        >
                          {u.subscription_source || "Tiada"}
                        </Badge>
                      </TableCell>
                      <TableCell className="text-sm text-muted-foreground">
                        {u.created_at ? new Date(u.created_at).toLocaleDateString("ms-MY") : "-"}
                      </TableCell>
                      <TableCell className="text-right space-x-2">
                        <Button variant="ghost" size="icon">
                          <Pencil className="w-4 h-4" />
                        </Button>
                        <Button variant="ghost" size="icon">
                          <Ban className="w-4 h-4 text-destructive" />
                        </Button>
                      </TableCell>
                    </TableRow>
                  ))
                )}
              </TableBody>
            </Table>
          </div>
        </CardContent>

        {/* Pagination Footer */}
        {totalUsers > 0 && (
          <CardFooter className="flex flex-col sm:flex-row items-center justify-between gap-4 p-4 border-t border-border">
            <p className="text-xs text-muted-foreground">
              Menunjukkan <span className="font-medium text-foreground">{from}</span> hingga{" "}
              <span className="font-medium text-foreground">{to}</span> daripada{" "}
              <span className="font-medium text-foreground">{totalUsers}</span> pengguna
            </p>

            <div className="flex items-center gap-2">
              <span className="text-xs text-muted-foreground mr-2">
                Halaman {currentPage} daripada {lastPage}
              </span>
              <Button
                variant="outline"
                size="sm"
                onClick={() => setCurrentPage((p) => Math.max(1, p - 1))}
                disabled={currentPage <= 1 || loading}
              >
                <ChevronLeft className="w-4 h-4 mr-1" />
                Sebelumnya
              </Button>
              <Button
                variant="outline"
                size="sm"
                onClick={() => setCurrentPage((p) => Math.min(lastPage, p + 1))}
                disabled={currentPage >= lastPage || loading}
              >
                Seterusnya
                <ChevronRight className="w-4 h-4 ml-1" />
              </Button>
            </div>
          </CardFooter>
        )}
      </Card>
    </div>
  );
}
