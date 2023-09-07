import 'package:action/models/search.dart';

enum SearchViewState {
  idle,
  searching,
  error,
  results,
}

class SearchState {
  final SearchViewState viewState;
  final String? query;
  final SearchQuery? searchQuery;
  final List<Result>? results;
  final bool loadingMore;

  SearchState({
    required this.viewState,
    required this.query,
    required this.searchQuery,
    required this.results,
    required this.loadingMore,
  });

  SearchState copyWith({
    SearchViewState? viewState,
    String? query,
    SearchQuery? searchQuery,
    List<Result>? results,
    bool? loadingMore,
  }) {
    return SearchState(
      viewState: viewState ?? this.viewState,
      query: query ?? this.query,
      searchQuery: searchQuery ?? this.searchQuery,
      results: results ?? this.results,
      loadingMore: loadingMore ?? this.loadingMore,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchState &&
          runtimeType == other.runtimeType &&
          viewState == other.viewState &&
          query == other.query &&
          searchQuery == other.searchQuery &&
          results == other.results &&
          loadingMore == other.loadingMore;

  @override
  int get hashCode =>
      viewState.hashCode ^
      query.hashCode ^
      searchQuery.hashCode ^
      results.hashCode ^
      loadingMore.hashCode;
}
