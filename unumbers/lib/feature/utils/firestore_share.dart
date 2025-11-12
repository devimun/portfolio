import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/functions.dart';

class FireStoreConstants {
  // TODO: 릴리즈 전 Collection 변경해야함.
  static final doc =
      FirebaseFirestore.instance.collection('gamess').doc('game');

  Future<void> uploadInitialGameData() async {
    final data = {
      'A': createGameData(),
      'B': createGameData(),
      'C': createGameData(),
      'D': createGameData(),
      'E': createGameData(),
      'F': createGameData(),
      'G': createGameData(),
      'H': createGameData(),
      'I': createGameData(),
      'J': createGameData(),
    };

    await doc.set(data);
  }

  Map<String, dynamic> createGameData() {
    // v3부터 zoneData가 따로 존재하지 않기 때문에 구조를 변경함
    return {
      // v4 업데이트 기준 이제 게임 내 allElements만을 사용하기 위해 1~7구역 데이터 제거
      // '1': <int>[],
      // '2': <int>[],
      // '3': <int>[],
      // '4': <int>[],
      // '5': <int>[],
      // '6': <int>[],
      // '7': <int>[],
      'selectedUser': null,
      'allElement': <int>[],
    };
  }

  // 특정 게임 리셋하기
  Future<void> resetGame(GameName game) async {
    await doc.update(
      {
        game.name: createGameData(),
      },
    );
  }

  Future<void> changeActivateGame(GameName gameName, String? username) async {
    final String selectedUserPath = '${gameName.name}.selectedUser';
    await doc.update({
      selectedUserPath: username,
    });
  }

  // 여러 숫자를 삽입하는 메서드
  Future<void> insertNumberList({
    required GameName gameName,
    required GameModel gameModel,
    required List<int> number,
  }) async {
    // v4 업데이트에 따른 메서드 수정
    // : 삽입 숫자의 구역 판단 메서드를 제거하고 allElements에만 삽입하도록 함
    try {
      await playSound();
      List<int> allElement = gameModel.allElements;
      for (int i in number) {
        if (allElement.isEmpty) {
          allElement.add(i);
          continue;
        }
        // int prevNum = allElement.last;
        // int zone = getNumberZone(prevNum);
        // List<int> zoneData = newGameModel['$zone'];
        // zoneData.add(i);
        allElement.add(i);
      }
      await doc.update(
        {
          '${gameName.name}.allElement': allElement,
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  // 단일 숫자 삽입 메서드
  Future<void> insertNumber({
    required GameName gameName,
    required GameModel gameModel,
    required int number,
  }) async {
    // v4 업데이트에 따른 메서드 수정
    // : 삽입 숫자의 구역 판단 메서드를 제거하고 allElements에만 삽입하도록 함
    try {
      await playSound();
      List<int> allElement = gameModel.allElements;
      // if (allElement.isEmpty) {
      allElement.add(number);
      await doc.update({
        '${gameName.name}.allElement': allElement,
      });
      return;
      // }
      // int prevNum = allElement.last;
      // int zone = getNumberZone(prevNum);
      // List<int> zoneData = newGameModel['$zone'];
      // zoneData.add(number);
      // allElement.add(number);
      // // update 호출
      // await doc.update({
      //   gameName.name: newGameModel,
      // });
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
    }
  }

  Future<void> deleteNumber({
    required GameName gameName,
    required GameModel gameModel,
  }) async {
    await AudioPlayer().play(AssetSource('audios/click.wav'));
    HapticFeedback.lightImpact();
    // v4 업데이트에 따른 메서드 수정
    // : allElements 내 마지막 숫자만 삭제하도록 변경
    try {
      // final game = gameModel.toJson();
      List<int> allElement = gameModel.allElements;
      final String allElementPath = '${gameName.name}.allElement';
      // 만약 비어있는 경우 끝
      if (allElement.isEmpty) {
        return;
      }
      if (allElement.length == 1) {
        await doc.update({
          allElementPath: <int>[],
        });
        return;
      }
      // 마지막 숫자를 지우기 위해선, 어떤 구역에 숫자가 입력되었는지 파악해야 함.
      // final int number = allElement[allElement.length - 2];
      // final zone = getNumberZone(number);
      // List<int> zoneData = game['$zone'];
      // zoneData.removeLast();
      allElement.removeLast();

      await doc.update({
        allElementPath: allElement,
      });
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
    }
  }
}
