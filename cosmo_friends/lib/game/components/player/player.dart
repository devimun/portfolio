import 'dart:async';
import 'package:cosmo_friends/game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:cosmo_friends/game/components/components.dart';

class Player extends SpriteAnimationComponent
    with HasGameReference<CosmoFriends>, CollisionCallbacks {
  Player({
    required this.playerAnimationComponent,
  }) : super(
          size: Vector2.all(playerAnimationComponent.width),
          paint: Paint()..filterQuality = FilterQuality.high,
        );

  late PlayerState _playerState = PlayerState.idle;
  final PlayerAnimationComponent playerAnimationComponent;
  late Vector2 velocity;

  // 모든 애니메이션 저장
  final Map<PlayerState, SpriteAnimation> _animations = {};

  PlayerState get playerState => _playerState;

  set playerState(PlayerState afterPlayerState) {
    _playerState = afterPlayerState;
    changePlayerState(afterPlayerState);
    if (_playerState == PlayerState.jump) {
      _startJump();
    }
  }

  void changePlayerState(PlayerState state) {
    animation = _animations[state];
  }

  void _startJump() {
    Alien alien = game.alien;
    ParallaxComponent parallaxComponent = game.parallaxComponent;

    final originalVelocity = parallaxComponent.parallax!.baseVelocity.clone();
    parallaxComponent.parallax!.baseVelocity *= 4.0;

    Future.delayed(const Duration(milliseconds: 510), () {
      playerState = PlayerState.idle;
      parallaxComponent.parallax!.baseVelocity = originalVelocity;
    });

    velocity.setValues(0, velocity.y * 1.005);
    alien.velocity.setValues(0, alien.velocity.y * 1.01);
  }

  void setStopValue() {
    velocity = Vector2.all(0);
    position = playerAnimationComponent.defaultPosition.clone();
    playerState = PlayerState.idle;
  }

  void setStartValue() {
    position = playerAnimationComponent.defaultPosition.clone();
    velocity = playerAnimationComponent.defaultVelocity.clone();
    playerState = PlayerState.idle;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (game.gameState == GameState.play && other is Alien) {
      game.world.remove(game.player);
      if (game.gameState != GameState.end) {
        game.gameState = GameState.end;
      }
    }
  }

  @override
  void update(double dt) {
    if (playerState == PlayerState.jump) {
      position -= velocity * dt;
    }
    super.update(dt);
  }

  Future<void> setAvatar(String avatarLink) async {
    var asset = await game.images.load(playerAnimationComponent.url);
    anchor = Anchor.center;

    for (var entry in playerAnimationComponent.frames.entries) {
      final state = entry.key;
      final (start, end) = entry.value;
      final spriteAnimation = SpriteAnimation.fromFrameData(
        asset,
        SpriteAnimationData.range(
          start: start,
          end: end,
          amount: playerAnimationComponent.amount,
          stepTimes: List.filled(
            playerAnimationComponent.amount,
            playerAnimationComponent.stepTimes,
          ),
          textureSize: playerAnimationComponent.textureSize,
        ),
      );

      _animations[state] = spriteAnimation;
    }

    // 기본 애니메이션 설정
    animation = _animations[PlayerState.idle];
  }

  @override
  FutureOr<void> onLoad() async {
    position = playerAnimationComponent.defaultPosition;
    velocity = playerAnimationComponent.defaultVelocity.clone();
    await setAvatar(playerAnimationComponent.url);
    add(RectangleHitbox());
    return super.onLoad();
  }
}
