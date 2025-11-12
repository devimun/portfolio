import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/utils/enum.dart';

class SelectGameProvider extends StateNotifier<GameName> {
  SelectGameProvider(super.gameName);
  void selectGame(GameName game) {
    if (state == game) {
      return;
    } else {
      state = game;
    }
  }
}

final desktopSelectGameProvider1 =
    StateNotifierProvider<SelectGameProvider, GameName>(
  (ref) => SelectGameProvider(GameName.A),
);
final desktopSelectGameProvider2 =
    StateNotifierProvider<SelectGameProvider, GameName>(
  (ref) => SelectGameProvider(GameName.B),
);
final desktopSelectGameProvider3 =
    StateNotifierProvider<SelectGameProvider, GameName>(
  (ref) => SelectGameProvider(GameName.C),
);
final desktopSelectGameProvider4 =
    StateNotifierProvider<SelectGameProvider, GameName>(
  (ref) => SelectGameProvider(GameName.D),
);

StateNotifierProvider<SelectGameProvider, GameName> selectProvider(int index) {
  switch (index) {
    case 0:
      return desktopSelectGameProvider1;
    case 1:
      return desktopSelectGameProvider2;
    case 2:
      return desktopSelectGameProvider3;
    case 3:
      return desktopSelectGameProvider4;
    default:
      throw ArgumentError('Invalid index for zone view: $index');
  }
}
