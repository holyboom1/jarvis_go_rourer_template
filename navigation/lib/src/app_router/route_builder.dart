import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RouteBuilder {
  static Route<T> withoutAnimation<T>(
    _,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      pageBuilder: (_, __, ___) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  static Route<T> dialog<T>(
    _,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      barrierColor: Colors.black26,
      opaque: false,
      fullscreenDialog: true,
      pageBuilder: (_, __, ___) => child,
    );
  }

  static Route<T> modalDialog<T>(
    BuildContext _,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      barrierColor: Colors.black26,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ),
          ),
          child: child,
        );
      },
      opaque: false,
      fullscreenDialog: true,
      barrierDismissible: true,
      pageBuilder: (_, __, ___) => child,
    );
  }
}
