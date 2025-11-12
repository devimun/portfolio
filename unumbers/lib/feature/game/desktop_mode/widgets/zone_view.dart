import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/game_manage_btn.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/game_select_btn.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/input.dart';
import 'package:unumbers/feature/game/desktop_mode/provider/select_game_provider.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/game/game_share/widgets/dash_board.dart';
import 'package:unumbers/feature/game/game_share/widgets/zone.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/enum.dart';

class DesktopZoneView extends ConsumerWidget {
  const DesktopZoneView({
    super.key,
    required this.streamData,
    required this.viewIdx,
  });
  final int viewIdx;
  final StreamData streamData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String username = ref.watch(loginInfoProvider).username;
    GameName selectedGame = ref.watch(selectProvider(viewIdx));
    GameModel gameModel = streamData.games[selectedGame]!;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: List.generate(10, (i) {
              return Expanded(
                child: Row(
                  children: [
                    if (i != 0) SizedBox(width: 1),
                    Expanded(
                      child: GameSelectBtn(
                        streamData: streamData,
                        gameModel: gameModel,
                        username: username,
                        gameName: GameName.values[i],
                        viewIdx: viewIdx,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Expanded(
          flex: 16,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: NumberZone(
                                  zoneNumber: 1,
                                  zoneData: gameModel.firstZone,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Expanded(
                                child: NumberZone(
                                  zoneNumber: 3,
                                  zoneData: gameModel.thirdZone,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Expanded(
                                child: NumberZone(
                                  zoneNumber: 5,
                                  zoneData: gameModel.fifthZone,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Expanded(
                                child: NumberZone(
                                  zoneNumber: 7,
                                  zoneData: gameModel.seventhZone,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Expanded(
                                  child: GameManageBtn(
                                streamData: streamData,
                                game: selectedGame,
                                gameModel: gameModel,
                                isDesktop: true,
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: NumberZone(
                                  zoneNumber: 2,
                                  zoneData: gameModel.secondZone,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Expanded(
                                child: NumberZone(
                                  zoneNumber: 4,
                                  zoneData: gameModel.fourthZone,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Expanded(
                                child: NumberZone(
                                  zoneNumber: 6,
                                  zoneData: gameModel.sixthZone,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.white,
                                  child: LayoutBuilder(
                                      builder: (context, constraint) {
                                    return ScrollConfiguration(
                                      behavior: const MaterialScrollBehavior()
                                          .copyWith(
                                        dragDevices: {
                                          PointerDeviceKind.touch,
                                          PointerDeviceKind.mouse, // 마우스 스크롤 허용
                                        },
                                      ),
                                      child: DashboardView(
                                        allElements: gameModel.allElements,
                                        // height: (constraint.maxHeight - 2) / 2,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            // padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
            child: DesktopInput(
              streamData: streamData,
              currentSelectUser: gameModel.selectedUser,
              gameName: selectedGame,
            ),
          ),
        ),
      ],
    );
  }
}
