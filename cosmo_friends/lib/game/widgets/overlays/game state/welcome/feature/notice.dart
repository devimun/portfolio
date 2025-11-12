import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeWidget extends StatelessWidget {
  const NoticeWidget({
    super.key,
    required this.modalType,
  });
  final ModalType modalType;
  final String resetTitle = 'RESET';
  final String cloudTitle = 'CLOUD CONNECT';
  final String resetContent =
      'When you reset your account,\nall data stored in the app and on the cloud will be cleared, and the app will restart.';
  final String cloudContent =
      'If you’ve previously connected to the cloud, your most recent cloud-stored data will be used.\nIf this is your first time connecting, your current data will be uploaded to the cloud and used from there.';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.35,
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Column(
        children: [
          Text(
            modalType == ModalType.reset ? resetTitle : cloudTitle,
            style: theme.displayMedium,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Center(
              child: Text(
                modalType == ModalType.reset ? resetContent : cloudContent,
                style: theme.displaySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> showModal(
    BuildContext context, ModalType modalType, WidgetRef ref) async {
  final theme = Theme.of(context).textTheme;
  final result = await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'NOTICE',
            style: theme.displayLarge!.copyWith(color: Colors.red),
          ),
        ),
        content: NoticeWidget(
          modalType: modalType,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              shape: borderShape,
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              sfx(null, 'tap', ref);
              Navigator.of(context).pop(true);
            },
            child: Text(
              'YES',
              style: theme.displaySmall,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: borderShape,
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              sfx(null, 'tap', ref);
              Navigator.of(context).pop(false);
            },
            child: Text(
              'NO',
              style: theme.displaySmall,
            ),
          ),
        ],
      );
    },
  );
  return result;
}
