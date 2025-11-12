import 'dart:developer';
import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Public-safe variant of AuthService. Replace placeholders with your real IDs.
class AuthService {
  Future<UserCredential?> signIn() async {
    if (Platform.isIOS) {
      return await _signInWithApple();
    } else if (Platform.isAndroid) {
      return await _signInWithGoogle();
    } else {
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
        clientId: 'REPLACE_WITH_APPLE_SERVICE_ID',
        redirectUri: Uri.parse(
          'https://REPLACE_WITH_FIREBASE_PROJECT.firebaseapp.com/__/auth/handler',
        ),
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
