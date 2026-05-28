"use client";

import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { useAuth } from "@/lib/auth";
import {
  Brain,
  LayoutDashboard,
  Languages,
  Layers,
  BookOpen,
  CreditCard,
  Ticket,
  Users,
  Receipt,
  LogOut,
  ChevronLeft,
} from "lucide-react";
import { Badge } from "@/components/ui/badge";

const NAV_ITEMS = [
  { href: "/admin/dashboard", label: "Dashboard", icon: LayoutDashboard },
  { href: "/admin/languages", label: "Bahasa", icon: Languages },
  { href: "/admin/levels", label: "Level", icon: Layers },
  { href: "/admin/sentences", label: "Ayat", icon: BookOpen },
  { href: "/admin/plans", label: "Plan Harga", icon: CreditCard },
  { href: "/admin/coupons", label: "Kupon", icon: Ticket },
  { href: "/admin/users", label: "Pengguna", icon: Users },
  { href: "/admin/transactions", label: "Transaksi", icon: Receipt },
];

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const pathname = usePathname();
  const router = useRouter();
  const { logout } = useAuth();

  const handleLogout = () => {
    logout();
    router.push("/login");
  };

  return (
    <div className="min-h-screen bg-background flex">
      {/* Sidebar */}
      <aside className="w-64 border-r border-border bg-card hidden lg:flex flex-col shrink-0">
        <div className="p-5 border-b border-border">
          <Link href="/admin/dashboard" className="flex items-center gap-2">
            <Brain className="w-6 h-6 text-primary" />
            <span className="font-bold text-lg">Vocabulary</span>
            <Badge variant="secondary" className="ml-auto text-xs">
              Admin
            </Badge>
          </Link>
        </div>
        <nav className="flex-1 p-3 space-y-1 overflow-y-auto">
          {NAV_ITEMS.map(({ href, label, icon: Icon }) => {
            const isActive = pathname === href;
            return (
              <Link key={href} href={href}>
                <Button
                  variant={isActive ? "secondary" : "ghost"}
                  className="w-full justify-start"
                  size="sm"
                >
                  <Icon className="w-4 h-4 mr-3" />
                  {label}
                </Button>
              </Link>
            );
          })}
        </nav>
        <div className="p-3 border-t border-border space-y-1">
          <Link href="/">
            <Button variant="ghost" className="w-full justify-start" size="sm">
              <ChevronLeft className="w-4 h-4 mr-3" /> Ke App Utama
            </Button>
          </Link>
          <Button
            variant="ghost"
            className="w-full justify-start text-destructive hover:text-destructive"
            size="sm"
            onClick={handleLogout}
          >
            <LogOut className="w-4 h-4 mr-3" /> Log Keluar
          </Button>
        </div>
      </aside>

      {/* Content */}
      <main className="flex-1 pb-24 overflow-x-hidden">{children}</main>
    </div>
  );
}
