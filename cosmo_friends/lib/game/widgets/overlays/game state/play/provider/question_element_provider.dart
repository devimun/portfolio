import 'package:cosmo_friends/game/components/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 문제로 제공되는 커맨드 키의 애니메이션을 관리하기 위한 프로바이더
class QuestionElementStatusManager
    extends StateNotifier<Map<int, QuestionElementStatus>> {
  QuestionElementStatusManager()
      : super({
          0: QuestionElementStatus.idle,
          1: QuestionElementStatus.idle,
          2: QuestionElementStatus.idle,
          3: QuestionElementStatus.idle,
        });
  void setStatus(int tapCount, QuestionElementStatus status) {
    state = {
      ...state,
      tapCount: status,
    };
  }

  void reset() {
    state = {
      0: QuestionElementStatus.idle,
      1: QuestionElementStatus.idle,
      2: QuestionElementStatus.idle,
      3: QuestionElementStatus.idle,
    };
  }
}

final questionElementStatusManagerProvider = StateNotifierProvider<
    QuestionElementStatusManager,
    Map<int, QuestionElementStatus>>((ref) => QuestionElementStatusManager());
