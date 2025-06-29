import React, { useState } from "react";
import {
  HashRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import styled from "styled-components";
import Layout from "./components/layout/Layout";
import ContentArea from "./components/layout/ContentArea";
import StudyContent from "./components/study/StudyContent";
import QuizPage from "./components/quiz/QuizPage";
import MockTestPage from "./components/mock_test/MockTestPage";
import studyContent from "./data/studyContent";
// import SEO from "./components/SEO";

const AppContainer = styled.div`
  min-height: 100vh;
  background-color: #081017;
`;

function App() {
  const [activeItem, setActiveItem] = useState("데이터 모델의 이해");

  const handleItemClick = (item) => {
    setActiveItem(item);
    window.scrollTo(0, 0);
  };

  return (
    <Router>
      <AppContainer>

        <Layout>
          <Routes>
            <Route path="/" element={<Navigate to="/study" replace />} />
            <Route
              path="/study"
              element={
                <ContentArea>          
                  <StudyContent
                    item={activeItem}
                    contentData={studyContent}
                    onItemClick={handleItemClick}
                  />
                </ContentArea>
              }
            />
            <Route
              path="/quiz"
              element={
                <ContentArea>
                  
                  <QuizPage />
                </ContentArea>
              }
            />
            <Route
              path="/mock-exam"
              element={
                <ContentArea>
                 
                  <MockTestPage />
                </ContentArea>
              }
            />
          </Routes>
        </Layout>
      </AppContainer>
    </Router>
  );
}

export default App;
