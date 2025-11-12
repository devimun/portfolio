// 아바타 구매 버튼
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/avatar_need_manger.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/avatar_view_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/btn_state_provider.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';

import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAvatarBtn extends ConsumerWidget {
  const GetAvatarBtn({
    super.key,
    required this.count,
    required this.coinType,
  });

  final int count;
  final CoinType coinType;

  Future<void> _unlock(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = ref.read(userProvider);
    int remainCoin = userData[coinType.name] - count;
    int currentIndex = ref.read(avatarViewProvider);
    List<String> hadAvatar = prefs.getStringList('hadAvatar') ?? [];

    String newAvatar =
        ref.read(userProvider.notifier).getUrlFromIndex(currentIndex);
    if (!hadAvatar.contains(newAvatar)) {
      hadAvatar.add(newAvatar);
    }

    String? uid = userData['uid'];
    if (uid != null) {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'hadAvatar': hadAvatar,
        coinType.name: remainCoin,
      });
    }

    await prefs.setStringList('hadAvatar', hadAvatar);
    await prefs.setInt(coinType.name, remainCoin);

    ref.read(userProvider.notifier).addAvatar(currentIndex);
    ref.read(userProvider.notifier).setElement(coinType.name, remainCoin);
    ref.read(btnStateProvider.notifier).setBtnType(ButtonType.select);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final needsCheckResult = ref.watch(needsManager);
    final canUnlock = needsCheckResult['result'];

    return TextButton(
      onPressed: canUnlock
          ? () async {
              sfx(null, 'tap', ref);
              EasyLoading.show(status: 'waiting..');
              await _unlock(ref);
              EasyLoading.dismiss();
            }
          : null,
      style: TextButton.styleFrom(
        backgroundColor: canUnlock ? mainColor : subColor,
        shape: borderShape,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/coin/${coinType.name}.png'),
          Text(
            ': $count',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
