import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (!kDebugMode) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-4769455621618933/9399629943';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-4769455621618933/6326282305';
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
        return 'ca-app-pub-4769455621618933/4779280500';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-4769455621618933/8685600760';
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
