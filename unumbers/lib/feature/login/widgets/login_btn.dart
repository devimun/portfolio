import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/utils/style.dart';

class LoginBtn extends ConsumerWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final firestore = FirebaseFirestore.instance;
    // final loginInfo = ref.watch(loginInfoProvider);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.7,
      child: FloatingActionButton(
        onPressed: () async {
          //  포트폴리오 업로드를 위해 로그인 로직을 제외한 이후 업로드 됩니다.
          await _login();
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

  Future<void> _login(
      // DocumentSnapshot<Map<String, dynamic>> userDoc,
      // BuildContext context,
      //  {
      // required String id,
      // required String pwd,
      // required bool remember,
      // }
      ) async {
    //  포트폴리오 업로드를 위해 로그인 로직을 제외한 이후 업로드 됩니다.
  }
}
