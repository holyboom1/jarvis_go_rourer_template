import 'dart:async';

import 'package:core/core.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRouter _appRouter;

  SplashBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(SplashState()) {
    on<InitEvent>(_onInitEvent);
  }

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<SplashState> emit,
  ) async {}
}
