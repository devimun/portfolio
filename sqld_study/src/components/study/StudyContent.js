/** @format */

import React, {useState, useEffect, useRef} from "react";
import styled from "styled-components";
import Sidebar from "../layout/Sidebar";
import MobileHeader from "../layout/MobileHeader";
import MobileHeaderSpacer from "../layout/MobileHeader";

// 모바일 환경 감지
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

const StudyPageContainer = styled.div`
  display: flex;
  width: 100%;

  @media (max-width: 768px) {
    flex-direction: column;
  }
`;

// 모바일 탑 내비게이션
const MobileTopicNav = styled.div`
  display: none;
  position: relative;

  @media (max-width: 768px) {
    display: flex;
    align-items: center;
    padding: 10px;
    background-color: #081017;
    overflow-x: visible;
    white-space: nowrap;
    margin-bottom: 10px;

    /* 스크롤바 숨기기 */
    -ms-overflow-style: none;
    scrollbar-width: none;
    &::-webkit-scrollbar {
      display: none;
    }
  }
`;

const TopicIcon = styled.div`
  width: 24px;
  height: 24px;
  background-color: #ffffff;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 8px;
`;

const DropdownIcon = styled.div`
  margin-left: 8px;
  transition: transform 0.3s ease;
  transform: ${(props) => (props.$isOpen ? "rotate(180deg)" : "rotate(0deg)")};
`;

const TopicText = styled.span`
  font-family: "Plus Jakarta Sans", sans-serif;
  font-weight: 700;
  font-size: 14px;
  color: #ffffff;
`;

const DropdownButton = styled.button`
  display: flex;
  align-items: center;
  background: none;
  border: none;
  cursor: pointer;
  padding-top: 10px;
  color: #ffffff;
  width: 100%;
`;

const DropdownMenu = styled.div`
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background-color: #081017;
  border: 1px solid rgba(145, 166, 182, 0.2);
  border-radius: 8px;
  max-height: 70vh;
  overflow-y: auto;
  z-index: 1000;
  margin-top: 4px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
  display: ${(props) => (props.$isOpen ? "block" : "none")};
`;

const DropdownSection = styled.div`
  padding: 8px 0;
  border-bottom: 1px solid rgba(145, 166, 182, 0.1);

  &:last-child {
    border-bottom: none;
  }
`;

const DropdownSectionTitle = styled.div`
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 600;
  font-size: 14px;
  color: #d7dfe4;
  padding: 10px 16px;
  opacity: 0.7;
`;

const DropdownItem = styled.button`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 14px;
  background: none;
  border: none;
  display: block;
  width: 100%;
  text-align: left;
  padding: 10px 16px;
  color: ${(props) => (props.$isActive ? "#0D99FF" : "#d7dfe4")};
  font-weight: ${(props) => (props.$isActive ? "700" : "500")};
  background-color: ${(props) =>
    props.$isActive ? "rgba(35, 149, 233, 0.1)" : "transparent"};

  &:hover {
    background-color: rgba(35, 149, 233, 0.05);
  }
`;

const ContentContainer = styled.div`
  flex: 1;
  padding: 0 24px 24px 24px;

  @media (max-width: 768px) {
    padding: 16px;
  }
`;

const Title = styled.h1`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 28px;
  font-weight: 500;
  color: #d7dfe4;
  margin-bottom: 20px;

  @media (max-width: 768px) {
    font-size: 22px;
    margin-bottom: 16px;
  }
`;

const Paragraph = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 17px;
  line-height: 1.65;
  color: #d7dfe4;
  margin-bottom: 16px;

  @media (max-width: 768px) {
    font-size: 14px;
    line-height: 2;
  }
`;

const Examples = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 16px;
  line-height: 1.5;
  color: #a7b7c2;
  font-style: italic;
  margin-bottom: 20px;
  padding-left: 16px;
  border-left: 3px solid #2395e9;

  @media (max-width: 768px) {
    font-size: 14px;
    padding-left: 10px;
    margin-bottom: 16px;
  }
`;

const Subtitle = styled.h2`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 22px;
  font-weight: 500;
  color: #d7dfe4;
  margin: 24px 0 12px 0;

  @media (max-width: 768px) {
    font-size: 16px;
    margin: 20px 0 10px 0;
  }
`;

const List = styled.ul`
  margin-bottom: 20px;
  padding-left: 20px;

  @media (max-width: 768px) {
    margin-bottom: 16px;
    padding-left: 16px;
  }
`;

const ListItem = styled.li`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 16px;
  line-height: 1.6;
  color: #d7dfe4;
  margin-bottom: 8px;
  position: relative;

  @media (max-width: 768px) {
    font-size: 14px;
    line-height: 1.7;
    margin-bottom: 6px;
  }
`;

const CodeBlock = styled.pre`
  background-color: #0f1923;
  padding: 16px;
  border-radius: 8px;
  overflow-x: auto;
  font-family: "Source Code Pro", monospace;
  font-size: 14px;
  line-height: 1.5;
  color: #e9f1f8;
  margin-bottom: 20px;
  border-left: 3px solid #2395e9;

  @media (max-width: 768px) {
    font-size: 12px;
    padding: 12px;
    margin-bottom: 16px;
  }
`;

const TableContainer = styled.div`
  margin: 20px 0;
  overflow-x: auto;

  @media (max-width: 768px) {
    margin: 16px 0;
  }
`;

const Table = styled.table`
  width: 100%;
  border-collapse: collapse;
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 14px;
  color: #d7dfe4;
  margin-bottom: 20px;

  @media (max-width: 768px) {
    font-size: 12px;
    margin-bottom: 16px;
  }
`;

const Th = styled.th`
  background-color: #0f1923;
  padding: 12px 16px;
  text-align: left;
  border: 1px solid #2b3844;
  font-weight: 600;

  @media (max-width: 768px) {
    padding: 8px 12px;
  }
`;

const Td = styled.td`
  padding: 10px 16px;
  border: 1px solid #2b3844;
  background-color: rgba(15, 25, 35, 0.5);

  @media (max-width: 768px) {
    padding: 8px 12px;
  }
`;

const Caption = styled.p`
  font-family: "IBM Plex Sans", sans-serif;
  font-size: 14px;
  color: #a7b7c2;
  text-align: center;
  margin-top: 8px;
  font-style: italic;

  @media (max-width: 768px) {
    font-size: 12px;
  }
`;

// 다음 버튼 컴포넌트
const NextButton = styled.button`
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #2395e9;
  color: black;
  border: none;
  border-radius: 22px;
  padding: 10px 20px;
  font-family: "IBM Plex Sans", sans-serif;
  font-weight: 500;
  font-size: 15px;
  cursor: pointer;
  margin-top: 20px;
  width: 180px;

  @media (max-width: 768px) {
    margin: 20px auto;
  }
`;

const findNextItem = (currentItem, menuData) => {
  let found = false;
  let nextItem = null;

  for (const section of menuData) {
    for (let i = 0; i < section.items.length; i++) {
      if (found) {
        nextItem = section.items[i];
        return nextItem;
      }
      if (section.items[i] === currentItem) {
        found = true;
        if (i < section.items.length - 1) {
          nextItem = section.items[i + 1];
          return nextItem;
        }
      }
    }
  }

  return nextItem;
};

// 메뉴 데이터 (Sidebar.js와 동일)
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

const StudyContent = ({item, contentData, onItemClick}) => {
  const isMobile = useMobileDetection();
  // 'study', 'quiz', 'mock-exam'
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const dropdownRef = useRef(null);

  // 외부 클릭 감지하여 드롭다운 닫기
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setDropdownOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  // 항목 선택 시 드롭다운 닫기
  const handleItemSelect = (selectedItem) => {
    onItemClick(selectedItem);
    setDropdownOpen(false);
  };

  const nextItem = findNextItem(item, menuData);

  if (!contentData || !contentData[item]) {
    return (
      <StudyPageContainer>
        {isMobile ? (
          <>
            <MobileHeader />

            <MobileHeaderSpacer />
            <MobileTopicNav ref={dropdownRef}>
              <DropdownButton onClick={() => setDropdownOpen(!dropdownOpen)}>
                <div style={{ display: "flex", alignItems: "center" }}>
                  <TopicIcon>
                    <svg
                      width="16"
                      height="16"
                      viewBox="0 0 16 16"
                      fill="none"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="M2 4.5H14M2 9.5H14M2 14.5H8"
                        stroke="#000000"
                        strokeWidth="1.5"
                        strokeLinecap="round"
                        strokeLinejoin="round"
                      />
                    </svg>
                  </TopicIcon>
                  <TopicText>목록</TopicText>
                </div>
                <DropdownIcon $isOpen={dropdownOpen}>
                  <svg
                    width="16"
                    height="16"
                    viewBox="0 0 16 16"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M4 6L8 10L12 6"
                      stroke="white"
                      strokeWidth="1.5"
                      strokeLinecap="round"
                      strokeLinejoin="round"
                    />
                  </svg>
                </DropdownIcon>
              </DropdownButton>

              <DropdownMenu $isOpen={dropdownOpen}>
                {menuData.map((section, sectionIndex) => (
                  <DropdownSection key={sectionIndex}>
                    <DropdownSectionTitle>{section.title}</DropdownSectionTitle>
                    {section.items.map((menuItem, itemIndex) => (
                      <DropdownItem
                        key={itemIndex}
                        $isActive={menuItem === item}
                        onClick={() => handleItemSelect(menuItem)}
                      >
                        {menuItem}
                      </DropdownItem>
                    ))}
                  </DropdownSection>
                ))}
              </DropdownMenu>
            </MobileTopicNav>
          </>
        ) : (
          <Sidebar activeItem={item} onItemClick={onItemClick} />
        )}
        <ContentContainer>
          <Title>준비 중입니다</Title>
          <Paragraph>
            선택하신 "{item}" 주제의 학습 내용을 준비 중입니다. 다른 주제를
            선택해 주세요.
          </Paragraph>
        </ContentContainer>
      </StudyPageContainer>
    );
  }

  const data = contentData[item];

  return (
    <StudyPageContainer>
      {isMobile ? (
        <>
          <MobileHeader />
          <MobileHeaderSpacer />
          <MobileTopicNav ref={dropdownRef}>
            <DropdownButton onClick={() => setDropdownOpen(!dropdownOpen)}>
              <div style={{ display: "flex", alignItems: "center" }}>
                <TopicIcon>
                  <svg
                    width="16"
                    height="16"
                    viewBox="0 0 16 16"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      d="M2 4.5H14M2 9.5H14M2 14.5H8"
                      stroke="#000000"
                      strokeWidth="1.5"
                      strokeLinecap="round"
                      strokeLinejoin="round"
                    />
                  </svg>
                </TopicIcon>
                <TopicText>{item}</TopicText>
              </div>
              <DropdownIcon $isOpen={dropdownOpen}>
                <svg
                  width="16"
                  height="16"
                  viewBox="0 0 16 16"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M4 6L8 10L12 6"
                    stroke="white"
                    strokeWidth="1.5"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                  />
                </svg>
              </DropdownIcon>
            </DropdownButton>

            <DropdownMenu $isOpen={dropdownOpen}>
              {menuData.map((section, sectionIndex) => (
                <DropdownSection key={sectionIndex}>
                  <DropdownSectionTitle>{section.title}</DropdownSectionTitle>
                  {section.items.map((menuItem, itemIndex) => (
                    <DropdownItem
                      key={itemIndex}
                      $isActive={menuItem === item}
                      onClick={() => handleItemSelect(menuItem)}
                    >
                      {menuItem}
                    </DropdownItem>
                  ))}
                </DropdownSection>
              ))}
            </DropdownMenu>
          </MobileTopicNav>
        </>
      ) : (
        <Sidebar activeItem={item} onItemClick={onItemClick} />
      )}

      <ContentContainer>
        <Title>{data.title}</Title>
        {data.content.map((section, index) => {
          switch (section.type) {
            case "paragraph":
              return <Paragraph key={index}>{section.text}</Paragraph>;
            case "examples":
              return <Examples key={index}>{section.text}</Examples>;
            case "subtitle":
              return <Subtitle key={index}>{section.text}</Subtitle>;
            case "list":
              return (
                <List key={index}>
                  {section.items.map((item, itemIndex) => (
                    <ListItem key={itemIndex}>{item}</ListItem>
                  ))}
                </List>
              );
            case "code":
              return <CodeBlock key={index}>{section.text}</CodeBlock>;
            case "table":
              return (
                <TableContainer key={index}>
                  <Table>
                    <thead>
                      <tr>
                        {section.headers.map((header, headerIndex) => (
                          <Th key={headerIndex}>{header}</Th>
                        ))}
                      </tr>
                    </thead>
                    <tbody>
                      {section.rows.map((row, rowIndex) => (
                        <tr key={rowIndex}>
                          {row.map((cell, cellIndex) => (
                            <Td key={cellIndex}>{cell}</Td>
                          ))}
                        </tr>
                      ))}
                    </tbody>
                  </Table>
                  {section.caption && <Caption>{section.caption}</Caption>}
                </TableContainer>
              );
            default:
              return null;
          }
        })}

        {nextItem && (
          <NextButton onClick={() => onItemClick(nextItem)}>다음 →</NextButton>
        )}
      </ContentContainer>
    </StudyPageContainer>
  );
};

export default StudyContent;
