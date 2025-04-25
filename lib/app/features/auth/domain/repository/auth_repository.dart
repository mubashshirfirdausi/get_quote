abstract class AuthRepository {
  Future<String> signInWithGoogle();
  Future<bool> signOut();
  bool checkAuthState();
}
