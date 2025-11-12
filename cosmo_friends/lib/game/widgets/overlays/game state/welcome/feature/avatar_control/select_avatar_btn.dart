// 아바타 선택 버튼
import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/avatar_view_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/btn_state_provider.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarSelectBtn extends ConsumerWidget {
  const AvatarSelectBtn({super.key});

  Future<void> _select(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    int currentIndex = ref.read(avatarViewProvider);

    ref.read(userProvider.notifier).setElement('avatarIndex', currentIndex);
    await prefs.setInt('avatarIndex', currentIndex);
    ref.read(btnStateProvider.notifier).setBtnType(ButtonType.start);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () async {
        sfx(null, 'tap', ref);
        await _select(ref);
      },
      style: TextButton.styleFrom(
        backgroundColor: mainColor,
        shape: borderShape,
      ),
      child: Text(
        'SELECT',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
