import 'package:action/shared/models/movie.dart';
import 'package:action/shared/providers/tmdb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie.provider.g.dart';

@riverpod
Future<Movie> movieDetails(MovieDetailsRef ref, int id) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response =
      await tmdb.v3.movies.getDetails(id, appendToResponse: 'credits');
  return Movie.fromJson(response as Map<String, dynamic>);
}
