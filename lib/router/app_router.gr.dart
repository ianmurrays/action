// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MovieDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieDetailPage(movieId: args.movieId),
      );
    },
    PersonRoute.name: (routeData) {
      final args = routeData.argsAs<PersonRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonPage(personId: args.personId),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchPage(),
      );
    },
    TVShowDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TVShowDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TVShowDetailPage(tvShowId: args.tvShowId),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailPage]
class MovieDetailRoute extends PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    required int movieId,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(movieId: movieId),
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static const PageInfo<MovieDetailRouteArgs> page =
      PageInfo<MovieDetailRouteArgs>(name);
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({required this.movieId});

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{movieId: $movieId}';
  }
}

/// generated route for
/// [PersonPage]
class PersonRoute extends PageRouteInfo<PersonRouteArgs> {
  PersonRoute({
    required int personId,
    List<PageRouteInfo>? children,
  }) : super(
          PersonRoute.name,
          args: PersonRouteArgs(personId: personId),
          initialChildren: children,
        );

  static const String name = 'PersonRoute';

  static const PageInfo<PersonRouteArgs> page = PageInfo<PersonRouteArgs>(name);
}

class PersonRouteArgs {
  const PersonRouteArgs({required this.personId});

  final int personId;

  @override
  String toString() {
    return 'PersonRouteArgs{personId: $personId}';
  }
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TVShowDetailPage]
class TVShowDetailRoute extends PageRouteInfo<TVShowDetailRouteArgs> {
  TVShowDetailRoute({
    required int tvShowId,
    List<PageRouteInfo>? children,
  }) : super(
          TVShowDetailRoute.name,
          args: TVShowDetailRouteArgs(tvShowId: tvShowId),
          initialChildren: children,
        );

  static const String name = 'TVShowDetailRoute';

  static const PageInfo<TVShowDetailRouteArgs> page =
      PageInfo<TVShowDetailRouteArgs>(name);
}

class TVShowDetailRouteArgs {
  const TVShowDetailRouteArgs({required this.tvShowId});

  final int tvShowId;

  @override
  String toString() {
    return 'TVShowDetailRouteArgs{tvShowId: $tvShowId}';
  }
}
