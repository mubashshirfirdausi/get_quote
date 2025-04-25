import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSource {
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSource({required GoogleSignIn googleSignIn}) : _googleSignIn = googleSignIn;

  Future<String> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) throw "Operation cancelled by User";
      return user.id;
    } on PlatformException catch (e) {
      throw e.message ?? "An error occured";
    } catch (e) {
      rethrow;
    }
  }
}
