import 'package:easy_localization/src/localization.dart';
import 'package:flutter/material.dart';

import '../../core.dart';

class TestableWidget extends StatelessWidget {
  final Widget child;


  const TestableWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Localization.load(
      const Locale('en'),
    );

    return EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      path: 'core/translations',
      startLocale: const Locale('en'),
      child: MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalization.supportedLocales,
        home: Overlay(
          initialEntries: <OverlayEntry>[
            OverlayEntry(
              builder: (BuildContext context) => Scaffold(
                body: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}