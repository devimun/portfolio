import 'package:flutter/material.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/game/game_share/widgets/dash_board.dart';
import 'package:unumbers/feature/game/mobile_mode/widgets/game_change_btn.dart';
import 'package:unumbers/feature/game/mobile_mode/widgets/game_manage_btn.dart';
import 'package:unumbers/feature/game/mobile_mode/widgets/number_pad.dart';
import 'package:unumbers/feature/game/game_share/widgets/zone.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/enum.dart';

class MobileGameView extends StatelessWidget {
  const MobileGameView(
      {super.key,
      required this.selectedGame,
      required this.gameModel,
      required this.streamData});
  final StreamData streamData;
  final GameModel gameModel;
  final GameName selectedGame;

  @override
  Widget build(BuildContext context) {
    GameModel game = streamData.games[selectedGame]!;
    return Column(
      children: [
        Expanded(
          flex: 20,
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
                            height: 1,
                          ),
                          Expanded(
                            child: NumberZone(
                              zoneNumber: 3,
                              zoneData: gameModel.thirdZone,
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Expanded(
                            child: NumberZone(
                              zoneNumber: 5,
                              zoneData: gameModel.fifthZone,
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Expanded(
                                  child: NumberZone(
                                    zoneNumber: 7,
                                    zoneData: gameModel.seventhZone,
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Expanded(
                                  child: MobileGameManageBtn(
                                    game: selectedGame,
                                    streamData: streamData,
                                  ),
                                )
                              ],
                            ),
                          ),
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
                            height: 1,
                          ),
                          Expanded(
                            child: NumberZone(
                              zoneNumber: 4,
                              zoneData: gameModel.fourthZone,
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Expanded(
                            child: NumberZone(
                              zoneNumber: 6,
                              zoneData: gameModel.sixthZone,
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child:
                                LayoutBuilder(builder: (context, constraint) {
                              return DashboardView(
                                allElements: gameModel.allElements,
                                streamData: streamData,
                              );
                            }),
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
        Expanded(
          flex: 1,
          child: Row(
            children: [
              for (int i = 0; i < GameName.values.length; i++)
                Expanded(
                  child: GameChangeBtn(
                    game: GameName.values[i],
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: NumberPad(
            game: game,
            gameName: selectedGame,
            selectedGame: selectedGame,
            selectedUser: gameModel.selectedUser,
          ),
        ),
      ],
    );
  }
}
