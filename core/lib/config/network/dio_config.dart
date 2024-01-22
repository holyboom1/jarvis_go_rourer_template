import 'dart:async';
import 'dart:io';

import 'package:data/data.dart';
import 'package:data/providers/api/api_providers.dart';
import 'package:data/providers/local/auth/auth_local_data_provider.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../core.dart';
import 'interceptors/dio_log_interceptor.dart';

part 'interceptors/error_interceptor.dart';
part 'interceptors/request_interceptor.dart';
part 'interceptors/response_interceptor.dart';

class DioConfig {
  final AppConfig appConfig;
  static const Duration timeout = Duration(seconds: 10);

  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioConfig({required this.appConfig}) {
    _dio
      ..options.baseUrl = appConfig.baseUrlDjango
      ..options.connectTimeout = timeout
      ..options.connectTimeout = timeout
      ..interceptors.addAll(<Interceptor>[
        RequestInterceptor(_dio),
        ErrorInterceptor(_dio),
        ResponseInterceptor(_dio),
        dioLoggerInterceptor,
      ]);
  }
}
