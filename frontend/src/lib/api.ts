const getToken = () =>
  typeof window !== "undefined" ? localStorage.getItem("auth-token") : null;

const getUrl = (url: string) => {
  if (url.startsWith("http") || url.startsWith("/api")) return url;
  return `/api${url.startsWith("/") ? "" : "/"}${url}`;
};

const api = {
  get: (url: string) =>
    fetch(getUrl(url), {
      headers: { Authorization: getToken() ? "Bearer " + getToken() : "" },
    }).then((r) => r.json()),
  post: async (url: string, data?: any) => {
    const res = await fetch(getUrl(url), {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: getToken() ? "Bearer " + getToken() : "",
      },
      body: data ? JSON.stringify(data) : undefined,
    });
    if (res.status === 401 && typeof window !== "undefined") {
      localStorage.removeItem("auth-token");
      localStorage.removeItem("auth-user");
      if (!window.location.pathname.startsWith("/login"))
        window.location.href = "/login";
    }
    return res.json();
  },
  put: (url: string, data?: any) =>
    fetch(getUrl(url), {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        Authorization: getToken() ? "Bearer " + getToken() : "",
      },
      body: data ? JSON.stringify(data) : undefined,
    }).then((r) => r.json()),
};

export default api;
