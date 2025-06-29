// 유저 정보 + 게임 아바타 관리를 위한 클래스
import 'package:cosmo_friends/game/components/components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserManagementProvider extends StateNotifier<Map<String, dynamic>> {
  UserManagementProvider()
      : super({
          'avatarIndex': 0,
          'best': 0,
          'hadAvatar': [
            'player/normal.png',
          ],
          'playCoin': 0,
          'cashCoin': 0,
        });

  List<String> avatarList = [
    'player/normal.png',
    'player/sad.png',
    'player/shock.png',
    'player/smile.png'
  ];

  Map<int, Map<String, dynamic>> unlockNeeds = {
    0: {
      'type': CoinType.playCoin,
      'count': 0,
    },
    1: {
      'type': CoinType.playCoin,
      'count': 50,
    },
    2: {
      'type': CoinType.playCoin,
      'count': 100,
    },
    3: {
      'type': CoinType.playCoin,
      'count': 200,
    },
  };

  // 유저가 조회중인 아바타를 유저가 획득할 수 있는지 없는지 확인해주는 메서드
  Map<String, dynamic> checkNeeds(int currentIndex) {
    Map<String, dynamic> needs = unlockNeeds[currentIndex]!;
    return needs;
  }

  // 현재 착용중인 아바타의 url을 반환하는 메서드
  PlayerAsset getUrl() {
    switch (avatarList[state['avatarIndex']]) {
      case 'player/normal.png':
        return PlayerAsset.normal;
      case 'player/sad.png':
        return PlayerAsset.sad;
      case 'player/shock.png':
        return PlayerAsset.shock;
      case 'player/smile.png':
        return PlayerAsset.smile;
      default:
        return PlayerAsset.normal;
    }
  }

  // 유저가 조회중인 아바타를 보유중인지 확인하는 메서드
  bool isHadAvatar(int currentIndex) {
    String avatarUrl = avatarList[currentIndex];
    List<dynamic> isHadAvatar = state['hadAvatar'];
    bool result = isHadAvatar.contains(avatarUrl);
    return result;
  }

  // 유저가 unlock상태의 버튼 클릭시 해당 아바타를 보유하게 하는 메서드
  void addAvatar(int currentIndex) {
    // avatarList에서 현재 인덱스에 해당하는 아바타 url을 hadAvatar리스트로 추가해야함.
    String newAvatar = avatarList[currentIndex];
    List<dynamic> hadAvatar = state['hadAvatar'];
    hadAvatar.add(newAvatar);
    state = {
      ...state,
      'hadAvatar': hadAvatar,
    };
  }

  // 유저가 조회중인 인덱스의 아바타 url을 반환해주는 메서드
  String getUrlFromIndex(int currentIndex) {
    return avatarList[currentIndex];
  }

  void setData(Map<String, dynamic> data) {
    state = data;
  }

  void setElement(String key, dynamic element) {
    state = {
      ...state,
      key: element,
    };
  }
}

final userProvider =
    StateNotifierProvider<UserManagementProvider, Map<String, dynamic>>(
  (ref) => UserManagementProvider(),
);
