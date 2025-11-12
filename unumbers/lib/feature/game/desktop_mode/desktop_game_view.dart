import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/loading_progress_widget.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/zone_view.dart';
import 'package:unumbers/feature/game/desktop_mode/widgets/header.dart';
import 'package:unumbers/feature/game/desktop_mode/provider/desktop_page_provider.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/user_management/user_management_page.dart';

class DesktopGameView extends ConsumerWidget {
  const DesktopGameView({
    super.key,
    required this.streamData,
  });
  final StreamData streamData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);
    final userType = ref.watch(loginInfoProvider).username;
    final pageIdx = ref.watch(desktopPageProvider);
    bool isAdmin = false;
    if (userType == 'admin') {
      isAdmin = true;
    }
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
            10,
            0,
            10,
            10,
          ),
          color: Colors.black,
          child: Column(
            children: [
              DesktopHeader(
                isAdmin: isAdmin,
              ),
              pageIdx == 1
                  ? const Expanded(
                      child: UserManagementPage(),
                    )
                  : Expanded(
                      child: Row(
                        children: [
                          for (int i = 0; i < 4; i++) ...[
                            Expanded(
                              child: DesktopZoneView(
                                streamData: streamData,
                                viewIdx: i,
                              ),
                            ),
                            if (i != GameName.values.length - 1)
                              const SizedBox(
                                width: 15,
                              ),
                          ]
                        ],
                      ),
                    )
            ],
          ),
        ),
        if (isLoading) const LoadingProgressWidget(),
      ],
    );
  }
}
