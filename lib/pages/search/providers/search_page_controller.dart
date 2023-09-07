import 'package:action/models/search.dart';
import 'package:action/pages/search/models/search_state.dart';
import 'package:action/providers/tmdb.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_page_controller.g.dart';

@riverpod
class SearchPageController extends _$SearchPageController {
  @override
  SearchState build() {
    return SearchState(
      viewState: SearchViewState.idle,
      query: null,
      searchQuery: null,
      results: null,
      loadingMore: false,
    );
  }

  void search(String query, {int page = 1}) async {
    debugPrint('Searching: $query, page: $page');

    state = state.copyWith(
      query: query,
      viewState: page > 1 ? SearchViewState.results : SearchViewState.searching,
      loadingMore: page > 1,
    );

    // FIXME: what if this fails?
    final response =
        await ref.read(tmdbApiProvider).v3.search.queryMulti(query, page: page);

    final searchQuery = SearchQuery.fromJson(response as Map<String, dynamic>);
    final results =
        page == 1 ? searchQuery.results : state.results! + searchQuery.results!;

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

  void reset() {
    state = state.copyWith(
      viewState: SearchViewState.idle,
      searchQuery: null,
      results: null,
      loadingMore: false,
    );
  }
}
