// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tvShowDetailsHash() => r'c24fc916c5b5b5923715d5e8092ed9907f3df7d6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef TvShowDetailsRef = AutoDisposeFutureProviderRef<TvShow>;

/// See also [tvShowDetails].
@ProviderFor(tvShowDetails)
const tvShowDetailsProvider = TvShowDetailsFamily();

/// See also [tvShowDetails].
class TvShowDetailsFamily extends Family<AsyncValue<TvShow>> {
  /// See also [tvShowDetails].
  const TvShowDetailsFamily();

  /// See also [tvShowDetails].
  TvShowDetailsProvider call(
    int id,
  ) {
    return TvShowDetailsProvider(
      id,
    );
  }

  @override
  TvShowDetailsProvider getProviderOverride(
    covariant TvShowDetailsProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tvShowDetailsProvider';
}

/// See also [tvShowDetails].
class TvShowDetailsProvider extends AutoDisposeFutureProvider<TvShow> {
  /// See also [tvShowDetails].
  TvShowDetailsProvider(
    this.id,
  ) : super.internal(
          (ref) => tvShowDetails(
            ref,
            id,
          ),
          from: tvShowDetailsProvider,
          name: r'tvShowDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tvShowDetailsHash,
          dependencies: TvShowDetailsFamily._dependencies,
          allTransitiveDependencies:
              TvShowDetailsFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is TvShowDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
