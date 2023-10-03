import 'package:action/shared/providers/locale.provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_api/tmdb_api.dart';

part 'tmdb.g.dart';

const localeMappings = {
  'en_US': 'en',
  'es_US': 'es',
};

@riverpod
Future<TMDB> tmdbApi(TmdbApiRef ref) async {
  final locale = await ref.watch(currentLocaleProvider.future);

  return TMDB(
    ApiKeys(
      const String.fromEnvironment('TMDB_KEY'),
      'apiReadAccessTokenv4',
    ),
    defaultLanguage:
        localeMappings.containsKey(locale) ? localeMappings[locale]! : 'en',
  );
}
