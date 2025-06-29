import React from 'react';
import styled from 'styled-components';

const TimerContainer = styled.div`
  font-family: 'IBM Plex Sans', sans-serif;
  font-size: 18px;
  font-weight: 700;
  color: ${props => props.isLow ? '#ff4d4d' : '#d7dfe5'};
  background-color: rgba(215, 223, 228, 0.08);
  padding: 10px 16px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  animation: ${props => props.isLow ? 'pulse 1s infinite' : 'none'};
  box-shadow: ${props => props.isLow ? '0 0 10px rgba(255, 77, 77, 0.5)' : 'none'};

  @keyframes pulse {
    0% {
      opacity: 1;
    }
    50% {
      opacity: 0.7;
    }
    100% {
      opacity: 1;
    }
  }
  
  @media (max-width: 768px) {
    font-size: 14px;
    padding: 6px 10px;
    
    /* MobileTopBar에서 사용되는 경우 */
    ${props => props.isTopBar && `
      background-color: rgba(35, 149, 233, 0.4);
      font-size: 13px;
      padding: 5px 8px;
    `}
  }
`;

// 모바일 타이머 디스플레이는 사이드바 전용으로 변경 (MobileTopBar와 중복을 피하기 위함)
const MobileTimerDisplay = styled.div`
  display: none;
  
  @media (max-width: 768px) {
    display: ${props => props.sidebarVisible ? 'flex' : 'none'};
    position: fixed;
    top: 10px;
    right: 10px;
    z-index: 50;
    font-family: 'IBM Plex Sans', sans-serif;
    font-size: 14px;
    font-weight: 700;
    color: ${props => props.isLow ? '#ff4d4d' : '#d7dfe5'};
    background-color: rgba(35, 149, 233, 0.6);
    padding: 6px 10px;
    border-radius: 6px;
    align-items: center;
    justify-content: center;
    animation: ${props => props.isLow ? 'pulse 1s infinite' : 'none'};
    box-shadow: ${props => props.isLow ? '0 0 10px rgba(255, 77, 77, 0.5)' : 'none'};
  }
`;

const MockTestTimer = ({ timeLeft, isTopBar, sidebarVisible }) => {
  // 남은 시간을 시:분:초 형태로 변환
  const formatTime = (seconds) => {
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;

    return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };
  
  // 모바일용 타이머 포맷 (분:초 또는 시:분:초)
  const formatMobileTime = (seconds) => {
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;

    if (hours > 0) {
      return `${hours}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }
    return `${minutes}:${secs.toString().padStart(2, '0')}`;
  };

  // 5분 이하일 때 경고 표시
  const isTimeRunningLow = timeLeft <= 300;

  return (
    <>
      <TimerContainer isLow={isTimeRunningLow} isTopBar={isTopBar}>
        {isTopBar ? formatMobileTime(timeLeft) : formatTime(timeLeft)}
      </TimerContainer>
      
      <MobileTimerDisplay isLow={isTimeRunningLow} sidebarVisible={sidebarVisible}>
        {formatMobileTime(timeLeft)}
      </MobileTimerDisplay>
    </>
  );
};

export default MockTestTimer; 