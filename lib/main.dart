import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:action/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
