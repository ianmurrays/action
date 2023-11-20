// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tvShowDetailsHash() => r'f7078b5800d85c3aa346f5faeda31d65a6dade8e';

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
    int id,
  ) : this._internal(
          (ref) => tvShowDetails(
            ref as TvShowDetailsRef,
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
          id: id,
        );

  TvShowDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<TvShow> Function(TvShowDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TvShowDetailsProvider._internal(
        (ref) => create(ref as TvShowDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TvShow> createElement() {
    return _TvShowDetailsProviderElement(this);
  }

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

mixin TvShowDetailsRef on AutoDisposeFutureProviderRef<TvShow> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TvShowDetailsProviderElement
    extends AutoDisposeFutureProviderElement<TvShow> with TvShowDetailsRef {
  _TvShowDetailsProviderElement(super.provider);

  @override
  int get id => (origin as TvShowDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
