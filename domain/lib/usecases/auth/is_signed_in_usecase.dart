import '../../domain.dart';

class IsSignedInUseCase implements FutureUseCase<NoParams, bool> {
  final AuthRepository _authRepository;

  IsSignedInUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<bool> execute(NoParams input) {
    return _authRepository.isSignedIn();
  }
}
