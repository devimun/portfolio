import React from "react";
import styled from "styled-components";

const SidebarContainer = styled.aside`
  width: 400px;
  height: calc(100vh - 70px); /* Header 높이를 뺀 값으로 변경 */
  background-color: #081017;
  position: sticky;
  top: 70px; /* Header 높이와 동일하게 설정 */
  overflow: hidden;
  display: flex;
  flex-direction: column;
`;

const ScrollContainer = styled.div`
  padding: 0 10px 20px 10px; /* 상단 패딩 제거, 좌우 하단 패딩 유지 */
  overflow-y: auto;
  flex: 1;
  max-height: calc(100vh - 70px); /* 사이드바의 최대 높이 설정 */

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
`;

const MenuSection = styled.div`
  margin-bottom: 24px;
  background: rgba(215, 223, 228, 0.08);
  border-radius: 12px;
  padding: 12px 8px;
`;

const MenuTitle = styled.h2`
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 700;
  font-size: 16px;
  color: #d7dfe4;
  padding: 12px 16px;
  margin: 0;
  border-bottom: 1px solid rgba(215, 223, 228, 0.1);
  margin-bottom: 8px;
`;

const SubMenu = styled.div`
  display: flex;
  flex-direction: column;
  gap: 4px;
  padding: 4px;
`;

const MenuItem = styled.button`
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 500;
  font-size: 14px;
  color: #d7dfe4;
  padding: 10px 16px;
  background: ${(props) =>
    props.$isActive ? "rgba(35, 149, 233, 0.7)" : "transparent"};
  border: none;
  border-radius: 8px;
  text-align: left;
  cursor: pointer;
  width: 100%;
  transition: all 0.2s ease;

  &:hover {
    background: ${(props) =>
      props.$isActive ? "rgba(35, 149, 233, 0.7)" : "rgba(35, 149, 233, 0.4)"};
  }
`;

const menuData = [
  {
    title: "데이터 모델링의 이해",
    items: ["데이터 모델의 이해", "엔터티", "속성", "관계", "식별자"],
  },
  {
    title: "데이터 모델과 SQL",
    items: [
      "정규화",
      "관계와 조인의 이해",
      "모델이 표현하는 트랜잭션의 이해",
      "NULL 속성의 이해",
      "본질식별자 VS 인조식별자",
    ],
  },
  {
    title: "SQL 기본",
    items: [
      "관계형 데이터베이스 개요",
      "SELECT 문",
      "함수",
      "WHERE 절",
      "GROUP BY, HAVING 절",
      "ORDER BY 절",
      "조인",
      "표준 조인",
    ],
  },
  {
    title: "SQL 활용",
    items: [
      "서브 쿼리",
      "집합 연산자",
      "그룹 함수",
      "윈도우 함수",
      "TOP N 쿼리",
      "계층형 질의와 셀프 조인",
      "PIVOT절과 UNPIVOT절",
      "정규 표현식",
    ],
  },
  {
    title: "관리 구문",
    items: ["DML", "TCL", "DDL", "DCL"],
  },
];

const Sidebar = ({ activeItem, onItemClick }) => {
  return (
    <SidebarContainer>
      <ScrollContainer>
        {menuData.map((section, sectionIndex) => (
          <MenuSection key={sectionIndex}>
            <MenuTitle>{section.title}</MenuTitle>
            <SubMenu>
              {section.items.map((item, itemIndex) => (
                <MenuItem
                  key={itemIndex}
                  $isActive={activeItem === item}
                  onClick={() => onItemClick(item)}
                >
                  {item}
                </MenuItem>
              ))}
            </SubMenu>
          </MenuSection>
        ))}
      </ScrollContainer>
    </SidebarContainer>
  );
};

export default Sidebar;
