import 'package:action/shared/models/tv_show.dart';
import 'package:action/shared/providers/tmdb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_show.provider.g.dart';

@riverpod
Future<TvShow> tvShowDetails(TvShowDetailsRef ref, int id) async {
  final tmdb = ref.read(tmdbApiProvider);
  final response =
      await tmdb.v3.tv.getDetails(id, appendToResponse: 'aggregate_credits');
  return TvShow.fromJson(response as Map<String, dynamic>);
}
