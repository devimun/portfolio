import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';

// GAME START 버튼
class GameStartBtn extends StatelessWidget {
  const GameStartBtn({super.key, required this.game});
  final CosmoFriends game;

  void _startGame() {
    game.gameState = GameState.play;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _startGame,
      style: TextButton.styleFrom(
        backgroundColor: mainColor,
        shape: borderShape,
      ),
      child: Text(
        'GAME START',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
