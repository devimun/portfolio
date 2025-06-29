import 'dart:math';

import 'package:cosmo_friends/game/components/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 유저에게 문제 형식으로 제공되는 커맨드키를 관리하는 프로바이더
class CommandListNotifier extends StateNotifier<List<CommandType>> {
  CommandListNotifier()
      : super(List.generate(
            4,
            (index) => CommandType
                .values[Random().nextInt(CommandType.values.length)])) {
    generateRandomCommands();
  }
  void generateRandomCommands() {
    state = List.generate(4, (index) {
      return CommandType.values[Random().nextInt(
        CommandType.values.length,
      )];
    });
  }
}

final commandListProvider =
    StateNotifierProvider<CommandListNotifier, List<CommandType>>(
  (ref) => CommandListNotifier(),
);
