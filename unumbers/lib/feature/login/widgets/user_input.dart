import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/utils/enum.dart';
import 'package:unumbers/feature/utils/style.dart';

class UserInput extends ConsumerStatefulWidget {
  const UserInput({super.key, required this.inputType});
  final InputType inputType;

  @override
  ConsumerState<UserInput> createState() => _UserInputState();
}

class _UserInputState extends ConsumerState<UserInput> {
  late final String inputTitle;
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    inputTitle =
        widget.inputType == InputType.username ? 'username' : 'password';
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            inputTitle,
            style: AppStyle.inputTextStyle,
          ),
        ),
        TextField(
          obscureText: widget.inputType == InputType.password,
          controller: textEditingController,
          onChanged: (value) {
            ref
                .read(loginInfoProvider.notifier)
                .setData(widget.inputType, value);
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
