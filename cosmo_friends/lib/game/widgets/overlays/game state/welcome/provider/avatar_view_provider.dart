// 유저가 조회중인 아바타의 인덱스를 저장해둘 클래스
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarViewManager extends StateNotifier<int> {
  AvatarViewManager()
      : super(
          0,
        );

  void setIndex(int index) {
    state = index;
  }
}

final avatarViewProvider =
    StateNotifierProvider<AvatarViewManager, int>((ref) => AvatarViewManager());
