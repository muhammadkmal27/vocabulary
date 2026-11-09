"use client";

import { useState } from "react";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Send, Eye, Edit3, Sparkles, Loader2, MailCheck } from "lucide-react";

interface EmailComposerProps {
  subject: string;
  setSubject: (val: string) => void;
  body: string;
  setBody: (val: string) => void;
  onSend: () => void;
  isSending: boolean;
  totalTargetCount: number;
}

const TEMPLATE_SPECIAL = `Assalamualaikum & Salam Sejahtera,

Selalunya kita cepat berasa bosan atau sukar faham apabila belajar Bahasa Inggeris sekadar membaca buku teks. Cara paling cepat untuk membiasakan minda dan telinga adalah dengan mendengar percakapan sebenar yang bermakna bagi diri kita.

Kini kami bawakan ciri baharu Special di Bijak English untuk membantu penguasaan bahasa anda:

• Dwi-Sari Kata Serentak: Teks Bahasa Inggeris dan terjemahan Bahasa Melayu dipaparkan serentak mengikut pemasaan audio — anda faham maksud serta-merta tanpa perlu henti video dan buka kamus.
• Transkrip Interaktif: Terlepas ayat atau nak teliti sebutan penutur? Hanya klik pada mana-mana baris ayat untuk ulang dengar bahagian tersebut secara fleksibel.
• Kosa Kata Sebenar & Bernilai: Pelajari frasa percakapan harian dan intonasi penutur antarabangsa (seperti Mufti Menk) sambil mengisi jiwa dengan pengisian yang bermanfaat.

Anda boleh terus terokai ciri baharu ini di:
https://bijakenglish.imat.my/special

Ada Idea Penambahbaikan?
Sekiranya anda mempunyai sebarang cadangan atau maklum balas mengenai ciri ini, sila balas emel ini atau hubungi kami di:
saashouse.mail@gmail.com

Selamat mencuba dan teruskan belajar!

Sekian, terima kasih.

Pasukan Bijak English
https://bijakenglish.imat.my`;

export default function EmailComposer({
  subject,
  setSubject,
  body,
  setBody,
  onSend,
  isSending,
  totalTargetCount,
}: EmailComposerProps) {
  const [activeTab, setActiveTab] = useState<"edit" | "preview">("edit");

  return (
    <div className="p-5 rounded-2xl border border-border bg-card space-y-5">
      {/* Sender Info Banner */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between p-3 rounded-xl bg-emerald-500/10 border border-emerald-500/20 text-xs gap-2">
        <div className="flex items-center gap-2">
          <MailCheck className="w-4 h-4 text-emerald-500 shrink-0" />
          <span>
            Dihantar dari: <strong className="font-semibold text-foreground">saashouse.mail@gmail.com</strong> (Pasukan Bijak English)
          </span>
        </div>
        <Button
          type="button"
          variant="outline"
          size="sm"
          className="h-7 text-xs gap-1 border-emerald-500/30 text-emerald-600 hover:text-emerald-700 hover:bg-emerald-500/10"
          onClick={() => {
            setSubject("Ciri Baharu di Bijak English: Kuasai English Secara Semulajadi Melalui Siri \"Special\" ✨");
            setBody(TEMPLATE_SPECIAL);
          }}
        >
          <Sparkles className="w-3 h-3" /> Muat Template "Special"
        </Button>
      </div>

      {/* Subject Input */}
      <div className="space-y-1.5">
        <label className="text-sm font-semibold">Subjek Emel:</label>
        <Input
          value={subject}
          onChange={(e) => setSubject(e.target.value)}
          placeholder="Contoh: Ciri Baharu di Bijak English..."
          className="font-medium text-base"
        />
      </div>

      {/* Tabs Edit / Preview */}
      <div className="space-y-2">
        <div className="flex items-center justify-between">
          <label className="text-sm font-semibold">Kandungan Emel:</label>
          <div className="flex items-center gap-1 bg-muted p-1 rounded-lg">
            <Button
              type="button"
              variant={activeTab === "edit" ? "secondary" : "ghost"}
              size="sm"
              className="h-7 text-xs gap-1.5"
              onClick={() => setActiveTab("edit")}
            >
              <Edit3 className="w-3.5 h-3.5" /> Tulis
            </Button>
            <Button
              type="button"
              variant={activeTab === "preview" ? "secondary" : "ghost"}
              size="sm"
              className="h-7 text-xs gap-1.5"
              onClick={() => setActiveTab("preview")}
            >
              <Eye className="w-3.5 h-3.5" /> Pratonton
            </Button>
          </div>
        </div>

        {activeTab === "edit" ? (
          <Textarea
            value={body}
            onChange={(e) => setBody(e.target.value)}
            placeholder="Tulis mesej emel anda di sini..."
            rows={12}
            className="font-sans text-sm leading-relaxed"
          />
        ) : (
          <div className="border rounded-xl p-5 bg-background space-y-4 max-w-2xl mx-auto">
            <div className="border-b pb-3 text-sm">
              <span className="text-muted-foreground">Subjek: </span>
              <strong className="text-foreground">{subject || "(Tiada subjek)"}</strong>
            </div>
            <div className="text-[14px] leading-[1.55] text-foreground space-y-3 font-sans">
              {body ? (
                body
                  .trim()
                  .split(/\n\s*\n/)
                  .map((para, i) => (
                    <p key={i} className="whitespace-pre-line m-0">
                      {para}
                    </p>
                  ))
              ) : (
                <span className="text-muted-foreground italic">(Tiada kandungan)</span>
              )}
            </div>
          </div>
        )}
      </div>

      {/* Action Footer */}
      <div className="flex flex-col sm:flex-row items-center justify-between gap-3 pt-2 border-t">
        <div className="text-xs text-muted-foreground">
          Sasaran Semasa:{" "}
          <Badge variant="outline" className="font-semibold text-primary">
            {totalTargetCount} Penerima
          </Badge>
        </div>
        <Button
          type="button"
          onClick={onSend}
          disabled={isSending || !subject.trim() || !body.trim() || totalTargetCount === 0}
          className="w-full sm:w-auto gap-2 bg-emerald-600 hover:bg-emerald-700 text-white"
        >
          {isSending ? (
            <>
              <Loader2 className="w-4 h-4 animate-spin" /> Menghantar Emel...
            </>
          ) : (
            <>
              <Send className="w-4 h-4" /> Hantar Emel Siaran
            </>
          )}
        </Button>
      </div>
    </div>
  );
}

