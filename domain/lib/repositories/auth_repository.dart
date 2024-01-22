import '../domain.dart';

abstract class AuthRepository {
  Future<void> registration(String email);

  Future<void> registrationConfirmCode(RegistrationConfirmCodeRequest request);

  Future<void> logout();

  Future<bool> isSignedIn();

  Future<void> signIn(SignInRequest request);
}
