import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unumbers/feature/login/widgets/login_btn.dart';
import 'package:unumbers/feature/login/widgets/remember_btn.dart';
import 'package:unumbers/feature/login/widgets/user_input.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/style.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                fit: BoxFit.fitWidth,
                Assets.blueLogo,
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.65,
                      child: const Column(
                        children: [
                          UserInput(inputType: InputType.username),
                          UserInput(inputType: InputType.password),
                          RememberBtn(),
                        ],
                      ),
                    ),
                    if ((kIsWeb ||
                        Platform.isWindows ||
                        Platform.isMacOS ||
                        Platform.isLinux))
                      const SizedBox(
                        height: 100,
                      ),
                    const LoginBtn()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
