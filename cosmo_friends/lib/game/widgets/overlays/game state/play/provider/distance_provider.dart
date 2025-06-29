import 'package:cosmo_friends/provider/game_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final distanceStreamProvider = StreamProvider<int>((ref) {
  // gameProvider를 통해 게임 인스턴스를 얻고, 그 인스턴스의 스트림을 반환합니다.
  final game = ref.watch(gameProvider);
  return game.distanceStream;
});
