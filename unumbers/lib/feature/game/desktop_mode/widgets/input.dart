import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/model/game_model.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/firestore_share.dart';
import 'package:unumbers/feature/utils/functions.dart';

class DesktopInput extends ConsumerStatefulWidget {
  const DesktopInput({
    super.key,
    required this.gameName,
    required this.currentSelectUser,
    required this.streamData,
  });
  final StreamData streamData;
  final GameName gameName;
  final String? currentSelectUser;

  @override
  ConsumerState<DesktopInput> createState() => _DesktopInputState();
}

class _DesktopInputState extends ConsumerState<DesktopInput> {
  late FocusNode _textFieldFocusNode;
  late FocusNode _keyboardFocusNode;
  late TextEditingController _controller;
  late String username;

  @override
  void initState() {
    super.initState();
    _textFieldFocusNode = FocusNode();
    _keyboardFocusNode = FocusNode();
    _controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      username = ref.watch(loginInfoProvider).username;
      _updateFocus();
    });
  }

  @override
  void didUpdateWidget(covariant DesktopInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentSelectUser != widget.currentSelectUser) {
      _updateFocus();
    }
  }

  void _updateFocus() {
    if (widget.currentSelectUser == username) {
      if (!_textFieldFocusNode.hasFocus) {
        _textFieldFocusNode.requestFocus();
      }
    } else {
      if (_textFieldFocusNode.hasFocus) {
        _textFieldFocusNode.unfocus();
      }
    }
  }

  Future<void> _handleKey(KeyEvent event) async {
    if (!_textFieldFocusNode.hasFocus) return;

    if (event is KeyDownEvent) {
      final key = event.logicalKey;
      GameModel gameModel = widget.streamData.games[widget.gameName]!;
      if (key == LogicalKeyboardKey.enter || key == LogicalKeyboardKey.arrowRight) {
        ref.read(loadingProvider.notifier).state = true;
        try {
          final inputText = _controller.text;
          final number = int.tryParse(inputText);
          List<int> inputList = [];
          inputList = parseInput(inputText);
          final firestore = FireStoreConstants();
          if (inputList.isNotEmpty && inputList.length >= 2) {
            await firestore.insertNumberList(gameName: widget.gameName, gameModel: gameModel, number: inputList);
          } else {
            if (number != null && number >= 0 && number <= 36) {
              try {
                await firestore.insertNumber(
                  gameModel: gameModel,
                  gameName: widget.gameName,
                  number: number,
                );
              } catch (e, st) {
                log(e.toString());
                log(st.toString());
              }
            }
          }
          _controller.clear();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('0~36의 숫자만 입력할 수 있습니다.')));
        }
        ref.read(loadingProvider.notifier).state = false;
      } else if (key == LogicalKeyboardKey.delete) {
        ref.read(loadingProvider.notifier).state = true;
        await FireStoreConstants().deleteNumber(
          gameModel: gameModel,
          gameName: widget.gameName,
        );
        ref.read(loadingProvider.notifier).state = false;
      }
    }
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    _keyboardFocusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _keyboardFocusNode,
      onKeyEvent: _handleKey,
      child: TextField(
        style: TextStyle(
          fontSize: 12,
        ),
        maxLength: 900,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onTap: () async {
          if (widget.currentSelectUser != username) {
            ref.read(loadingProvider.notifier).state = true;
            await widget.streamData.findOtherGame(widget.gameName, username);
            await FireStoreConstants().changeActivateGame(widget.gameName, username);
            ref.read(loadingProvider.notifier).state = false;
          }
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\s]')),
        ],
        controller: _controller,
        textInputAction: TextInputAction.none,
        focusNode: _textFieldFocusNode,
        decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(4),
        ),
      ),
    );
  }
}
