/** @format */

import styled from "styled-components";
import {exam1, exam2} from "../../data/mock_exam";
import {useState, useEffect, useRef} from "react";
import MockTestSidebar from "./MockTestSidebar";
import QuestionDisplay from "./QuestionDisplay";
import MockTestTimer from "./MockTestTimer";
import MobileHeader, {MobileHeaderSpacer} from "../layout/MobileHeader";
import MockTestResults from "./MockTestResults";

const MockTestPageContainer = styled.div`
  width: 100%;
  height: 100%;
  padding: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  position: relative;
`;

const TestSelectionContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
  width: 100%;
  padding: 20px;

  @media (max-width: 768px) {
    padding: 15px;
  }
`;

const TestSelectionHeading = styled.h1`
  color: #d7dfe5;
  margin-bottom: 30px;
  font-family: "IBM Plex Sans", sans-serif;
  text-align: center;

  @media (max-width: 768px) {
    font-size: 24px;
    margin-bottom: 20px;
  }

  @media (max-width: 480px) {
    font-size: 20px;
  }
`;

const TestRouteBtn = styled.button`
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 500;
  font-size: 15px;
  color: #d7dfe5;
  padding: 12px 24px;
  background-color: transparent;
  border: 1.5px solid rgba(214, 224, 230, 0.2);
  border-radius: 12px;
  cursor: pointer;
  transition: all 0.2s ease;
  margin: 10px;
  width: 200px;

  &:hover {
    background-color: rgba(35, 149, 233, 0.4);
  }

  @media (max-width: 768px) {
    width: 90%;
    max-width: 280px;
    padding: 10px 16px;
    font-size: 14px;
  }
`;

const StartButton = styled(TestRouteBtn)`
  background-color: rgba(35, 149, 233, 0.6);
  margin-top: 30px;

  &:hover {
    background-color: rgba(35, 149, 233, 0.8);
  }

  @media (max-width: 768px) {
    margin-top: 20px;
  }
`;

const TestContainer = styled.div`
  display: flex;
  width: 100%;
  height: 100%;
  position: relative;
`;

const ContentContainer = styled.div`
  flex: 1;
  padding: 20px;
  transition: margin-left 0.3s ease;
  margin-left: ${(props) => (props.sidebarVisible ? "350px" : "0")};

  @media (max-width: 1200px) {
    padding: 16px;
    margin-left: ${(props) => (props.sidebarVisible ? "350px" : "0")};
  }

  @media (max-width: 768px) {
    padding: 16px 12px;
    margin-left: 0;
    padding-top: 120px; /* 모바일 탑바 아래 추가 패딩 */
  }
`;

const ShowSidebarButton = styled.button`
  position: fixed;
  top: 20px;
  left: 20px;
  background-color: rgba(35, 149, 233, 0.4);
  color: #d7dfe5;
  border: none;
  border-radius: 8px;
  padding: 10px 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.2s ease;
  z-index: 50;
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 500;

  &:hover {
    background-color: rgba(35, 149, 233, 0.6);
  }

  svg {
    margin-right: 8px;
  }

  @media (max-width: 768px) {
    top: 10px;
    left: 10px;
    padding: 8px 12px;
    font-size: 14px;
  }
`;

const MobileTopBar = styled.div`
  display: none;

  @media (max-width: 768px) {
    display: flex;
    position: fixed;
    top: 103px; /* MobileHeader 높이와 일치 */
    left: 0;
    width: 100%;
    background-color: #081017;
    border-bottom: 1px solid rgba(214, 224, 230, 0.1);
    padding: 10px;
    z-index: 90; /* MobileHeader보다 낮은 z-index */
    flex-direction: column;
    height: auto; /* 높이 자동 조정으로 변경 */
    min-height: 60px; /* 최소 높이 설정 */
    box-sizing: border-box;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 그림자 추가로 가시성 향상 */
  }
`;

const MobileTopBarContent = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
`;

const MobileQuestionScroller = styled.div`
  display: flex;
  overflow-x: auto;
  padding: 10px 5px;
  margin-top: 8px;
  gap: 6px;
  width: 100%;

  /* 스크롤바 숨기기 */
  -ms-overflow-style: none; /* IE and Edge */
  scrollbar-width: none; /* Firefox */

  &::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera */
  }
`;

const MobileQuestionDot = styled.button`
  min-width: 36px;
  height: 36px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: ${(props) =>
    props.isCurrent
      ? "rgba(35, 149, 233, 0.7)"
      : props.isAnswered
      ? "rgba(60, 179, 113, 0.4)"
      : "rgba(215, 223, 228, 0.08)"};
  border-radius: 18px;
  color: #d7dfe5;
  font-weight: 600;
  font-size: 14px;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  font-family: "IBM Plex Sans", sans-serif;
`;

const MobileTestTitle = styled.div`
  font-family: "IBM Plex Sans", sans-serif;
  color: #d7dfe5;
  font-weight: 600;
  font-size: 14px;
`;

// MobileTopBar 높이만큼 공간을 확보하는 스페이서
const MobileTopBarSpacer = styled.div`
  display: none;

  @media (max-width: 768px) {
    display: block;
    height: auto; /* 자동 높이로 변경 */
    min-height: 120px; /* 모바일 탑바 높이를 충분히 확보하기 위해 증가 */
  }
`;

const ResultContainer = styled.div`
  width: 100%;
  padding: 20px;
  background-color: rgba(12, 20, 28, 0.5);
  border-radius: 12px;
  margin-top: 20px;
  color: #d7dfe5;
  font-family: "IBM Plex Sans", sans-serif;

  h2 {
    color: #2395e9;
    margin-bottom: 15px;
    font-weight: 700;
  }

  p {
    margin-bottom: 8px;
    padding: 8px;
    border-radius: 6px;

    &:hover {
      background: rgba(215, 223, 228, 0.05);
    }
  }

  @media (max-width: 768px) {
    padding: 16px;
    margin-top: 16px;

    h2 {
      font-size: 18px;
      margin-bottom: 12px;
    }

    p {
      font-size: 14px;
      margin-bottom: 6px;
      padding: 6px;
    }
  }
`;

// 모바일 환경 감지 hook 추가
const useMobileDetection = () => {
  const [isMobile, setIsMobile] = useState(false);

  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768);
    };

    checkMobile();
    window.addEventListener("resize", checkMobile);
    return () => window.removeEventListener("resize", checkMobile);
  }, []);

  return isMobile;
};

const MockTestPage = () => {
  const testList = [exam1, exam2];
  const [selectedTest, setSelectedTest] = useState(null);
  const [activeTest, setActiveTest] = useState(null);
  const [currentQuestion, setCurrentQuestion] = useState(0);
  const [userAnswers, setUserAnswers] = useState([]);
  const [sidebarVisible, setSidebarVisible] = useState(true);
  const [timeLeft, setTimeLeft] = useState(90 * 60); // 90분을 초 단위로
  const [testFinished, setTestFinished] = useState(false);
  const [showResultsPage, setShowResultsPage] = useState(false);

  const timerRef = useRef(null);
  const mobileQuestionScrollRef = useRef(null);

  // 모바일 감지 추가
  const isMobile = useMobileDetection();

  // 시험 시작 함수
  const startTest = () => {
    if (selectedTest) {
      setActiveTest(selectedTest);
      setUserAnswers(new Array(selectedTest.length).fill(null));
      setTestFinished(false);
      setShowResultsPage(false);

      // 타이머 시작
      timerRef.current = setInterval(() => {
        setTimeLeft((prev) => {
          if (prev <= 1) {
            clearInterval(timerRef.current);
            setTestFinished(true);
            setShowResultsPage(true);
            return 0;
          }
          return prev - 1;
        });
      }, 1000);
    }
  };

  // 컴포넌트 언마운트 시 타이머 정리
  useEffect(() => {
    return () => {
      if (timerRef.current) {
        clearInterval(timerRef.current);
      }
    };
  }, []);

  // 모바일 뷰에서 사이드바 표시 시 스크롤 방지
  useEffect(() => {
    const handleResize = () => {
      if (window.innerWidth <= 768 && sidebarVisible) {
        document.body.style.overflow = "hidden";
      } else {
        document.body.style.overflow = "auto";
      }
    };

    handleResize();
    window.addEventListener("resize", handleResize);

    return () => {
      window.removeEventListener("resize", handleResize);
      document.body.style.overflow = "auto";
    };
  }, [sidebarVisible]);

  // 모바일 문제 스크롤러에서 현재 문제가 보이도록 스크롤 조정
  useEffect(() => {
    if (mobileQuestionScrollRef.current && window.innerWidth <= 768) {
      const scrollContainer = mobileQuestionScrollRef.current;
      const selectedElement = scrollContainer.children[currentQuestion];

      if (selectedElement) {
        const containerWidth = scrollContainer.offsetWidth;
        const elementLeft = selectedElement.offsetLeft;
        const elementWidth = selectedElement.offsetWidth;

        // 중앙 정렬 스크롤 계산
        const scrollPosition =
          elementLeft - containerWidth / 2 + elementWidth / 2;
        scrollContainer.scrollTo({
          left: scrollPosition,
          behavior: "smooth",
        });
      }
    }
  }, [currentQuestion]);

  // 답안 선택 함수
  const handleAnswerSelect = (questionIndex, answerIndex) => {
    const newAnswers = [...userAnswers];
    newAnswers[questionIndex] = answerIndex;
    setUserAnswers(newAnswers);
  };

  // 문제 이동 함수
  const goToQuestion = (index) => {
    setCurrentQuestion(index);

    // 모바일에서 문제 선택 시 사이드바 닫기
    if (window.innerWidth <= 768) {
      setSidebarVisible(false);
    }
  };

  // 시험 제출 함수
  const submitTest = () => {
    clearInterval(timerRef.current);
    setTestFinished(true);
    setShowResultsPage(true);
  };

  // 모의고사 선택 화면으로 돌아가기
  const handleReturnToSelection = () => {
    setActiveTest(null);
    setSelectedTest(null);
    setTimeLeft(90 * 60);
    setTestFinished(false);
    setShowResultsPage(false);
  };

  // 사이드바 토글 함수
  const toggleSidebar = () => {
    // 모바일에서는 사이드바 토글이 필요 없으므로 데스크탑에서만 동작
    if (!isMobile) {
      setSidebarVisible(!sidebarVisible);
    }
  };

  // 시험 결과 계산
  const calculateResults = () => {
    if (!testFinished || !activeTest) return null;

    let correctCount = 0;
    activeTest.forEach((question, idx) => {
      if (userAnswers[idx] === question.answer) {
        correctCount++;
      }
    });

    return {
      totalQuestions: activeTest.length,
      correctAnswers: correctCount,
      score: Math.round((correctCount / activeTest.length) * 100),
    };
  };

  const results = calculateResults();

  if (!activeTest) {
    return (
      <MockTestPageContainer>
        <MobileHeader />
        <MobileHeaderSpacer />
        <TestSelectionContainer>
          <TestSelectionHeading>실전 모의고사 선택</TestSelectionHeading>
          {testList.map((exam, idx) => (
            <TestRouteBtn
              key={idx}
              onClick={() => setSelectedTest(exam)}
              style={
                selectedTest === exam
                  ? {backgroundColor: "rgba(35, 149, 233, 0.4)"}
                  : {}
              }
            >
              {`${idx + 1}회 실전 모의고사`}
            </TestRouteBtn>
          ))}
          {selectedTest && (
            <StartButton onClick={startTest}>모의고사 시작하기</StartButton>
          )}
        </TestSelectionContainer>
      </MockTestPageContainer>
    );
  }

  // 결과 페이지 표시
  if (testFinished && showResultsPage && results) {
    return (
      <MockTestPageContainer>
        <MobileHeader />
        <MobileHeaderSpacer />
        <ContentContainer sidebarVisible={false}>
          <MockTestResults
            questions={activeTest}
            userAnswers={userAnswers}
            totalQuestions={results.totalQuestions}
            correctAnswers={results.correctAnswers}
            score={results.score}
            onReturnToSelection={handleReturnToSelection}
          />
        </ContentContainer>
      </MockTestPageContainer>
    );
  }

  return (
    <MockTestPageContainer>
      <MobileHeader />
      <MobileHeaderSpacer />
      <TestContainer>
        {/* 데스크탑 모드에서만 사이드바 표시 */}
        {!isMobile && sidebarVisible ? (
          <MockTestSidebar
            questions={activeTest}
            currentQuestion={currentQuestion}
            userAnswers={userAnswers}
            goToQuestion={goToQuestion}
            testNumber={testList.indexOf(activeTest) + 1}
            timeLeft={timeLeft}
            toggleSidebar={toggleSidebar}
          />
        ) : (
          !isMobile && (
            <ShowSidebarButton onClick={toggleSidebar}>
              <svg
                width="16"
                height="16"
                viewBox="0 0 16 16"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M1 4C1 2.34315 2.34315 1 4 1H12C13.6569 1 15 2.34315 15 4V12C15 13.6569 13.6569 15 12 15H4C2.34315 15 1 13.6569 1 12V4Z"
                  stroke="currentColor"
                  strokeWidth="1.5"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
                <path
                  d="M5 1V15"
                  stroke="currentColor"
                  strokeWidth="1.5"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
              사이드바 표시
            </ShowSidebarButton>
          )
        )}

        {/* 모바일 모드에서는 항상 탑바 표시 */}
        {isMobile && (
          <>
            {/* 모바일 전용 상단 바 */}
            <MobileTopBar>
              <MobileTopBarContent>
                <MobileTestTitle>
                  실전 모의고사 {testList.indexOf(activeTest) + 1}회
                </MobileTestTitle>
                <MockTestTimer
                  timeLeft={timeLeft}
                  isTopBar={true}
                  sidebarVisible={false}
                />
              </MobileTopBarContent>

              <MobileQuestionScroller ref={mobileQuestionScrollRef}>
                {activeTest.map((_, index) => (
                  <MobileQuestionDot
                    key={index}
                    isCurrent={index === currentQuestion}
                    isAnswered={userAnswers[index] !== null}
                    onClick={() => goToQuestion(index)}
                  >
                    {index + 1}
                  </MobileQuestionDot>
                ))}
              </MobileQuestionScroller>
            </MobileTopBar>
            <MobileTopBarSpacer />
          </>
        )}

        <ContentContainer sidebarVisible={!isMobile && sidebarVisible}>
          <QuestionDisplay
            question={activeTest[currentQuestion]}
            questionIndex={currentQuestion}
            totalQuestions={activeTest.length}
            selectedAnswer={userAnswers[currentQuestion]}
            onAnswerSelect={(answer) =>
              handleAnswerSelect(currentQuestion, answer)
            }
            onPrevious={() =>
              currentQuestion > 0 && setCurrentQuestion(currentQuestion - 1)
            }
            onNext={() =>
              currentQuestion < activeTest.length - 1 &&
              setCurrentQuestion(currentQuestion + 1)
            }
            onSubmit={submitTest}
            isLast={currentQuestion === activeTest.length - 1}
            testFinished={testFinished}
          />

          {testFinished && !showResultsPage && results && (
            <ResultContainer>
              <h2>모의고사 결과</h2>
              <p>총 문항 수: {results.totalQuestions}개</p>
              <p>정답 수: {results.correctAnswers}개</p>
              <p>점수: {results.score}점</p>
            </ResultContainer>
          )}
        </ContentContainer>
      </TestContainer>
    </MockTestPageContainer>
  );
};

export default MockTestPage;
