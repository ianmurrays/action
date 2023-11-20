import 'package:isar/isar.dart';
import 'package:action/isar/models/search_item.dart';
import 'package:action/shared/providers/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_items.provider.g.dart';

@riverpod
class SearchItemsService extends _$SearchItemsService {
  late Isar _db;

  @override
  void build() {
    _db = ref.watch(dbProvider);

    return;
  }

  Stream<List<SearchItem>> watchSearchItems() {
    return _db.searchItems
        .where()
        .sortByCreatedAtDesc()
        .limit(5)
        .watch(fireImmediately: true);
  }

  Future<void> addSearchItem(SearchItem searchItem) async {
    final item = await _db.searchItems.getByQuery(searchItem.query);

    if (item != null) {
      return;
    }

    return await _db.writeTxn(() async {
      await _db.searchItems.put(searchItem);
      await _db.searchItems.where().sortByCreatedAtDesc().offset(5).deleteAll();
    });
  }

  Future<void> removeSearchItem(SearchItem searchItem) async {
    return await _db.writeTxn(() async {
      await _db.searchItems.delete(searchItem.id);
    });
  }
}

@riverpod
Stream<List<SearchItem>> watchSearchItems(WatchSearchItemsRef ref) {
  return ref.read(searchItemsServiceProvider.notifier).watchSearchItems();
}
