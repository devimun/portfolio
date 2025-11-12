import React from "react";
import styled from "styled-components";

const FooterContainer = styled.footer`
  width: 100%;
  background-color: #0a1622;
  color: #ffffff;
  padding: 20px 0;
  text-align: center;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
`;

const FooterContent = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 15px;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
`;

const ButtonsContainer = styled.div`
  display: flex;
  gap: 15px;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
`;

const FooterButton = styled.a`
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 10px 15px;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s ease;
  cursor: pointer;
  color: #ffffff;

  &:hover {
    transform: translateY(-2px);
  }
`;

const ContactButton = styled(FooterButton)`
  background-color: #2563eb;

  &:hover {
    background-color: #1d4ed8;
  }
`;

const BuyMeCoffeeButton = styled.a`
  // display: inline-flex;
  align-items: center;
  background-color: #5f7fff;
  color: #ffffff;
  padding: 5px 15px;
  border-radius: 5px;
  font-family: "Poppins", sans-serif;
  text-decoration: none;
  font-weight: 500;
  transition: all 0.2s ease;
  gap: 8px;

  &:hover {
    background-color: #4a6ae3;
    transform: translateY(-2px);
  }

  img {
    height: 28px;
    width: auto;
  }
`;

const Copyright = styled.p`
  margin-top: 15px;
  font-size: 14px;
  color: rgba(255, 255, 255, 0.6);
`;

const Footer = () => {
  const currentYear = new Date().getFullYear();

  return (
    <FooterContainer>
      <FooterContent>
        <ButtonsContainer>
          <ContactButton href="https://open.kakao.com/o/sKwqjIwh">
            📧 오픈채팅으로 문의하기
          </ContactButton>
          <BuyMeCoffeeButton
            href="https://www.buymeacoffee.com/devimun909"
            target="_blank"
            rel="noopener noreferrer"
          >
            <img
              src="https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg"
              alt="Buy me a coffee"
              loading="lazy"
            />
            개발자 후원하기
          </BuyMeCoffeeButton>
        </ButtonsContainer>
        <Copyright>© {currentYear} SQLD 스터디. All rights reserved.</Copyright>
      </FooterContent>
    </FooterContainer>
  );
};

export default Footer;
