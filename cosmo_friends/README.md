<!-- @format -->

# 🪐 Cosmo Friends - 게임 개발 포트폴리오

**플랫폼:** Flutter  
**장르:** 커맨드 입력 기반 캐주얼 점프 게임  
**출시 플랫폼:** Android , IOS
**개발 기간:** 2024.09 ~ 진행중  
**버전:** 1.1.7  
**기술 스택:** Flutter, Flame, Firebase, AdMob, Google Play Console

### 🔗 다운로드

[![Google Play](https://img.shields.io/badge/Download-Google_Play-black?style=for-the-badge&logo=google-play)](https://play.google.com/store/apps/details?id=com.goodday.cosmo_friends)
[![App Store](https://img.shields.io/badge/Download-App_Store-0D96F6?style=for-the-badge&logo=app-store&logoColor=white)](https://apps.apple.com/us/app/cosmo-friends/id6746978572)

## 🎮 프로젝트 소개

**Cosmo Friends**는 간단한 커맨드 입력을 통해 점프하고, 블랙홀(현재는 외계인)로부터 도망치는 캐주얼 아케이드 게임입니다.  
플레이어는 랜덤으로 생성된 커맨드 조합을 순서대로 입력해 문제를 해결하고, 그 보상으로 점프를 하며 생존하게 됩니다.

게임의 지속성과 재미를 높이기 위해 아바타 수집 요소, 리더보드, 재화 시스템, 사운드/시각 효과 등 다양한 기능을 구현했습니다.

---

## 🧩 핵심 기능

- 커맨드 기반 입력 게임 시스템
- 문제 정답/오답 시 시각 및 음향 피드백
- 플레이어 상태 기반 애니메이션/이동 로직
- 다양한 오버레이 UI
- 게임 몰입도를 위한 HUD 적용
- 캐릭터(아바타) 변경 시스템
- 게임 내 재화 시스템 및 광고 보상 시스템
- Firebase 기반 유저 데이터 및 계정 연동
- Google Play 리더보드 기능
- 버전/네트워크 체크 및 앱 업데이트 안내

---

## 📱 주요 UI 구성

- 메인 홈 화면 (게임 시작, 설정, 기록 확인, 아바타 설정 등)
- 게임 플레이 화면 (커맨드 입력, 점프 액션)
- 게임 종료 화면 (점수 및 리더보드 안내)
- 설정 화면 (사운드 설정, 계정 연동/탈퇴, 데이터 초기화)
- 아바타 변경 화면 (좌/우 버튼으로 탐색, 구매/적용 기능)
- 리더보드 화면 (상위 100명 표시)

---

## 🔧 기술 상세

| 항목       | 내용                                                     |
| ---------- | -------------------------------------------------------- |
| 게임 엔진  | Flame                                                    |
| 물리       | 커스텀 구현 (Forge2D 제거)                               |
| 상태 관리  | Riverpod, Stream                                         |
| 백엔드     | Firebase Authentication, Firestore, Crashlytics          |
| 광고       | AdMob (배너 및 보상형 광고)                              |
| 배포       | Google Play Console, iOS 준비 중                         |
| 애널리틱스 | Firebase Crashlytics                                     |
| 기타       | 앱 버전 체크, 네트워크 체크, 로딩 바, 스플래시 스크린 등 |

---

## 🔄 버전 히스토리 요약

### ✅ v1.0.0 ~ v1.1.0

- 기본 게임 구조 및 커맨드 키 시스템 구현
- 블랙홀 충돌, 점수 시스템, 오버레이 UI 완성
- 플레이어 물리 제거 후 커스텀 로직 적용
- 사운드 이펙트 및 배경 음악 추가
- Firebase 연동, 아바타 시스템 구현
- 광고 및 재화 시스템 구현
- 앱 출시 및 Google Play 등록

### ✅ v1.1.0 ~ v1.1.3

- 리뷰 요청 모달 추가
- 리더보드 기능 및 UI 구현
- 계정 연결 및 이전 기능 개선
- 버전 미스매치 안내 처리

### ✅ v1.1.4 ~ v1.1.7

- 게임 적 변경 (블랙홀 → 외계인)
- 전체 코드 리팩토링 및 폴더 구조 개선
- HUD 및 배경 구조 재정비
- iOS 광고 기능 추가
- 유지 보수성 향상을 위한 게임 컴포넌트 공통 부모 클래스화

---

## ✨ 향후 추가 목표

- 다양한 캐릭터/에셋 추가
- UI 및 UX 세부 개선
- 글로벌 사용자 대상 다국어 지원

---

📧 문의: devimun909@gmail.com
