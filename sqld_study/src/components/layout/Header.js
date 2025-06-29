import React from "react";
import styled from "styled-components";
import { Link, useLocation } from "react-router-dom";

const HeaderContainer = styled.header`
  background-color: #081017;
  padding: 16px 48px;
  border-bottom: 1.5px solid rgba(255, 255, 255, 0.2);
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
`;

const HeaderContent = styled.div`
  display: grid;
  grid-template-columns: 200px 1fr 200px;
  align-items: center;
`;

const Logo = styled.div`
  display: flex;
  align-items: center;
  gap: 4px;
`;

const LogoText = styled.h1`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 700;
  font-size: 28px;
  color: #7ec1f1;
  letter-spacing: -0.04em;
  margin: 0;
`;

const NavLinks = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 48px;
`;

const NavLink = styled(Link)`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-size: 20px;
  text-decoration: none;
  color: ${(props) => (props.$isActive ? "#0D99FF" : "#D7DFE5")};
  font-weight: ${(props) => (props.$isActive ? "700" : "500")};
`;

const Header = () => {
  const location = useLocation();

  return (
    <HeaderContainer>
      <HeaderContent>
        <Logo>
          <LogoText>SQLDStudy</LogoText>
        </Logo>
        <NavLinks>
          <NavLink to="/study" $isActive={location.pathname === "/study"}>
            개념 학습
          </NavLink>
          <NavLink to="/quiz" $isActive={location.pathname === "/quiz"}>
            개념 확인
          </NavLink>
          <NavLink
            to="/mock-exam"
            $isActive={location.pathname === "/mock-exam"}
          >
            실전 모의고사
          </NavLink>
        </NavLinks>
        <div />
      </HeaderContent>
    </HeaderContainer>
  );
};

export default Header;
