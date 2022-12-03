///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:transgo/style/style.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  Future onSubmit(context) async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2/api/v3/auth/login.php"),
        body: {"email": _email.text, "sandi": _password.text});

    final output = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(output);
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      print(output['message']);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text("Selamat Datang",
                    style: GoogleFonts.inter(
                        fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                const Image(
                  image: AssetImage("assets/image/bus2.png"),
                  height: 200,
                  width: 300,
                  fit: BoxFit.contain,
                ),
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.black, width: .5))),
                  width: MediaQuery.of(context).size.width - 80,
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                        controller: _email,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 96, 110, 255),
                            fontWeight: FontWeight.w600),
                        decoration: CustomInputStyle.inputDecoration(
                            "Email", "Inputkan email anda..", Icons.email))),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                      controller: _password,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 96, 110, 255),
                          fontWeight: FontWeight.w600),
                      decoration: CustomInputStyle.inputDecoration(
                          "Password", "Inputkan password anda..", Icons.lock),
                      obscureText: true,
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    child: TextButton(
                        onPressed: () {
                          onSubmit(context);
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          alignment: Alignment.center,
                          backgroundColor: const Color(0xFF8E97FD),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ))),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lupa Password?",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun? "),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/register");
                        },
                        child: Text("Register"))
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
