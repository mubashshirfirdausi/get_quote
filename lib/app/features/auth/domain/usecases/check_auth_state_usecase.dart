import '../../../../common/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class CheckAuthStateUseCase implements Usecase<bool> {
  final AuthRepository _authRepository;

  CheckAuthStateUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;
  @override
  bool execute() {
    return _authRepository.checkAuthState();
  }
}
