import React, { useState, useEffect } from "react";
import styled from "styled-components";
import Header from "./Header";
import Footer from "./Footer";

// 모바일 환경 감지
const useMobileDetection = () => {
  const [isMobile, setIsMobile] = useState(false);

  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768);
    };
    
    checkMobile();
    window.addEventListener('resize', checkMobile);
    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  return isMobile;
};

const LayoutContainer = styled.div`
  min-height: 100vh;
  background-color: #081017;
  display: flex;
  flex-direction: column;
`;

const MainContent = styled.div`
  display: flex;
  min-height: ${props => props.isMobile ? '100vh' : 'calc(100vh - 70px)'};
  padding-top: ${props => props.isMobile ? '0' : '70px'};
  
  @media (max-width: 768px) {
    flex-direction: column;
  }
`;

const Layout = ({ children }) => {
  const isMobile = useMobileDetection();
  
  return (
    <LayoutContainer>
      {!isMobile && <Header />}
      <MainContent isMobile={isMobile}>{children}</MainContent>
      <Footer />
    </LayoutContainer>
  );
};

export default Layout;
