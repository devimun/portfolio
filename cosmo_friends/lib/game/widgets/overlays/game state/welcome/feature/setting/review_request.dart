import 'package:cosmo_friends/config/data.dart';
import 'package:cosmo_friends/game/components/components.dart';
import 'package:cosmo_friends/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewRequest extends ConsumerWidget {
  const ReviewRequest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('REVIEW', style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: borderShape,
            backgroundColor: Colors.green,
          ),
          onPressed: () async {
            sfx(null, 'tap', ref);
            await launchUrl(url);
          },
          child: Text(
            'GO',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}
