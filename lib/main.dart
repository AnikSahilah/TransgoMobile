import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:transgo/UI/Home.dart';
import 'package:transgo/UI/Pemesanan.dart';
import 'package:transgo/UI/Resetpassword.dart';
import 'package:transgo/UI/splashscreen.dart';
import 'package:transgo/UI/register.dart';
import 'package:transgo/UI/login.dart';
import 'package:transgo/UI/profil.dart';
import 'package:transgo/provider/auth.dart';

//  TODO TONIGHT
// 1. save id user to sharedpreferences
// 2. finishing api dari smeua table
// 3. layouting home
// 4. show alert ketika error / success

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
        title: 'TransGo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 96, 110, 255),
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        routes: {
          '/': (context) => const LandingScreen(),
          '/home': (context) => Home(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/lupapassword': (context) => const Lupapasword(),
          '/pemesanan': (context) => const pemesanan()
        });
    return ChangeNotifierProvider<AuthApplication>(
      create: (context) => AuthApplication(),
      child: materialApp,
    );
  }
}
