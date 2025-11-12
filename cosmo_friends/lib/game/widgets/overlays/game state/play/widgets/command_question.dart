import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/command_provider.dart';
import 'package:cosmo_friends/game/widgets/overlays/game%20state/play/provider/question_element_provider.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cosmo_friends/game/components/components.dart';

// Question Element 위젯 6개로 조합된 위젯
// 위젯 최초 생성시 랜덤으로 Question Element 5개를 조합함
class Questions extends StatelessWidget {
  const Questions({super.key});
  @override
  Widget build(BuildContext context) {
    List<QuestionElement> commandQuestion = List.generate(
      4,
      (index) => QuestionElement(
        index: index,
      ),
    );
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: commandKeyAreaBGC,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: commandQuestion,
      ),
    );
  }
}

// 커맨드 문제 단위 위젯
// 이 위젯 6개가 랜덤하게 조합되어 문제를 만들어냄
// CommandType을 필요로하고 해당 타입에 따라 assetName이 달라짐
// 커맨드 키가 눌렸을 때 자신과 같은 타입인지 아닌지에 따라 효과가 달라져야 함.
class QuestionElement extends ConsumerWidget {
  const QuestionElement({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(questionElementStatusManagerProvider);
    final commandType = ref.watch(commandListProvider);

    String assetName = 'assets/images/command/${commandType[index].name}.png';
    double opacity;
    switch (status[index]!) {
      case QuestionElementStatus.correct:
        opacity = 0.0;
        break;
      case QuestionElementStatus.incorrect:
        opacity = 0.5;
        break;
      case QuestionElementStatus.idle:
        opacity = 1.0;
    }

    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(
        milliseconds: 150,
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 10,
        height: MediaQuery.sizeOf(context).width / 10,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              boxShadow,
            ],
          ),
          child: Image.asset(assetName),
        ),
      ),
    );
  }
}
