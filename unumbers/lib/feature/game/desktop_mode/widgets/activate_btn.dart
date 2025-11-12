import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';
import 'package:unumbers/feature/utils/style.dart';

class ActivateBtn extends ConsumerWidget {
  const ActivateBtn({
    super.key,
    required this.game,
    required this.streamData,
  });
  final GameName game;
  final StreamData streamData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(loginInfoProvider).username;
    return SizedBox(
      height: double.maxFinite,
      child: TextButton(
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
        onPressed: () async {
          ref.read(loadingProvider.notifier).state = true;
          await streamData.findOtherGame(game, username);
          await FireStoreConstants().changeActivateGame(game, username);
          ref.read(loadingProvider.notifier).state = false;
        },
        child: const Text(
          'ACTIVATE',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
