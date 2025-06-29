import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/wrong_score_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WrongScroreBoard extends StatelessWidget {
  const WrongScroreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: commandKeyAreaBGC,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset('assets/images/wrong.png'),
          ),
          SizedBox(
            height: 5,
          ),
          WrongText(),
        ],
      ),
    );
  }
}

class WrongText extends ConsumerWidget {
  const WrongText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(wrongScorerovider);
    return Text('$score');
  }
}
