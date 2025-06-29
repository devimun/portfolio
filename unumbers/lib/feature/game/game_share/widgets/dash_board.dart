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
  final double height;
  final StreamData? streamData;
  const DashboardView({
    super.key,
    required this.allElements,
    required this.height,
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
    int boxCount = (widget.allElements.length / 100).ceil();
    if (boxCount < 2) boxCount = 2;

    return GestureDetector(
      onTap: () async {
        if (Platform.isAndroid || Platform.isIOS) {
          ref.read(loadingProvider.notifier).state = true;
          final username = ref.watch(loginInfoProvider).username;
          final selectedGame = ref.watch(selectedGameProvider);
          await widget.streamData?.findOtherGame(selectedGame, username);
          await FireStoreConstants().changeActivateGame(selectedGame, username);
          ref.read(loadingProvider.notifier).state = false;
        }
      },
      child: ListView.builder(
        controller: _scrollController,
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: boxCount,
        itemBuilder: (context, pageIndex) {
          int start = pageIndex * 100;
          int end = (start + 100).clamp(0, widget.allElements.length);

          List<int> pageItems =
              start < end ? widget.allElements.sublist(start, end) : <int>[];

          return Column(
            children: [
              Container(
                height: widget.height,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double height = (constraints.maxHeight - 12) / 10;
                    return Table(
                      children: List.generate(
                        10,
                        (rowIndex) {
                          return TableRow(
                            children: List.generate(
                              10,
                              (columnIndex) {
                                int index = rowIndex * 10 + columnIndex;
                                int? item = index < pageItems.length
                                    ? pageItems[index]
                                    : null;

                                return Padding(
                                  padding: const EdgeInsets.all(0.5),
                                  child: Container(
                                    height: height,
                                    color: item != null
                                        ? getBackGroundColor(item)
                                        : null,
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      minFontSize: 7,
                                      item == null ? '' : item.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: item == null
                                            ? null
                                            : getTextColor(item),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
