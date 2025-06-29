import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/functions.dart';

class FireStoreConstants {
  static final doc = FirebaseFirestore.instance.collection('games').doc('game');
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
      '1': <int>[],
      '2': <int>[],
      '3': <int>[],
      '4': <int>[],
      '5': <int>[],
      '6': <int>[],
      '7': <int>[],
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

  Future<void> insertNumberList({
    required GameName gameName,
    required GameModel gameModel,
    required List<int> number,
  }) async {
    try {
      await playSound();
      Map<String, dynamic> newGameModel = gameModel.toJson();
      List<int> allElement = newGameModel['allElement'];
      for (int i in number) {
        if (allElement.isEmpty) {
          allElement.add(i);
          continue;
        }
        int prevNum = allElement.last;
        int zone = getNumberZone(prevNum);
        List<int> zoneData = newGameModel['$zone'];
        zoneData.add(i);
        allElement.add(i);
      }
      await doc.update(
        {
          gameName.name: newGameModel,
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> insertNumber({
    required GameName gameName,
    required GameModel gameModel,
    required int number,
  }) async {
    try {
      await playSound();
      Map<String, dynamic> newGameModel = gameModel.toJson();
      List<int> allElement = newGameModel['allElement'];
      if (allElement.isEmpty) {
        allElement.add(number);
        await doc.update({
          gameName.name: newGameModel,
        });
        return;
      }
      int prevNum = allElement.last;
      int zone = getNumberZone(prevNum);
      List<int> zoneData = newGameModel['$zone'];
      zoneData.add(number);
      allElement.add(number);
      // update 호출
      await doc.update({
        gameName.name: newGameModel,
      });
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
    try {
      final game = gameModel.toJson();
      List<int> allElement = game['allElement'];
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
      final int number = allElement[allElement.length - 2];
      final zone = getNumberZone(number);
      List<int> zoneData = game['$zone'];
      zoneData.removeLast();
      allElement.removeLast();

      await doc.update({
        '${gameName.name}.$zone': zoneData,
        allElementPath: allElement,
      });
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
    }
  }
}
