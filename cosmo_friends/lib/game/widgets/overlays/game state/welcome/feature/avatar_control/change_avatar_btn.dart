import 'package:cosmo_friends/config/style.dart';
import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/avatar_need_manger.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/avatar_view_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/btn_state_provider.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 캐릭터 좌우로 배치된 화살표 버튼 위젯으로 다른 캐릭터를 조회할 수 있다.
class ChangeAvatarBtn extends ConsumerWidget {
  const ChangeAvatarBtn({
    super.key,
    required this.game,
  });
  final CosmoFriends game;
  static const List<String> avatarList = [
    'player/normal.png',
    'player/sad.png',
    'player/shock.png',
    'player/smile.png'
  ];
  // 현재 유저가 조회중인 인덱스의 아바타를 조건에 따라 보유중인 것으로 변경하는 메서드
  Map<String, dynamic> checkAvatarNeeeds(WidgetRef ref, int currentIndex) {
    // 유저 정보에 코인을 조회함.
    Map<String, dynamic> userData = ref.read(userProvider);
    // 현재 인덱스를 통해 유저가 조회중인 아바타 확인
    // 조회중인 아바타의 획득 조건 확인
    Map<String, dynamic> needs =
        ref.read(userProvider.notifier).checkNeeds(currentIndex);
    // needs는 type,count를 key값으로 갖고 있다.
    // 또한 userData[type]은 해당 타입 코인의 개수를 저장해둔다.
    CoinType needsCoinType = needs['type'];
    int needsCoinCount = needs['count'];
    int userHasCoin = userData[needsCoinType.name];
    // 만약 유저가 보유중인 코인이 조건보다 많은 경우
    if (userHasCoin >= needsCoinCount) {
      return {
        'needs': needs,
        'result': true,
      };
    } else {
      return {
        'needs': needs,
        'result': false,
      };
    }
  }

  // 하단 버튼의 타입을 결정하기 위한 메서드
  void setBtnWidgetType(WidgetRef ref, int currentIndex) {
    Map<String, dynamic> userData = ref.watch(userProvider);
    // currentIndex를 통해 GameStartBtn 위젯의 UI를 결정해야함
    // 이 버튼 타입을 결정하는 요소들
    // 그러려면 현재 착용하고 있는 아바타의 정보를 알아야함.
    // select를 누른 경우 avatarIndex가 변경됨. 만약 안누른다면 초기값인 0.
    // 즉,avatarIndex가 착용중인 인덱스고 currentIndex는 조회중인 인덱스
    // 버튼을 통해 아바타를 조회할 때 해당 인덱스에 맞는 url을 갖고 유저가 갖고있는지 확인하는 메서드가 필요함

    // 1. 보유중인 아바타를 착용하고 있는 경우 => start
    // 아바타를 보유중인 경우
    if (ref.read(userProvider.notifier).isHadAvatar(currentIndex)) {
      // 아바타 보유 + 착용중인 경우
      if (currentIndex == userData['avatarIndex']) {
        // 유저가 시작할 수 있게 버튼 타입을 start로 설정해야함
        ref.read(btnStateProvider.notifier).setBtnType(ButtonType.start);
      }
      // 아바타 보유 + 착용중이지 않은 경우
      else {
        // 유저가 착용할 수 있게 버튼 타입을 select로 설정해야함
        ref.read(btnStateProvider.notifier).setBtnType(ButtonType.select);
      }
    }
    // 아바타를 보유하지 않은 경우
    else {
      // 아바타 보유 가능 여부 결과를 확인하고 이를 클래스에 저장해둠
      Map<String, dynamic> result = checkAvatarNeeeds(ref, currentIndex);
      ref.read(needsManager.notifier).setNeedsState(result);
      // 버튼 스테이트를 unlock으로 설정하여 , 구매 가능 여부를 위젯에 표현함
      ref.read(btnStateProvider.notifier).setBtnType(ButtonType.unlock);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 유저의 아바타 주소를 알고 해당 주소의 순서를 알아야함
    int currentIndex =
        avatarList.indexOf(game.player.playerAnimationComponent.url);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_left,
            color: mainColor,
            size: 100,
          ),
          onPressed: () async {
            sfx(game, 'tap', ref);
            // 만약 리스트 최초 요소라면 마지막 요소(3번째 인덱스)가 보일 수 있도록 4로 변경
            if (currentIndex == 0) {
              currentIndex = avatarList.length;
            }
            String avatarLink = avatarList[currentIndex - 1];
            await game.player.setAvatar(avatarLink);
            currentIndex--;
            // 조회중인 인덱스를 저장해둔다.
            ref.read(avatarViewProvider.notifier).setIndex(currentIndex);
            setBtnWidgetType(ref, currentIndex);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_right,
            color: mainColor,
            size: 100,
          ),
          onPressed: () async {
            sfx(game, 'tap', ref);
            // 만약 리스트 마지막 요소라면 첫 번쨰 요소(0번째 인덱스)가 보일 수 있도록 -1로 변경
            if (currentIndex == avatarList.length - 1) {
              currentIndex = -1;
            }
            String avatarLink = avatarList[currentIndex + 1];
            await game.player.setAvatar(avatarLink);
            currentIndex++;
            ref.read(avatarViewProvider.notifier).setIndex(currentIndex);
            setBtnWidgetType(ref, currentIndex);
          },
        ),
      ],
    );
  }
}
