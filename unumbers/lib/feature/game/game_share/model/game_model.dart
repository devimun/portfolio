import 'package:flutter/material.dart';
import 'package:unumbers/feature/game/game_share/data/data.dart';
import 'package:unumbers/feature/utils/functions.dart';

// 숫자 박스 클래스
class NumberBox {
  final int number;
  final Color bgColor;
  final Color txtColor;
  NumberBox({
    required this.number,
    required this.bgColor,
    required this.txtColor,
  });
}

class GameModel {
  final List<NumberBox> firstZone;
  final List<NumberBox> secondZone;
  final List<NumberBox> thirdZone;
  final List<NumberBox> fourthZone;
  final List<NumberBox> fifthZone;
  final List<NumberBox> sixthZone;
  final List<NumberBox> seventhZone;
  final List<int> allElements;
  final String? selectedUser;

  GameModel({
    required this.firstZone,
    required this.secondZone,
    required this.thirdZone,
    required this.fourthZone,
    required this.fifthZone,
    required this.sixthZone,
    required this.seventhZone,
    required this.allElements,
    required this.selectedUser,
  });

  // 해당 숫자가 어느 구역에 속하는 값인지 찾아주는 함수

  static int getZoneNumber(int number) {
    if (zoneData[1]!.contains(number)) {
      return 1;
    } else if (zoneData[2]!.contains(number)) {
      return 2;
    } else if (zoneData[4]!.contains(number)) {
      return 4;
    } else if (zoneData[6]!.contains(number)) {
      return 6;
    } else if (zoneData[5]!.contains(number)) {
      return 5;
    } else if (zoneData[3]!.contains(number)) {
      return 3;
    } else {
      return 7;
    }
  }

  // 스트림 데이터를 기준으로 박스 배치
  static Map<int, List<NumberBox>> makeZoneData(List<int> allElement) {
    Map<int, List<NumberBox>> allZoneData = {
      1: [],
      2: [],
      3: [],
      4: [],
      5: [],
      6: [],
      7: []
    };
    for (int i = 0; i < allElement.length; i++) {
      if (i == 0) {
        continue;
      }
      // 4.1 수정 사항
      // 1. 배경 계산 로직 변경
      // 기존 : 직전에 입력된 숫자와 현재 입력된 숫자와의 거리 비교 => 변경 : 직전 입력된 숫자가 아닌 자신이 포함된 구역의 직전 숫자와 거리 비교
      // 2. 특정 구역에 최초로 들어가는 숫자의 경우 배경색을 검정색으로 변경

      // 들어가야 되는 구역 확인
      int zoneNumber = getZoneNumber(allElement[i - 1]);
      // 해당 구역이 비어있는지 확인
      int currentNum = allElement[i];
      bool zoneDataIsEmpty = allZoneData[zoneNumber]!.isEmpty;
      Color bgColor;
      Color txtColor;
      // 비어있는 경우
      if (zoneDataIsEmpty) {
        bgColor = Colors.black;
        txtColor = const Color.fromARGB(255, 238, 236, 236);
      } else {
        // 비어있지 않는 경우 이전 숫자와 비교하여 배경과 텍스트 컬러 지정
        int prevNum = allZoneData[zoneNumber]!.last.number;
        List<Color> color = getColor(prevNum, currentNum);
        bgColor = color[0];
        txtColor = color[1];
      }

      NumberBox numberBox = NumberBox(
        number: allElement[i],
        bgColor: bgColor,
        txtColor: txtColor,
      );
      allZoneData[zoneNumber]!.add(numberBox);
    }
    return allZoneData;
  }

  // allElement
  factory GameModel.fromJson(Map<String, dynamic> json) {
    final Map<int, List<NumberBox>> zoneData =
        makeZoneData(List<int>.from(json['allElement']));
    return GameModel(
      firstZone: zoneData[1]!,
      secondZone: zoneData[2]!,
      thirdZone: zoneData[3]!,
      fourthZone: zoneData[4]!,
      fifthZone: zoneData[5]!,
      sixthZone: zoneData[6]!,
      seventhZone: zoneData[7]!,
      allElements: List<int>.from(json['allElement']),
      selectedUser: json['selectedUser'] as String?,
    );
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     '1': firstZone,
  //     '2': secondZone,
  //     '3': thirdZone,
  //     '4': fourthZone,
  //     '5': fifthZone,
  //     '6': sixthZone,
  //     '7': seventhZone,
  //     'allElement': allElements,
  //     'selectedUser': selectedUser,
  //   };
  // }

  @override
  String toString() {
    return '''
GameModel(
  firstZone: $firstZone,
  secondZone: $secondZone,
  thirdZone: $thirdZone,
  fourthZone: $fourthZone,
  fifthZone: $fifthZone,
  sixthZone: $sixthZone,
  seventhZone: $seventhZone,
  allElements: $allElements,
  selectedUser: $selectedUser,
)
''';
  }
}
