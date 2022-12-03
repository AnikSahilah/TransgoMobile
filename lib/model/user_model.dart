import 'dart:convert';

import 'package:transgo/API/api.dart';
import 'package:http/http.dart' as http;

class User {
  late String nik, namaUser, ttl, noHp, alamat, gender, email, level;

  User(
      {required this.nik,
      required this.namaUser,
      required this.ttl,
      required this.noHp,
      required this.alamat,
      required this.email,
      required this.gender,
      required this.level});

  factory User.addUser(Map<String, dynamic> object) {
    return User(
        nik: object["nik"],
        namaUser: object["nama_user"],
        ttl: object["ttl"],
        noHp: object["no_hp"],
        alamat: object["alamat"],
        email: object["email"],
        gender: object["gender"],
        level: object["level"]);
  }

  static Future<User> login(String email, String password) async {
    Uri url = Uri.parse(BaseAPI().login);
    var response =
        await http.post(url, body: {"email": email, "sandi": password});

    var jsonObject = json.decode(response.body);

    return User.addUser(jsonObject['data']);
  }
}
