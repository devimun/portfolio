import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/style.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';

class NumberPad extends ConsumerWidget {
  const NumberPad(
      {super.key,
      required this.game,
      required this.selectedGame,
      required this.selectedUser,
      required this.gameName});
  final GameModel game;
  final GameName selectedGame;
  final String? selectedUser;
  final GameName gameName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(loginInfoProvider).username;
    // 버튼 리스트 만들기
    List<Widget> buildButtons(List<String> labels) {
      return labels.asMap().entries.map((entry) {
        final index = entry.key;
        final label = entry.value;
        final isDel = label == 'DEL';
        final isEven = index % 2 == 0;

        return Flexible(
          flex: isDel ? 3 : 1,
          child: Material(
            child: InkWell(
              onTap: () async {
                final fireStore = FireStoreConstants();
                if (isDel) {
                  ref.read(loadingProvider.notifier).state = true;
                  await fireStore.deleteNumber(
                    gameModel: game,
                    gameName: selectedGame,
                  );
                  ref.read(loadingProvider.notifier).state = false;
                } else {
                  ref.read(loadingProvider.notifier).state = true;
                  await fireStore.insertNumber(
                    gameModel: game,
                    gameName: selectedGame,
                    number: int.parse(label),
                  );
                  ref.read(loadingProvider.notifier).state = false;
                }
              },
              child: Container(
                margin: const EdgeInsets.all(2),
                color: isDel
                    ? Colors.black
                    : isEven
                        ? const Color(0xFF727272)
                        : const Color(0xFF9A9596),
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList();
    }

    return SizedBox(
      height: double.maxFinite,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                    children: buildButtons(
                        ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'])),
              ),
              Expanded(
                child: Row(
                    children: buildButtons([
                  '11',
                  '12',
                  '13',
                  '14',
                  '15',
                  '16',
                  '17',
                  '18',
                  '19',
                  '20'
                ])),
              ),
              Expanded(
                child: Row(
                    children: buildButtons([
                  '21',
                  '22',
                  '23',
                  '24',
                  '25',
                  '26',
                  '27',
                  '28',
                  '29',
                  '30'
                ])),
              ),
              Expanded(
                child: Row(
                    children: buildButtons(
                        ['31', '32', '33', '34', '35', '36', '0', 'DEL'])),
              ),
            ],
          ),
          if (selectedGame == gameName &&
              selectedUser != null &&
              selectedUser != username)
            Container(
              color: Colors.white70,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  '다른 사용자가 입력 중 입니다.\n입력창을 눌러 입력 기능을 활성화 해주세요.',
                  style: WebStyle.tS.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (selectedUser == null)
            Container(
              color: Colors.white70,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  '입력창을 눌러\n 입력 기능을 활성화 해주세요.',
                  style: WebStyle.tS.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
