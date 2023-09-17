import 'package:isar/isar.dart';

part 'search_item.g.dart';

@collection
class SearchItem {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? query;

  DateTime createdAt = DateTime.now();
}
