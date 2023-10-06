import 'package:action/isar/models/recent_search.dart';
import 'package:action/shared/providers/isar.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_taps.provider.g.dart';

@riverpod
class RecentTaps extends _$RecentTaps {
  late Isar _db;

  @override
  void build() {
    _db = ref.watch(dbProvider);

    return;
  }

  Stream<List<RecentSearch>> watchRecentTaps() {
    return _db.recentSearches
        .where()
        .sortByCreatedAtDesc()
        .limit(6)
        .watch(fireImmediately: true);
  }

  Future<void> addRecentTap(RecentSearch recentSearch) async {
    final item = await _db.recentSearches.getByTmdbId(recentSearch.tmdbId);

    if (item != null) {
      return;
    }

    return await _db.writeTxn(() async {
      await _db.recentSearches.put(recentSearch);
      await _db.recentSearches
          .where()
          .sortByCreatedAtDesc()
          .offset(6)
          .deleteAll();
    });
  }

  Future<void> removeRecentTap(RecentSearch recentSearch) async {
    return await _db.writeTxn(() async {
      await _db.recentSearches.delete(recentSearch.id);
    });
  }
}

@riverpod
Stream<List<RecentSearch>> watchRecentTaps(WatchRecentTapsRef ref) {
  return ref.read(recentTapsProvider.notifier).watchRecentTaps();
}
