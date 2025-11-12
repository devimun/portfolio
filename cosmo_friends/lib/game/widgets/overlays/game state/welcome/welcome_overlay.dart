import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/avatar_control/change_avatar_btn.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/game_manage_btn.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/coin.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/leader_board.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/setting/settings.dart';
import 'package:cosmo_friends/game/widgets/overlays/headline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeOverlay extends ConsumerWidget {
  const WelcomeOverlay({
    super.key,
    required this.game,
  });
  final CosmoFriends game;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 70,
            ),

            SizedBox(
              height: (constraints.maxHeight - 70) * 0.3,
              child: Column(
                children: [
                  const HeadLine(data: 'COSMO FRIENDS'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SettingBtn(game: game),
                        const SizedBox(
                          height: 5,
                        ),
                        const LeaderBoardBtn(),
                        const SizedBox(
                          height: 5,
                        ),
                        const CoinWidget(coinType: CoinType.playCoin),
                        const SizedBox(
                          height: 10,
                        ),
                        // 추후 현금성 재화 출시되면 삽입예정
                        // CoinWidget(coinType: CoinType.cashCoin),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 아바타 체인지 버튼
            SizedBox(
              height: (constraints.maxHeight - 70) * 0.3,
              child: Align(
                alignment: Alignment.center,
                child: ChangeAvatarBtn(game: game),
              ),
            ),
            // 게임 시작 버튼
            SizedBox(
              height: (constraints.maxHeight - 70) * 0.3,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GameManageBtn(game: game),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
