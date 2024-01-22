import '../../domain.dart';
import '../usecase.dart';

class LogoutUseCase implements FutureUseCase<NoParams, void> {
  final AuthRepository _authRepository;

  LogoutUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> execute(NoParams input) {
    return _authRepository.logout();
  }
}
