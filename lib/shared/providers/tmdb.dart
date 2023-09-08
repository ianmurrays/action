import 'package:action/shared/models/movie.dart';
import 'package:action/shared/models/person.dart';
import 'package:action/shared/models/tv_show.dart';
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

@riverpod
Future<Movie> movieDetails(MovieDetailsRef ref, int id) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response =
      await tmdb.v3.movies.getDetails(id, appendToResponse: 'credits');
  return Movie.fromJson(response as Map<String, dynamic>);
}

@riverpod
Future<Person> personDetails(PersonDetailsRef ref, int id) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response = await tmdb.v3.people.getDetails(id,
      appendToResponse: [
        'movie_credits',
        'tv_credits',
      ].join(','));

  return Person.fromJson(response as Map<String, dynamic>);
}

@riverpod
Future<TvShow> tvShowDetails(TvShowDetailsRef ref, int id) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response =
      await tmdb.v3.tv.getDetails(id, appendToResponse: 'aggregate_credits');
  return TvShow.fromJson(response as Map<String, dynamic>);
}
