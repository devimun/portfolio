import 'package:flutter/material.dart';
import 'package:unumbers/feature/game/game_share/widgets/logout_btn.dart';
import 'package:unumbers/feature/game/game_share/widgets/stop_btn.dart';
import 'package:unumbers/feature/game/game_share/widgets/reset_btn.dart';
import 'package:unumbers/feature/game/mobile_mode/widgets/diff_color_info.dart';
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
        0xff383836,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: ResetBtn(
                    game: game,
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
          SizedBox(height: 8),
          Expanded(
            flex: 6,
            child: DiffColorInfo(),
          ),
          SizedBox(height: 8),
          Expanded(
            flex: 10,
            child: SizedBox(
              height: 50,
              child: MobileInput(
                streamData: streamData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
