import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// 헤드라인 애니메이션 전용 위젯
class HeadLine extends StatelessWidget {
  const HeadLine({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headlineLarge,
    )
        .animate(onPlay: (controller) => controller.repeat())
        .fadeIn(duration: 800.milliseconds)
        .then()
        .fadeOut(duration: 800.milliseconds);
  }
}
