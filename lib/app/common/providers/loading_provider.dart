import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value, {bool shouldNotify = true}) {
    _isLoading = value;
    if (shouldNotify) notifyListeners();
  }
}
