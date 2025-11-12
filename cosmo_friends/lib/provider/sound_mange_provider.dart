import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoundEffectsManager extends StateNotifier<Map<String, AudioPool?>> {
  SoundEffectsManager()
      : super({
          'tap': null,
          'wrong': null,
          'correct': null,
          'jump': null,
        });
  void setAudioPools(Map<String, AudioPool> audioPools) {
    state = audioPools;
  }
}

final soundManager =
    StateNotifierProvider<SoundEffectsManager, Map<String, AudioPool?>>(
        (ref) => SoundEffectsManager());
