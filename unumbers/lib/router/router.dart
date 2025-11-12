import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unumbers/feature/game/game_view.dart';
import 'package:unumbers/feature/home/home.dart';
import 'package:unumbers/feature/login/login.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainLayOut(
        child: Home(),
      ),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const MainLayOut(
            child: Login(),
          ),
        ),
        GoRoute(
          path: 'gameView',
          builder: (context, state) => const MainLayOut(
            child: GameView(),
          ),
        ),
      ],
    ),
  ],
);

class MainLayOut extends StatelessWidget {
  const MainLayOut({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: child,
        ),
      ),
    );
  }
}
