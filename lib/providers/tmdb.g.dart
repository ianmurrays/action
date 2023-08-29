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
String _$popularMoviesHash() => r'8f5c1c4604dcb6fc31373ee8ea823b1f36ca840f';

/// See also [popularMovies].
@ProviderFor(popularMovies)
final popularMoviesProvider = AutoDisposeFutureProvider<List<Movie>>.internal(
  popularMovies,
  name: r'popularMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PopularMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$upcomingMoviesHash() => r'aa72ba9ad18fff664e0526f0a1c87601f0169dc1';

/// See also [upcomingMovies].
@ProviderFor(upcomingMovies)
final upcomingMoviesProvider = AutoDisposeFutureProvider<List<Movie>>.internal(
  upcomingMovies,
  name: r'upcomingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upcomingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpcomingMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$popularTvShowsHash() => r'1e5fe6ce8b335524d5543eeb065e4146550d84de';

/// See also [popularTvShows].
@ProviderFor(popularTvShows)
final popularTvShowsProvider = AutoDisposeFutureProvider<List<TvShow>>.internal(
  popularTvShows,
  name: r'popularTvShowsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularTvShowsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PopularTvShowsRef = AutoDisposeFutureProviderRef<List<TvShow>>;
String _$topRatedTvShowsHash() => r'5e32bd15d4d0812a12a4c2f787caea02ec39a8b5';

/// See also [topRatedTvShows].
@ProviderFor(topRatedTvShows)
final topRatedTvShowsProvider =
    AutoDisposeFutureProvider<List<TvShow>>.internal(
  topRatedTvShows,
  name: r'topRatedTvShowsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$topRatedTvShowsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TopRatedTvShowsRef = AutoDisposeFutureProviderRef<List<TvShow>>;
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
