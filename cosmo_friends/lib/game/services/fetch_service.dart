import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmo_friends/game/services/prefs_service.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/setting_mangement_provider.dart';
import 'package:cosmo_friends/provider/sound_mange_provider.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> fetchData(WidgetRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  final now = DateTime.now().toUtc().toString();
  String? uid = prefs.getString('uid');
  Map<String, dynamic> userData;

  try {
    if (uid == null) {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      uid = userCredential.user?.uid;
      log('신규 가입 후 uid입니다 : $uid');
      await prefs.setString('uid', uid!);

      userData = await prefsSetData();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userData);
    } else {
      final user = FirebaseAuth.instance.currentUser;
      log('user : $user');

      await prefs.setString('lastDay', now);
      final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
      await userRef.update({'lastDay': now});
      userData = (await userRef.get()).data()!;
    }
  } catch (e, stackTrace) {
    await checkError(e, stackTrace);
    userData = await prefsSetData();
  }
  log(userData.toString());
  ref.read(userProvider.notifier).setData(userData);

  // 음원 초기화
  await FlameAudio.audioCache.loadAll([
    'welcome.mp3',
    'run.mp3',
    'end.mp3',
  ]);

  await _initAudioPools(ref);

  // 환경설정 불러오기 및 기본값 세팅
  bool sfx = prefs.getBool('sfx') ?? true;
  bool bgm = prefs.getBool('bgm') ?? true;

  await prefs.setBool('sfx', sfx);
  await prefs.setBool('bgm', bgm);

  ref.read(settingManager.notifier).set('sfx', sfx);
  ref.read(settingManager.notifier).set('bgm', bgm);
}

Future<void> _initAudioPools(WidgetRef ref) async {
  try {
    final audioPools = {
      'tap': await FlameAudio.createPool('effect/tap.mp3', maxPlayers: 1),
      'wrong': await FlameAudio.createPool('effect/wrong.mp3', maxPlayers: 1),
      'correct':
          await FlameAudio.createPool('effect/correct.mp3', maxPlayers: 4),
      'jump': await FlameAudio.createPool('effect/jump.mp3', maxPlayers: 1),
    };

    ref.read(soundManager.notifier).setAudioPools(audioPools);
  } catch (e, stackTrace) {
    await checkError(e, stackTrace);
  }
}
