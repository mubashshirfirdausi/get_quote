import '../../domain/enitities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.userName,
    required super.profilePic,
  });

  factory UserModel.fromGoogleSignInAccount(GoogleSignInAccount googleSignInAccount) {
    return UserModel(
      id: googleSignInAccount.id,
      email: googleSignInAccount.email,
      userName: googleSignInAccount.displayName,
      profilePic: googleSignInAccount.photoUrl,
    );
  }
}
