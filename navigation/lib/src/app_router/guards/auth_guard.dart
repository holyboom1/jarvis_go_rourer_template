import 'package:flutter/material.dart';

import '../../../navigation.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthService authService;

  AuthGuard(this.authService);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next();

    // if (!authService.isAuthenticated) {
    //   router.pushAndPopUntil(
    //     const SignInRoute(),
    //     predicate: (Route r) => true,
    //   );
    // } else {
    //   resolver.next();
    // }
  }
}
