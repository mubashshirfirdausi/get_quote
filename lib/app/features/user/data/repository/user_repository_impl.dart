import '../../domain/enitities/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/user_local_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _userLocalDataSource;

  UserRepositoryImpl({required UserLocalDataSource userLocalDataSource}) : _userLocalDataSource = userLocalDataSource;
  @override
  User getCurrentUser() {
    return _userLocalDataSource.getCurrentUser();
  }
}
