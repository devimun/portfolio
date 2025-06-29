import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmo_friends/config/data.dart';
import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestReivew extends ConsumerWidget {
  const RequestReivew({
    super.key,
    required this.game,
  });
  final CosmoFriends game;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'We Need Your Feedback!',
                    style: textTheme.displayLarge!,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: mainColor,
                  height: 10,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Did you enjoy our game?',
                  style: textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'We need your feedback to create even more fun and exciting games.',
                  style: textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Please share your thoughts about the game by leaving a review.',
                  style: textTheme.displayMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: borderShape,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () async {
                    ref.read(userProvider.notifier).setElement('review', true);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('review', true);
                    final userData = ref.read(userProvider);
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userData['uid'])
                        .update({'review': true});
                    await launchUrl(url).then((r) {
                      game.overlays.remove('review');
                      game.gameState = GameState.welcome;
                      game.player.playerState = PlayerState.idle;
                    });
                  },
                  child: Text(
                    'YES',
                    style: textTheme.displayMedium,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: borderShape,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    final userData = ref.read(userProvider);
                    final reviewDate = DateTime.parse(userData['reviewDate'])
                        .toUtc()
                        .add(
                          const Duration(days: 1),
                        )
                        .toString();
                    ref
                        .read(userProvider.notifier)
                        .setElement('reviewDate', reviewDate);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString('reviewDate', reviewDate);
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userData['uid'])
                        .update({'reviewDate': reviewDate}).then((r) {
                      game.overlays.remove('review');
                      game.gameState = GameState.welcome;
                      game.player.playerState = PlayerState.idle;
                    });
                  },
                  child: Text(
                    'NO',
                    style: textTheme.displayMedium!
                        .copyWith(color: Colors.black.withValues(alpha: 0.7)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
