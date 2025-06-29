import 'package:flutter/material.dart';

class LoadingProgressWidget extends StatelessWidget {
  const LoadingProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.black54,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
