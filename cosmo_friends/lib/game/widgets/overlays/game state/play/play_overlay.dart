import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/widgets/command_keys.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/widgets/command_question.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/widgets/distance_board.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/widgets/score.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/widgets/wrong_scrore.dart';
import 'package:flutter/material.dart';

class PlayOverlay extends StatelessWidget {
  const PlayOverlay({required this.game, super.key});
  final CosmoFriends game;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    EdgeInsets padding = const EdgeInsets.all(10);
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Center(
          child: GameScore(),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: padding,
          width: width,
          child: const Questions(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DistanceBoard(),
            WrongScroreBoard(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Container(
          padding: padding,
          width: width,
          child: CommandKeys(
            game: game,
          ),
        )
      ],
    );
  }
}
