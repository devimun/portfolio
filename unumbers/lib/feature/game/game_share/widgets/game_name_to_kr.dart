import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:unumbers/feature/utils/style.dart';

class GameNameToKr extends StatelessWidget {
  const GameNameToKr({
    super.key,
    required this.gameNameKr,
  });

  final String gameNameKr;

  Widget _buildText(String char, {double minFontSize = 1}) {
    return Expanded(
      child: AutoSizeText(
        char,
        minFontSize: minFontSize,
        maxFontSize: 20,
        style: AppStyle.boldText,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chars = gameNameKr.padRight(4).split('');

    return Column(
      children: [
        if (gameNameKr.length == 1) ...[
          _buildText(
            chars[0],
          )
        ] else ...[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildText(
                  chars[0],
                ),
                _buildText(
                  chars[1],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                if (gameNameKr.length >= 3) ...[
                  _buildText(
                    chars[2],
                  ),
                  _buildText(
                    chars[3],
                  ),
                ]
              ],
            ),
          ),
        ]
      ],
    );
  }
}
