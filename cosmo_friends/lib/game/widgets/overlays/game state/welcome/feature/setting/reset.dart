import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/services/auth_service.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/notice.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetBtn extends ConsumerWidget {
  const ResetBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text('RESET & DELETE ACCOUNT',
            style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 10),
        TextButton(
          style: TextButton.styleFrom(
            shape: borderShape,
            backgroundColor: Colors.grey,
          ),
          onPressed: () async {
            sfx(null, 'tap', ref);
            final result = await showModal(context, ModalType.reset, ref);

            if (result) {
              EasyLoading.show(dismissOnTap: false, status: 'waiting...');

              final user = FirebaseAuth.instance.currentUser;

              // 파이어베이스와 연결된 계정일 경우
              if (user != null && userData['uid'] != null) {
                final uid = userData['uid'];

                try {
                  // Firestore 데이터 삭제
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .delete();

                  // 사용자 재인증 & 삭제
                  final reauthSuccess = await AuthService().reauthenticate();
                  if (reauthSuccess) {
                    await user.delete();
                  } else {
                    EasyLoading.dismiss();
                    return;
                  }
                } catch (e, stackTrace) {
                  await checkError(e, stackTrace);
                  EasyLoading.dismiss();
                  return;
                }
              }

              // 3. 로컬 데이터 삭제
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              EasyLoading.dismiss();

              // 4. 앱 재시작
              Restart.restartApp();
            }
          },
          child: Text(
            'RESET',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
