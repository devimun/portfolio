import 'package:cosmo_friends/game/components/components.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonStateManager extends StateNotifier<ButtonType> {
  ButtonStateManager()
      : super(
          ButtonType.start,
        );
  void setBtnType(ButtonType btnType) {
    state = btnType;
  }
}

final btnStateProvider = StateNotifierProvider<ButtonStateManager, ButtonType>(
    (ref) => ButtonStateManager());
