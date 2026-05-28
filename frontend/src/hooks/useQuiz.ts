"use client";

import { useState, useCallback } from "react";
import api from "@/lib/api";

interface Sentence {
  id: string;
  source_text: string;
  target_text: string;
}

interface Answer {
  id: string;
  sentence: Sentence;
  user_answer: string | null;
  is_correct: boolean;
  revealed: boolean;
}

interface QuizState {
  sessionId: string | null;
  answers: Answer[];
  currentIndex: number;
  totalQuestions: number;
  correctCount: number;
  isLoading: boolean;
  isCompleted: boolean;
}

export function useQuiz() {
  const [state, setState] = useState<QuizState>({
    sessionId: null,
    answers: [],
    currentIndex: 0,
    totalQuestions: 0,
    correctCount: 0,
    isLoading: false,
    isCompleted: false,
  });

  const start = useCallback(async (languageId: string, levelId: string) => {
    setState((s) => ({ ...s, isLoading: true }));
    try {
      const res = await api.post("/quiz/start", {
        language_id: languageId,
        level_id: levelId,
      });
      const session = res.data;
      setState({
        sessionId: session.id,
        answers: session.answers || [],
        currentIndex: 0,
        totalQuestions: session.total_questions || 0,
        correctCount: 0,
        isLoading: false,
        isCompleted: false,
      });
    } catch {
      setState((s) => ({ ...s, isLoading: false }));
    }
  }, []);

  const getCurrentSentence = useCallback((): Sentence | null => {
    return state.answers[state.currentIndex]?.sentence ?? null;
  }, [state.answers, state.currentIndex]);

  const submitAnswer = useCallback(
    async (userAnswer: string) => {
      const answer = state.answers[state.currentIndex];
      if (!answer || !state.sessionId) return null;
      try {
        const res = await api.post(`/quiz/${state.sessionId}/answer`, {
          answer_id: answer.id,
          user_answer: userAnswer,
        });
        const updated = res.data;
        setState((s) => {
          const newAnswers = [...s.answers];
          newAnswers[s.currentIndex] = updated;
          return {
            ...s,
            answers: newAnswers,
            correctCount: updated.is_correct
              ? s.correctCount + 1
              : s.correctCount,
          };
        });
        return updated;
      } catch {
        return null;
      }
    },
    [state.answers, state.currentIndex, state.sessionId],
  );

  const revealAnswer = useCallback(async () => {
    const answer = state.answers[state.currentIndex];
    if (!answer || !state.sessionId) return null;
    try {
      const res = await api.post(
        `/quiz/${state.sessionId}/reveal/${answer.id}`,
      );
      const updated = res.data;
      setState((s) => {
        const newAnswers = [...s.answers];
        newAnswers[s.currentIndex] = updated;
        return { ...s, answers: newAnswers };
      });
      return updated;
    } catch {
      return null;
    }
  }, [state.answers, state.currentIndex, state.sessionId]);

  const nextQuestion = useCallback(() => {
    setState((s) => {
      const nextIdx = s.currentIndex + 1;
      const completed = nextIdx >= s.answers.length;
      return { ...s, currentIndex: nextIdx, isCompleted: completed };
    });
  }, []);

  const getResult = useCallback(async () => {
    if (!state.sessionId) return null;
    try {
      const res = await api.post(`/quiz/${state.sessionId}/complete`);
      return res.data;
    } catch {
      return null;
    }
  }, [state.sessionId]);

  return {
    ...state,
    start,
    getCurrentSentence,
    submitAnswer,
    revealAnswer,
    nextQuestion,
    getResult,
  };
}
