// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieDetailsHash() => r'30d5e54ccc79d56f138d3fc28a2b84debe096f20';

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

typedef MovieDetailsRef = AutoDisposeFutureProviderRef<Movie>;

/// See also [movieDetails].
@ProviderFor(movieDetails)
const movieDetailsProvider = MovieDetailsFamily();

/// See also [movieDetails].
class MovieDetailsFamily extends Family<AsyncValue<Movie>> {
  /// See also [movieDetails].
  const MovieDetailsFamily();

  /// See also [movieDetails].
  MovieDetailsProvider call(
    int id,
  ) {
    return MovieDetailsProvider(
      id,
    );
  }

  @override
  MovieDetailsProvider getProviderOverride(
    covariant MovieDetailsProvider provider,
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
  String? get name => r'movieDetailsProvider';
}

/// See also [movieDetails].
class MovieDetailsProvider extends AutoDisposeFutureProvider<Movie> {
  /// See also [movieDetails].
  MovieDetailsProvider(
    this.id,
  ) : super.internal(
          (ref) => movieDetails(
            ref,
            id,
          ),
          from: movieDetailsProvider,
          name: r'movieDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieDetailsHash,
          dependencies: MovieDetailsFamily._dependencies,
          allTransitiveDependencies:
              MovieDetailsFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is MovieDetailsProvider && other.id == id;
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
