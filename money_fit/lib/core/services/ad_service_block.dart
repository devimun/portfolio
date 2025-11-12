// Redacted copy for public sharing. Fill in your own AdMob IDs before build.
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:money_fit/core/widgets/ads/ad_banner_widget.dart';

/// AdMob 광고 서비스를 관리하는 클래스
class AdService {
  static AdService? _instance;
  static AdService get instance => _instance ??= AdService._internal();

  AdService._internal();

  /// AdMob SDK 초기화
  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  static const Map<ScreenType, String> _androidBannerIds = {
    ScreenType.home: 'REPLACE_WITH_ANDROID_HOME_BANNER_ID',
    ScreenType.calendar: 'REPLACE_WITH_ANDROID_CALENDAR_BANNER_ID',
    ScreenType.settings: 'REPLACE_WITH_ANDROID_SETTINGS_BANNER_ID',
    ScreenType.stats: 'REPLACE_WITH_ANDROID_STATS_BANNER_ID',
    ScreenType.expenses: 'REPLACE_WITH_ANDROID_EXPENSES_BANNER_ID',
  };

  static const Map<ScreenType, String> _iosBannerIds = {
    ScreenType.home: 'REPLACE_WITH_IOS_HOME_BANNER_ID',
    ScreenType.calendar: 'REPLACE_WITH_IOS_CALENDAR_BANNER_ID',
    ScreenType.settings: 'REPLACE_WITH_IOS_SETTINGS_BANNER_ID',
    ScreenType.stats: 'REPLACE_WITH_IOS_STATS_BANNER_ID',
    ScreenType.expenses: 'REPLACE_WITH_IOS_EXPENSES_BANNER_ID',
  };
  static const String _testBannerAdId =
      'ca-app-pub-3940256099942544/6300978111';
  static const String _testInterstitialAdId =
      'ca-app-pub-3940256099942544/1033173712';
  static const String _iosReleaseInterstitialAdId =
      'REPLACE_WITH_IOS_INTERSTITIAL_ID';
  static const String _aosReleaseInterstitialAdId =
      'REPLACE_WITH_ANDROID_INTERSTITIAL_ID';

  static const String _testAppOpenAdId =
      'ca-app-pub-3940256099942544/9257395921';
  static const String _iosReleaseAppOpenAdId =
      'REPLACE_WITH_IOS_APP_OPEN_ID';
  static const String _aosReleaseAppOpenAdId =
      'REPLACE_WITH_ANDROID_APP_OPEN_ID';

  static String get appOpenAdId {
    if (Platform.isAndroid) {
      return isDebugMode ? _testAppOpenAdId : _aosReleaseAppOpenAdId;
    } else if (Platform.isIOS) {
      return isDebugMode ? _testAppOpenAdId : _iosReleaseAppOpenAdId;
    }
    throw UnsupportedError('Unsupported platform');
  }

  /// 개발/릴리스 모드에 따른 광고 ID 반환
  static bool get isDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  /// 배너 광고 ID
  static String bannerId(ScreenType screenType) {
    if (isDebugMode) {
      return _testBannerAdId;
    } else {
      if (Platform.isAndroid) {
        return _androidBannerIds[screenType] ?? _testBannerAdId;
      } else if (Platform.isIOS) {
        return _iosBannerIds[screenType] ?? _testBannerAdId;
      }
    }
    throw UnsupportedError('Unsupported platform');
  }

  /// 전면 광고 ID
  static String get interstitialAdId {
    if (Platform.isAndroid) {
      return isDebugMode ? _testInterstitialAdId : _aosReleaseInterstitialAdId;
    } else if (Platform.isIOS) {
      return isDebugMode ? _testInterstitialAdId : _iosReleaseInterstitialAdId;
    }
    throw UnsupportedError('Unsupported platform');
  }
}

/// 전면 광고 관리 클래스
class InterstitialAdManager {
  static InterstitialAdManager? _instance;
  static InterstitialAdManager get instance =>
      _instance ??= InterstitialAdManager._internal();

  InterstitialAdManager._internal();

  InterstitialAd? _interstitialAd;
  bool _isAdReady = false;

  // --- 광고 정책 변수 ---
  int _actionCount = 0;
  DateTime? _lastAdShowTime;
  final int _actionsPerAd = 12; // 몇 번의 액션마다 광고를 보여줄지
  final Duration _adCooldown = const Duration(minutes: 10); // 광고 사이의 최소 간격

  /// 전면 광고 로드
  Future<void> loadAd() async {
    if (_isAdReady) return;

    await InterstitialAd.load(
      adUnitId: AdService.interstitialAdId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isAdReady = true;
          _setupAdCallbacks(ad);
        },
        onAdFailedToLoad: (error) {
          _isAdReady = false;
        },
      ),
    );
  }

  void _setupAdCallbacks(InterstitialAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _lastAdShowTime = DateTime.now();
        _actionCount = 0; // 광고 표시 후 액션 카운트 초기화
      },
      onAdDismissedFullScreenContent: (ad) async {
        ad.dispose();
        _isAdReady = false;
        await loadAd(); // 다음 광고 미리 로드
      },
      onAdFailedToShowFullScreenContent: (ad, error) async {
        ad.dispose();
        _isAdReady = false;
        await loadAd(); // 재시도
      },
    );
  }

  /// 사용자의 주요 액션을 기록하고, 조건이 맞으면 광고를 표시
  Future<void> logActionAndShowAd() async {
    _actionCount++;

    // 쿨다운 확인: 마지막 광고 표시 후 충분한 시간이 지났는가?
    final now = DateTime.now();
    if (_lastAdShowTime != null &&
        now.difference(_lastAdShowTime!) < _adCooldown) {
      return;
    }

    // 액션 카운트 확인: 정해진 횟수의 액션을 수행했는가?
    if (_actionCount >= _actionsPerAd) {
      await _showAd();
    } else {}
  }

  Future<void> _showAd() async {
    if (_isAdReady && _interstitialAd != null) {
      await _interstitialAd!.show();
    } else {
      if (kDebugMode) {
        print('Ad not ready.');
      }
      await loadAd(); // 혹시 광고가 로드되지 않았다면 다시 시도
    }
  }

  /// 리소스 정리
  void dispose() {
    _interstitialAd?.dispose();
  }
}

/// 앱 오프닝 광고(App Open Ad) 관리 클래스
class AppOpenAdManager {
  static AppOpenAdManager? _instance;
  static AppOpenAdManager get instance =>
      _instance ??= AppOpenAdManager._internal();

  AppOpenAdManager._internal();

  AppOpenAd? _appOpenAd;
  DateTime? _adLoadTime;
  bool _isShowingAd = false;
  bool _isLoading = false;
  bool _deferShowUntilLoaded = false;

  final Duration _maxCacheDuration = const Duration(hours: 4);

  bool get _isAdFresh {
    if (_adLoadTime == null) return false;
    return DateTime.now().difference(_adLoadTime!) < _maxCacheDuration;
  }

  bool get isAdAvailable => _appOpenAd != null && _isAdFresh;

  Future<void> loadAd({bool showOnLoad = false}) async {
    if (_isLoading) {
      debugPrint('[AppOpenAd] load skipped: already loading');
      return;
    }
    if (isAdAvailable) {
      debugPrint('[AppOpenAd] load skipped: ad is fresh and available');
      return;
    }

    _isLoading = true;
    debugPrint('[AppOpenAd] start loading...');

    await AppOpenAd.load(
      adUnitId: AdService.appOpenAdId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) async {
          _appOpenAd = ad;
          _adLoadTime = DateTime.now();
          _isLoading = false;
          debugPrint('[AppOpenAd] loaded successfully');
          if (_deferShowUntilLoaded || showOnLoad) {
            _deferShowUntilLoaded = false;
            await showAdIfAvailable();
          }
        },
        onAdFailedToLoad: (error) {
          _appOpenAd = null;
          _adLoadTime = null;
          _isLoading = false;
          debugPrint('[AppOpenAd] failed to load: ${error.message}');
        },
      ),
    );
  }

  Future<void> showAdIfAvailable({VoidCallback? onDismissed}) async {
    if (_isShowingAd) {
      debugPrint('[AppOpenAd] show skipped: already showing');
      return;
    }
    if (!isAdAvailable) {
      _deferShowUntilLoaded = true;
      await loadAd();
      return;
    }

    _isShowingAd = true;
    debugPrint('[AppOpenAd] showing ad');

    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {},
      onAdDismissedFullScreenContent: (ad) async {
        ad.dispose();
        _appOpenAd = null;
        _adLoadTime = null;
        _isShowingAd = false;
        debugPrint('[AppOpenAd] dismissed');
        onDismissed?.call();
        await loadAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) async {
        ad.dispose();
        _appOpenAd = null;
        _adLoadTime = null;
        _isShowingAd = false;
        debugPrint('[AppOpenAd] failed to show: $error');
        await loadAd();
      },
    );

    await _appOpenAd!.show();
  }
}
