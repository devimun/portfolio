// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNdvo4mM3cJkgnUKQKmybU5Zrtp7AymgU',
    appId: '1:345609036100:android:098d94fca88d229b6df711',
    messagingSenderId: '345609036100',
    projectId: 'cosmo-friends',
    storageBucket: 'cosmo-friends.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtU0a8kpkogsgPBtqW7oxylU8fFSR_j-M',
    appId: '1:345609036100:ios:4ca7c7edff437e3c6df711',
    messagingSenderId: '345609036100',
    projectId: 'cosmo-friends',
    storageBucket: 'cosmo-friends.firebasestorage.app',
    androidClientId: '345609036100-0jv9liltba334gs5d4c1m1p7hm6g1pop.apps.googleusercontent.com',
    iosClientId: '345609036100-2900umhcimpvk6a48uqvmp893q70queu.apps.googleusercontent.com',
    iosBundleId: 'com.example.cosmoFriends.RunnerTests',
  );

}