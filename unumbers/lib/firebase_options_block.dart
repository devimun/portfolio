// Redacted copy of the Firebase options for public sharing.
// Replace every placeholder with the actual value from your private configuration
// before running the app.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Redacted [FirebaseOptions] bundle that mirrors the structure of
/// `firebase_options.dart` without exposing production credentials.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'supply your own values in firebase_options.dart.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'REDACTED_WEB_API_KEY',
    appId: 'REDACTED_WEB_APP_ID',
    messagingSenderId: 'REDACTED_WEB_SENDER_ID',
    projectId: 'REDACTED_PROJECT_ID',
    authDomain: 'REDACTED_WEB_AUTH_DOMAIN',
    storageBucket: 'REDACTED_WEB_STORAGE_BUCKET',
    measurementId: 'REDACTED_WEB_MEASUREMENT_ID',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'REDACTED_ANDROID_API_KEY',
    appId: 'REDACTED_ANDROID_APP_ID',
    messagingSenderId: 'REDACTED_ANDROID_SENDER_ID',
    projectId: 'REDACTED_PROJECT_ID',
    storageBucket: 'REDACTED_ANDROID_STORAGE_BUCKET',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'REDACTED_IOS_API_KEY',
    appId: 'REDACTED_IOS_APP_ID',
    messagingSenderId: 'REDACTED_IOS_SENDER_ID',
    projectId: 'REDACTED_PROJECT_ID',
    storageBucket: 'REDACTED_IOS_STORAGE_BUCKET',
    iosBundleId: 'REDACTED_IOS_BUNDLE_ID',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'REDACTED_MACOS_API_KEY',
    appId: 'REDACTED_MACOS_APP_ID',
    messagingSenderId: 'REDACTED_MACOS_SENDER_ID',
    projectId: 'REDACTED_PROJECT_ID',
    storageBucket: 'REDACTED_MACOS_STORAGE_BUCKET',
    iosBundleId: 'REDACTED_MACOS_BUNDLE_ID',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'REDACTED_WINDOWS_API_KEY',
    appId: 'REDACTED_WINDOWS_APP_ID',
    messagingSenderId: 'REDACTED_WINDOWS_SENDER_ID',
    projectId: 'REDACTED_PROJECT_ID',
    authDomain: 'REDACTED_WINDOWS_AUTH_DOMAIN',
    storageBucket: 'REDACTED_WINDOWS_STORAGE_BUCKET',
    measurementId: 'REDACTED_WINDOWS_MEASUREMENT_ID',
  );
}
