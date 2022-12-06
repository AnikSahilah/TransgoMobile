class BaseAPI {
  static String base = "http://10.0.2.2";
  static var api = "$base/api/v3";
  var customersPath = "$api/customers";
  static var authPath = "$api/auth";

  var login = "$authPath/login.php";
  var register = "$authPath/register.php";
  var getProfile = "$authPath/check-user.php";
  // more routes
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}
