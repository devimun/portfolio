import 'dart:developer';
import 'dart:io';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cosmo_friends/config/style.dart';

Future<Map<String, dynamic>?> checkAppVersion() async {
  try {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('checkAppVersion');

    final result = await callable.call(<String, String>{
      'platform': Platform.isAndroid ? 'android' : 'ios',
    });

    final data = result.data;

    final String latestVersion = data['latestVersion'];
    final String minSupportedVersion = data['minSupportedVersion'];
    final bool gameStatus = data['gameStatus'];
    final String? message = data['content'];

    final output = {
      'latestVersion': latestVersion,
      'minSupportedVersion': minSupportedVersion,
      'gameStatus': gameStatus,
      'message': message,
    };
    log(output.toString());
    return output;
  } catch (e, stackTrace) {
    await checkError(e, stackTrace); // 에러 로깅용 함수
    return null;
  }
}

bool isNeedUpdate(String current, String target) {
  final currentParts = current.split('.').map(int.parse).toList();
  final targetParts = target.split('.').map(int.parse).toList();
  for (int i = 0; i < 3; i++) {
    int c = currentParts[i];
    int t = targetParts[i];
    if (t > c) {
      return true;
    } else {
      continue;
    }
  }
  return false;
}
