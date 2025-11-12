// 유저가 조회중인 아바타의 조건 부합 여부를 바텀 버튼 위젯에 표현하기 위한 클래스
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarNeedsManager extends StateNotifier<Map<String, dynamic>> {
  AvatarNeedsManager() : super({});

  void setNeedsState(Map<String, dynamic> result) {
    state = result;
  }
}

final needsManager =
    StateNotifierProvider<AvatarNeedsManager, Map<String, dynamic>>(
        (r) => AvatarNeedsManager());
