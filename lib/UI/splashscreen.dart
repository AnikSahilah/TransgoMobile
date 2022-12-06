///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:transgo/provider/auth.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final authState = AuthApplication();

  @override
  void initState() {
    super.initState();

    print("init state from splashscreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Lottie.network(
                  "https://assets3.lottiefiles.com/packages/lf20_adagzoy4.json"),
              Text(
                "T r a n s G o",
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "TransGo merupakan aplikasi pemesanan \n tiket bus di seluruh terminal yang ada di \nIndonesia",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    backgroundColor: const Color(0xFF8E97FD),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah memiliki akun? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
