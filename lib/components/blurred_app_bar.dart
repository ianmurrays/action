import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlurredAppBar({super.key, this.title = "Action!", this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background.withAlpha(200),
      title: Text(title),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
