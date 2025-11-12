import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: const Color(0xff4640A6),
      child: Center(
        child: Text(
          'COSMO\n\nFRIENDS',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 40,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
