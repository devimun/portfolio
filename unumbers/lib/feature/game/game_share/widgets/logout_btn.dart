import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unumbers/feature/utils/style.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({
    super.key,
    this.isDesktop,
  });
  final bool? isDesktop;
  @override
  Widget build(BuildContext context) {
    var bool = isDesktop != null && isDesktop == false;
    return SizedBox(
      height: bool ? double.maxFinite : null,
      child: TextButton(
        style: bool
            ? ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                backgroundColor: AppStyle.gameMangeBtnColor,
              )
            : null,
        onPressed: () async {
          try {
            final prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            if (context.mounted) {
              context.replace('/login');
            }
          } catch (e, st) {
            log('$e,$st');
          }
        },
        child: Text(
          'LOGOUT',
          style: bool ? AppStyle.smallBtnText : WebStyle.subTS,
        ),
      ),
    );
  }
}
