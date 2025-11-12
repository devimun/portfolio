import 'package:cosmo_friends/game/components/config/enum.dart';
import 'package:cosmo_friends/firebase_options.dart';
import 'package:cosmo_friends/game/game.dart';
import 'package:cosmo_friends/provider/game_provider.dart';
import 'package:cosmo_friends/game/services/app_version_service.dart';
import 'package:cosmo_friends/game/services/fetch_service.dart';
import 'package:cosmo_friends/game/widgets/ad_banner/ad_banner.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/end/end_overlay.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/play_overlay.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/welcome/welcome_overlay.dart';
import 'package:cosmo_friends/game/widgets/overlays/loading/load_result.dart';
import 'package:cosmo_friends/game/widgets/overlays/loading/lost_connect.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/end/request_reivew.dart';
import 'package:cosmo_friends/splash_screen.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 모든 Flutter 프레임워크 오류를 Crashlytics로 전송
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordError(
      errorDetails.exception,
      errorDetails.stack,
    );
  };

  // 모든 비동기 오류를 Crashlytics로 전송
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(
      error,
      stack,
    );
    return true;
  };

  runApp(
    const ProviderScope(
      child: MyGame(),
    ),
  );
}

// 유저 정보 로드
class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontFamily: 'ps2',
              fontSize: 18,
            ),
            displayMedium: const TextStyle(
              fontFamily: 'ps2',
              fontSize: 15,
            ),
            displaySmall: const TextStyle(
              fontFamily: 'ps2',
              fontSize: 13,
            ),
            headlineLarge: TextStyle(
              fontFamily: 'ps2',
              fontSize: 20,
              color: mainColor,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: LoadWidget(),
        ),
        builder: EasyLoading.init(),
      ),
    );
  }
}

class LoadWidget extends ConsumerWidget {
  const LoadWidget({super.key});

  // 로딩 과정을 담은 메서드
  // 1. 버전 체크 -> 2.내부 데이터 세팅 -> 3. 데이터 패치
  Future<List<dynamic>> apploading(WidgetRef ref) async {
    final checkData = await checkAppVersion();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;

    if (checkData == null) {
      return [LoadingResult.error];
    }
    final String latest = checkData['latestVersion'];
    final String minSupported = checkData['minSupportedVersion'];
    final bool gameStatus = checkData['gameStatus'];
    final String? message = checkData['message'];
    // 서버 점검 혹은 문제가 발생한 경우
    if (!gameStatus) {
      return [LoadingResult.notice, message];
    }
    // 업데이트 필요한 경우
    if (isNeedUpdate(currentVersion, minSupported)) {
      return [
        LoadingResult.update,
        {
          'localVersion': currentVersion,
          'storeVersion': latest,
        },
      ];
    }
    //문제 없는 경우
    await fetchData(ref);
    return [LoadingResult.good];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: apploading(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else if (snapshot.data != null &&
            snapshot.data![0] == LoadingResult.good) {
          return const Game();
        } else {
          return LoadResultWidget(
            loadData: snapshot.data!,
          );
        }
      },
    );
  }
}

class Game extends ConsumerWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cosmoGame = ref.watch(gameProvider);
    return Stack(
      children: [
        GameWidget(
          game: cosmoGame,
          loadingBuilder: (context) => const SplashScreen(),
          overlayBuilderMap: {
            GameState.welcome.name: (BuildContext context, CosmoFriends game) =>
                WelcomeOverlay(game: game),
            GameState.play.name: (BuildContext context, CosmoFriends game) =>
                PlayOverlay(game: game),
            GameState.end.name: (BuildContext context, CosmoFriends game) =>
                EndOverlay(game: game),
            'LostNetwork': (BuildContext context, CosmoFriends game) =>
                const LostNetwork(),
            'review': (BuildContext context, CosmoFriends game) =>
                RequestReivew(
                  game: game,
                )
          },
        ),
        const Positioned(
          left: 10,
          right: 10,
          child: TopBanner(),
        ),
      ],
    );
  }
}
