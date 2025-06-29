import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSettingManager extends StateNotifier<Map<String, dynamic>> {
  UserSettingManager()
      : super(
          {
            'sfx': true,
            'bgm': true,
          },
        );
  void set(String key, dynamic value) {
    state = {
      ...state,
      key: value,
    };
  }
}

final settingManager =
    StateNotifierProvider<UserSettingManager, Map<String, dynamic>>(
  (ref) => UserSettingManager(),
);
