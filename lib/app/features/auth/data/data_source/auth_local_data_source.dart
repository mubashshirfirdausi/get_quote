import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthLocalDataSource {
  final GoogleSignIn _googleSignIn;

  AuthLocalDataSource({required GoogleSignIn googleSignIn}) : _googleSignIn = googleSignIn;
  bool getAuthState() {
    try {
      final currentGoogleUser = _googleSignIn.currentUser;
      if (currentGoogleUser == null) {
        _googleSignIn.signOut();
        return false;
      }
      return true;
    } catch (e) {
      _googleSignIn.signOut();
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      // final currentGoogleUser = _googleSignIn.currentUser;
      await _googleSignIn.currentUser?.clearAuthCache();
      await _googleSignIn.signOut();
      return true;
    } on PlatformException catch (e) {
      throw e.message ?? "An error occured";
    } catch (e) {
      throw "An error occured";
    }
  }
}
