import styled from "styled-components";

const Button = styled.a`
  display: inline-flex;
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

const BuyMeCoffeeButton = (props) => (
  <Button {...props}>
    <img
      src="https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg"
      alt="Buy me a coffee"
      loading="lazy"
    />
    개발자 후원하기
  </Button>
);

export default BuyMeCoffeeButton;