import 'package:isar/isar.dart';

part 'pin.g.dart';

@collection
class Pin {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  int? tmdbId;

  @enumerated
  late PinType type;

  String? title;
  String? posterPath;
  double? voteAverage;
  String? year;

  DateTime createdAt = DateTime.now();
}

enum PinType {
  movie,
  tv,
  person,
}
