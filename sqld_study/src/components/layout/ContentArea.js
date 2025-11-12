import React from "react";
import styled from "styled-components";
import { useLocation } from "react-router-dom";

const ContentContainer = styled.main`
  flex: 1;
  padding: ${(props) => (props.$isQuizPage ? "0" : "24px")};
  background-color: #081017;
  color: #d7dfe4;
  display: flex;
  height: ${(props) => (props.$isQuizPage ? "100%" : "auto")};
`;

const Title = styled.h1`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 28px;
  font-weight: 400;
  line-height: 1.14;
  letter-spacing: -0.01em;
  margin-bottom: 12px;
`;

const ContentArea = ({ children }) => {
  const location = useLocation();
  const isQuizPage = location.pathname === "/quiz";

  return (
    <ContentContainer $isQuizPage={isQuizPage}>
      {children == null && <Title>{"준비 중 입니다."}</Title>}
      {children}
    </ContentContainer>
  );
};

export default ContentArea;
