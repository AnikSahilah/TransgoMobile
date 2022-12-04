///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                height: 20,
              ),
              const Text(
                "TransGo",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Image(
                image: AssetImage("assets/image/buslanding.png"),
                height: 200,
                width: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Selamat Datang",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah memiliki akun? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
