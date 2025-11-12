import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/game/mobile_mode/widgets/enter_btn.dart';
import 'package:unumbers/feature/game/mobile_mode/provider/mobile_input_provider.dart';
import 'package:unumbers/feature/game/mobile_mode/provider/mobile_selected_game.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';

class MobileInput extends ConsumerWidget {
  const MobileInput({
    super.key,
    required this.streamData,
  });
  final StreamData streamData;
  @override
  Widget build(context, WidgetRef ref) {
    final username = ref.watch(loginInfoProvider).username;
    final selectedGame = ref.watch(selectedGameProvider);
    String inputText = ref.watch(inputTextProvider);
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            readOnly: !(streamData.games[selectedGame]!.selectedUser == username),
            controller: TextEditingController(
              text: inputText,
            ),
            keyboardType: TextInputType.none,
            onTap: () async {
              if (streamData.games[selectedGame]!.selectedUser == username) {
              } else {
                ref.read(loadingProvider.notifier).state = true;
                await streamData.findOtherGame(selectedGame, username);
                await FireStoreConstants().changeActivateGame(selectedGame, username);
                ref.read(loadingProvider.notifier).state = false;
              }
            },
            onChanged: (v) => ref.read(inputTextProvider.notifier).state = v,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: EnterBtn(
            gameModel: streamData.games[selectedGame]!,
            gameName: selectedGame,
          ),
        ),
      ],
    );
  }
}
