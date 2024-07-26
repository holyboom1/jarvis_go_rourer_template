import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/splash_bloc.dart';
import 'splash_form.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (BuildContext context) => SplashBloc(
        appRouter: appLocator<AppRouter>(),
      ),
      child: SplashForm(),
    );
  }
}
