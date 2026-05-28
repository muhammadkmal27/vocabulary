"use client";

import React, { createContext, useContext, useState, useCallback } from "react";
import { CheckCircle2, AlertTriangle, Info, X, ShieldAlert } from "lucide-react";
import { Button } from "@/components/ui/button";

type ToastType = "success" | "error" | "info";

interface Toast {
  id: string;
  message: string;
  type: ToastType;
}

interface DialogState {
  isOpen: boolean;
  title: string;
  message: string;
  type: "alert" | "confirm";
  resolve: ((value: boolean) => void) | null;
}

interface AlertConfirmContextType {
  toast: (message: string, type?: ToastType) => void;
  showAlert: (message: string, title?: string) => Promise<boolean>;
  showConfirm: (message: string, title?: string) => Promise<boolean>;
}

const AlertConfirmContext = createContext<AlertConfirmContextType | undefined>(undefined);

export function AlertConfirmProvider({ children }: { children: React.ReactNode }) {
  const [toasts, setToasts] = useState<Toast[]>([]);
  const [dialog, setDialog] = useState<DialogState>({
    isOpen: false,
    title: "",
    message: "",
    type: "alert",
    resolve: null,
  });

  const toast = useCallback((message: string, type: ToastType = "info") => {
    const id = Math.random().toString(36).substring(2, 9);
    setToasts((prev) => [...prev, { id, message, type }]);
    setTimeout(() => {
      setToasts((prev) => prev.filter((t) => t.id !== id));
    }, 4000);
  }, []);

  const removeToast = useCallback((id: string) => {
    setToasts((prev) => prev.filter((t) => t.id !== id));
  }, []);

  const showAlert = useCallback((message: string, title = "Maklumat") => {
    return new Promise<boolean>((resolve) => {
      setDialog({
        isOpen: true,
        title,
        message,
        type: "alert",
        resolve,
      });
    });
  }, []);

  const showConfirm = useCallback((message: string, title = "Pengesahan") => {
    return new Promise<boolean>((resolve) => {
      setDialog({
        isOpen: true,
        title,
        message,
        type: "confirm",
        resolve,
      });
    });
  }, []);

  const handleCloseDialog = (value: boolean) => {
    if (dialog.resolve) {
      dialog.resolve(value);
    }
    setDialog((prev) => ({ ...prev, isOpen: false, resolve: null }));
  };

  return (
    <AlertConfirmContext.Provider value={{ toast, showAlert, showConfirm }}>
      {children}

      {/* Toast Notification Stack */}
      <div className="fixed bottom-4 right-4 z-50 flex flex-col gap-2 max-w-sm w-full p-4 pointer-events-none">
        {toasts.map((t) => (
          <div
            key={t.id}
            className={`pointer-events-auto flex items-center justify-between gap-3 px-4 py-3 rounded-xl border bg-background/95 backdrop-blur-md shadow-lg duration-200 animate-in fade-in slide-in-from-bottom-2 ${
              t.type === "success"
                ? "text-emerald-950 dark:text-emerald-50 border-emerald-500/20"
                : t.type === "error"
                ? "text-rose-950 dark:text-rose-50 border-rose-500/20"
                : "text-blue-950 dark:text-blue-50 border-blue-500/20"
            }`}
          >
            <div className="flex items-center gap-2.5">
              {t.type === "success" && <CheckCircle2 className="size-5 text-emerald-500 shrink-0" />}
              {t.type === "error" && <ShieldAlert className="size-5 text-rose-500 shrink-0" />}
              {t.type === "info" && <Info className="size-5 text-blue-500 shrink-0" />}
              <span className="text-sm font-medium leading-tight">{t.message}</span>
            </div>
            <button
              onClick={() => removeToast(t.id)}
              className="text-muted-foreground hover:text-foreground transition-colors p-0.5"
            >
              <X className="size-4" />
            </button>
          </div>
        ))}
      </div>

      {/* Custom Dialog Modal */}
      {dialog.isOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          {/* Overlay */}
          <div
            className="absolute inset-0 bg-black/40 backdrop-blur-xs animate-in fade-in duration-150"
            onClick={() => {
              if (dialog.type === "alert") handleCloseDialog(true);
            }}
          />

          {/* Modal Container */}
          <div className="relative w-full max-w-md bg-popover border border-border shadow-2xl rounded-2xl p-6 overflow-hidden animate-in fade-in zoom-in-95 duration-200">
            <div className="flex gap-4">
              <div
                className={`p-3 rounded-full h-fit ${
                  dialog.type === "confirm" ? "bg-amber-100 text-amber-600 dark:bg-amber-950/50 dark:text-amber-400" : "bg-blue-100 text-blue-600 dark:bg-blue-950/50 dark:text-blue-400"
                }`}
              >
                {dialog.type === "confirm" ? (
                  <AlertTriangle className="size-6 shrink-0" />
                ) : (
                  <Info className="size-6 shrink-0" />
                )}
              </div>
              <div className="flex-1 space-y-2">
                <h3 className="text-lg font-semibold tracking-tight text-foreground">{dialog.title}</h3>
                <p className="text-sm text-muted-foreground leading-relaxed whitespace-pre-wrap">{dialog.message}</p>
              </div>
            </div>

            <div className="mt-6 flex justify-end gap-3">
              {dialog.type === "confirm" ? (
                <>
                  <Button variant="outline" size="default" onClick={() => handleCloseDialog(false)}>
                    Batal
                  </Button>
                  <Button
                    variant="default"
                    size="default"
                    className="bg-primary text-primary-foreground"
                    onClick={() => handleCloseDialog(true)}
                  >
                    Teruskan
                  </Button>
                </>
              ) : (
                <Button variant="default" size="default" onClick={() => handleCloseDialog(true)}>
                  OK
                </Button>
              )}
            </div>
          </div>
        </div>
      )}
    </AlertConfirmContext.Provider>
  );
}

export function useAlert() {
  const context = useContext(AlertConfirmContext);
  if (!context) {
    throw new Error("useAlert must be used within an AlertConfirmProvider");
  }
  return context;
}
