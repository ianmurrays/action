import 'package:auto_route/auto_route.dart';

import 'package:action/modules/home/views/home.dart';
import 'package:action/modules/movie/views/movie_detail.dart';
import 'package:action/modules/tv_show/views/tv_show_detail.dart';
import 'package:action/modules/person/views/person.dart';
import 'package:action/modules/search/views/search.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: MovieDetailRoute.page),
        AutoRoute(page: TVShowDetailRoute.page),
        AutoRoute(page: PersonRoute.page),
        AutoRoute(page: SearchRoute.page),
      ];
}
