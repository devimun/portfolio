// Minimal login screen stub for the public/portfolio build.
// Swap in `login.dart` when running the production app.
import 'package:flutter/material.dart';
import 'package:unumbers/feature/login/widgets/login_btn_block.dart';
import 'package:unumbers/feature/utils/style.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: MediaQuery.sizeOf(context).width * 0.2,
                    color: AppStyle.blueBtnbackgroundColor,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Login flow intentionally hidden in the portfolio build.\n'
                    'Replace this widget with the real implementation for production.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const LoginBtn(),
          ],
        ),
      ),
    );
  }
}
