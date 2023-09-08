import 'package:action/shared/models/person.dart';
import 'package:action/shared/providers/tmdb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'person.provider.g.dart';

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
