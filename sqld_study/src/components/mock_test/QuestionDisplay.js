import React from 'react';
import styled from 'styled-components';

const QuestionContainer = styled.div`
  width: 100%;
  padding: 20px;
  background-color: rgba(12, 20, 28, 0.5);
  border-radius: 12px;
  color: #d7dfe5;
  font-family: "IBM Plex Sans", sans-serif;
  
  @media (max-width: 768px) {
    padding: 16px;
  }
  
  @media (max-width: 480px) {
    padding: 12px;
  }
`;

const QuestionHeader = styled.div`
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid rgba(214, 224, 230, 0.2);
  
  @media (max-width: 768px) {
    margin-bottom: 16px;
    padding-bottom: 8px;
  }
`;

const QuestionNumber = styled.h3`
  color: #d7dfe5;
  font-weight: 500;
  font-family: "IBM Plex Sans", sans-serif;
  
  @media (max-width: 768px) {
    font-size: 15px;
  }
  
  @media (max-width: 480px) {
    font-size: 14px;
  }
`;

const QuestionText = styled.h2`
  font-size: 1.3rem;
  font-weight: 600;
  margin-bottom: 20px;
  line-height: 1.5;
  font-family: "IBM Plex Sans", sans-serif;
  
  @media (max-width: 768px) {
    font-size: 1.1rem;
    margin-bottom: 16px;
  }
  
  @media (max-width: 480px) {
    font-size: 1rem;
    margin-bottom: 14px;
  }
`;

const DiagramContainer = styled.div`
  margin: 20px 0;
  padding: 15px;
  background-color: rgba(215, 223, 228, 0.08);
  border-radius: 12px;
  overflow-x: auto;
  
  @media (max-width: 768px) {
    margin: 16px 0;
    padding: 12px;
  }
  
  @media (max-width: 480px) {
    margin: 14px 0;
    padding: 10px;
  }
`;

const TableDisplay = styled.table`
  width: 100%;
  border-collapse: collapse;
  margin: 15px 0;
  font-size: 0.9em;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
  
  @media (max-width: 768px) {
    font-size: 0.85em;
    margin: 12px 0;
  }
  
  @media (max-width: 480px) {
    font-size: 0.8em;
    margin: 10px 0;
  }
`;

const TableRow = styled.tr`
  background-color: ${props => props.isHeader ? '#1e2832' : '#0d151e'};
  border-bottom: 1px solid rgba(214, 224, 230, 0.1);
  
  &:last-child {
    border-bottom: 2px solid #2395e9;
  }
  
  &:hover {
    background-color: ${props => props.isHeader ? '#1e2832' : '#151e28'};
  }
`;

const TableCell = styled.td`
  padding: 12px 15px;
  text-align: left;
  font-family: "IBM Plex Sans", sans-serif;
  
  @media (max-width: 768px) {
    padding: 10px 12px;
  }
  
  @media (max-width: 480px) {
    padding: 8px 10px;
  }
`;

const TableHeader = styled.th`
  padding: 12px 15px;
  text-align: left;
  color: #d7dfe5;
  font-weight: 600;
  font-family: "IBM Plex Sans", sans-serif;
  
  @media (max-width: 768px) {
    padding: 10px 12px;
  }
  
  @media (max-width: 480px) {
    padding: 8px 10px;
  }
`;

const OptionsContainer = styled.div`
  margin-top: 30px;
  
  @media (max-width: 768px) {
    margin-top: 24px;
  }
  
  @media (max-width: 480px) {
    margin-top: 20px;
  }
`;

const OptionItem = styled.div`
  padding: 12px 15px;
  margin-bottom: 10px;
  background-color: ${props => 
    props.isSelected 
      ? 'rgba(35, 149, 233, 0.4)'
      : props.isCorrect && props.showAnswer
        ? 'rgba(60, 179, 113, 0.4)'
        : props.isWrong && props.showAnswer
          ? 'rgba(255, 77, 77, 0.4)'
          : 'rgba(215, 223, 228, 0.08)'
  };
  border-radius: 12px;
  cursor: ${props => props.disabled ? 'default' : 'pointer'};
  transition: background-color 0.2s;
  display: flex;
  align-items: center;
  font-family: "IBM Plex Sans", sans-serif;
  
  &:hover {
    background-color: ${props => 
      props.disabled 
        ? props.isSelected 
          ? 'rgba(35, 149, 233, 0.4)'
          : props.isCorrect && props.showAnswer
            ? 'rgba(60, 179, 113, 0.4)'
            : props.isWrong && props.showAnswer
              ? 'rgba(255, 77, 77, 0.4)'
              : 'rgba(215, 223, 228, 0.08)'
        : 'rgba(35, 149, 233, 0.2)'
    };
  }
  
  @media (max-width: 768px) {
    padding: 10px 12px;
    margin-bottom: 8px;
    font-size: 14px;
  }
  
  @media (max-width: 480px) {
    padding: 8px 10px;
    margin-bottom: 6px;
    font-size: 13px;
  }
`;

const OptionIndex = styled.div`
  width: 30px;
  height: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: rgba(0, 0, 0, 0.2);
  border-radius: 50%;
  margin-right: 15px;
  font-weight: 600;
  
  @media (max-width: 768px) {
    width: 26px;
    height: 26px;
    margin-right: 12px;
    font-size: 14px;
  }
  
  @media (max-width: 480px) {
    width: 24px;
    height: 24px;
    margin-right: 10px;
    font-size: 13px;
  }
`;

const OptionText = styled.div`
  flex: 1;
`;

const NavigationContainer = styled.div`
  display: flex;
  justify-content: space-between;
  margin-top: 30px;
  
  @media (max-width: 768px) {
    margin-top: 24px;
  }
  
  @media (max-width: 480px) {
    margin-top: 20px;
    flex-direction: column;
    gap: 10px;
  }
`;

const NavButton = styled.button`
  padding: 10px 20px;
  background-color: rgba(35, 149, 233, 0.4);
  color: #d7dfe5;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 500;
  transition: background-color 0.2s;
  font-family: "IBM Plex Sans", sans-serif;
  
  &:hover {
    background-color: rgba(35, 149, 233, 0.6);
  }
  
  &:disabled {
    background-color: rgba(214, 224, 230, 0.1);
    cursor: not-allowed;
  }
  
  @media (max-width: 768px) {
    padding: 8px 16px;
    font-size: 14px;
  }
  
  @media (max-width: 480px) {
    width: 100%;
    padding: 10px 0;
  }
`;

const ExplanationContainer = styled.div`
  margin-top: 20px;
  padding: 15px;
  background-color: rgba(60, 179, 113, 0.1);
  border-radius: 12px;
  border-left: 4px solid #3cb371;
  
  @media (max-width: 768px) {
    margin-top: 16px;
    padding: 12px;
  }
  
  @media (max-width: 480px) {
    margin-top: 14px;
    padding: 10px;
  }
`;

const ExplanationTitle = styled.h4`
  color: #3cb371;
  margin-bottom: 10px;
  font-weight: 600;
  font-family: "IBM Plex Sans", sans-serif;
  
  @media (max-width: 768px) {
    font-size: 15px;
    margin-bottom: 8px;
  }
  
  @media (max-width: 480px) {
    font-size: 14px;
    margin-bottom: 6px;
  }
`;

const ExplanationText = styled.p`
  color: #d7dfe5;
  line-height: 1.5;
  font-family: "IBM Plex Sans", sans-serif;
  
  @media (max-width: 768px) {
    font-size: 14px;
    line-height: 1.4;
  }
  
  @media (max-width: 480px) {
    font-size: 13px;
  }
`;

// 다이어그램 또는 테이블 렌더링 컴포넌트
const DiagramRenderer = ({ diagram }) => {
  if (!diagram) return null;

  if (diagram.type === 'table') {
    return (
      <DiagramContainer>
        <TableDisplay>
          <thead>
            <TableRow isHeader>
              {diagram.columns.map((col, idx) => (
                <TableHeader key={idx}>{col}</TableHeader>
              ))}
            </TableRow>
          </thead>
          <tbody>
            {diagram.rows.map((row, rowIdx) => (
              <TableRow key={rowIdx}>
                {row.map((cell, cellIdx) => (
                  <TableCell key={cellIdx}>
                    {cell === null ? 'NULL' : cell}
                  </TableCell>
                ))}
              </TableRow>
            ))}
          </tbody>
        </TableDisplay>
      </DiagramContainer>
    );
  }

  if (diagram.type === 'tables') {
    return (
      <DiagramContainer>
        {diagram.tables.map((table, tableIdx) => (
          <div key={tableIdx} style={{ marginBottom: '20px' }}>
            <h4 style={{ 
              marginBottom: '10px', 
              fontFamily: '"IBM Plex Sans", sans-serif',
              color: '#d7dfe5',
              fontWeight: '600',
              fontSize: window.innerWidth <= 480 ? '14px' : window.innerWidth <= 768 ? '15px' : '16px'
            }}>
              {table.name}
            </h4>
            <TableDisplay>
              <thead>
                <TableRow isHeader>
                  {table.columns.map((col, idx) => (
                    <TableHeader key={idx}>{col}</TableHeader>
                  ))}
                </TableRow>
              </thead>
              <tbody>
                {table.rows.map((row, rowIdx) => (
                  <TableRow key={rowIdx}>
                    {row.map((cell, cellIdx) => (
                      <TableCell key={cellIdx}>
                        {cell === null ? 'NULL' : cell}
                      </TableCell>
                    ))}
                  </TableRow>
                ))}
              </tbody>
            </TableDisplay>
          </div>
        ))}
      </DiagramContainer>
    );
  }

  return (
    <DiagramContainer>
      <p style={{ fontFamily: '"IBM Plex Sans", sans-serif' }}>다이어그램 형식이 지원되지 않습니다.</p>
    </DiagramContainer>
  );
};

const QuestionDisplay = ({ 
  question, 
  questionIndex, 
  totalQuestions, 
  selectedAnswer, 
  onAnswerSelect, 
  onPrevious, 
  onNext, 
  onSubmit, 
  isLast,
  testFinished 
}) => {
  const handleOptionClick = (optionIndex) => {
    if (!testFinished) {
      onAnswerSelect(optionIndex);
    }
  };

  return (
    <QuestionContainer>
      <QuestionHeader>
        <QuestionNumber>문제 {questionIndex + 1} / {totalQuestions}</QuestionNumber>
      </QuestionHeader>
      
      <QuestionText>{question.question}</QuestionText>
      
      {question.diagram && (
        <DiagramRenderer diagram={question.diagram} />
      )}
      
      <OptionsContainer>
        {question.options.map((option, idx) => (
          <OptionItem 
            key={idx}
            isSelected={selectedAnswer === idx}
            isCorrect={idx === question.answer && testFinished}
            isWrong={selectedAnswer === idx && idx !== question.answer && testFinished}
            showAnswer={testFinished}
            onClick={() => handleOptionClick(idx)}
            disabled={testFinished}
          >
            <OptionIndex>{idx + 1}</OptionIndex>
            <OptionText>{option}</OptionText>
          </OptionItem>
        ))}
      </OptionsContainer>
      
      {testFinished && (
        <ExplanationContainer>
          <ExplanationTitle>정답 해설</ExplanationTitle>
          <ExplanationText>{question.explanation}</ExplanationText>
        </ExplanationContainer>
      )}
      
      <NavigationContainer>
        <NavButton onClick={onPrevious} disabled={questionIndex === 0}>
          이전 문제
        </NavButton>
        
        {!isLast ? (
          <NavButton onClick={onNext}>
            다음 문제
          </NavButton>
        ) : (
          <NavButton onClick={onSubmit} disabled={testFinished}>
            {testFinished ? '제출 완료' : '시험 제출하기'}
          </NavButton>
        )}
      </NavigationContainer>
    </QuestionContainer>
  );
};

export default QuestionDisplay; 