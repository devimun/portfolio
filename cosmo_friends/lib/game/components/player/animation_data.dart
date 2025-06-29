import 'package:cosmo_friends/game/components/components.dart';
import 'package:flame/game.dart';

final Map<PlayerAsset, PlayerAnimationComponent> playerAnimationAssets = {
  PlayerAsset.normal: PlayerAnimationComponent(
    defaultVelocity: Vector2(0, 60),
    defaultPosition: Vector2(0, 5000),
    url: 'player/normal.png',
    textureSize: Vector2.all(200),
    frames: {
      PlayerState.idle: (0, 3),
      PlayerState.jump: (4, 5),
    },
  ),
  PlayerAsset.sad: PlayerAnimationComponent(
    defaultVelocity: Vector2(0, 60),
    defaultPosition: Vector2(0, 5000),
    url: 'player/sad.png',
    textureSize: Vector2.all(200),
    frames: {
      PlayerState.idle: (0, 3),
      PlayerState.jump: (4, 5),
    },
  ),
  PlayerAsset.shock: PlayerAnimationComponent(
    defaultVelocity: Vector2(0, 60),
    defaultPosition: Vector2(0, 5000),
    url: 'player/shock.png',
    textureSize: Vector2.all(200),
    frames: {
      PlayerState.idle: (0, 3),
      PlayerState.jump: (4, 5),
    },
  ),
  PlayerAsset.smile: PlayerAnimationComponent(
    defaultVelocity: Vector2(0, 60),
    defaultPosition: Vector2(0, 5000),
    url: 'player/smile.png',
    textureSize: Vector2.all(200),
    frames: {
      PlayerState.idle: (0, 3),
      PlayerState.jump: (4, 5),
    },
  ),
};
