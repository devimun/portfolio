<!-- @format -->

# SQLD Study (SQLD 자격증 학습/문제풀이/모의고사 웹앱)

이 프로젝트는 SQLD(데이터베이스 개발자) 자격증 취득을 위한 학습 자료, 퀴즈, 모의고사 기능을 제공하는 웹 애플리케이션입니다.  
Cursor 에디터의 AI Agent 및 MCP 서버를 활용해 개발 환경을 구축했으며, Figma MCP 서버를 이용해 디자인-개발 과정을 원활하게 진행했습니다.  
React 기반으로 제작되었으며, Firebase Hosting을 통해 배포했습니다.

참고 : [FIGMA MCP SERVER](https://github.com/GLips/Figma-Context-MCP)

### 🌐 웹사이트

## [![Visit Website](https://img.shields.io/badge/Visit-sqld--study.web.app-blue?style=for-the-badge&logo=google-chrome&logoColor=white)](https://sqld-study-3f30a.web.app/#/study)

---

## 주요 기능

- **학습 자료**: SQLD 시험에 필요한 이론과 핵심 내용을 정리하여 제공합니다.
- **퀴즈**: 기출 및 예상 문제를 퀴즈 형식으로 풀어볼 수 있습니다.
- **모의고사**: 실제 시험과 유사한 환경에서 실전 연습이 가능합니다.
- **반응형 UI**: 사용자 환경에 따른 UI가 제공됩니다.

---

## 폴더 구조

```
src/
  ├── App.js                # 라우팅 및 전체 앱 구조
  ├── index.js              # 엔트리 포인트
  ├── components/           # 주요 UI 컴포넌트
  │   ├── layout/           # Header, Footer, Sidebar 등 레이아웃 컴포넌트
  │   ├── quiz/             # 퀴즈 관련 컴포넌트 (Quiz, QuizPage, QuizResult 등)
  │   ├── study/            # 학습 콘텐츠 컴포넌트 (StudyContent 등)
  │   ├── mock_test/        # 모의고사 관련 컴포넌트 (MockTestPage, MockTestResults 등)
  │   ├── common/           # 공통 컴포넌트 (현재 비어 있음)
  │   └── SEO.js            # SEO 메타 태그 관리
  ├── data/                 # 학습/퀴즈/모의고사 데이터 파일
  │   ├── studyContent.js   # 이론 및 학습 자료
  │   ├── quizData.js       # 퀴즈 문제 데이터
  │   └── mock_exam.js      # 모의고사 문제 데이터
  ├── App.css, index.css    # 전역 스타일
  └── reportWebVitals.js    # 성능 측정
```

---

## 주요 기술 스택

- **React** (CRA 기반)
- **react-router-dom**: 라우팅
- **styled-components**: CSS-in-JS 스타일링
- **Firebase Hosting**: 배포 및 호스팅
- **react-helmet**: SEO 메타 태그 관리

---

## 라우팅 구조

- `/study` : SQLD 이론 및 학습 자료
- `/quiz` : SQLD 퀴즈 문제 풀이
- `/mock-exam` : SQLD 모의고사 실전 연습

---

## 기타

- **SEO**: 각 페이지별로 SEO 메타 태그가 자동 적용됩니다.
- **반응형 디자인**: 모바일, 태블릿, 데스크탑 모두 지원합니다.

---

📧 문의: devimun909@gmail.com
