import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApplication with ChangeNotifier {
  bool _isLogin = false;
  Map<String, dynamic> _user = {};

// getter untuk mengakses state
  bool get isLogin => _isLogin;
  Map get user => _user;

// setter / method untuk mengubah state
  void loggedIn(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  void setUser(Map<String, dynamic> value) {
    print({"set User", value});
    _user = value;

    print(_user);
  }

  Future logOut() async {
    _isLogin = false;
    _user = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.remove("id");
  }
}
