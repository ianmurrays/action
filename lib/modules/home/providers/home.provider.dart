import 'package:action/shared/models/tv_show.dart';
import 'package:action/shared/providers/tmdb.dart';
import 'package:action/shared/models/movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.provider.g.dart';

@riverpod
Future<List<Movie>> popularMovies(PopularMoviesRef ref) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response = await tmdb.v3.movies.getPopular();
  return response['results'].map<Movie>((e) => Movie.fromJson(e)).toList();
}

@riverpod
Future<List<Movie>> upcomingMovies(UpcomingMoviesRef ref) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response = await tmdb.v3.movies.getUpcoming();
  return response['results'].map<Movie>((e) => Movie.fromJson(e)).toList();
}

@riverpod
Future<List<TvShow>> popularTvShows(PopularTvShowsRef ref) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response = await tmdb.v3.tv.getPopular();
  return response['results'].map<TvShow>((e) => TvShow.fromJson(e)).toList();
}

@riverpod
Future<List<TvShow>> topRatedTvShows(TopRatedTvShowsRef ref) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response = await tmdb.v3.tv.getTopRated();
  return response['results'].map<TvShow>((e) => TvShow.fromJson(e)).toList();
}
