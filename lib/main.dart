import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transgo/API/api.dart';
import 'package:transgo/UI/Pemesanan.dart';

import 'package:transgo/UI/home.dart';
import 'package:transgo/UI/detail_pemesanan.dart';
import 'package:transgo/UI/Resetpassword.dart';
import 'package:transgo/UI/home2.dart';
import 'package:transgo/UI/splashscreen.dart';
import 'package:transgo/UI/register.dart';
import 'package:transgo/UI/login.dart';
import 'package:transgo/UI/profil.dart';
import 'package:transgo/provider/auth.dart';
import 'package:http/http.dart' as http;

//  TODO TONIGHT
// 1. save id user to sharedpreferences
// 2. finishing api dari smeua table
// 3. layouting home
// 4. show alert ketika error / success

// TODO
// 1. Notif register
// 2. Layouting yang belum

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthApplication>(
            create: (context) => AuthApplication())
      ],
      child: const MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authState = AuthApplication();
  bool _isLogin = false;
  Map<String, dynamic> _user = {};

  checkIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt("id");
    print(id);

    if (id == null) {
      return false;
    }

    final response = await http
        .post(Uri.parse(BaseAPI().getProfile), body: {"id": id.toString()});

    print(response.body);
    var output = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _isLogin = true;
        _user = output["data"];
      });
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    checkIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthApplication>(context).setUser(_user);

    var materialApp = MaterialApp(
        title: 'TransGo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 96, 110, 255),
          fontFamily: GoogleFonts.inter().fontFamily,
          // pageTransitionsTheme: const PageTransitionsTheme(builders: {
          //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          // })
        ),
        home: Builder(
          builder: (context) {
            if (_isLogin) {
              return const Home();
            }
            return const LandingScreen();
          },
        ),
        routes: {
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/lupapassword': (context) => const Lupapasword(),
          '/detail_pemesanan': (context) => const detail_pemesanan(),
          '/home2': (context) => const Home2(),
          '/profile': (context) => Profil(),
          '/pemesanan': (context) => pemesanan()
        });

    return materialApp;
  }
}
