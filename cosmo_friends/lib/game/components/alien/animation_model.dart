import 'package:cosmo_friends/game/components/config/base_animation_model.dart';

/// 외계인 애니메이션 설정을 담는 클래스입니다.
/// 역시 AnimationComponentData를 상속합니다.
class AlienAnimationComponent extends AnimationComponentData {
  final int amount; // 전체 프레임 수
  const AlienAnimationComponent({
    required super.width,
    required super.height,
    required super.url,
    required super.defaultVelocity,
    required super.defaultPosition,
    required super.stepTimes,
    required super.textureSize,
    required this.amount,
  });
}
