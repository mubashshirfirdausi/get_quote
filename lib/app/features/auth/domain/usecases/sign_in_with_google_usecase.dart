import '../../../../common/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class SignInwithGoogleUsecase implements Usecase<Future<String>> {
  final AuthRepository _authRepository;

  SignInwithGoogleUsecase({required AuthRepository authRepository}) : _authRepository = authRepository;
  @override
  Future<String> execute() {
    try {
      return _authRepository.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }
}
