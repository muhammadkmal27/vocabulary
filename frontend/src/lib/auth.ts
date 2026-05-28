"use client";

import React, { useState, useEffect, useCallback } from "react";

const Ctx = React.createContext<any>(null);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<any>(null);
  const [token, setToken] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    try {
      const t = localStorage.getItem("auth-token");
      const u = localStorage.getItem("auth-user");
      if (t && u) {
        setToken(t);
        setUser(JSON.parse(u));
      }
    } catch {}
    setIsLoading(false);
  }, []);

  const login = useCallback(async (email: string, password: string, turnstileToken?: string) => {
    const res = await (
      await fetch("/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password, "cf-turnstile-response": turnstileToken }),
      })
    ).json();
    setToken(res.token);
    setUser(res.user);
    localStorage.setItem("auth-token", res.token);
    localStorage.setItem("auth-user", JSON.stringify(res.user));
  }, []);

  const register = useCallback(
    async (name: string, email: string, password: string, pw2: string, turnstileToken?: string) => {
      const res = await (
        await fetch("/api/register", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            name,
            email,
            password,
            password_confirmation: pw2,
            "cf-turnstile-response": turnstileToken,
          }),
        })
      ).json();
      setToken(res.token);
      setUser(res.user);
      localStorage.setItem("auth-token", res.token);
      localStorage.setItem("auth-user", JSON.stringify(res.user));
    },
    [],
  );

  const logout = useCallback(() => {
    fetch("/api/logout", { method: "POST" }).catch(() => {});
    localStorage.removeItem("auth-token");
    localStorage.removeItem("auth-user");
    setUser(null);
    setToken(null);
  }, []);

  const updateUser = useCallback((updatedUser: any) => {
    setUser(updatedUser);
    localStorage.setItem("auth-user", JSON.stringify(updatedUser));
  }, []);

  return React.createElement(
    Ctx.Provider,
    { value: { user, token, isLoading, login, register, logout, updateUser } },
    children,
  );
}

export function useAuth() {
  const ctx = React.useContext(Ctx);
  if (!ctx) throw new Error("useAuth must be used within AuthProvider");
  return ctx;
}
