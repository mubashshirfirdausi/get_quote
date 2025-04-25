import '../../../../common/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignOutUsecase implements Usecase<Future<bool>> {
  final AuthRepository _authRepository;

  SignOutUsecase({required AuthRepository authRepository}) : _authRepository = authRepository;
  @override
  Future<bool> execute() {
    try {
      return _authRepository.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
