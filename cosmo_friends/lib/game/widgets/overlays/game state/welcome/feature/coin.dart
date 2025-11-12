import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinWidget extends ConsumerWidget {
  const CoinWidget({super.key, required this.coinType});
  final CoinType coinType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        // height: 50,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Row(
            children: [
              Container(
                width: constraints.maxWidth,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/coin/${coinType.name}.png',
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Text(
                        '${userData[coinType.name]}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
