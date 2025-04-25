import 'package:flutter/material.dart';

import '../../domain/enitities/user_entity.dart';
import '../../domain/usecases/get_current_user_usecase.dart';

class UserProvider extends ChangeNotifier {
  final GetCurrentUserUsecase _getCurrentUserUsecase;

  late User _user;
  UserProvider({required GetCurrentUserUsecase getCurrentUserUsecase}) : _getCurrentUserUsecase = getCurrentUserUsecase;

  User get user => _user;

  void getCurrentUser() {
    _user = _getCurrentUserUsecase.execute();
    notifyListeners();
  }
}
