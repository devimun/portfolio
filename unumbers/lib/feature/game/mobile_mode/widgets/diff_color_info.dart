import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unumbers/feature/utils/functions.dart';

// 숫자 위치 차이에 따른 색상 안내도
class DiffColorInfo extends StatelessWidget {
  const DiffColorInfo({super.key});
  final List<Color> colors = const [
    Colors.white,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.purpleAccent,
    Colors.blue,
    Colors.grey
  ];
  final List<String> diff = const ['0', '1', '2', '3', '4', '5', '6', '7 8'];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int idx = 0; idx < colors.length; idx++)
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.0, vertical: Platform.isWindows ? 0.0 : 2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: colors[idx],
                ),
                child: idx == colors.length - 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText('7',
                              maxFontSize: 15,
                              minFontSize: 7,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: getTextColor('7'),
                              )),
                          AutoSizeText('8',
                              maxFontSize: 15,
                              minFontSize: 7,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: getTextColor('8'),
                              ))
                        ],
                      )
                    : AutoSizeText(diff[idx],
                        maxFontSize: 15,
                        minFontSize: 7,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getTextColor(diff[idx]),
                        )),
              ),
            ),
          ),
      ],
    );
  }
}
