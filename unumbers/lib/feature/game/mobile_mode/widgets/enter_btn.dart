import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/game/mobile_mode/provider/mobile_input_provider.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';
import 'package:unumbers/feature/utils/functions.dart';
import 'package:unumbers/feature/utils/style.dart';

class EnterBtn extends ConsumerWidget {
  const EnterBtn({
    super.key,
    required this.gameName,
    required this.gameModel,
  });
  final GameModel gameModel;
  final GameName gameName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String input = ref.watch(inputTextProvider);
    return SizedBox(
      height: double.maxFinite,
      child: TextButton(
        onPressed: () async {
          ref.read(loadingProvider.notifier).state = true;
          if (input.trim().isNotEmpty) {
            final firestore = FireStoreConstants();
            try {
              if (input.length > 2) {
                List<int> inputList = parseInput(input);
                await firestore.insertNumberList(
                  gameName: gameName,
                  gameModel: gameModel,
                  number: inputList,
                );
              } else {
                int inputNum = int.parse(input);
                firestore.insertNumber(
                  gameName: gameName,
                  gameModel: gameModel,
                  number: inputNum,
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('올바른 숫자를 입력해 주세요'),
                  ),
                );
              }
            }
          }
          ref.read(inputTextProvider.notifier).state = '';
          ref.read(loadingProvider.notifier).state = false;
        },
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          backgroundColor: AppStyle.gameMangeBtnColor,
        ),
        child: Text(
          'ENT.',
          style: AppStyle.smallBtnText,
        ),
      ),
    );
  }
}
