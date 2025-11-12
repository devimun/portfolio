import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/game/mobile_mode/provider/mobile_selected_game.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';
import 'package:unumbers/feature/utils/style.dart';

class ResetBtn extends ConsumerWidget {
  const ResetBtn({
    super.key,
    required this.game,
  });

  final GameName? game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGame = ref.watch(selectedGameProvider);
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: double.maxFinite,
        child: TextButton(
          onPressed: () async {
            ref.read(loadingProvider.notifier).state = true;
            await FireStoreConstants().resetGame(game ?? selectedGame);
            ref.read(loadingProvider.notifier).state = false;
          },
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            backgroundColor: AppStyle.gameMangeBtnColor,
          ),
          child: Text(
            'RESET',
            style: AppStyle.smallBtnText,
          ),
        ),
      ),
    );
  }
}
