import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/utils/enum.dart';

class LoginInfo {
  final String username;
  final String pwd;
  final bool isRemember;

  const LoginInfo({
    required this.username,
    required this.pwd,
    required this.isRemember,
  });

  LoginInfo copyWith({
    String? username,
    String? pwd,
    bool? isRemember,
  }) {
    return LoginInfo(
      username: username ?? this.username,
      pwd: pwd ?? this.pwd,
      isRemember: isRemember ?? this.isRemember,
    );
  }
}

class LoginInfoNotifier extends StateNotifier<LoginInfo> {
  LoginInfoNotifier()
      : super(const LoginInfo(username: '', pwd: '', isRemember: false));

  void setData(InputType inputType, String input) {
    if (inputType == InputType.username) {
      state = state.copyWith(username: input);
    } else {
      state = state.copyWith(pwd: input);
    }
  }

  void setRemember(bool remember) {
    state = state.copyWith(isRemember: remember);
  }
}

final loginInfoProvider = StateNotifierProvider<LoginInfoNotifier, LoginInfo>(
  (ref) => LoginInfoNotifier(),
);
