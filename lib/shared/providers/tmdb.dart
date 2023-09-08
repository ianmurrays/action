import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_api/tmdb_api.dart';

part 'tmdb.g.dart';

@riverpod
TMDB tmdbApi(TmdbApiRef ref) {
  return TMDB(
    ApiKeys(
      const String.fromEnvironment('TMDB_KEY'),
      'apiReadAccessTokenv4',
    ),
  );
}
