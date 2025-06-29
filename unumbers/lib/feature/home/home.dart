import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unumbers/feature/game/game_view.dart';
import 'package:unumbers/feature/home/widgets/error_view.dart';
import 'package:unumbers/feature/home/widgets/loading.dart';
import 'package:unumbers/feature/login/login.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/utils/enum.dart';

class Home extends ConsumerWidget {
  const Home({super.key});
  Future<bool> getSavedAccount(WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    if (username != null) {
      ref
          .read(loginInfoProvider.notifier)
          .setData(InputType.username, username);
    }

    String? id = prefs.getString('id');
    if (id != null) {
      String? pwd = prefs.getString('pwd');
      if (pwd != null) {
        final userDoc =
            await FirebaseFirestore.instance.collection('users').doc(id).get();
        if (userDoc.exists) {
          String userPwd = userDoc.get('pwd') as String;
          if (userPwd == pwd) {
            return true;
          }
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: getSavedAccount(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Errorview(error: snapshot.error?.toString());
        } else {
          if (snapshot.data != null) {
            Widget widget;
            widget = snapshot.data == true ? const GameView() : const Login();
            return widget;
          }
          return const LoadingScreen();
        }
      },
    );
  }
}
