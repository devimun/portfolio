import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';

class StreamData {
  final Map<GameName, GameModel> games;

  StreamData({
    required this.games,
  });
  // 게임 대시 보드를 클릭했을 때 , 다른 게임에 자신이 활성화 되어있는 경우 해당 게임은 초기화
  Future<void> findOtherGame(GameName currentGame, String username) async {
    games.forEach((k, v) async {
      if (currentGame != k) {
        v.selectedUser == username;
        await FireStoreConstants().changeActivateGame(k, null);
      }
    });
  }

  factory StreamData.fromJson(Map<String, dynamic> json) {
    return StreamData(
      games: {
        GameName.A: GameModel.fromJson(json['A']),
        GameName.B: GameModel.fromJson(json['B']),
        GameName.C: GameModel.fromJson(json['C']),
        GameName.D: GameModel.fromJson(json['D']),
        GameName.E: GameModel.fromJson(json['E']),
        GameName.F: GameModel.fromJson(json['F']),
        GameName.G: GameModel.fromJson(json['G']),
        GameName.H: GameModel.fromJson(json['H']),
        GameName.I: GameModel.fromJson(json['I']),
        GameName.J: GameModel.fromJson(json['J']),
      },
    );
  }
}
