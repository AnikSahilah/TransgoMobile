import 'package:flutter/foundation.dart';

class AuthApplication with ChangeNotifier {
  bool _isLogin = true;
  Map<String, dynamic> _user = {};

// getter untuk mengakses state
  bool get isLogin => _isLogin;
  Map get user => _user;

// setter / method untuk mengubah state
  set loggedIn(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  set addUser(Map<String, dynamic> value) {
    _user = value;
    notifyListeners();
  }
}
