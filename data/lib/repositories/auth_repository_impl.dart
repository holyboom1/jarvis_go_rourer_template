import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../data.dart';
import '../providers/api/api_providers.dart';
import '../providers/local/local_providers.dart';
import '../providers/safe_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiProvider _authApiProvider;
  final AuthHiveProvider _authHiveProvider;
  final AuthService _authService;

  AuthRepositoryImpl({
    required AuthApiProvider authApiProvider,
    required AuthHiveProvider authHiveProvider,
    required AuthService authService,
  })  : _authApiProvider = authApiProvider,
        _authService = authService,
        _authHiveProvider = authHiveProvider;

  @override
  Future<void> registration(String email) async {
    final AuthDataEntity data = await safeRequest(() => _authApiProvider.registration(email));
    await _authHiveProvider.addAuthData(data);
  }

  @override
  Future<void> registrationConfirmCode(RegistrationConfirmCodeRequest request) async {
    final AuthDataEntity data = await safeRequest(() => _authApiProvider.registrationConfirmCode(
          code: request.code,
          password1: request.passwordOne,
          password2: request.passwordTwo,
          username: request.username,
        ));
    await _authHiveProvider.updateAuthData(data);
  }

  @override
  Future<void> logout() {
    _authService.isAuthenticated = false;
    return _authHiveProvider.deleteAuthData();
  }

  @override
  Future<bool> isSignedIn() async {
    if (await _authHiveProvider.isSignedIn()) {
      await goToAuthScope();
      _authService.isAuthenticated = true;
      return true;
    }
    return false;
  }

  @override
  Future<void> signIn(SignInRequest request) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
