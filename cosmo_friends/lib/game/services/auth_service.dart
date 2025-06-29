import 'dart:developer';
import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  // 플랫폼에 따라 로그인 메서드 선택
  Future<UserCredential?> signIn() async {
    if (Platform.isIOS) {
      return await _signInWithApple();
    } else if (Platform.isAndroid) {
      return await _signInWithGoogle();
    } else {
      // 그 외 플랫폼 처리 (웹, 데스크톱 등 필요시)
      return null;
    }
  }

  Future<UserCredential?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential?> _signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      log('appleCredential : $appleCredential');
      WebAuthenticationOptions(
        clientId: 'com.goodday.cosmoFriends',
        redirectUri:
            Uri.parse('https://cosmo-friends.firebaseapp.com/__/auth/handler'),
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (e) {
      log('Apple sign-in failed: $e');
      return null;
    }
  }

  Future<bool> reauthenticate() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return false;

      AuthCredential credential;

      if (Platform.isIOS) {
        final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );

        credential = OAuthProvider("apple.com").credential(
          idToken: appleCredential.identityToken,
          accessToken: appleCredential.authorizationCode,
        );
      } else if (Platform.isAndroid) {
        final googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) return false;

        final googleAuth = await googleUser.authentication;

        credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      } else {
        return false;
      }

      await user.reauthenticateWithCredential(credential);
      log('Reauthentication successful');
      return true;
    } catch (e, stack) {
      log('Reauthentication failed: $e', stackTrace: stack);
      return false;
    }
  }
}
