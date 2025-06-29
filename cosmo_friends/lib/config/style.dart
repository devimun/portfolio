import 'dart:developer';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color mainColor = const Color(0xffF89B00).withValues(alpha: 0.8);
Color modalBgColor = const Color(0xffF9F9F9).withValues(alpha: 0.9);
Color subColor = Colors.grey.withValues(alpha: 0.9);
RoundedRectangleBorder borderShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15),
);
Color commandKeyAreaBGC = Colors.white30;
BoxShadow boxShadow = BoxShadow(
  color: Colors.black.withValues(alpha: 0.5), // 그림자 색상 및 불투명도
  blurRadius: 20, // 그림자의 퍼짐 정도
  offset: const Offset(5, 5), // 그림자의 위치 (x, y)
);

// Future<User?> connectWithGoogle(WidgetRef ref) async {
//   try {
//     // 구글 로그인 진행
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     if (googleUser == null) {
//       // 사용자가 구글 로그인 취소
//       return null;
//     }

//     // 구글 인증 정보 얻기
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     // Firebase에 구글 로그인 인증 정보 생성
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // 기존 익명 사용자와 구글 계정 연결 시도

//     UserCredential userCredential =
//         await FirebaseAuth.instance.currentUser!.linkWithCredential(credential);
//     return userCredential.user;
//   }
//   // 이전에 계정 연결했던 경우 익명 계정에 대한 정보 삭제 후 저장됐던 정보 덮어쓰기
//   on FirebaseAuthException catch (e) {
//     if (e.code == 'credential-already-in-use') {
//       await pasteData(credential, ref);
//     }
//   } on PlatformException catch (e) {
//     log(e.code);
//     log(e.toString());
//     // if (e.code == 'ERROR_CREDENTIAL_ALREADY_IN_USE') {
//     //   await pasteData(credential, ref);
//     // } else {
//     //   // 다른 PlatformException 처리
//     //   rethrow;
//     // }
//   } catch (e, stackTrace) {
//     // 에러 로그 기록
//     // await FirebaseCrashlytics.instance.recordError(e, stackTrace);
//     log(e.toString());
//     return null;
//   }
// }

// Future<void> pasteData(AuthCredential credential, WidgetRef ref) async {
//   final anonymousUser = FirebaseAuth.instance.currentUser!;

//   // 익명 계정 데이터 삭제
//   String anonymousUid = anonymousUser.uid;
//   await FirebaseFirestore.instance
//       .collection('users')
//       .doc(anonymousUid)
//       .delete();
//   // 익명 계정 Auth 삭제
//   await anonymousUser.delete();
//   // 이후 구글 credential로 로그인 진행
//   final User existingUser =
//       (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
//   // existingUser에 저장된 정보를 현재 데이터를 덮어 씌운다.
//   final userRef =
//       FirebaseFirestore.instance.collection('users').doc(existingUser.uid);

//   // 정보를 덮어씌우기 이전 유저가 로그인을 하는 것이니 lastDay정보를 업데이트 한다.
//   String lastDay = DateTime.now().toUtc().toString();
//   await userRef.update({'lastDay': lastDay});
//   final docRef = await userRef.get();
//   final userData = docRef.data()!;

//   // 덮어 씌워야할 데이터
//   // 1. 내부 저장 데이터
//   await setPreferenceData(userData);
//   // 2. 상태 관리 데이터
//   log('덮어쓰기 이전 데이터 : ${ref.read(userProvider)}');
//   ref.read(userProvider.notifier).setData(userData);
//   log('덮어쓰기 이후 데이터 : ${ref.read(userProvider)}');
// }

// 유저 내부 데이터 정보 변경하는 함수
Future<void> setPreferenceData(Map<String, dynamic> userData) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> intT = [
    'best',
    'avatarIndex',
    'cashCoin',
    'gameCount',
    'playCoin',
  ];
  List<String> stringT = [
    'firstDay',
    'lastDay',
    'uid',
    'reviewDate',
  ];
  List<String> listT = [
    'hadAvatar',
  ];

  userData.forEach((k, v) async {
    var value = userData[k];
    if (intT.contains(k)) {
      await prefs.setInt(k, value);
    } else if (stringT.contains(k)) {
      await prefs.setString(k, value);
    } else if (listT.contains(k)) {
      List<String> hadAvatar = [];
      for (int i = 0; i < value.length; i++) {
        hadAvatar.add(value[i].toString());
      }
      await prefs.setStringList(k, hadAvatar);
    } else {
      await prefs.setBool(k, value);
    }
  });
}

Future<void> checkError(Object e, StackTrace stackTrace) async {
  if (kDebugMode) {
    log(e.toString(), stackTrace: stackTrace);
  } else {
    await FirebaseCrashlytics.instance.recordError(e, stackTrace);
  }
}
