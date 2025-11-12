import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/widgets/game_name_to_kr.dart';
import 'package:unumbers/feature/game/mobile_mode/provider/mobile_selected_game.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/functions.dart';

class GameChangeBtn extends ConsumerWidget {
  const GameChangeBtn({super.key, required this.game});
  final GameName game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGame = ref.watch(selectedGameProvider);

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: TextButton(
        onPressed: () {
          ref.read(selectedGameProvider.notifier).selectGame(game);
        },
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          shape: LinearBorder(),
          backgroundColor: selectedGame == game
              ? const Color(0xff065AA2)
              : Color(0xff86A5AF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: GameNameToKr(
            gameNameKr: getGameName(game),
          ),
        ),
      ),
    );
  }
}
