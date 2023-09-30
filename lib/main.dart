import 'package:action/isar/models/pin.dart';
import 'package:action/isar/models/recent_search.dart';
import 'package:action/isar/models/search_item.dart';
import 'package:action/shared/providers/isar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:action/app.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  final db = await loadDb();

  runApp(
    ProviderScope(
      overrides: [
        dbProvider.overrideWithValue(db),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        path: 'assets/i18n',
        fallbackLocale: const Locale('en', 'US'),
        child: App(),
      ),
    ),
  );
}

Future<Isar> loadDb() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      PinSchema,
      SearchItemSchema,
      RecentSearchSchema,
    ],
    directory: dir.path,
  );

  return isar;
}
