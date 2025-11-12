// 점수 관리를 위한 프로바이더
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreNotifier extends StateNotifier<int> {
  ScoreNotifier() : super(0);
  void resetState() {
    state = 0;
  }

  void increment() {
    state += 1;
  }
}

final scoreProvider = StateNotifierProvider<ScoreNotifier, int>(
  (ref) => ScoreNotifier(),
);
