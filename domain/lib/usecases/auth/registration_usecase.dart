import '../../domain.dart';
import '../usecase.dart';

class RegistrationUseCase implements FutureUseCase<String, void> {
  final AuthRepository _authRepository;

  RegistrationUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(String email) {
    return _authRepository.registration(email);
  }
}
