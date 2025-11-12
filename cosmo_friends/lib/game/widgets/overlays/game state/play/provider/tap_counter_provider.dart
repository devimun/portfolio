import 'package:flutter_riverpod/flutter_riverpod.dart';

// 유저가 커맨드 키를 몇 회 눌렀는지 관리하는 프로바이더
class TapCountNotifier extends StateNotifier<int> {
  TapCountNotifier() : super(0);
  void resetState() {
    state = 0;
  }

  void increment() {
    state++;
  }
}

final tapCounterProvider = StateNotifierProvider<TapCountNotifier, int>(
  (ref) => TapCountNotifier(),
);
