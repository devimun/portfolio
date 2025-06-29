import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/widgets/ad_banner/data.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/score_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/headline.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// 게임 종료 모달 기능
// 1. 최종 게임 점수 표시
// 2. 게임 다시 시작 기능
// 3. 홈으로 이동하기 기능
class EndOverlay extends ConsumerStatefulWidget {
  const EndOverlay({
    super.key,
    required this.game,
  });
  final CosmoFriends game;

  @override
  ConsumerState<EndOverlay> createState() => _EndOverlayState();
}

class _EndOverlayState extends ConsumerState<EndOverlay> {
  final completer = Completer<RewardedAd?>();
  Future<RewardedAd?> loadRewardedAd() async {
    try {
      RewardedAd.load(
        adUnitId: AdHelper.rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
              },
            );
            if (!completer.isCompleted) {
              completer.complete(ad);
            }
          },
          onAdFailedToLoad: (err) {
            if (!completer.isCompleted) {
              completer.complete(null);
            }
          },
        ),
      );

      return completer.future;
    } catch (e, stackTrace) {
      await checkError(e, stackTrace);
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    completer.future.then((ad) {
      ad?.dispose();
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final int score = ref.read(scoreProvider);
    final int bestScore = ref.read(userProvider)['best'];
    final TextStyle displayLarge = Theme.of(context).textTheme.displayLarge!;
    final TextStyle displayMedium = Theme.of(context).textTheme.displayMedium!;
    return FutureBuilder(
      future: loadRewardedAd(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.grey.withValues(alpha: 0.5),
            width: double.maxFinite,
            height: double.maxFinite,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return EndOverlayWidget(
            displayMedium: displayMedium,
            bestScore: bestScore,
            displayLarge: displayLarge,
            score: score,
            widget: widget,
            ads: snapshot.data,
          );
        }
      },
    );
  }
}

class EndOverlayWidget extends ConsumerStatefulWidget {
  const EndOverlayWidget({
    super.key,
    required this.displayMedium,
    required this.bestScore,
    required this.displayLarge,
    required this.score,
    required this.widget,
    required this.ads,
  });

  final TextStyle displayMedium;
  final int bestScore;
  final TextStyle displayLarge;
  final int score;
  final EndOverlay widget;
  final RewardedAd? ads;

  @override
  ConsumerState<EndOverlayWidget> createState() => _EndOverlayWidgetState();
}

class _EndOverlayWidgetState extends ConsumerState<EndOverlayWidget> {
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        height: MediaQuery.sizeOf(context).height * 0.6,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const HeadLine(
              data: 'GAME OVER',
            ),
            Text(
              'BEST SCORE',
              style: widget.displayMedium,
            ),
            Text(
              widget.bestScore.toString(),
              style: widget.displayLarge,
            ),
            Text(
              'SCORE',
              style: widget.displayMedium,
            ),
            Text(
              widget.score.toString(),
              style: widget.displayLarge,
            ),
            // 획득 코인 개수 말해줌
            Text(
              'get ${widget.score ~/ 5} coin',
              style: widget.displayLarge,
            ),
            if (widget.ads != null)
              TextButton(
                style: TextButton.styleFrom(
                    shape: borderShape,
                    backgroundColor: loaded ? Colors.grey : mainColor,
                    minimumSize: const Size(120, 60)),
                onPressed: () async {
                  // widget.game.gameState = GameState.play;
                  loaded
                      ? null
                      : await widget.ads?.show(
                          onUserEarnedReward: (ad, reward) async {
                            // 유저에게 코인을 한 번 더 추가해줌
                            Map<String, dynamic> userData =
                                ref.read(userProvider);
                            int score = ref.read(scoreProvider);
                            int reward = score ~/ 5;
                            int newPlayCoin = userData['playCoin'] + reward;

                            String? uid = userData['uid'];
                            if (uid != null) {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(uid)
                                  .update({
                                'playCoin': newPlayCoin,
                              });
                            }
                            // firebase에 추가해줌
                            await widget.widget.game.prefs
                                .setInt('playCoin', newPlayCoin);
                            ref.read(userProvider.notifier).setElement(
                                  CoinType.playCoin.name,
                                  newPlayCoin,
                                );
                          },
                        ).then((V) => setState(() {
                            loaded = true;
                          }));
                },
                child: Text(
                  'X2 Coin (AD)',
                  style: widget.displayMedium,
                ),
              ),
            TextButton(
              style: TextButton.styleFrom(
                  shape: borderShape,
                  backgroundColor: mainColor,
                  minimumSize: const Size(120, 60)),
              onPressed: () {
                widget.widget.game.gameState = GameState.play;
              },
              child: Text(
                'RETRY',
                style: widget.displayMedium,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  shape: borderShape,
                  backgroundColor: mainColor,
                  minimumSize: const Size(120, 60)),
              onPressed: () {
                sfx(widget.widget.game, 'tap', ref);
                final userData = ref.read(userProvider);
                if (!userData['review']) {
                  bool request = DateTime.now().day ==
                      DateTime.parse(userData['reviewDate']).toUtc().day;
                  if (request) {
                    widget.widget.game.overlays.add('review');
                  } else {
                    widget.widget.game.gameState = GameState.welcome;
                    widget.widget.game.player.playerState = PlayerState.idle;
                  }
                } else {
                  widget.widget.game.gameState = GameState.welcome;
                  widget.widget.game.player.playerState = PlayerState.idle;
                }
              },
              child: Text(
                'HOME',
                style: widget.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
