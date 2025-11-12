// 배경음 작동 메서드
import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/setting_mangement_provider.dart';
import 'package:cosmo_friends/provider/sound_mange_provider.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> bgm(String bgm, Ref ref) async {
  await FlameAudio.bgm.stop();
  Map<String, dynamic> settings = ref.read(settingManager);
  if (settings['bgm'] == true) {
    if (bgm == 'end.mp3') {
      await FlameAudio.play(bgm);
    } else {
      await FlameAudio.bgm.play(bgm);
    }
  }
}

// 효과음 작동 메서드
void sfx(CosmoFriends? game, String sfx, WidgetRef ref) {
  Map<String, dynamic> settings = ref.read(settingManager);
  Map<String, AudioPool?> sound = ref.read(soundManager);
  if (game != null) {
    if (settings['sfx'] == true) {
      game.sound[sfx]!.start();
    }
  } else {
    if (settings['sfx'] == true) {
      sound[sfx]!.start();
    }
  }
}
