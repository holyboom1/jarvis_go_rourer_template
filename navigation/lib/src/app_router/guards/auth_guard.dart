import 'package:flutter/material.dart';

import '../../../navigation.dart';

class AuthGuard {
  final AuthService authService;

  AuthGuard(this.authService);

  Future<String?> handleRedirect(BuildContext context, GoRouterState state) async {
    if (!authService.isAuthenticated) {
      return '/signin';
    } else {
      return null;
    }
  }
}
