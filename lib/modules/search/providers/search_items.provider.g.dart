// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_items.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchSearchItemsHash() => r'4f4d3e5849fdb026815cf8762bd330cdb12b1a30';

/// See also [watchSearchItems].
@ProviderFor(watchSearchItems)
final watchSearchItemsProvider =
    AutoDisposeStreamProvider<List<SearchItem>>.internal(
  watchSearchItems,
  name: r'watchSearchItemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchSearchItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchSearchItemsRef = AutoDisposeStreamProviderRef<List<SearchItem>>;
String _$searchItemsServiceHash() =>
    r'b4e94f9d54c8e712f448b3e7f1f86ff56dcf4d3b';

/// See also [SearchItemsService].
@ProviderFor(SearchItemsService)
final searchItemsServiceProvider =
    AutoDisposeNotifierProvider<SearchItemsService, void>.internal(
  SearchItemsService.new,
  name: r'searchItemsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchItemsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchItemsService = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
