import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unumbers/feature/game/game_share/data/data.dart';
import 'package:unumbers/feature/utils/enum.dart';

// 시계방향 거리 계산
int clockwiseDistance(int base, int target) {
  int len = circularNumber.length;
  int baseIndex = circularNumber.indexOf(base);
  int targetIndex = circularNumber.indexOf(target);
  return (targetIndex - baseIndex + len) % len;
}

// 반시계방향 거리 계산
int counterClockwiseDistance(int base, int target) {
  int len = circularNumber.length;
  int baseIndex = circularNumber.indexOf(base);
  int targetIndex = circularNumber.indexOf(target);
  return (baseIndex - targetIndex + len) % len;
}

// 거리별 색상 매핑 함수
List<Color> getColor(int prevNum, int currentNum) {
  int cwDist = clockwiseDistance(prevNum, currentNum);
  int ccwDist = counterClockwiseDistance(prevNum, currentNum);

  int dist = cwDist < ccwDist ? cwDist : ccwDist;
  Color bgColor;
  Color txtColor;
  switch (dist) {
    case 0:
      bgColor = Color.fromARGB(255, 247, 245, 245);
      txtColor = Colors.black;
    case 1:
      bgColor = Colors.yellow; // 1 = 노란색
      txtColor = Colors.black;
    case 2:
      bgColor = Colors.green; // 2 = 초록색
      txtColor = Colors.black;
    case 3:
      bgColor = Colors.orange; // 3 = 주황색
      txtColor = Colors.black;
    case 4:
      bgColor = Colors.red; // 4 = 빨간색
      txtColor = Colors.white;
    case 5:
      bgColor = Colors.purpleAccent; // 5 = 보라색
      txtColor = Colors.white;
    case 6:
      bgColor = Colors.blue; // 6 = 파란색
      txtColor = Colors.white;
    case 7:
      bgColor = const Color.fromARGB(255, 175, 174, 174);
      txtColor = const Color.fromARGB(255, 14, 134, 233);
    case 8:
      bgColor = const Color.fromARGB(255, 175, 174, 174);
      txtColor = Colors.black;
    default:
      bgColor = Colors.black; // 8 초과 = 검은색
      txtColor = Colors.white;
  }
  return [bgColor, txtColor];
}

// v4 버전 업데이트로 넘버 박스 색상 메서드를 추가한다. => deprecated
// Color getNumberTextColor(Color boxColor) {
//   List<Color> blackText = [Colors.white, Colors.grey, Colors.yellow];

//   if (blackText.contains(boxColor)) {
//     return Colors.black;
//   } else {
//     return Colors.white;
//   }
// }

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

Color getTextColor(String num) {
  List<String> black = ['0', '1', '2', '3'];
  if (num == '7') {
    return const Color.fromARGB(255, 14, 134, 233);
  } else if (black.contains(num)) {
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

double calculateAspectRatio(
  BoxConstraints constraints,
) {
  final int boxesPerRow = 10;
  // 한 줄에 들어갈 박스의 개수
  final int rowCount = 8;
  // 총 줄의 개수 (이 줄 개수에 맞춰 높이 계산)
  final double horizontalSpacing = 1.0;
  // 박스 간 가로 간격
  final double verticalSpacing = 1.0;
  final parentWidth = constraints.maxWidth;
  final parentHeight = constraints.maxHeight;

  final boxWidth =
      (parentWidth - (horizontalSpacing * (boxesPerRow - 1))) / boxesPerRow;

  final totalBoxesHeight = parentHeight - (verticalSpacing * (rowCount - 1));
  final boxHeight = totalBoxesHeight / rowCount;

  return boxWidth / boxHeight;
}
