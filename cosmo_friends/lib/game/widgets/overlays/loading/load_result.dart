// 앱 로딩을 진행했을 때 게임 업데이트 혹은 공지사항이 있는 경우 유저에게 전달하기 위한 위젯

import 'dart:io';

import 'package:cosmo_friends/config/data.dart';
import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoadResultWidget extends StatelessWidget {
  const LoadResultWidget({
    super.key,
    required this.loadData,
    this.message,
  });
  final List<dynamic> loadData;

  final String? message;
  @override
  Widget build(BuildContext context) {
    LoadingResult loadingResult = loadData[0];
    final theme = Theme.of(context).textTheme;
    final String text;
    switch (loadingResult) {
      case LoadingResult.error:
        text =
            'We encountered an unexpected issue. Please give it another try ';
      case LoadingResult.notice:
        text = message!;
      case LoadingResult.update:
        text =
            "Welcome to Cosmo Friends!\n\n\nWe have released a new version of the app.\n\n\nso please click the button below to install it!\n\n\nYour version:${loadData[1]['localVersion']}\n\n\nUpdate version:${loadData[1]['storeVersion']}\n\n\nIf the update message doesn't appear in the store, please try again in a few minutes.";
      case LoadingResult.good:
        text = 'good';
    }
    return Container(
      color: const Color(0xff4640A6),
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'NOTICE',
              style: theme.displayLarge!.copyWith(color: Colors.red),
            ),
            Text(
              text,
              style: theme.displayMedium,
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: borderShape,
              ),
              onPressed: () async {
                if (loadingResult == LoadingResult.notice ||
                    loadingResult == LoadingResult.error) {
                  exit(0);
                } else {
                  await launchUrl(url);
                }
              },
              child: Text(
                loadingResult == LoadingResult.update ? 'UPDATE' : 'EXIT',
                style: theme.displayLarge!.copyWith(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
