import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/game/mobile_mode/provider/mobile_selected_game.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';
import 'package:unumbers/feature/utils/functions.dart';

class DashboardView extends ConsumerStatefulWidget {
  final List<int> allElements;
  final StreamData? streamData;
  const DashboardView({
    super.key,
    required this.allElements,
    this.streamData,
  });

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToEnd();
    });
  }

  @override
  void didUpdateWidget(DashboardView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.allElements != widget.allElements) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
    }
  }

  void _scrollToEnd() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (Platform.isAndroid || Platform.isIOS) {
          ref.read(loadingProvider.notifier).state = true;
          final username = ref.watch(loginInfoProvider).username;
          final selectedGame = ref.watch(selectedGameProvider);
          await widget.streamData?.findOtherGame(selectedGame, username);
          await FireStoreConstants().changeActivateGame(selectedGame, username);
          ref.read(loadingProvider.notifier).state = false;
        } else {
          null;
        }
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 1.0)),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: AutoSizeText(
                'INPUT DATA',
                minFontSize: 9,
                maxFontSize: 10,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade300,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final aspectRatio = calculateAspectRatio(constraints);

                    return GridView.count(
                      controller: _scrollController,
                      crossAxisCount: 10,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      childAspectRatio: aspectRatio * 2.3,
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        widget.allElements.length,
                        (index) => Container(
                          alignment: Alignment.center,
                          color: Colors.black,
                          child: AutoSizeText(
                            '${widget.allElements[index]}',
                            maxFontSize: 10,
                            minFontSize: 5,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
