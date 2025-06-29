import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/utils/enum.dart';

class MobileSelectedGame extends StateNotifier<GameName> {
  MobileSelectedGame() : super(GameName.A);
  void selectGame(GameName game) async {
    if (state != game) {
      state = game;
    }
  }
}

/// 게임 선택 상태를 관리하는 Provider
final selectedGameProvider =
    StateNotifierProvider<MobileSelectedGame, GameName>((ref) {
  return MobileSelectedGame();
});
