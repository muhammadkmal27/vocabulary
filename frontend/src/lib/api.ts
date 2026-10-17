const getToken = () =>
  typeof window !== "undefined" ? localStorage.getItem("auth-token") : null;

const getUrl = (url: string) => {
  if (url.startsWith("http") || url.startsWith("/api")) return url;
  return `/api${url.startsWith("/") ? "" : "/"}${url}`;
};

const handleAuthError = (status: number) => {
  if (status === 401 && typeof window !== "undefined") {
    localStorage.removeItem("auth-token");
    localStorage.removeItem("auth-user");
    if (!window.location.pathname.startsWith("/login")) {
      const redirect = encodeURIComponent(window.location.pathname + window.location.search);
      window.location.href = `/login?redirect=${redirect}`;
    }
  }
};

const api = {
  get: async (url: string) => {
    const res = await fetch(getUrl(url), {
      headers: {
        Accept: "application/json",
        Authorization: getToken() ? "Bearer " + getToken() : "",
      },
    });
    handleAuthError(res.status);
    return res.json();
  },
  post: async (url: string, data?: any) => {
    const res = await fetch(getUrl(url), {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: getToken() ? "Bearer " + getToken() : "",
      },
      body: data ? JSON.stringify(data) : undefined,
    });
    handleAuthError(res.status);
    return res.json();
  },
  put: async (url: string, data?: any) => {
    const res = await fetch(getUrl(url), {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        Authorization: getToken() ? "Bearer " + getToken() : "",
      },
      body: data ? JSON.stringify(data) : undefined,
    });
    handleAuthError(res.status);
    return res.json();
  },
};

export default api;
