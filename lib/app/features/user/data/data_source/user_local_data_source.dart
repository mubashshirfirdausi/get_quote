import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class UserLocalDataSource {
  final GoogleSignIn _googleSignIn;

  UserLocalDataSource({required GoogleSignIn googleSignIn}) : _googleSignIn = googleSignIn;

  UserModel getCurrentUser() {
    try {
      final currentGoogleUser = _googleSignIn.currentUser;
      if (currentGoogleUser == null) throw "Authentication error. Please try again";
      return UserModel.fromGoogleSignInAccount(currentGoogleUser);
    } catch (e) {
      throw "Authentication error. Please try again";
    }
  }
}
