import 'package:flutter/material.dart';

class Errorview extends StatelessWidget {
  const Errorview({
    super.key,
    required this.error,
  });
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const Text('에러가 발생했습니다. 화면을 캡쳐하여 개발자에게 전송부탁드립니다.'),
            Text('에러 코드 :${error ?? '알 수 없는 오류'}'),
            const Text('이용에 불편을 드려 정말 죄송합니다. 신속히 수정할 수 있도록 하겠습니다.'),
          ],
        ),
      ),
    );
  }
}
