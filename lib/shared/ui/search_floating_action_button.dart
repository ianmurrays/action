import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SearchFloatingActionButton extends StatelessWidget {
  const SearchFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        AutoRouter.of(context).push(const SearchRoute());
      },
      child: const Icon(Icons.search),
    );
  }
}
