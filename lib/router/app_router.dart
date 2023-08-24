import 'package:auto_route/auto_route.dart';

import 'package:action/pages/home.dart';
import 'package:action/pages/detail.dart';
import 'package:action/pages/person.dart';
import 'package:action/pages/search.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: PersonRoute.page),
        AutoRoute(page: SearchRoute.page),
      ];
}