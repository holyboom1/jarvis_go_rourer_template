part of '../dio_config.dart';

class RequestInterceptor extends Interceptor {
  final Dio dio;
  RequestInterceptor(this.dio);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final AuthDataEntity? authData = appLocator<AuthHiveProvider>().getAuthData();
    if (authData != null) {
      options.headers['Authorization'] = 'Bearer ${authData.accessToken}';
    }
    return handler.next(options);
  }
}
