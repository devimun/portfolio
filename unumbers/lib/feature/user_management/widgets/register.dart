import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/game/game_share/provider/loading_provider.dart';
import 'package:unumbers/feature/utils/style.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  late TextEditingController idController;
  late TextEditingController pwController;
  late final FirebaseFirestore firestore;

  @override
  void initState() {
    idController = TextEditingController();
    pwController = TextEditingController();
    firestore = FirebaseFirestore.instance;
    super.initState();
  }

  void clearTextControlloer() {
    idController.clear();
    pwController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the parent widget's width and height
        double parentWidth = constraints.maxWidth;
        double parentHeight = constraints.maxHeight;

        // Define responsive width and height for the TextFields and Button
        double textFieldWidth = parentWidth * 0.7; // 80% of the parent width
        double textFieldHeight = parentHeight * 0.1; // 8% of the parent height
        double buttonWidth = parentWidth * 0.25; // 40% of the parent width
        double buttonHeight = parentHeight * 0.1; // 6% of the parent height

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: textFieldWidth,
                height: textFieldHeight,
                child: TextField(
                  style: WebStyle.twoSubTS,
                  textAlign: TextAlign.center,
                  decoration: WebStyle.registerField.copyWith(hintText: '아이디'),
                  controller: idController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: textFieldWidth,
                height: textFieldHeight,
                child: TextField(
                  style: WebStyle.twoSubTS,
                  textAlign: TextAlign.center,
                  decoration: WebStyle.registerField.copyWith(hintText: '비밀번호'),
                  controller: pwController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: FloatingActionButton(
                  onPressed: () async {
                    String id = idController.text.trim();
                    String pw = pwController.text.trim();
                    try {
                      if (id.isNotEmpty && pw.isNotEmpty) {
                        ref.read(loadingProvider.notifier).state = true;
                        await firestore.collection('users').doc(id).set(
                          {'pwd': pw},
                        );
                        ref.read(loadingProvider.notifier).state = false;
                        clearTextControlloer();
                      }
                    } catch (e) {
                      log(e.toString());
                    }
                  },
                  elevation: 0,
                  foregroundColor: AppStyle.blueBtnoverlayColor,
                  backgroundColor: AppStyle.blueBtnbackgroundColor,
                  child: Text(
                    '생성하기',
                    style: WebStyle.twoSubTS,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
