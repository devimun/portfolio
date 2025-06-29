import 'dart:async';
import 'package:cosmo_friends/game/game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:cosmo_friends/game/components/components.dart';
import 'package:flutter/material.dart';

class Alien extends SpriteAnimationComponent
    with HasGameReference<CosmoFriends>, CollisionCallbacks {
  Alien({
    required this.component,
  }) : super(
          size: Vector2(component.width, component.height),
          anchor: Anchor.center,
          paint: Paint()..filterQuality = FilterQuality.high,
        );
  late SpriteAnimation idle;
  late Vector2 velocity;
  final AlienAnimationComponent component;
  void setStartValue() {
    position = component.defaultPosition.clone();
    velocity = component.defaultVelocity.clone();
  }

  void setStopValue() {
    velocity = Vector2.all(0);
    position = component.defaultPosition.clone();
  }

  @override
  void update(double dt) {
    // 적을 상단으로 이동시키는 움직임
    if (game.gameState != GameState.welcome) {
      position -= velocity * dt;
    }
    super.update(dt);
  }

  @override
  FutureOr<void> onLoad() async {
    velocity = component.defaultVelocity.clone();
    position = component.defaultPosition;
    add(RectangleHitbox());
    animation = await game.loadSpriteAnimation(
      component.url,
      SpriteAnimationData.sequenced(
        amount: component.amount,
        stepTime: component.stepTimes,
        textureSize: component.textureSize,
      ),
    );
    final shakeEffect = SequenceEffect(
      [
        MoveByEffect(Vector2(2, 0), EffectController(duration: 0.05)),
        MoveByEffect(Vector2(-4, 0), EffectController(duration: 0.1)),
        MoveByEffect(Vector2(2, 0), EffectController(duration: 0.05)),
      ],
      infinite: true,
    );
    add(shakeEffect);
    return super.onLoad();
  }
}
