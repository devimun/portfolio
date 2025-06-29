import 'package:flutter/material.dart';
import 'package:unumbers/feature/game/game_share/widgets/logout_btn.dart';
import 'package:unumbers/feature/game/game_share/widgets/stop_btn.dart';
import 'package:unumbers/feature/game/game_share/widgets/reset_btn.dart';
import 'package:unumbers/feature/game/mobile_mode/widgets/mobile_input.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/enum.dart';

class MobileGameManageBtn extends StatelessWidget {
  const MobileGameManageBtn({
    super.key,
    required this.game,
    required this.streamData,
  });
  final GameName game;
  final StreamData streamData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
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
                    color: Color(
                      0xff590747,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: StopBtn(
                    game: game,
                    streamData: streamData,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: LogoutBtn(
                    isDesktop: false,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                child: MobileInput(
                  streamData: streamData,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
