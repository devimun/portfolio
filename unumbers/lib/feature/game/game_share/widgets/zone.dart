import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/utils/functions.dart';

class NumberZone extends StatefulWidget {
  const NumberZone({
    super.key,
    required this.zoneNumber,
    required this.zoneData,
  });
  final List<NumberBox> zoneData;
  final int zoneNumber;

  @override
  State<NumberZone> createState() => _NumberZoneState();
}

class _NumberZoneState extends State<NumberZone> {
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
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(border: Border.all(width: 1.0)),
            width: double.maxFinite,
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
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
              ],
            )),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final aspectRatio = calculateAspectRatio(constraints);

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                ),
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    childAspectRatio: aspectRatio,
                  ),
                  itemCount: widget.zoneData.length,
                  itemBuilder: (context, index) {
                    final value = widget.zoneData[index];
                    return Container(
                      alignment: Alignment.center,
                      color: value.bgColor,
                      child: AutoSizeText(
                        '${value.number}',
                        minFontSize: 8,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: value.txtColor,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 3,
        )
      ],
    );
  }
}
