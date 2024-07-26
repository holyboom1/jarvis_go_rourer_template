import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/splash_bloc.dart';

class SplashForm extends StatefulWidget {
  @override
  State<SplashForm> createState() => _SplashFormState();
}

class _SplashFormState extends State<SplashForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (BuildContext context, SplashState state) {
          return SizedBox(
            height: ScreenUtil().screenHeight,
            child: Placeholder(),
          );
        },
      ),
    );
  }
}
