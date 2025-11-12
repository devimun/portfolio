import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/command_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/question_element_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/score_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/tap_counter_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/wrong_score_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommandKey extends ConsumerWidget {
  const CommandKey({
    super.key,
    required this.commandType,
    required this.game,
  });
  final CommandType commandType;
  final CosmoFriends game;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commandList = ref.watch(commandListProvider);
    final tapCount = ref.watch(tapCounterProvider);
    final wrongScore = ref.watch(wrongScorerovider);
    String assetName = 'assets/images/command/${commandType.name}.png';
    return Container(
      decoration: BoxDecoration(
        color: commandKeyAreaBGC,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          boxShadow,
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage(assetName),
          width: MediaQuery.sizeOf(context).width / 6,
          height: MediaQuery.sizeOf(context).width / 6,
          child: InkWell(
            onTap: () async {
              HapticFeedback.lightImpact();
              // 순서에 맞는 커맨드를 누른 경우
              if (commandList[tapCount] == commandType) {
                sfx(game, 'correct', ref);
                // tapCount 증가
                ref.read(tapCounterProvider.notifier).increment();
                // questionElement[tapcount]는 QuestionElementStatus를 값으로 갖고 있으며 해당 값을 구독하고 있는 위젯이 있다.
                // 이 값을 구독하고 있는 위젯은 값에 따라 UI가 변경되며 아래 코드는 UI변경을 트리거 시킨다.
                ref
                    .read(questionElementStatusManagerProvider.notifier)
                    .setStatus(tapCount, QuestionElementStatus.correct);
                // 모든 문제를 맞춘 경우
                if (tapCount == 3) {
                  // commandList를 초기화하여 새로운 문제를 출제한다
                  ref
                      .read(commandListProvider.notifier)
                      .generateRandomCommands();
                  // tapCount를 0으로 재설정
                  ref.read(tapCounterProvider.notifier).resetState();
                  // elementStatus 초기화
                  ref
                      .read(questionElementStatusManagerProvider.notifier)
                      .reset();
                  // 스코어 점수 상승
                  ref.read(scoreProvider.notifier).increment();
                  // 게임 플레이어 점프시킴
                  sfx(game, 'jump', ref);
                  game.player.playerState = PlayerState.jump;
                }
              } else {
                if (wrongScore == 5) {
                  // 게임 종료
                  game.gameState = GameState.end;
                } else {
                  // wrongScore업데이트
                  ref.read(wrongScorerovider.notifier).increment();
                  // 오답 사운드 이펙트
                  sfx(game, 'wrong', ref);
                  // elementStuats를 incorrect로 변경하여 UI 변경을 트리거
                  // 이후 다시 elementStatus를 idle로하는 애니메이션
                  ref
                      .read(questionElementStatusManagerProvider.notifier)
                      .setStatus(tapCount, QuestionElementStatus.incorrect);
                  await Future.delayed(const Duration(milliseconds: 100), () {
                    if (context.mounted) {
                      ref
                          .read(questionElementStatusManagerProvider.notifier)
                          .setStatus(tapCount, QuestionElementStatus.idle);
                    }
                  });
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

class CommandKeys extends StatelessWidget {
  const CommandKeys({
    super.key,
    required this.game,
  });
  final CosmoFriends game;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommandKey(
              commandType: CommandType.tl,
              game: game,
            ),
            CommandKey(
              commandType: CommandType.tr,
              game: game,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommandKey(
              commandType: CommandType.bl,
              game: game,
            ),
            CommandKey(
              commandType: CommandType.br,
              game: game,
            ),
          ],
        ),
      ],
    );
  }
}
