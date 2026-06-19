import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { ThemeProvider } from "next-themes";
import { AuthProvider } from "@/lib/auth";
import { AlertConfirmProvider } from "@/components/ui/AlertConfirmProvider";
import { FacebookPixel } from "@/components/FacebookPixel";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  metadataBase: new URL("https://bijakenglish.imat.my"),
  title: {
    default: "Vocabulary — Hafal Ayat, Bukan Perkataan",
    template: "%s | Vocabulary",
  },
  description:
    "Belajar bahasa Inggeris dengan pantas melalui kaedah menghafal 20 ayat lengkap setiap hari. Platform pintar dengan pengesanan variasi ayat.",
  keywords: [
    "belajar bahasa inggeris",
    "hafal vocabulary",
    "kelas bahasa inggeris percuma",
    "muet",
    "ielts",
    "aplikasi belajar bahasa",
    "bijak english",
  ],
  openGraph: {
    type: "website",
    locale: "ms_MY",
    url: "https://bijakenglish.imat.my",
    title: "Vocabulary — Hafal Ayat, Bukan Perkataan",
    description:
      "Belajar bahasa Inggeris dengan pantas melalui kaedah menghafal 20 ayat lengkap setiap hari.",
    siteName: "Vocabulary by Bijak English",
  },
  twitter: {
    card: "summary_large_image",
    title: "Vocabulary — Hafal Ayat, Bukan Perkataan",
    description:
      "Belajar bahasa Inggeris dengan pantas melalui kaedah menghafal 20 ayat lengkap setiap hari.",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="ms"
      className={`${geistSans.variable} ${geistMono.variable} h-full antialiased`}
      suppressHydrationWarning
    >
      <body className="h-full bg-background text-foreground flex flex-col">
        <ThemeProvider
          attribute="class"
          defaultTheme="light"
          enableSystem={false}
          disableTransitionOnChange
        >
          <AuthProvider>
            <AlertConfirmProvider>
              <FacebookPixel />
              {children}
            </AlertConfirmProvider>
          </AuthProvider>
        </ThemeProvider>
      </body>
    </html>
  );
}
