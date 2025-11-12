import 'package:cosmo_friends/game/components/components.dart';

/// 플레이어 애니메이션 설정을 담는 클래스입니다.
/// AnimationComponentData를 상속하여 공통 필드를 물려받습니다.
class PlayerAnimationComponent extends AnimationComponentData {
  final int amount; // 전체 프레임 수
  final Map<PlayerState, (int start, int end)> frames;
  // 각 상태별로 어떤 프레임 범위를 사용할지 정의합니다.
  // 예: idle 상태는 0~3번 프레임 사용

  PlayerAnimationComponent({
    required super.url,
    super.width = 70.0,
    super.height = 70.0,
    required super.defaultVelocity,
    required super.defaultPosition,
    super.stepTimes = 0.15,
    required super.textureSize,
    this.amount = 6,
    this.frames = const {
      PlayerState.idle: (0, 3),
      PlayerState.jump: (4, 5),
    },
  });
}
