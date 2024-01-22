import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  factory AppColors.ofGlobalContext() {
    final BuildContext? context = appLocator<AppRouter>().navigatorKey.currentContext;
    if (context == null) {
      return const DarkColors();
    }
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }
  //MAIN COLOR SCHEME
  Color get template;
}

class DarkColors implements AppColors {
  const DarkColors();

  @override
  Color get template => Colors.red;
}

class LightColors extends DarkColors {
  const LightColors();
}
