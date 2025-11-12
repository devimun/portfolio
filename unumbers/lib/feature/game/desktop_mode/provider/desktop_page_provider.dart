import 'package:flutter_riverpod/flutter_riverpod.dart';

class DesktopPageProvider extends StateNotifier<int> {
  DesktopPageProvider() : super(0);
  void selectGame(int page) {
    if (state != page) {
      state = page;
    }
  }
}

final desktopPageProvider = StateNotifierProvider<DesktopPageProvider, int>(
    (ref) => DesktopPageProvider());
