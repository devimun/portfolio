import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unumbers/feature/utils/functions.dart';

class NumberZone extends StatefulWidget {
  const NumberZone({
    super.key,
    required this.zoneNumber,
    required this.zoneData,
  });
  final List<int> zoneData;
  final int zoneNumber;

  @override
  State<NumberZone> createState() => _NumberZoneState();
}

class _NumberZoneState extends State<NumberZone> {
  final int boxesPerRow = 10;
  // 한 줄에 들어갈 박스의 개수
  final int totalRows = 8;
  // 총 줄의 개수 (이 줄 개수에 맞춰 높이 계산)
  final double horizontalSpacing = 1.0;
  // 박스 간 가로 간격
  final double verticalSpacing = 1.0;
  late ScrollController scrollController = ScrollController();
  @override
  void didUpdateWidget(covariant NumberZone oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.zoneData != widget.zoneData) {
      scrollJump();
    }
  }

  void scrollJump() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        scrollController.jumpTo(scrollController.position.maxScrollExtent));
  }

  @override
  void initState() {
    scrollJump();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Container(
              width: double.maxFinite,
              color: getTitleColor(widget.zoneNumber),
              child: Row(
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: widget.zoneNumber == 7 ? 4 : 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i in getZoneNumber(widget.zoneNumber))
                          AutoSizeText(
                            i.toString(),
                            maxFontSize: 10,
                            minFontSize: 5,
                            style: TextStyle(
                              color: widget.zoneNumber == 7
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              )),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final parentWidth = constraints.maxWidth;

                final boxWidth =
                    (parentWidth - (horizontalSpacing * (boxesPerRow - 1))) /
                        boxesPerRow;

                final rowCount = 8;

                final totalBoxesHeight =
                    constraints.maxHeight - (verticalSpacing * (rowCount - 1));

                final boxHeight = totalBoxesHeight / rowCount;

                return GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: boxesPerRow,
                    crossAxisSpacing: horizontalSpacing,
                    mainAxisSpacing: verticalSpacing,
                    childAspectRatio: boxWidth / boxHeight,
                  ),
                  itemCount: widget.zoneData.length,
                  itemBuilder: (context, index) {
                    final value = widget.zoneData[index];
                    return Container(
                      alignment: Alignment.center,
                      color: getBackGroundColor(value),
                      child: AutoSizeText(
                        '$value',
                        minFontSize: 7,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: getTextColor(value),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 3,
          )
        ],
      ),
    );
  }
}
