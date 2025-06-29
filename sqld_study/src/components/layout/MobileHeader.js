import React from 'react';
import styled from 'styled-components';
import { useNavigate, useLocation } from 'react-router-dom';

// 모바일 헤더 컴포넌트
const HeaderContainer = styled.div`
  display: none;
  
  @media (max-width: 768px) {
    display: flex;
    flex-direction: column;
    width: 100%;
    background-color: #081017;
    padding: 10px;
    border-bottom: 1px solid rgba(145, 166, 182, 0.2);
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
    height: 103px; /* 고정 높이 설정 */
    box-sizing: border-box;
  }
`;

const LogoSection = styled.div`
  display: flex;
  align-items: center;
  padding: 10px;
  height: 48px; /* 로고 섹션 높이 고정 */
`;

const Logo = styled.h1`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 700;
  font-size: 28px;
  color: #7EC1F1;
  letter-spacing: -0.04em;
  margin: 0;
  line-height: 1;
`;

const NavLinks = styled.div`
  display: flex;
  justify-content: space-between;
  padding: 0 10px;
  height: 35px; /* 네비게이션 링크 높이 고정 */
  align-items: center;
`;

const NavLink = styled.button`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-size: 14px;
  background: none;
  border: none;
  cursor: pointer;
  color: ${props => props.$isActive ? "#0D99FF" : "#D7DFE5"};
  font-weight: ${props => props.$isActive ? "700" : "500"};
  padding: 10px 0;
  height: 35px;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  justify-content: center;
`;

// 모바일 환경에서 헤더 높이만큼 추가 패딩을 제공하는 도우미 컴포넌트
export const MobileHeaderSpacer = styled.div`
  display: none;
  
  @media (max-width: 768px) {
    display: block;
    height: 103px; /* HeaderContainer 높이와 동일하게 설정 */
  }
`;

const MobileHeader = ({ activePage }) => {
  const navigate = useNavigate();
  const location = useLocation();
  
  // URL 경로를 기반으로 활성 페이지 추적
  const currentPath = location.pathname.substring(1); // '/' 제거
  const currentPage = activePage || currentPath || 'study';
  
  // 페이지 이동 함수
  const handlePageChange = (page) => {
    navigate(`/${page}`);
  };
  
  return (
    <HeaderContainer>
      <LogoSection>
        <Logo>SQLDStudy</Logo>
      </LogoSection>
      <NavLinks>
        <NavLink 
          $isActive={currentPage === "study"} 
          onClick={() => handlePageChange("study")}
        >
          개념 공부
        </NavLink>
        <NavLink 
          $isActive={currentPage === "quiz"} 
          onClick={() => handlePageChange("quiz")}
        >
          개념 확인
        </NavLink>
        <NavLink 
          $isActive={currentPage === "mock-exam"} 
          onClick={() => handlePageChange("mock-exam")}
        >
          실전 모의고사
        </NavLink>
      </NavLinks>
    </HeaderContainer>
  );
};

export default MobileHeader; 