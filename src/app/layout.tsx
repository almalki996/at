import type { Metadata } from "next";
import { Tajawal } from "next/font/google";
import "./globals.css";
import { RefineProvider } from "@/providers/refine-provider";
import { ThemeProvider } from "@/providers/theme-provider";
import { Toaster } from "react-hot-toast";

const tajawal = Tajawal({
  subsets: ["arabic"],
  weight: ["300", "400", "500", "700", "800", "900"],
  variable: "--font-tajawal",
});

export const metadata: Metadata = {
  title: "Strategic Plans Automation",
  description: "Generated dynamically with Next.js and Refine",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="ar"
      dir="rtl"
      className={`${tajawal.variable} font-sans h-full antialiased`}
      suppressHydrationWarning
    >
      <body className="min-h-full flex flex-col bg-slate-50/50 dark:bg-slate-950 text-slate-900 dark:text-slate-100 transition-colors duration-300">
          <ThemeProvider attribute="class" defaultTheme="system" enableSystem>
              <RefineProvider>{children}</RefineProvider>
          </ThemeProvider>
          <Toaster />
      </body>
    </html>
  );
}
