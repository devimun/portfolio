import 'package:cosmo_friends/game/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameProvider = Provider<CosmoFriends>((ref) {
  return CosmoFriends(ref: ref);
});
