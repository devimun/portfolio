import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';
import 'package:unumbers/feature/utils/style.dart';

class DeleteBtn extends ConsumerWidget {
  const DeleteBtn({
    super.key,
    required this.game,
    required this.gameModel,
  });
  final GameName game;
  final GameModel gameModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: double.maxFinite,
      child: TextButton(
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
        onPressed: () async {
          ref.read(loadingProvider.notifier).state = true;
          await FireStoreConstants()
              .deleteNumber(gameName: game, gameModel: gameModel);
          ref.read(loadingProvider.notifier).state = false;
        },
        child: const Text(
          'DEL',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
