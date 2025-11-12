import React, { useState, useEffect } from "react";
import styled from "styled-components";

const QuizContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 20px;
  width: 100%;
  height: calc(100vh - 140px); /* 헤더와 패딩을 고려한 높이 */
  overflow: hidden;
`;

const CategoryText = styled.p`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 600;
  font-size: 18px;
  color: #2395e9;
  text-align: center;
  margin-bottom: 10px;
`;

const QuestionCard = styled.div`
  background-color: #121c2b;
  border-radius: 22px;
  padding: 40px 50px;
  width: 100%;
  max-width: 800px;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
`;

const QuestionText = styled.p`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 500;
  font-size: 15px;
  color: #d7dfe5;
  line-height: 1.33;
  max-width: 600px;
`;

const ButtonGroup = styled.div`
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  gap: 12px;
  padding: 12px 0;
  width: 100%;
  max-width: 600px;
`;

const AnswerButton = styled.button`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 500;
  font-size: 15px;
  color: #d7dfe5;
  padding: 8px 16px;
  background-color: transparent;
  border: 1.5px solid rgba(214, 224, 230, 0.2);
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.2s ease;

  &:hover {
    background-color: rgba(35, 149, 233, 0.4);
  }

  &.selected {
    background-color: rgba(35, 149, 233, 0.7);
  }

  &.correct {
    background-color: rgba(46, 204, 113, 0.7);
  }

  &.incorrect {
    background-color: rgba(231, 76, 60, 0.7);
  }
`;

const SkipButton = styled.button`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 500;
  font-size: 15px;
  color: #fafdff;
  background: none;
  border: none;
  cursor: pointer;
  padding: 8px 16px;

  &:hover {
    text-decoration: underline;
  }
`;

const NextButton = styled.button`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 500;
  font-size: 15px;
  color: #000000;
  background-color: #2395e9;
  border: none;
  border-radius: 22px;
  padding: 8px 16px;
  cursor: pointer;
  margin-top: 12px;

  &:hover {
    background-color: #1b7ac2;
  }
`;

const ResultContainer = styled.div`
  background-color: #121c2b;
  border-radius: 22px;
  padding: 30px;
  width: 100%;
  max-width: 800px;
  margin-top: 20px;
`;

const ResultText = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 16px;
  line-height: 1.5;
  color: #d7dfe5;
  margin-bottom: 10px;
`;

const ExplanationText = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 15px;
  line-height: 1.5;
  color: #a7b7c2;
  font-style: italic;
  padding-left: 16px;
  border-left: 3px solid #2395e9;
  margin-top: 16px;
`;

const Quiz = ({ quizData, onComplete }) => {
  const [availableQuestions, setAvailableQuestions] = useState([]);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState(null);
  const [showResult, setShowResult] = useState(false);
  const [score, setScore] = useState(0);
  const [answeredQuestions, setAnsweredQuestions] = useState([]);
  const [userAnswers, setUserAnswers] = useState(
    Array(quizData.length).fill(null)
  );

  // 초기 랜덤 문제 목록 생성
  useEffect(() => {
    const shuffleQuestions = () => {
      // 문제 인덱스를 배열로 만들고 섞기
      const indices = [...Array(quizData.length).keys()];
      for (let i = indices.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [indices[i], indices[j]] = [indices[j], indices[i]];
      }
      setAvailableQuestions(indices);
    };

    shuffleQuestions();
  }, [quizData.length]);

  const getCurrentQuestion = () => {
    if (availableQuestions.length === 0) return null;
    const questionId = availableQuestions[currentQuestionIndex];
    return quizData[questionId];
  };

  const handleAnswerClick = (answer) => {
    if (showResult) return;

    const currentQuestion = getCurrentQuestion();
    if (!currentQuestion) return;

    const questionId = availableQuestions[currentQuestionIndex];

    setSelectedAnswer(answer);
    setShowResult(true);

    const newUserAnswers = [...userAnswers];
    newUserAnswers[questionId] = answer;
    setUserAnswers(newUserAnswers);

    if (answer === currentQuestion.correctAnswer) {
      setScore(score + 1);
    }

    setAnsweredQuestions([...answeredQuestions, questionId]);
  };

  const handleNextClick = () => {
    setShowResult(false);
    setSelectedAnswer(null);

    // 현재 문제를 사용 가능한 문제 목록에서 제거
    const updatedQuestions = [...availableQuestions];
    updatedQuestions.splice(currentQuestionIndex, 1);
    setAvailableQuestions(updatedQuestions);

    // 다음 문제 인덱스 설정 (랜덤)
    if (updatedQuestions.length > 0) {
      const nextIndex = Math.floor(Math.random() * updatedQuestions.length);
      setCurrentQuestionIndex(nextIndex);
    } else {
      // 모든 문제를 다 풀었을 때
      onComplete(score, userAnswers);
    }
  };

  const handleSkipClick = () => {
    if (availableQuestions.length <= 1) return;

    // 현재 문제를 건너뛰고 다른 랜덤 문제 선택
    let nextIndex;
    do {
      nextIndex = Math.floor(Math.random() * availableQuestions.length);
    } while (
      nextIndex === currentQuestionIndex &&
      availableQuestions.length > 1
    );

    setCurrentQuestionIndex(nextIndex);
    setShowResult(false);
    setSelectedAnswer(null);
  };

  const currentQuestion = getCurrentQuestion();
  if (!currentQuestion) {
    return (
      <QuizContainer>
        <NextButton onClick={() => onComplete(score, userAnswers)}>
          결과 보기
        </NextButton>
      </QuizContainer>
    );
  }

  return (
    <QuizContainer>
      <CategoryText>주제: {currentQuestion.category}</CategoryText>

      <QuestionCard>
        <QuestionText>{currentQuestion.question}</QuestionText>
      </QuestionCard>

      <ButtonGroup>
        <AnswerButton
          className={
            showResult
              ? currentQuestion.correctAnswer === "O"
                ? "correct"
                : selectedAnswer === "O"
                ? "incorrect"
                : ""
              : selectedAnswer === "O"
              ? "selected"
              : ""
          }
          onClick={() => handleAnswerClick("O")}
        >
          O
        </AnswerButton>

        <AnswerButton
          className={
            showResult
              ? currentQuestion.correctAnswer === "X"
                ? "correct"
                : selectedAnswer === "X"
                ? "incorrect"
                : ""
              : selectedAnswer === "X"
              ? "selected"
              : ""
          }
          onClick={() => handleAnswerClick("X")}
        >
          X
        </AnswerButton>
      </ButtonGroup>

      {!showResult && availableQuestions.length > 1 && (
        <SkipButton onClick={handleSkipClick}>Skip</SkipButton>
      )}

      {showResult && (
        <>
          <ResultContainer>
            <ResultText>정답: {currentQuestion.correctAnswer}</ResultText>
            <ExplanationText>{currentQuestion.explanation}</ExplanationText>
          </ResultContainer>
          <NextButton onClick={handleNextClick}>
            {availableQuestions.length > 1 ? "다음 문제" : "결과 보기"}
          </NextButton>
        </>
      )}
    </QuizContainer>
  );
};

export default Quiz;
