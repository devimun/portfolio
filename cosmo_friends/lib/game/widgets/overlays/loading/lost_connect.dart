import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class LostNetwork extends StatelessWidget {
  const LostNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Colors.white.withValues(alpha: 0.8),
        child: LayoutBuilder(
          builder: (context, constraints) => Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(
                8.0,
              ),
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'LOST CONNECT',
                    style: theme.displayLarge!.copyWith(color: Colors.red),
                  ),
                  Text(
                    'The internet connection has been lost.\n\nPlease tap the button to restart the game.',
                    style: theme.displayMedium,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: borderShape,
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Restart.restartApp();
                    },
                    child: Text(
                      'RESTART',
                      style: theme.displayLarge,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
