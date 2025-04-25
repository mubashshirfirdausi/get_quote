import '../enitities/user_entity.dart';

abstract class UserRepository {
  User getCurrentUser();
}
