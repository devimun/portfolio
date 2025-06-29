import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/desktop_mode/provider/select_game_provider.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/game/game_share/widgets/game_name_to_kr.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/enum.dart';

import 'package:unumbers/feature/utils/functions.dart';

class GameSelectBtn extends ConsumerWidget {
  const GameSelectBtn({
    super.key,
    required this.gameModel,
    required this.username,
    required this.gameName,
    required this.viewIdx,
    required this.streamData,
  });
  final int viewIdx;
  final GameModel gameModel;
  final String username;
  final GameName gameName;
  final StreamData streamData;
  bool trySelectGame(WidgetRef ref, int viewIdx, GameName gameName) {
    for (int i = 0; i < 4; i++) {
      if (i == viewIdx) continue;
      final otherSelected = ref.read(selectProvider(i));
      if (otherSelected == gameName) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameName selectedGame = ref.watch(selectProvider(viewIdx));
    String gameNameKr = getGameName(gameName);
    return TextButton(
        style: TextButton.styleFrom(
          shape: LinearBorder(),
          backgroundColor: selectedGame == gameName
              ? const Color(0xff065AA2)
              : Color(0xff86A5AF),
          padding: EdgeInsets.all(1.0),
        ),
        onPressed: () {
          ref.read(loadingProvider.notifier).state = true;
          bool selectCheck = trySelectGame(ref, viewIdx, gameName);
          ref.read(loadingProvider.notifier).state = false;
          selectCheck
              ? ref.read(selectProvider(viewIdx).notifier).selectGame(gameName)
              : ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('이미 선택된 게임입니다.'),
                  ),
                );
        },
        child: GameNameToKr(
          gameNameKr: gameNameKr,
        ));
  }
}
