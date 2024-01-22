import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../providers/api/api_providers.dart';
import '../providers/local/local_providers.dart';
import '../repositories/repositories.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> preLoginScope() async {
    _initDio();
    await _initHive();
    _initApi();
    _initAuth();
  }

  void postLoginScope() {}

  void _initDio() {
    appLocator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: appLocator<AppConfig>(),
      ),
    );
  }

  void _initApi() {
    appLocator.registerLazySingleton<AuthApiProvider>(
      () => AuthApiProvider(
        appLocator<DioConfig>().dio,
      ),
    );
  }

  Future<void> _initHive() async {
    appLocator.registerLazySingleton<HiveProvider>(HiveProviderImpl.new);
    await appLocator<HiveProvider>().init();

    appLocator.registerLazySingleton<AuthHiveProvider>(
      () => AuthHiveProvider(
        appLocator<HiveProvider>().authDataBox,
      ),
    );
  }

  void _initAuth() {
    appLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authApiProvider: appLocator<AuthApiProvider>(),
        authHiveProvider: appLocator<AuthHiveProvider>(),
        authService: appLocator<AuthService>(),
      ),
    );

    appLocator.registerLazySingleton<RegistrationUseCase>(
      () => RegistrationUseCase(
        authRepository: appLocator<AuthRepository>(),
      ),
    );

    appLocator.registerLazySingleton<RegistrationConfirmCodeUseCase>(
      () => RegistrationConfirmCodeUseCase(
        authRepository: appLocator<AuthRepository>(),
      ),
    );

    appLocator.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(
        authRepository: appLocator<AuthRepository>(),
      ),
    );
    appLocator.registerLazySingleton<IsSignedInUseCase>(
      () => IsSignedInUseCase(
        authRepository: appLocator<AuthRepository>(),
      ),
    );
  }
}
