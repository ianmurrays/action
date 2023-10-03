// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_taps.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchRecentTapsHash() => r'062e66e6abb54e3567273c3d90aa34a1123c1741';

/// See also [watchRecentTaps].
@ProviderFor(watchRecentTaps)
final watchRecentTapsProvider =
    AutoDisposeStreamProvider<List<RecentSearch>>.internal(
  watchRecentTaps,
  name: r'watchRecentTapsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchRecentTapsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchRecentTapsRef = AutoDisposeStreamProviderRef<List<RecentSearch>>;
String _$recentTapsHash() => r'7a51ecf389c498b01b120ea5e2000e7c9fbefa65';

/// See also [RecentTaps].
@ProviderFor(RecentTaps)
final recentTapsProvider =
    AutoDisposeNotifierProvider<RecentTaps, void>.internal(
  RecentTaps.new,
  name: r'recentTapsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recentTapsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentTaps = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
