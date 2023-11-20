import 'package:isar/isar.dart';

part 'recent_search.g.dart';

@Collection(accessor: 'recentSearches')
class RecentSearch {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  int? tmdbId;

  @enumerated
  late SearchType type;

  String? title;
  String? posterPath;
  double? voteAverage;
  String? year;

  DateTime createdAt = DateTime.now();
}

enum SearchType {
  movie,
  tv,
  person,
}
