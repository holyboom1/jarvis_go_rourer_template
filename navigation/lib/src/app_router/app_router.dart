import 'package:core/core.dart';

import 'guards/auth_guard.dart';
import 'services/route_logger.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Form|Screen|Step,Route',
  modules: <Type>[],
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  RouterLogger get logger => RouterLogger();

  @override
  final List<AutoRoute> routes = <AutoRoute>[
    // AutoRoute(
    //   page: MainRoute.page,
    //   guards: <AutoRouteGuard>[
    //     AuthGuard(appLocator<AuthService>()),
    //   ],
    //   children: <AutoRoute>[],
    // ),
  ];
}
