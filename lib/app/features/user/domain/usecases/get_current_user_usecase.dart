import '../../../../common/usecase/usecase.dart';
import '../enitities/user_entity.dart';
import '../repository/user_repository.dart';

class GetCurrentUserUsecase implements Usecase<User> {
  final UserRepository _userRepository;

  GetCurrentUserUsecase({required UserRepository userRepository}) : _userRepository = userRepository;
  @override
  User execute() {
    return _userRepository.getCurrentUser();
  }
}
