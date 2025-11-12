import 'dart:io';

import 'package:flutter/foundation.dart';

/// Public-safe copy of AdHelper with placeholders for release AdMob IDs.
class AdHelper {
  static String get bannerAdUnitId {
    if (!kDebugMode) {
      if (Platform.isAndroid) {
        return 'REPLACE_WITH_ANDROID_BANNER_AD_UNIT_ID';
      } else if (Platform.isIOS) {
        return 'REPLACE_WITH_IOS_BANNER_AD_UNIT_ID';
      } else {
        throw UnsupportedError('Unsupported platform');
      }
    } else {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else {
        throw UnsupportedError('Unsupported platform');
      }
    }
  }

  static String get rewardedAdUnitId {
    if (!kDebugMode) {
      if (Platform.isAndroid) {
        return 'REPLACE_WITH_ANDROID_REWARDED_AD_UNIT_ID';
      } else if (Platform.isIOS) {
        return 'REPLACE_WITH_IOS_REWARDED_AD_UNIT_ID';
      } else {
        throw UnsupportedError('Unsupported platform');
      }
    } else {
      if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/5224354917";
      } else if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/1712485313";
      } else {
        throw UnsupportedError("Unsupported platform");
      }
    }
  }
}
