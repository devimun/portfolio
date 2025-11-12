import 'dart:async';
import 'package:cosmo_friends/game/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BackGround extends SpriteComponent with HasGameReference<CosmoFriends> {
  BackGround()
      : super(
          paint: Paint()..filterQuality = FilterQuality.high,
          scale: Vector2(2, 2),
        );

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('background/background.png');
    anchor = Anchor.center;
    return super.onLoad();
  }
}
