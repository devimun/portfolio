import 'package:flame/game.dart';
import 'package:cosmo_friends/game/components/components.dart';

final Map<AlienAsset, AlienAnimationComponent> alienAnimationAsset = {
  AlienAsset.normal: AlienAnimationComponent(
    height: 202 / 3.2,
    width: 314 / 3.2,
    defaultVelocity: Vector2(0, 30),
    defaultPosition: Vector2(0, 5500),
    url: 'alien/animation/alien.png',
    amount: 5,
    stepTimes: 0.25,
    textureSize: Vector2(314, 202),
  ),
};
