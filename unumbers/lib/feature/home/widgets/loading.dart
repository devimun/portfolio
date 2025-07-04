import 'package:flutter/material.dart';
import 'package:unumbers/feature/utils/style.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          fit: BoxFit.fitWidth,
          Assets.blueLogo,
        ),
      ),
    );
  }
}
