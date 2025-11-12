import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/game.dart';

import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/setting/cloud_connect.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/setting/reset.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/setting/review_request.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/setting/sound.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 환경 설정 버튼

class SettingBtn extends ConsumerWidget {
  const SettingBtn({
    super.key,
    required this.game,
  });
  final CosmoFriends game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: mainColor,
        shape: borderShape,
      ),
      onPressed: () {
        sfx(game, 'tap', ref);
        // 환경 설정 오버레이 띄우기
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: modalBgColor,
            child: SettingScreen(game: game),
          ),
        );
      },
      icon: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
    );
  }
}

// 환경 설정 오버레이
class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
    required this.game,
  });
  final CosmoFriends game;
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        height: 500,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 리뷰 작성 버튼
            ReviewRequest(),
            // 효과음 관리(on/off)
            SoundSettingBtn(
              title: 'EFFECTS',
              type: SettingType.sfx,
            ),
            // 배경음 관리(on/off)
            SoundSettingBtn(
              title: 'BACKGROUND',
              type: SettingType.bgm,
            ),
            CloudConnecterBtn(),
            ResetBtn(),
          ],
        ),
      ),
    );
  }
}
