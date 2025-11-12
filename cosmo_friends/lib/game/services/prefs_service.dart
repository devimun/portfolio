import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> prefsSetData() async {
  final prefs = await SharedPreferences.getInstance();

  String? uid = prefs.getString('uid');
  String now = DateTime.now().toUtc().toString();

  // 간편한 set/get 함수 정의
  T getOrSet<T>(String key, T defaultValue) {
    final value = prefs.get(key);
    if (value == null) {
      if (defaultValue is int) prefs.setInt(key, defaultValue);
      if (defaultValue is bool) prefs.setBool(key, defaultValue);
      if (defaultValue is String) prefs.setString(key, defaultValue);
      if (defaultValue is List<String>) {
        prefs.setStringList(key, defaultValue);
      }
      return defaultValue;
    }
    return value as T;
  }

  // 각 항목별 값 세팅
  final best = getOrSet<int>('best', 0);
  final avatarIndex = getOrSet<int>('avatarIndex', 0);
  final hadAvatar = getOrSet<List<String>>('hadAvatar', ['player/normal.png']);
  final playCoin = getOrSet<int>('playCoin', 0);
  final cashCoin = getOrSet<int>('cashCoin', 0);
  final firstDay = getOrSet<String>('firstDay', now);
  final lastDay = now;
  await prefs.setString('lastDay', lastDay);

  final gameCount = getOrSet<int>('gameCount', 0);
  final connect = getOrSet<bool>('connect', false);
  final review = getOrSet<bool>('review', false);
  final reviewDate = getOrSet<String>('reviewDate', now);
  Map<String, dynamic> output = {
    'best': best,
    'avatarIndex': avatarIndex,
    'hadAvatar': hadAvatar,
    'gameCount': gameCount,
    'uid': uid,
    'playCoin': playCoin,
    'cashCoin': cashCoin,
    'firstDay': firstDay,
    'lastDay': lastDay,
    'connect': connect,
    'review': review,
    'reviewDate': reviewDate,
  };
  return output;
}
