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

class CloudConnecterBtn extends ConsumerWidget {
  const CloudConnecterBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> userData = ref.watch(userProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          'CLOUD CONNECT',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: borderShape,
            backgroundColor:
                userData['connect'] == true ? Colors.green : Colors.grey,
          ),
          onPressed: () async {
            // 현재 클라우드 연결이 되어있지 않은 경우에 다음과 같은 메서드가 실행된다.
            try {
              if (!userData['connect']) {
                sfx(null, 'tap', ref);
                final result = await showModal(context, ModalType.cloud, ref);
                if (result) {
                  EasyLoading.show(dismissOnTap: false, status: 'waiting...');

                  String? anonymousUid;
                  // 익명 계정 삭제
                  if (FirebaseAuth.instance.currentUser!.isAnonymous) {
                    anonymousUid = FirebaseAuth.instance.currentUser!.uid;
                    FirebaseAuth.instance.currentUser!.delete();
                  }
                  // 구글 로그인 진행
                  final userCredential = await AuthService().signIn();
                  if (userCredential != null) {
                    final user = userCredential.user!;
                    final colRef =
                        FirebaseFirestore.instance.collection('users');
                    // 2가지 경우의 수
                    // 1. 이전에 로그인을 통해 데이터가 존재하는 경우
                    final docRef = colRef.doc(user.uid);
                    final dataRef = await docRef.get();
                    if (dataRef.exists) {
                      // lastDay 업데이트 후 데이터 덮어 씌우기
                      String lastDay = DateTime.now().toUtc().toString();
                      await docRef.update({
                        'lastDay': lastDay,
                      });
                      final setData = await docRef.get().then((r) => r.data()!);
                      // 내부 데이터 설정
                      await setPreferenceData(setData);
                      ref.read(userProvider.notifier).setData(setData);
                    }
                    // 2. 최초 가입인 경우
                    else {
                      // 현재 유저 데이터를 firestore에 저장한다.
                      ref
                          .read(userProvider.notifier)
                          .setElement('connect', true);
                      ref
                          .read(userProvider.notifier)
                          .setElement('uid', user.uid);
                      final setData = ref.read(userProvider);
                      await setPreferenceData(setData);
                      await docRef.set(setData);
                    }
                    // 구글 계정으로 데이터 세팅을 마친 후 익명계정 데이터를 삭제한다
                    if (anonymousUid != null) {
                      await colRef.doc(anonymousUid).delete();
                    }
                  }
                }
              }
            } catch (e, stackTrace) {
              await checkError(e, stackTrace);
            }
            EasyLoading.dismiss();
          },
          child: Text(
            userData['connect'] == true ? 'ON' : 'OFF',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
