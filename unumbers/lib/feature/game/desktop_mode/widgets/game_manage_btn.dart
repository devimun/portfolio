import 'package:flutter/material.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/activate_btn.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/delete_btn.dart';
import 'package:unumbers/feature/game/game_share/widgets/stop_btn.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/game/game_share/widgets/reset_btn.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/enum.dart';

class GameManageBtn extends StatelessWidget {
  const GameManageBtn({
    super.key,
    required this.game,
    required this.gameModel,
    required this.isDesktop,
    required this.streamData,
  });
  final StreamData streamData;
  final GameName game;
  final GameModel gameModel;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Color(
        0xff383837,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResetBtn(
                    game: game,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: DeleteBtn(
                    game: game,
                    gameModel: gameModel,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ActivateBtn(
                    streamData: streamData,
                    game: game,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: StopBtn(
                    streamData: streamData,
                    game: game,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
