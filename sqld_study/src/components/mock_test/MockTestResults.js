import React, { useState } from 'react';
import styled from 'styled-components';

const ResultsContainer = styled.div`
  width: 100%;
  color: #d7dfe5;
  font-family: "IBM Plex Sans", sans-serif;
`;

const ResultHeader = styled.div`
  background-color: rgba(12, 20, 28, 0.5);
  border-radius: 12px;
  padding: 20px;
  margin-bottom: 24px;
  
  @media (max-width: 768px) {
    padding: 16px;
    margin-bottom: 16px;
  }
`;

const ResultTitle = styled.h2`
  font-size: 24px;
  font-weight: 700;
  color: #2395e9;
  margin-bottom: 16px;
  
  @media (max-width: 768px) {
    font-size: 20px;
    margin-bottom: 12px;
  }
`;

const ResultSummary = styled.div`
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 12px;
  margin-bottom: 16px;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
    gap: 8px;
    margin-bottom: 12px;
  }
`;

const ResultItem = styled.div`
  background: rgba(215, 223, 228, 0.05);
  padding: 12px 16px;
  border-radius: 8px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  
  span:first-child {
    font-weight: 500;
  }
  
  span:last-child {
    font-weight: 700;
    font-size: 18px;
  }
  
  @media (max-width: 768px) {
    padding: 10px 12px;
    
    span:last-child {
      font-size: 16px;
    }
  }
`;

const ResultScore = styled.div`
  background: rgba(35, 149, 233, 0.2);
  border-radius: 8px;
  padding: 16px;
  text-align: center;
  font-size: 20px;
  font-weight: 700;
  
  span {
    color: ${props => props.score >= 60 ? '#4CAF50' : '#FF5252'};
  }
  
  @media (max-width: 768px) {
    padding: 12px;
    font-size: 18px;
  }
`;

const TabsContainer = styled.div`
  display: flex;
  margin-bottom: 20px;
  border-bottom: 1px solid rgba(215, 223, 228, 0.1);
  
  @media (max-width: 768px) {
    margin-bottom: 16px;
  }
`;

const TabButton = styled.button`
  background: ${props => props.active ? 'rgba(35, 149, 233, 0.2)' : 'transparent'};
  border: none;
  padding: 12px 20px;
  color: ${props => props.active ? '#2395e9' : '#d7dfe5'};
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: ${props => props.active ? '700' : '500'};
  font-size: 16px;
  cursor: pointer;
  border-bottom: 2px solid ${props => props.active ? '#2395e9' : 'transparent'};
  transition: all 0.2s ease;
  
  &:hover {
    background: rgba(35, 149, 233, 0.1);
  }
  
  @media (max-width: 768px) {
    padding: 10px 16px;
    font-size: 14px;
  }
`;

const QuestionsList = styled.div`
  display: flex;
  flex-direction: column;
  gap: 20px;
  
  @media (max-width: 768px) {
    gap: 16px;
  }
`;

const QuestionCard = styled.div`
  background-color: rgba(12, 20, 28, 0.5);
  border-radius: 12px;
  overflow: hidden;
  border: 1px solid rgba(215, 223, 228, 0.1);
  
  @media (max-width: 768px) {
    border-radius: 8px;
  }
`;

const QuestionHeader = styled.div`
  padding: 16px;
  background-color: ${props => props.isCorrect ? 'rgba(60, 179, 113, 0.2)' : 'rgba(255, 82, 82, 0.2)'};
  display: flex;
  justify-content: space-between;
  align-items: center;
  
  @media (max-width: 768px) {
    padding: 12px;
  }
`;

const QuestionNumber = styled.span`
  font-weight: 700;
  font-size: 16px;
  
  @media (max-width: 768px) {
    font-size: 14px;
  }
`;

const QuestionStatus = styled.span`
  font-weight: 500;
  color: ${props => props.isCorrect ? '#4CAF50' : '#FF5252'};
  
  @media (max-width: 768px) {
    font-size: 14px;
  }
`;

const QuestionContent = styled.div`
  padding: 16px;
  white-space: pre-wrap;
  
  @media (max-width: 768px) {
    padding: 12px;
    font-size: 14px;
  }
`;

const OptionsContainer = styled.div`
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-top: 12px;
  
  @media (max-width: 768px) {
    gap: 6px;
    margin-top: 10px;
  }
`;

const OptionItem = styled.div`
  display: flex;
  align-items: flex-start;
  padding: 10px 12px;
  border-radius: 6px;
  background-color: ${props => {
    if (props.isCorrectAnswer) return 'rgba(60, 179, 113, 0.2)';
    if (props.isSelected && !props.isCorrectAnswer) return 'rgba(255, 82, 82, 0.2)';
    return 'rgba(215, 223, 228, 0.05)';
  }};
  
  @media (max-width: 768px) {
    padding: 8px 10px;
  }
`;

const OptionNumber = styled.span`
  font-weight: 700;
  margin-right: 12px;
  min-width: 20px;
  
  @media (max-width: 768px) {
    margin-right: 8px;
  }
`;

const OptionText = styled.span`
  flex: 1;
`;

const ExplanationSection = styled.div`
  margin-top: 16px;
  padding: 16px;
  background: rgba(35, 149, 233, 0.1);
  border-radius: 8px;
  
  @media (max-width: 768px) {
    margin-top: 12px;
    padding: 12px;
    font-size: 14px;
  }
`;

const ExplanationTitle = styled.div`
  font-weight: 700;
  margin-bottom: 8px;
  color: #2395e9;
  
  @media (max-width: 768px) {
    margin-bottom: 6px;
  }
`;

const ReturnButton = styled.button`
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(35, 149, 233, 0.6);
  color: #d7dfe5;
  border: none;
  border-radius: 8px;
  padding: 12px 24px;
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 600;
  font-size: 16px;
  cursor: pointer;
  margin-top: 20px;
  transition: all 0.2s ease;
  
  &:hover {
    background-color: rgba(35, 149, 233, 0.8);
  }
  
  @media (max-width: 768px) {
    padding: 10px 20px;
    font-size: 14px;
    margin-top: 16px;
  }
`;

const MockTestResults = ({ 
  questions, 
  userAnswers, 
  totalQuestions,
  correctAnswers,
  score,
  onReturnToSelection 
}) => {
  const [activeTab, setActiveTab] = useState('incorrect');

  // 틀린 문제 필터링
  const incorrectQuestions = questions?.filter((_, index) => 
    userAnswers[index] !== questions[index].answer
  );

  // 맞은 문제 필터링
  const correctQuestions = questions?.filter((_, index) => 
    userAnswers[index] === questions[index].answer
  );

  // 현재 탭에 따라 보여줄 문제들
  const displayQuestions = activeTab === 'incorrect' 
    ? incorrectQuestions 
    : activeTab === 'correct' 
      ? correctQuestions 
      : questions;

  const getQuestionIndex = (question) => {
    return questions.findIndex(q => q === question);
  };

  return (
    <ResultsContainer>
      <ResultHeader>
        <ResultTitle>모의고사 결과</ResultTitle>
        <ResultSummary>
          <ResultItem>
            <span>총 문항 수:</span>
            <span>{totalQuestions}개</span>
          </ResultItem>
          <ResultItem>
            <span>정답 수:</span>
            <span>{correctAnswers}개</span>
          </ResultItem>
        </ResultSummary>
        <ResultScore score={score}>
          최종 점수: <span>{score}점</span> {score >= 60 ? '(합격)' : '(불합격)'}
        </ResultScore>
      </ResultHeader>
      
      <TabsContainer>
        <TabButton 
          active={activeTab === 'all'} 
          onClick={() => setActiveTab('all')}
        >
          전체 문제 ({questions?.length || 0})
        </TabButton>
        <TabButton 
          active={activeTab === 'incorrect'} 
          onClick={() => setActiveTab('incorrect')}
        >
          틀린 문제 ({incorrectQuestions?.length || 0})
        </TabButton>
        <TabButton 
          active={activeTab === 'correct'} 
          onClick={() => setActiveTab('correct')}
        >
          맞은 문제 ({correctQuestions?.length || 0})
        </TabButton>
      </TabsContainer>
      
      <QuestionsList>
        {displayQuestions?.map((question) => {
          const questionIndex = getQuestionIndex(question);
          const userAnswer = userAnswers[questionIndex];
          const isCorrect = userAnswer === question.answer;
          
          return (
            <QuestionCard key={questionIndex}>
              <QuestionHeader isCorrect={isCorrect}>
                <QuestionNumber>문제 {questionIndex + 1}</QuestionNumber>
                <QuestionStatus isCorrect={isCorrect}>
                  {isCorrect ? '정답' : '오답'}
                </QuestionStatus>
              </QuestionHeader>
              
              <QuestionContent>
                {question.question}
                
                <OptionsContainer>
                  {question.options.map((option, optIndex) => (
                    <OptionItem 
                      key={optIndex}
                      isSelected={userAnswer === optIndex}
                      isCorrectAnswer={question.answer === optIndex}
                    >
                      <OptionNumber>{optIndex + 1}.</OptionNumber>
                      <OptionText>{option}</OptionText>
                    </OptionItem>
                  ))}
                </OptionsContainer>
                
                <ExplanationSection>
                  <ExplanationTitle>정답 해설:</ExplanationTitle>
                  {question.explanation || '해설이 제공되지 않았습니다.'}
                </ExplanationSection>
              </QuestionContent>
            </QuestionCard>
          );
        })}
      </QuestionsList>
      
      <ReturnButton onClick={onReturnToSelection}>
        모의고사 선택으로 돌아가기
      </ReturnButton>
    </ResultsContainer>
  );
};

export default MockTestResults; 