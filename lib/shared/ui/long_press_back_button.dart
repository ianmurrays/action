import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LongPressBackButton extends StatelessWidget {
  const LongPressBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      child: const InkWell(child: Icon(Icons.arrow_back_ios)),
      onTap: () {
        AutoRouter.of(context).pop();
      },
      onLongPress: () {
        AutoRouter.of(context).popUntilRoot();
      },
    );
  }
}
