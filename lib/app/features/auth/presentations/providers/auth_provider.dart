import '../../../../common/providers/loading_provider.dart';
import '../../domain/usecases/check_auth_state_usecase.dart';
import '../../domain/usecases/sign_in_with_google_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';

class AuthProvider extends LoadingProvider {
  final SignInwithGoogleUsecase _signInwithGoogleUsecase;
  final SignOutUsecase _signOutUsecase;
  final CheckAuthStateUseCase _checkAuthStateUsecase;

  AuthProvider(
      {required SignInwithGoogleUsecase signInwithGoogleUsecase,
      required SignOutUsecase signOutUsecase,
      required CheckAuthStateUseCase checkAuthStateUseCase})
      : _signInwithGoogleUsecase = signInwithGoogleUsecase,
        _signOutUsecase = signOutUsecase,
        _checkAuthStateUsecase = checkAuthStateUseCase;

  bool _authenticated = false;
  bool get isAuthenticated => _authenticated;

  void checkAuthState() {
    _authenticated = _checkAuthStateUsecase.execute();
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    try {
      setLoading(true);
      await _signInwithGoogleUsecase.execute();
      _authenticated = true;
    } catch (e) {
      _authenticated = false;
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<void> signOut() async {
    try {
      setLoading(true);
      await _signOutUsecase.execute();
      _authenticated = false;
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
