import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unumbers/feature/utils/enum.dart';

Color getTitleColor(int number) {
  if (number == 1 || number == 2) {
    return Colors.black;
  } else if (number == 4 || number == 6) {
    return Colors.blue;
  } else if (number == 3 || number == 5) {
    return Colors.red;
  } else {
    return Colors.yellow;
  }
}

Color getBackGroundColor(int? number) {
  final List<int> black = [36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 27, 13];
  final List<int> blue = [1, 20, 14, 31, 9, 22, 18, 29, 7, 28];
  final List<int> yellow = [12, 35, 3, 26, 0, 32, 15];

  if (number == null) {
    return Colors.white;
  } else {
    if (black.contains(number)) {
      return Colors.black;
    } else if (blue.contains(number)) {
      return Color(0xff3286AD);
    } else if (yellow.contains(number)) {
      return Colors.yellow;
    } else {
      return Color(0xffF00022);
    }
  }
}

List<int> getZoneNumber(int zoneNumber) {
  List<int> zoneString;
  switch (zoneNumber) {
    case 1:
      zoneString = [36, 11, 30, 8, 23];
    case 2:
      zoneString = [10, 5, 24, 16, 33];
    case 3:
      zoneString = [17, 34, 6, 27, 13];
    case 4:
      zoneString = [1, 20, 14, 31, 9];
    case 5:
      zoneString = [19, 4, 21, 2, 25];
    case 6:
      zoneString = [22, 18, 29, 7, 28];
    case 7:
      zoneString = [12, 35, 3, 26, 0, 32, 15];
    default:
      zoneString = [];
  }
  return zoneString;
}

List<int> parseInput(String input) {
  List<int> splited = input
      .split(' ')
      .where((e) => e.trim().isNotEmpty) // 빈 문자열 제거
      .map(int.parse)
      .toList();

  bool hasInvalid = splited.any((number) => number < 0 || number > 36);
  if (hasInvalid) {
    throw FormatException('0부터 36 사이의 숫자만 입력 가능합니다.');
  }

  return splited;
}

Future<void> playSound() async {
  await AudioPlayer().play(AssetSource('audios/click.wav'));
  HapticFeedback.lightImpact();
}

Color getTextColor(int num) {
  List<int> black = [12, 35, 3, 26, 0, 32, 15];
  if (black.contains(num)) {
    return Colors.black;
  }
  return Colors.white;
}

int getNumberZone(int num) {
  List<int> first = [36, 11, 30, 8, 23];
  List<int> second = [10, 5, 24, 16, 33];
  List<int> fourth = [1, 20, 14, 31, 9];
  List<int> sixth = [22, 18, 29, 7, 28];
  List<int> fifth = [19, 4, 21, 2, 25];
  List<int> third = [17, 34, 6, 27, 13];
  List<int> seventh = [12, 35, 3, 26, 0, 32, 15];

  if (first.contains(num)) {
    return 1;
  } else if (second.contains(num)) {
    return 2;
  } else if (third.contains(num)) {
    return 3;
  } else if (fourth.contains(num)) {
    return 4;
  } else if (fifth.contains(num)) {
    return 5;
  } else if (sixth.contains(num)) {
    return 6;
  } else if (seventh.contains(num)) {
    return 7;
  } else {
    throw Exception('Invalid number: $num');
  }
}

String getGameName(GameName gameName) {
  String gameNameKr;
  switch (gameName) {
    case GameName.A:
      gameNameKr = '마이크로';
    case GameName.B:
      gameNameKr = '베터';
    case GameName.C:
      gameNameKr = '윈피니티';
    case GameName.D:
      gameNameKr = '이매오토';
    case GameName.E:
      gameNameKr = '이매스피';
    case GameName.F:
      gameNameKr = '프라오토';
    case GameName.G:
      gameNameKr = '프라브이';
    case GameName.H:
      gameNameKr = 'A';
    case GameName.I:
      gameNameKr = 'B';
    case GameName.J:
      gameNameKr = 'C';
  }
  return gameNameKr;
}
