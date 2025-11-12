import 'package:flame/game.dart';

/// 애니메이션에 공통적으로 필요한 데이터들을 정의한 추상 클래스입니다.
/// 플레이어나 외계인처럼 공통된 필드를 갖는 캐릭터 클래스들이 이 클래스를 상속합니다.
abstract class AnimationComponentData {
  final double width; // 캐릭터의 가로 길이
  final double height; // 캐릭터의 세로 길이
  final String url; // 애셋 이미지 경로
  final Vector2 defaultVelocity; // 기본 속도 (예: 움직이지 않을 땐 (0, 0))
  final Vector2 defaultPosition; // 기본 위치 (게임 시작 시 위치)
  final double stepTimes; // 각 프레임마다 걸리는 시간 (초 단위)
  final Vector2 textureSize; // 이미지 내에서 한 프레임의 크기

  const AnimationComponentData({
    required this.width,
    required this.height,
    required this.url,
    required this.defaultVelocity,
    required this.defaultPosition,
    required this.stepTimes,
    required this.textureSize,
  });
}
