import 'package:flutter_riverpod/flutter_riverpod.dart';

// 점수 관리를 위한 Notifier
class WrongScroreNotifier extends StateNotifier<int> {
  WrongScroreNotifier() : super(0);
  void resetState() {
    state = 0;
  }

  void increment() {
    state += 1;
  }
}

final wrongScorerovider = StateNotifierProvider<WrongScroreNotifier, int>(
  (ref) => WrongScroreNotifier(),
);
