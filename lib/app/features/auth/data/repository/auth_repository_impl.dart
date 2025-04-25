import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_local_data_source.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(
      {required AuthRemoteDataSource authRemoteDataSource, required AuthLocalDataSource authLocalDataSource})
      : _authRemoteDataSource = authRemoteDataSource,
        _authLocalDataSource = authLocalDataSource;

  @override
  Future<String> signInWithGoogle() {
    try {
      return _authRemoteDataSource.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> signOut() {
    try {
      return _authLocalDataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool checkAuthState() {
    return _authLocalDataSource.getAuthState();
  }
}
