import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/command_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/question_element_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/score_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/tap_counter_provider.dart';
import 'package:cosmo_friends/provider/sound_mange_provider.dart';
import 'package:cosmo_friends/provider/user_management_provider.dart';
import 'components/components.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/wrong_score_provider.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart' as audio;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CosmoFriends extends FlameGame with HasCollisionDetection {
  late Player player;
  late Alien alien;
  late ParallaxComponent parallaxComponent;
  late BackGround backgrond;
  late SharedPreferences prefs;
  late Vector2 playerDefaultPostion;
  late Map<String, audio.AudioPool?> sound;
  Vector2? currentalienVelocity;
  GameState? pauseState;
  final Connectivity connectivity = Connectivity();
  List<ConnectivityResult>? connectivityState;
  final StreamController<int> _distanceController =
      StreamController<int>.broadcast();
  Stream<int> get distanceStream => _distanceController.stream;
  final Ref ref;

  CosmoFriends({
    required this.ref,
  }) : super();
  late GameState _gameState;
  GameState get gameState => _gameState;
  GameState gameStateClone() {
    return gameState;
  }

  set gameState(GameState afterGameState) {
    _gameState = afterGameState;
    switch (_gameState) {
      case GameState.welcome:
        welcome();
        break;
      case GameState.play:
        start();
        break;
      case GameState.pause:
        break;
      case GameState.end:
        end();
        break;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (connectivityState != null) {
      if (connectivityState!.first == ConnectivityResult.none) {
        if (!overlays.isActive('LostNetwork')) {
          pauseState = gameStateClone();
          if (overlays.isActive(pauseState!.name)) {
            // 네트워크 연결을 요청하는 오버레이를 띄움
            overlays.add('LostNetwork');
            // 네트워크 연결 종료이 끊긴 경우 적의 현재 속도를 저장해두고 0으로 정지시킨다
            currentalienVelocity = alien.velocity.clone();
            alien.velocity.setFrom(Vector2.all(0));
          }
        }
      }
      // 게임 상태가 'play'일 때만 거리 계산 및 스트림 업데이트
      if (gameState == GameState.play &&
          world.contains(player) &&
          world.contains(alien)) {
        final currentDistance = (alien.position.y - player.position.y).round();
        if (!_distanceController.isClosed) {
          _distanceController.add(currentDistance);
        }
      }
    }
  }

  @override
  FutureOr<void> onLoad() async {
    prefs = await SharedPreferences.getInstance();
    // debugMode = true;
    audio.FlameAudio.bgm.initialize();
    await bgm('welcome.mp3', ref);
    sound = ref.read(soundManager);
    // 유저 데이터 클래스를 통해 url조회
    PlayerAsset playerAsset = ref.read(userProvider.notifier).getUrl();
    player = Player(
      playerAnimationComponent: playerAnimationAssets[playerAsset]!,
    );
    alien = Alien(
      component: alienAnimationAsset[AlienAsset.normal]!,
    );

    // 적, 플레이어 기본 위치 설정
    // playerDefaultPostion = playerPosition;
    backgrond = BackGround();
    parallaxComponent = await ParallaxComponent.load(
      [
        ParallaxImageData('background/stars1.png'),
        ParallaxImageData('background/stars2.png'),
      ],
      baseVelocity: Vector2(0, -40),
      velocityMultiplierDelta: Vector2(0, 1.6),
      fill: LayerFill.height,
      repeat: ImageRepeat.repeatY,
    );
    world.add(backgrond);
    world.add(alien);
    world.add(player);
    // HUD 추가
    await camera.viewport.add(parallaxComponent);
    camera.follow(player);

    camera.viewfinder.zoom = 2.0;
    gameState = GameState.welcome;
    // 네트워크 상태 초기화
    connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      connectivityState = result;
    });
    return super.onLoad();
  }

  Future<void> welcome() async {
    if (!world.contains(player)) {
      world.add(player);
    }
    await bgm('welcome.mp3', ref);
    setComponentStop();
    // 모든 오버레이 삭제
    overlays.removeAll(
      [
        GameState.play.name,
        GameState.pause.name,
        GameState.end.name,
      ],
    );
    // 웰컴 오버레이 추가
    overlays.add(GameState.welcome.name);
  }

  // 게임이 시작될 때 실행될 함수
  Future<void> start() async {
    await bgm('run.mp3', ref);
    // 게임 종료시 제거되는 컴포넌트 추가
    if (!world.contains(player)) {
      world.add(player);
    }
    // 모든 오버레이 제거
    overlays.removeAll(
      [
        GameState.welcome.name,
        GameState.pause.name,
        GameState.end.name,
      ],
    );
    // wrongScore 초기화
    ref.read(wrongScorerovider.notifier).resetState();
    // 플레이어,외계인 정보로 초기화
    setComponentStop();
    // 외계인으로 카메라 무브
    // 만약 플레이어 위치가 초기값이 아닌 경우 플레이어 위치로 먼저 카메라를 세팅하고
    // 이후 적로 카메라 무브를 만들어 게임 시작 통일감을 제공
    if (camera.viewfinder.position.y != player.position.y) {
      camera.moveTo(player.position);
      await Future.delayed(
        1.seconds,
        () {
          camera.moveTo(alien.position, speed: 1000.0);
        },
      );
    } else {
      camera.moveTo(alien.position, speed: 1000.0);
    }
    await Future.delayed(1000.milliseconds);
    // 게임을 시작하고, 적과 카메라가 만났다면 적을 이동시키고 카메라를 플레이어가 따르게함
    if ((camera.viewfinder.position.y.round() == alien.position.y.round())) {
      // 카메라가 적을 잡으면 적 이동 시작
      await Future.delayed(500.milliseconds, () {
        setComponentStart();
      });
      // 적 이동모션 보여준 뒤 카메라는 플레이어 팔로우
      await Future.delayed(2000.milliseconds, () {
        camera.follow(player);
        overlays.add(GameState.play.name);
      });
    }

    //// 점수 초기화
    ref.read(scoreProvider.notifier).resetState();
    // 탭 카운트 초기화
    ref.read(tapCounterProvider.notifier).resetState();
    // 커맨드 문제
    ref.read(commandListProvider.notifier).generateRandomCommands();
    // 커맨드 상태 초기화
    ref.read(questionElementStatusManagerProvider.notifier).reset();
  }

  // 플레이어가 적과 충돌하여 게임이 종료됐을 경우 실행될 메서드
  Future<void> end() async {
    await bgm('end.mp3', ref);
    final userData = ref.read(userProvider);

    overlays.remove(GameState.play.name);
    int bestScore = userData['best'];
    int score = ref.read(scoreProvider);
    if (bestScore <= score) {
      // 만약 유저가 파이어베이스 연동되어있다면 파이어베이스 업데이트
      if (userData['uid'] != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userData['uid'])
            .update({
          'best': score,
        });
      }
      await prefs.setInt('best', score);

      ref.read(userProvider.notifier).setElement('best', score);
    }
    int reward = score ~/ 5;
    String? uid = userData['uid'];
    int newPlayCoin = userData['playCoin'] + reward;
    // firebase에 추가해줌
    if (uid != null) {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'playCoin': newPlayCoin,
        'gameCount': FieldValue.increment(1),
      });
    }

    // playCoin 재화 추가
    await prefs.setInt('playCoin', newPlayCoin);
    ref.read(userProvider.notifier).setElement(
          CoinType.playCoin.name,
          newPlayCoin,
        );
    // end 오버레이 추가
    overlays.add(GameState.end.name);
  }

  // 적,플레이어 속력, 위치 초기화
  void setComponentStop() {
    alien.setStopValue();
    player.setStopValue();
  }

  void setComponentStart() {
    alien.setStartValue();
    player.setStartValue();
  }
}
