import 'package:action/isar/models/search_item.dart';
import 'package:action/modules/search/providers/search_items.provider.dart';
import 'package:action/shared/models/search.dart';
import 'package:action/modules/search/models/search_state.dart';
import 'package:action/shared/providers/isar.dart';
import 'package:action/shared/providers/tmdb.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_page_controller.g.dart';

@riverpod
class SearchPageController extends _$SearchPageController {
  late Isar _db;

  @override
  SearchState build() {
    _db = ref.watch(dbProvider);

    return SearchState(
      viewState: SearchViewState.idle,
      query: null,
      searchQuery: null,
      results: null,
      loadingMore: false,
    );
  }

  void search(String query, {int page = 1}) async {
    if (query.isEmpty) {
      return;
    }

    debugPrint('Searching: $query, page: $page');

    state = state.copyWith(
      query: query,
      viewState: page > 1 ? SearchViewState.results : SearchViewState.searching,
      loadingMore: page > 1,
    );

    // FIXME: what if this fails?
    final tmdb = await ref.read(tmdbApiProvider.future);
    final response = await tmdb.v3.search.queryMulti(query, page: page);

    final searchQuery = SearchQuery.fromJson(response as Map<String, dynamic>);
    final results =
        page == 1 ? searchQuery.results : state.results! + searchQuery.results!;

    // store this search query
    await ref.read(searchItemsServiceProvider.notifier).addSearchItem(
          SearchItem()..query = query,
        );

    state = state.copyWith(
      viewState: SearchViewState.results,
      searchQuery: searchQuery,
      results: results,
      loadingMore: false,
    );
  }

  void searchMore() {
    debugPrint('Searching More');

    if (state.searchQuery!.page! < state.searchQuery!.totalPages!) {
      search(state.query!, page: state.searchQuery!.page! + 1);
    }
  }

  Stream<List<SearchItem>> watchLatestSearches() async* {
    final query = _db.searchItems.where().sortByCreatedAtDesc().limit(5);

    yield* query.watch(fireImmediately: true);
  }

  void reset() {
    state = state.copyWith(
      viewState: SearchViewState.idle,
      searchQuery: null,
      results: null,
      loadingMore: false,
    );
  }
}
