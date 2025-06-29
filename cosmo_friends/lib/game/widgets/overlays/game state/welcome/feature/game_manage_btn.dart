import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/avatar_control/select_avatar_btn.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/avatar_control/game_start_btn.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/feature/avatar_control/get_avatar_btn.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/avatar_need_manger.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/provider/btn_state_provider.dart';
import 'package:cosmo_friends/provider/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cosmo_friends/game/components/components.dart';

class GameManageBtn extends ConsumerWidget {
  const GameManageBtn({
    super.key,
    required this.game,
  });
  final CosmoFriends game;
//   void start() {
//     // 게임 상태 변경
//     game.gameState = GameState.play;
//   }

//   Future<void> select(WidgetRef ref) async {
//     // 내부 데이터 활용을 위해 인스턴스 조회
//     final prefs = await SharedPreferences.getInstance();
//     // 어떤 아바타를 골랐는지 알기 위해 인덱스 조회
//     int currentIndex = ref.read(avatarViewProvider);
//     // 해당 인덱스 유저 데이터 상태관리 클래스에 저장
//     ref.read(userProvider.notifier).setElement('avatarIndex', currentIndex);
//     // 앱을 재실행 했을 때 해당 아바타를 사용할 수 있도록 내부 데이터에도 저장
//     await prefs.setInt('avatarIndex', currentIndex);
//     // 버튼 스테이트 변경
//     ref.read(btnStateProvider.notifier).setBtnType(ButtonType.start);
//   }

//   Future<void> unlock(
//       WidgetRef ref, int needsCount, CoinType needCoinType) async {
//     // 내부 데이터 인스턴스 선언
//     final prefs = await SharedPreferences.getInstance();
//     // 현재 인덱스를 통해 유저가 조회중인 아바타 확인
//     // 유저의 코인타입에서 코인을 빼감
//     Map<String, dynamic> userData = ref.read(userProvider);
//     int remainCoin = userData[needCoinType.name] - needsCount;
//     int currentIndex = ref.read(avatarViewProvider);
//     List<String> hadAvatar = prefs.getStringList('hadAvatar')!;
//     // 현재 인덱스를 통해 새로운 아바타 획득
//     String newAvatar =
//         ref.read(userProvider.notifier).getUrlFromIndex(currentIndex);
//     // 보유 아바타에 추가
//     if (!hadAvatar.contains(newAvatar)) {
//       hadAvatar.add(newAvatar);
//     }
//     // 1.파이어베이스 업데이트
//     String? uid = ref.read(userProvider)['uid'];
//     if (uid != null) {
//       // 아바타 리스트, 남은 코인 업데이트
//       await FirebaseFirestore.instance.collection('users').doc(uid).update(
//         {
//           'hadAvatar': hadAvatar,
//           needCoinType.name: remainCoin,
//         },
//       );
//     }
//     // 2.내부 데이터 저장
//     // 아바타 리스트 저장
//     await prefs.setStringList('hadAvatar', hadAvatar);
//     // 잔여 코인 업데이트
//     await prefs.setInt(needCoinType.name, remainCoin);
//     // 3.상태관리 클래스 업데이트
//     // 아바타 리스트 저장
//     ref.read(userProvider.notifier).addAvatar(currentIndex);
//     // 잔여 코인 업데이트
//     ref.read(userProvider.notifier).setElement(
//           needCoinType.name,
//           remainCoin,
//         );
//     // 마지막으로 현재 버튼 상태를 Select로 변경해줘야함
//     ref.read(btnStateProvider.notifier).setBtnType(ButtonType.select);
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final btnType = ref.watch(btnStateProvider);
    final needsCheckResult = ref.watch(needsManager);
    final needs = needsCheckResult['needs'];
    final coinType = needs?['type'];
    final count = needs?['count'];
    final game = ref.watch(gameProvider); // CosmoFriends 인스턴스
    Widget? child;
    switch (btnType) {
      case ButtonType.start:
        child = GameStartBtn(game: game);
      case ButtonType.select:
        child = const AvatarSelectBtn();
      case ButtonType.unlock:
        child = GetAvatarBtn(count: count, coinType: coinType);
    }
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 2,
      height: MediaQuery.sizeOf(context).height * 0.08,
      child: child,
    );
  }
}
//   Widget build(BuildContext context, WidgetRef ref) {
//     final btnType = ref.watch(btnStateProvider);
//     final needsCheckResult = ref.watch(needsManager);
//     Map<String, dynamic>? needs = needsCheckResult['needs'];
//     CoinType? coinType;
//     int? count;
//     if (needs != null) {
//       coinType = needs['type'];
//       count = needs['count'];
//     }
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: SizedBox(
//           height: 80,
//           child: TextButton(
//             style: TextButton.styleFrom(
//               // 버튼 스테이트가 unlock인 경우 구매 가능 여부에 대한 정보가 담겨있는 needsCheckResult['result']값에 따라서 배경색이 달라짐
//               backgroundColor: btnType == ButtonType.unlock
//                   ? needsCheckResult['result']
//                       ? mainColor
//                       : subColor
//                   : mainColor,
//               shape: borderShape,
//             ),
//             onPressed: () async {
//               sfx(game, 'tap', ref);
//               // 현재 버튼 타입에 따른 메서드 실행
//               if (btnType == ButtonType.start) {
//                 start();
//               } else if (btnType == ButtonType.select) {
//                 await select(ref);
//               } else {
//                 if (needsCheckResult['result']) {
//                   // 로딩바 나오게하기
//                   EasyLoading.show(dismissOnTap: false, status: 'waiting..');
//                   await unlock(ref, count!, coinType!).then((v) =>
//                       // 로딩바 삭제
//                       EasyLoading.dismiss());
//                 } else {
//                   log('can nothing');
//                 }
//               }
//             },
//             // 버튼 타입에 따른 위젯 변경
//             child: btnType == ButtonType.unlock
//                 ? SizedBox(
//                     width: MediaQuery.sizeOf(context).width * 0.5,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/coin/${coinType!.name}.png',
//                         ),
//                         Text(
//                           ': $count',
//                           style: Theme.of(context).textTheme.displayLarge,
//                         )
//                       ],
//                     ),
//                   )
//                 : Text(
//                     btnType == ButtonType.start ? 'GAME START' : 'SELECT',
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
