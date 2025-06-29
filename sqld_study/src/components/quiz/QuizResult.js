import React from "react";
import styled from "styled-components";
import { useNavigate } from "react-router-dom";

const ResultContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  max-width: 800px;
  height: calc(100vh - 140px);
  margin: 0 auto;
  padding: 20px;
  overflow-y: auto;
`;

const Title = styled.h1`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 700;
  font-size: 28px;
  color: #d7dfe5;
  text-align: center;
  margin-bottom: 20px;
`;

const ScoreCard = styled.div`
  background-color: #121c2b;
  border-radius: 22px;
  padding: 30px;
  width: 100%;
  margin-bottom: 20px;
  text-align: center;
`;

const ScoreText = styled.p`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 700;
  font-size: 36px;
  color: #d7dfe5;
  margin-bottom: 10px;
`;

const ScoreDescription = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 16px;
  color: #a7b7c2;
`;

const QuestionList = styled.div`
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 15px;
  overflow-y: auto;
  flex: 1;
  padding-right: 10px;

  /* 스크롤바 스타일링 */
  &::-webkit-scrollbar {
    width: 8px;
  }

  &::-webkit-scrollbar-track {
    background: rgba(215, 223, 228, 0.05);
    border-radius: 4px;
  }

  &::-webkit-scrollbar-thumb {
    background: rgba(215, 223, 228, 0.15);
    border-radius: 4px;

    &:hover {
      background: rgba(215, 223, 228, 0.25);
    }
  }
`;

const QuestionItem = styled.div`
  background-color: #121c2b;
  border-radius: 12px;
  padding: 20px;
  border-left: 4px solid
    ${(props) => (props.$isCorrect ? "#2ecc71" : "#e74c3c")};
`;

const QuestionText = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 15px;
  color: #d7dfe5;
  margin-bottom: 10px;
`;

const AnswerText = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 14px;
  color: ${(props) => (props.$isCorrect ? "#2ecc71" : "#e74c3c")};
  margin-bottom: 10px;
`;

const ExplanationText = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 14px;
  color: #a7b7c2;
  font-style: italic;
  margin-top: 10px;
`;

const Button = styled.button`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 500;
  font-size: 15px;
  color: #000000;
  background-color: #2395e9;
  border: none;
  border-radius: 22px;
  padding: 10px 20px;
  cursor: pointer;
  margin-top: 30px;

  &:hover {
    background-color: #1b7ac2;
  }
`;

const NoQuestionsText = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 16px;
  color: #d7dfe5;
  text-align: center;
  margin: 30px 0;
`;

const QuizResult = ({
  score,
  totalQuestions,
  userAnswers,
  quizData,
  answeredIds,
  onRetry,
}) => {
  const navigate = useNavigate();

  const handleRetryClick = () => {
    if (onRetry) {
      onRetry();
    } else {
      navigate("/quiz");
    }
  };

  const percentage =
    totalQuestions > 0 ? Math.round((score / totalQuestions) * 100) : 0;

  return (
    <ResultContainer>
      <Title>퀴즈 결과</Title>

      <ScoreCard>
        <ScoreText>
          {score} / {totalQuestions} 문제 정답
        </ScoreText>
        <ScoreDescription>정답률: {percentage}%</ScoreDescription>
      </ScoreCard>

      <QuestionList>
        {answeredIds.length === 0 ? (
          <NoQuestionsText>아직 풀었던 문제가 없습니다.</NoQuestionsText>
        ) : (
          answeredIds.map((id, index) => {
            const question = quizData[id];
            const userAnswer = userAnswers[id];
            const isCorrect = userAnswer === question.correctAnswer;

            return (
              <QuestionItem key={question.id} $isCorrect={isCorrect}>
                <QuestionText>
                  {index + 1}. {question.question}
                </QuestionText>
                <AnswerText $isCorrect={isCorrect}>
                  {isCorrect
                    ? `정답: ${question.correctAnswer}`
                    : `오답: ${userAnswer || "응답 없음"} (정답: ${
                        question.correctAnswer
                      })`}
                </AnswerText>
                <ExplanationText>{question.explanation}</ExplanationText>
              </QuestionItem>
            );
          })
        )}
      </QuestionList>

      <Button onClick={handleRetryClick}>다시 풀기</Button>
    </ResultContainer>
  );
};

export default QuizResult;
