import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/widgets/logout_btn.dart';
import 'package:unumbers/feature/game/desktop_mode/provider/desktop_page_provider.dart';
import 'package:unumbers/feature/utils/style.dart';

class DesktopHeader extends ConsumerWidget {
  const DesktopHeader({
    super.key,
    required this.isAdmin,
  });

  final bool isAdmin;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final pageIdx = ref.watch(desktopPageProvider);
    var read = ref.read(desktopPageProvider.notifier);
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                height: 60,
                child: Image.asset(Assets.whiteLogo),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  read.selectGame(0);
                },
                child: Text(
                  'Games',
                  style: pageIdx == 0 ? WebStyle.tS : WebStyle.subTS,
                ),
              ),
              if (isAdmin) ...[
                Container(
                  width: 3,
                  height: 15,
                  color: WebStyle.subBGC,
                ),
                TextButton(
                  onPressed: () {
                    read.selectGame(1);
                  },
                  child: Text(
                    'User Management',
                    style: pageIdx == 0 ? WebStyle.subTS : WebStyle.tS,
                  ),
                ),
              ],
            ],
          ),
        ),
        const LogoutBtn(),
      ],
    );
  }
}
