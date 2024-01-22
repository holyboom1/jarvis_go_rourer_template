import '../../domain.dart';
import '../usecase.dart';

class RegistrationConfirmCodeUseCase
    implements FutureUseCase<RegistrationConfirmCodeRequest, void> {
  final AuthRepository _authRepository;

  RegistrationConfirmCodeUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(RegistrationConfirmCodeRequest input) {
    return _authRepository.registrationConfirmCode(input);
  }
}
