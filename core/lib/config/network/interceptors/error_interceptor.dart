part of '../dio_config.dart';

class ErrorInterceptor extends Interceptor {
  final Dio dio;

  ErrorInterceptor(this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    switch (err.type) {
      case DioExceptionType.cancel:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case HttpStatus.badRequest:
            break;
          case HttpStatus.notFound:
            break;
          case HttpStatus.internalServerError:
            break;
        }
        break;
      case DioExceptionType.connectionError:
        // TODO(Kemal): Handle connectionError case
        break;
      case DioExceptionType.badCertificate:
        // TODO(Kemal): Handle badCertificate case
        break;
      case DioExceptionType.unknown:
        // TODO(Kemal): Handle unknown case
        break;
    }

    if (err.response?.statusCode != HttpStatus.unauthorized) {
      return handler.next(err);
    }
    final Response<dynamic> response =
        err.response ?? Response<dynamic>(requestOptions: err.requestOptions);
    return handler.resolve(response);
  }

  Future<void> handle401Error(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (appLocator<AuthHiveProvider>().getAuthData()?.refreshToken == null) {
      await appLocator<LogoutUseCase>().execute(const NoParams());
      return handler.resolve(error.response!);
    }
    if (appLocator<AuthHiveProvider>().getAuthData() != null) {
      if (JwtDecoder.isExpired(appLocator<AuthHiveProvider>().getAuthData()!.refreshToken)) {
        await appLocator<LogoutUseCase>().execute(const NoParams());
        return handler.resolve(error.response!);
      }
    }

    if (error.response != null && (error.response?.statusCode == 401)) {
      try {
        final AuthDataEntity? oldToken = appLocator<AuthHiveProvider>().getAuthData();

        final AuthDataEntity token =
            await appLocator<AuthApiProvider>().refreshToken(oldToken?.refreshToken ?? '');

        await appLocator<AuthHiveProvider>().updateAuthData(token);

        final RequestOptions requestOptions = error.response!.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer ${token.accessToken}';
        final Response response = await dio.request<dynamic>(
          requestOptions.path,
          cancelToken: requestOptions.cancelToken,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
        );
        return handler.resolve(response);
      } catch (_) {
        await appLocator<LogoutUseCase>().execute(const NoParams());
        return handler.next(error);
      }
    } else {
      await appLocator<LogoutUseCase>().execute(const NoParams());
      return handler.resolve(error.response!);
    }
  }
}
