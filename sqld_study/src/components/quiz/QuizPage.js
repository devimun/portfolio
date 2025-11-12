import React, { useState } from "react";
import styled from "styled-components";
import Quiz from "./Quiz";
import QuizResult from "./QuizResult";
import quizData from "../../data/quizData";
import MobileHeader, { MobileHeaderSpacer } from "../layout/MobileHeader";

const QuizPageContainer = styled.div`
  width: 100%;
  height: 100%;
  padding: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
`;

const ContentContainer = styled.div`
  width: 100%;
  max-width: 800px;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px;
  
  @media (max-width: 768px) {
    padding: 16px;
  }
`;

const QuizPage = () => {
  const [isQuizCompleted, setIsQuizCompleted] = useState(false);
  const [score, setScore] = useState(0);
  const [userAnswers, setUserAnswers] = useState(
    Array(quizData.length).fill(null)
  );
  const [answeredIds, setAnsweredIds] = useState([]);

  const handleQuizComplete = (finalScore, answers) => {
    setScore(finalScore);
    setUserAnswers(answers);

    const ids = [];
    answers.forEach((answer, index) => {
      if (answer !== null) {
        ids.push(index);
      }
    });
    setAnsweredIds(ids);

    setIsQuizCompleted(true);
  };

  const handleRetry = () => {
    setIsQuizCompleted(false);
    setScore(0);
    setUserAnswers(Array(quizData.length).fill(null));
    setAnsweredIds([]);
  };

  return (
    <QuizPageContainer>
      <MobileHeader />
      <MobileHeaderSpacer />
      <ContentContainer>
        {!isQuizCompleted ? (
          <Quiz quizData={quizData} onComplete={handleQuizComplete} />
        ) : (
          <QuizResult
            score={score}
            totalQuestions={answeredIds.length}
            userAnswers={userAnswers}
            quizData={quizData}
            answeredIds={answeredIds}
            onRetry={handleRetry}
          />
        )}
      </ContentContainer>
    </QuizPageContainer>
  );
};

export default QuizPage;
