import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';
import 'package:unumbers/feature/utils/style.dart';

class StopBtn extends ConsumerWidget {
  const StopBtn({
    super.key,
    required this.game,
    required this.streamData,
  });
  final GameName game;
  final StreamData streamData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String username = ref.watch(loginInfoProvider).username;
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
          FocusScope.of(context).unfocus();
          await streamData.findOtherGame(game, username);
          await FireStoreConstants().changeActivateGame(game, null);
          ref.read(loadingProvider.notifier).state = false;
        },
        child: Text(
          'STOP',
          style: AppStyle.smallBtnText,
        ),
      ),
    );
  }
}
