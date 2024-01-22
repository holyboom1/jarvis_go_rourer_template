import 'package:easy_localization/src/localization.dart';
import 'package:flutter/material.dart';

import '../../core.dart';

class TestableWidgetWithBloc<T extends StateStreamableSource<Object?>> extends StatelessWidget {
  final Widget child;
  final T bloc;

  const TestableWidgetWithBloc({
    required this.child,
    required this.bloc,
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
        home: BlocProvider<T>(
          create: (BuildContext context) => bloc,
          child: Overlay(
            initialEntries: <OverlayEntry>[
              OverlayEntry(
                builder: (BuildContext context) => Scaffold(
                  body: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

