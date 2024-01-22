import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class RouterLogger extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    AppLogger.info(
      'RouterLogger: didPush: ${route.settings.name}, '
      'path: [${route.data?.parent?.path}] [${route.data?.path}]',
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    AppLogger.info('RouterLogger: didPop: ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    AppLogger.info('RouterLogger: didRemove: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    AppLogger.info('RouterLogger: didReplace: ${newRoute?.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    AppLogger.info('RouterLogger: didInitTabRoute: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    AppLogger.info('RouterLogger: didChangeTabRoute: ${route.name}');
  }
}
