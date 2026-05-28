"use client";

import { useState, useEffect, useCallback } from "react";
import api from "@/lib/api";

interface Subscription {
  id: string;
  plan: { name: string; price_myr: number };
  stripe_status: string;
  auto_renew: boolean;
}

export function useSubscription() {
  const [subscription, setSubscription] = useState<Subscription | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  const fetchStatus = useCallback(async () => {
    try {
      const res = await api.get("/subscription/status");
      setSubscription(res.data.subscription);
    } catch {
      /* ignore */
    }
    setIsLoading(false);
  }, []);

  useEffect(() => {
    fetchStatus();
  }, [fetchStatus]);

  const createCheckout = useCallback(async (planId: string) => {
    const res = await api.post("/subscription/create-checkout", {
      plan_id: planId,
      success_url: window.location.origin + "/subscription?success=1",
      cancel_url: window.location.origin + "/pricing",
    });
    window.location.href = res.data.url;
  }, []);

  const toggleRenew = useCallback(async (subscriptionId: string) => {
    const res = await api.post("/subscription/toggle-renew", {
      subscription_id: subscriptionId,
    });
    setSubscription(res.data);
  }, []);

  return {
    subscription,
    isLoading,
    createCheckout,
    toggleRenew,
    refetch: fetchStatus,
  };
}
