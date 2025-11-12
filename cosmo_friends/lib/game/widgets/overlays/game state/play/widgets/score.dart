import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/score_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScore extends ConsumerWidget {
  const GameScore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      'SCORE : ${ref.watch(scoreProvider).toString()}',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
