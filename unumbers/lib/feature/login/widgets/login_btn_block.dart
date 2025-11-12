// Redacted login button for the public portfolio build.
// Replace this widget with `login_btn.dart` when deploying the real service.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/utils/style.dart';

class LoginBtn extends ConsumerWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginInfo = ref.watch(loginInfoProvider);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.7,
      child: FloatingActionButton(
        onPressed: () async {
          await _handlePlaceholderLogin(
            context,
            username: loginInfo.username,
            password: loginInfo.pwd,
            rememberUser: loginInfo.isRemember,
          );
        },
        elevation: 0,
        foregroundColor: AppStyle.blueBtnoverlayColor,
        backgroundColor: AppStyle.blueBtnbackgroundColor,
        child: Text(
          'LOGIN',
          style: AppStyle.blueBtnTextStyle,
        ),
      ),
    );
  }

  Future<void> _handlePlaceholderLogin(
    BuildContext context, {
    required String username,
    required String password,
    required bool rememberUser,
  }) async {
    // The production build talks to Firestore and SharedPreferences here.
    // Omitted in the public snapshot to avoid leaking operational details.
    if (!context.mounted) return;

    final snackBar = SnackBar(
      content: Text(
        'Login flow hidden. username=$username, remember=$rememberUser',
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
