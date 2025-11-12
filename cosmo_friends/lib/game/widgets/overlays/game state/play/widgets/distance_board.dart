import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/distance_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DistanceBoard extends StatelessWidget {
  const DistanceBoard({super.key});

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
            child: Image.asset('assets/images/alien/profile/alien_profile.png'),
          ),
          SizedBox(
            height: 5,
          ),
          DistanceText(),
        ],
      ),
    );
  }
}

class DistanceText extends ConsumerWidget {
  const DistanceText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distanceProvider = ref.watch(distanceStreamProvider);
    return distanceProvider.when(
      data: (data) => Text('${data}m'),
      error: (err, stack) => Text('Error : $err'),
      loading: () => SizedBox.shrink(),
    );
  }
}
