import React from 'react';
import styled from 'styled-components';
import MockTestTimer from './MockTestTimer';

const SidebarContainer = styled.aside`
  width: 350px;
  height: 100vh;
  background-color: #081017;
  position: fixed;
  left: 0;
  overflow: hidden;
  padding-bottom: 150px;    
  display: flex;
  flex-direction: column;
  z-index: 100;
  
  @media (max-width: 768px) {
    width: 100%;
    height: calc(100vh - 103px); /* 모바일 헤더 높이(103px)를 제외 */
    left: 0;
    top: 103px; /* 모바일 헤더 높이만큼 아래로 이동 */
    padding-bottom: 100px;
  }
`;

const ScrollContainer = styled.div`
  padding: 20px 15px;
  overflow-y: auto;
  flex: 1;
  max-height: 100vh;

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
  
  @media (max-width: 768px) {
    padding: 15px 10px;
  }
`;

const SidebarSection = styled.div`
  margin-bottom: 24px;
  background: rgba(215, 223, 228, 0.08);
  border-radius: 12px;
  padding: 12px 8px;
  
  @media (max-width: 768px) {
    margin-bottom: 16px;
    padding: 10px 6px;
  }
`;

const SidebarTitle = styled.h2`
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 700;
  font-size: 16px;
  color: #d7dfe4;
  padding: 12px 16px;
  margin: 0;
  border-bottom: 1px solid rgba(215, 223, 228, 0.1);
  margin-bottom: 12px;
  
  @media (max-width: 768px) {
    font-size: 15px;
    padding: 10px 12px;
  }
`;

const TestInfo = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 12px;
  margin-bottom: 15px;
  padding: 12px;
  
  @media (max-width: 768px) {
    gap: 8px;
    padding: 8px;
  }
`;

const TestTitle = styled.div`
  font-family: "IBM Plex Sans", sans-serif;
  color: #d7dfe5;
  font-weight: 700;
  font-size: 18px;
  text-align: center;
  
  @media (max-width: 768px) {
    font-size: 16px;
  }
`;

const ToggleSidebarButton = styled.button`
  font-family: "IBM Plex Sans", sans-serif;
  background-color: rgba(35, 149, 233, 0.4);
  color: #d7dfe5;
  border: none;
  border-radius: 8px;
  padding: 10px 16px;
  width: 90%;
  margin: 10px auto;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.2s ease;
  font-weight: 500;
  
  &:hover {
    background-color: rgba(35, 149, 233, 0.6);
  }
  
  svg {
    margin-right: 8px;
  }
  
  @media (max-width: 768px) {
    padding: 8px 12px;
    font-size: 14px;
  }
`;

const QuestionList = styled.div`
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 8px;
  padding: 8px;
  
  @media (max-width: 768px) {
    grid-template-columns: repeat(4, 1fr);
    gap: 6px;
    padding: 6px;
  }
  
  @media (max-width: 480px) {
    grid-template-columns: repeat(3, 1fr);
  }
`;

const QuestionItem = styled.button`
  width: 100%;
  aspect-ratio: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: ${props => 
    props.isCurrent 
      ? 'rgba(35, 149, 233, 0.7)' 
      : props.isAnswered 
        ? 'rgba(60, 179, 113, 0.4)' 
        : 'rgba(215, 223, 228, 0.08)'
  };
  border-radius: 8px;
  color: #d7dfe5;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
  border: none;
  font-family: "IBM Plex Sans", sans-serif;

  &:hover {
    background-color: ${props => 
      props.isCurrent 
        ? 'rgba(35, 149, 233, 0.7)' 
        : props.isAnswered 
          ? 'rgba(60, 179, 113, 0.6)' 
          : 'rgba(35, 149, 233, 0.4)'
    };
  }
  
  @media (max-width: 768px) {
    font-size: 14px;
  }
`;

const StatusSection = styled.div`
  background: rgba(215, 223, 228, 0.08);
  border-radius: 12px;
  padding: 16px;
  margin-top: 20px;
  
  @media (max-width: 768px) {
    padding: 12px;
    margin-top: 16px;
  }
`;

const StatusTitle = styled.h3`
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 700;
  font-size: 16px;
  color: #d7dfe4;
  margin: 0 0 12px 0;
  padding-bottom: 8px;
  border-bottom: 1px solid rgba(215, 223, 228, 0.1);
  
  @media (max-width: 768px) {
    font-size: 15px;
    margin: 0 0 10px 0;
  }
`;

const StatusInfo = styled.div`
  display: flex;
  justify-content: space-between;
  color: #d7dfe5;
  margin-bottom: 8px;
  font-family: "IBM Plex Sans", sans-serif;
  padding: 6px 8px;
  
  &:hover {
    background: rgba(215, 223, 228, 0.05);
    border-radius: 6px;
  }
  
  @media (max-width: 768px) {
    font-size: 14px;
    padding: 5px 6px;
  }
`;

const CloseButton = styled.button`
  display: none;
  
  @media (max-width: 768px) {
    display: flex;
    position: fixed;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    background-color: rgba(35, 149, 233, 0.6);
    color: #d7dfe5;
    border: none;
    border-radius: 20px;
    padding: 10px 20px;
    font-family: "IBM Plex Sans", sans-serif;
    font-weight: 500;
    font-size: 16px;
    cursor: pointer;
    z-index: 110;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    
    &:hover {
      background-color: rgba(35, 149, 233, 0.8);
    }
  }
`;

const MockTestSidebar = ({ 
  questions, 
  currentQuestion, 
  userAnswers, 
  goToQuestion, 
  testNumber, 
  timeLeft, 
  toggleSidebar 
}) => {
  // 답변한 문제 수 계산
  const answeredCount = userAnswers.filter(answer => answer !== null).length;
  
  return (
    <SidebarContainer>
      <ScrollContainer>
        <SidebarSection>
          <TestInfo>
            <TestTitle>실전 모의고사 {testNumber}회</TestTitle>
            <MockTestTimer timeLeft={timeLeft} sidebarVisible={true} />
          </TestInfo>
          
          <ToggleSidebarButton onClick={toggleSidebar}>
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 1H4C2.34315 1 1 2.34315 1 4V12C1 13.6569 2.34315 15 4 15H12C13.6569 15 15 13.6569 15 12V4C15 2.34315 13.6569 1 12 1Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
              <path d="M5 1V15" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
            </svg>
            사이드바 숨기기
          </ToggleSidebarButton>
        </SidebarSection>
        
        <SidebarSection>
          <SidebarTitle>문제 목록</SidebarTitle>
          
          <QuestionList>
            {questions.map((_, index) => (
              <QuestionItem 
                key={index}
                isCurrent={index === currentQuestion}
                isAnswered={userAnswers[index] !== null}
                onClick={() => goToQuestion(index)}
              >
                {index + 1}
              </QuestionItem>
            ))}
          </QuestionList>
        </SidebarSection>
        
        <StatusSection>
          <StatusTitle>진행 상황</StatusTitle>
          <StatusInfo>
            <span>전체 문제:</span>
            <span>{questions.length}개</span>
          </StatusInfo>
          <StatusInfo>
            <span>답변 완료:</span>
            <span>{answeredCount}개</span>
          </StatusInfo>
          <StatusInfo>
            <span>남은 문제:</span>
            <span>{questions.length - answeredCount}개</span>
          </StatusInfo>
        </StatusSection>
      </ScrollContainer>
      
      <CloseButton onClick={toggleSidebar}>
        문제 풀기로 돌아가기
      </CloseButton>
    </SidebarContainer>
  );
};

export default MockTestSidebar; 