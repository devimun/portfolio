import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/setting_mangement_provider.dart';

import 'package:cosmo_friends/config/style.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundSettingBtn extends ConsumerWidget {
  const SoundSettingBtn({
    super.key,
    required this.type,
    required this.title,
  });
  final SettingType type;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(settingManager);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          // on/off 상태에 따라서 UI가 변함
          // title의 상태가 on이라면 백그라운드 컬러는 green , text는 on
          // title의 상태가 off이라면  grey , off
          // 단, 해당 title의 상태는 기기 내부 데이터에 저장됨
          // 상태 관리 클래스에 따라 값이 달라져야함.
          style: TextButton.styleFrom(
            shape: borderShape,
            backgroundColor: manager[type.name] ? Colors.green : Colors.grey,
          ),
          onPressed: () async {
            sfx(null, 'tap', ref);
            final prefs = await SharedPreferences.getInstance();
            // 설정 변경 구현
            // 1. 설정 상태 관리 클래스 업데이트
            // 2. 내부 데이터 저장
            // 3. 세팅 타입이 bgm인 경우 bgm play/stop 실행
            if (manager[type.name]) {
              if (type == SettingType.bgm) {
                await FlameAudio.bgm.stop();
              }
            } else {
              if (type == SettingType.bgm) {
                await FlameAudio.bgm.play('welcome.mp3');
              }
            }
            ref
                .read(settingManager.notifier)
                .set(type.name, !manager[type.name]);
            await prefs.setBool(type.name, !manager[type.name]);
          },
          child: Text(
            manager[type.name] ? 'ON' : 'OFF',
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
