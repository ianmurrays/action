// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tmdbApiHash() => r'3ab53b0e266f2af31ea7dfcbf1ff3a73962c3f0b';

/// See also [tmdbApi].
@ProviderFor(tmdbApi)
final tmdbApiProvider = AutoDisposeProvider<TMDB>.internal(
  tmdbApi,
  name: r'tmdbApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tmdbApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TmdbApiRef = AutoDisposeProviderRef<TMDB>;
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

String _$personDetailsHash() => r'7ea5b4d2f793e67efa88180dbe2a00bb37758365';
typedef PersonDetailsRef = AutoDisposeFutureProviderRef<Person>;

/// See also [personDetails].
@ProviderFor(personDetails)
const personDetailsProvider = PersonDetailsFamily();

/// See also [personDetails].
class PersonDetailsFamily extends Family<AsyncValue<Person>> {
  /// See also [personDetails].
  const PersonDetailsFamily();

  /// See also [personDetails].
  PersonDetailsProvider call(
    int id,
  ) {
    return PersonDetailsProvider(
      id,
    );
  }

  @override
  PersonDetailsProvider getProviderOverride(
    covariant PersonDetailsProvider provider,
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
  String? get name => r'personDetailsProvider';
}

/// See also [personDetails].
class PersonDetailsProvider extends AutoDisposeFutureProvider<Person> {
  /// See also [personDetails].
  PersonDetailsProvider(
    this.id,
  ) : super.internal(
          (ref) => personDetails(
            ref,
            id,
          ),
          from: personDetailsProvider,
          name: r'personDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$personDetailsHash,
          dependencies: PersonDetailsFamily._dependencies,
          allTransitiveDependencies:
              PersonDetailsFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is PersonDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$tvShowDetailsHash() => r'c24fc916c5b5b5923715d5e8092ed9907f3df7d6';
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
