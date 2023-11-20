import 'package:action/shared/providers/settings.provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LongPressBackButton extends HookConsumerWidget {
  const LongPressBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fastHome = ref.watch(fastHomeProvider);

    return InkWell(
      customBorder: const CircleBorder(),
      child: const InkWell(child: Icon(Icons.arrow_back_ios)),
      onTap: () {
        AutoRouter.of(context).pop();
      },
      onLongPress: () {
        if (fastHome.valueOrNull == true) {
          HapticFeedback.heavyImpact();

          AutoRouter.of(context).popUntilRoot();
        } else {
          AutoRouter.of(context).pop();
        }
      },
    );
  }
}
