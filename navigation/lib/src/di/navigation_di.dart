import 'package:core/core.dart';

void setupNavigationDependencies() {
  appLocator.registerSingleton<AuthService>(AuthService());

  appLocator.registerSingleton<AppRouter>(AppRouter());
}
