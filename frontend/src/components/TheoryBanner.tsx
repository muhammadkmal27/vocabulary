"use client";

import { useState } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Lightbulb, Quote } from "lucide-react";

const ADS = [
  "Orang gagal kuasai English sebab hafal perkataan, sepatutnya hafal ayat!",
  "Fasih English bukan soal berapa banyak perkataan kau tahu, tapi berapa cepat kau boleh keluarkan ayat.",
];

export function TheoryBanner() {
  const [currentAd, setCurrentAd] = useState(0);
  const [animating, setAnimating] = useState(false);

  const handleNext = () => {
    if (animating) return;
    setAnimating(true);
    setTimeout(() => {
      setCurrentAd((prev) => (prev + 1) % ADS.length);
      setAnimating(false);
    }, 200); // match transition duration
  };

  const handleDotClick = (e: React.MouseEvent, index: number) => {
    e.stopPropagation();
    if (animating || index === currentAd) return;
    setAnimating(true);
    setTimeout(() => {
      setCurrentAd(index);
      setAnimating(false);
    }, 200);
  };

  return (
    <Card 
      onClick={handleNext}
      className="border-primary/30 bg-gradient-to-br from-primary/5 via-background to-primary/5 overflow-hidden cursor-pointer select-none transition-all duration-300 hover:shadow-md hover:border-primary/50 active:scale-[0.99] group"
    >
      <CardContent className="p-5 space-y-3">
        <div className="flex items-start gap-3">
          <div className="shrink-0 w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center transition-transform duration-300 group-hover:scale-110">
            <Lightbulb className="w-5 h-5 text-primary" />
          </div>
          <div className="space-y-2 flex-1">
            <div className="flex items-center gap-2">
              <Badge className="text-[10px] bg-primary/20 text-primary border-primary/30 font-semibold">Teori</Badge>
              <span className="text-[10px] text-muted-foreground">Ketahui rahsia belajar bahasa (Klik untuk slide)</span>
            </div>
            <div className="min-h-[56px] sm:min-h-[48px] flex items-center">
              <blockquote className={`text-sm sm:text-base leading-relaxed font-medium transition-all duration-200 ${animating ? "opacity-0 translate-x-4" : "opacity-100 translate-x-0"}`}>
                <Quote className="w-4 h-4 inline text-primary/40 -mt-1 mr-1" />
                {ADS[currentAd]}
              </blockquote>
            </div>
          </div>
        </div>
        <div className="flex justify-center gap-1.5 pt-1">
          {ADS.map((_, i) => (
            <button
              key={i}
              onClick={(e) => handleDotClick(e, i)}
              className={`w-1.5 h-1.5 rounded-full transition-all duration-300 ${i === currentAd ? "bg-primary w-4" : "bg-muted-foreground/30 hover:bg-muted-foreground/50"}`}
            />
          ))}
        </div>
      </CardContent>
    </Card>
  );
}
