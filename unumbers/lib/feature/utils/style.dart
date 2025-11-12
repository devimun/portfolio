import 'package:flutter/material.dart';

class Assets {
  static const String whiteLogo = 'assets/images/white_logo.png';
  static const String blueLogo = 'assets/images/blue_logo.png';
}

class AppStyle {
  static Color gameMangeBtnColor = Color(0xff4c4c4c);
  static Color blueBtnbackgroundColor = const Color(0xff3772B1);
  static Color blueBtnoverlayColor = const Color(0xff5192d1);
  static Color selectedBackgroundColor = const Color(0xff065AA2);
  static Color greyColor = const Color(0xff9E9E97);
  static TextStyle blueBtnTextStlye = const TextStyle(
    color: Colors.white,
  );
  static TextStyle smallBtnText = TextStyle(
    fontSize: 12,
    color: Colors.white,
  );
  static TextStyle boldText = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle inputTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xff9E9E97),
  );
  static TextStyle blueBtnTextStyle = const TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
  static ThemeData appTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      hoverColor: Colors.black,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffCECDCD),
        ),
      ),
    ),
  );
}

class WebStyle {
  static Color bGC = const Color(0xff1E1E20);
  static Color subBGC = const Color(0xff272829);
  static Color twoSubBGC = const Color(0xff313233);

  static TextStyle tS = const TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle subTS = const TextStyle(
    fontSize: 20,
    color: Color(0xff9E9E97),
  );
  static TextStyle twoSubTS = const TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
  static InputDecoration registerField = InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15),
    ),
    hoverColor: twoSubBGC,
    filled: true,
    fillColor: twoSubBGC,
    hintStyle: const TextStyle(
      color: Color(0xff9E9E97),
    ),
  );
  static BoxDecoration tableRowDeco = BoxDecoration(
    color: WebStyle.subBGC,
    border: const Border(
      bottom: BorderSide(width: 1, color: Color(0xff9E9E97)),
    ),
  );
}
