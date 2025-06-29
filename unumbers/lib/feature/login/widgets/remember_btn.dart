import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/login/provider/login_manager.dart';
import 'package:unumbers/feature/utils/style.dart';

class RememberBtn extends ConsumerWidget {
  const RememberBtn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginInfo = ref.watch(loginInfoProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              activeColor: AppStyle.blueBtnoverlayColor,
              side: const BorderSide(
                width: 0.5,
                color: Color(0xff9E9E97),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: loginInfo.isRemember,
              onChanged: (value) {
                if (value != null) {
                  ref.read(loginInfoProvider.notifier).setRemember(value);
                }
              },
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Remember me',
              style: AppStyle.inputTextStyle,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
