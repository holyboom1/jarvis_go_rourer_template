import 'package:core/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../entities/entities.dart';

part 'auth_api_provider.g.dart';

@RestApi()
abstract class AuthApiProvider {
  factory AuthApiProvider(Dio dio, {String baseUrl}) = _AuthApiProvider;

  @POST(ApiConstants.registration)
  @FormUrlEncoded()
  Future<AuthDataEntity> registration(
    @Field() String email,
  );

  @POST('${ApiConstants.registrationConfirmCode}{code}')
  @FormUrlEncoded()
  Future<AuthDataEntity> registrationConfirmCode({
    @Path() required String code,
    @Field() required String password1,
    @Field() required String password2,
    @Field() required String username,
  });

  @POST(ApiConstants.refreshToken)
  @FormUrlEncoded()
  Future<AuthDataEntity> refreshToken(
    @Field() String refresh,
  );
}
