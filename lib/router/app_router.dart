import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:action/modules/home/views/home.dart';
import 'package:action/modules/movie/views/movie_detail.dart';
import 'package:action/modules/tv_show/views/tv_show_detail.dart';
import 'package:action/modules/person/views/person.dart';
import 'package:action/modules/search/views/search.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        actionRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        actionRoute(page: MovieDetailRoute.page),
        actionRoute(page: TVShowDetailRoute.page),
        actionRoute(page: PersonRoute.page),
        actionRoute(page: SearchRoute.page),
      ];
}

CustomRoute actionRoute({required PageInfo page, bool initial = false}) {
  return CustomRoute(
    page: page,
    customRouteBuilder: materialWithModalsPageRoute,
    initial: initial,
  );
}

Route<T> materialWithModalsPageRoute<T>(
    BuildContext context, Widget child, Page<T> page) {
  return MaterialWithModalsPageRoute<T>(
    builder: (context) => child,
    settings: page,
  );
}
