import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/desktop_mode/desktop_game_view.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/loading_progress_widget.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/game/mobile_mode/mobile_game_view.dart';
import 'package:unumbers/feature/game/mobile_mode/provider/mobile_selected_game.dart';
import 'package:unumbers/feature/stream/provider/stream_service.dart';

class GameView extends ConsumerWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamDataProvider);
    final selectedGame = ref.watch(selectedGameProvider);
    final isLoading = ref.watch(loadingProvider);

    return streamData.when(
      data: (streamData) {
        return Stack(
          children: [
            (!(kIsWeb ||
                    Platform.isWindows ||
                    Platform.isMacOS ||
                    Platform.isLinux))
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(
                      2,
                      2,
                      2,
                      0,
                    ),
                    child: MobileGameView(
                      streamData: streamData,
                      gameModel: streamData.games[selectedGame]!,
                      selectedGame: selectedGame,
                    ),
                  )
                : DesktopGameView(
                    streamData: streamData,
                  ),
            if (isLoading) const LoadingProgressWidget(),
          ],
        );
      },
      error: (error, stackTrace) => Center(
        child: Column(
          children: [
            const Text(
              '이용에 불편을 드려 죄송합니다. 화면을 캡쳐 후 연락주시면 빠른 시일 내로 수정할 수 있도록 하겠습니다.',
            ),
            Text('error : $error, $stackTrace'),
          ],
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
