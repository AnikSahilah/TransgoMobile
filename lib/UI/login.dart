///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transgo/API/api.dart';
import 'package:transgo/UI/home.dart';
import 'package:transgo/UI/home2.dart';
import 'package:transgo/provider/auth.dart';
import 'package:transgo/style/style.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

error(String val) => Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 44, 30),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        val,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(color: Colors.white),
      ),
    );

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future onSubmit(context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final response = await http.post(Uri.parse(BaseAPI().login),
        body: {"email": _email.text, "sandi": _password.text});
    

    final output = jsonDecode(response.body);
    print(output);
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      pref.setInt("id", output["data"]["id"]);
      var authState = Provider.of<AuthApplication>(context, listen: false);

      authState.setUser(output["data"]);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => output["data"]["level"] == "4"
                  ? const Home()
                  : const Home2()),
          ModalRoute.withName("/"));
    } else {
      var snakbar = SnackBar(
        content: error(output["message"]),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      );
      ScaffoldMessenger.of(context).showSnackBar(snakbar);
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
                const SizedBox(
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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Field tidak boleh kosong!';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Gunakan email yg valid!';
                                  }
                                  if (value.split("@")[1] != "gmail.com") {
                                    return 'Harus menggunakan email dari Gmail!';
                                  }
                                  return null;
                                },
                                controller: _email,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 96, 110, 255),
                                    fontWeight: FontWeight.w600),
                                decoration: CustomInputStyle.inputDecoration(
                                    "Email",
                                    "Inputkan email anda..",
                                    Icons.email))),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Field tidak boleh kosong!';
                                }
                                return null;
                              },
                              controller: _password,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 96, 110, 255),
                                  fontWeight: FontWeight.w600),
                              decoration: CustomInputStyle.inputDecoration(
                                  "Password",
                                  "Inputkan password anda..",
                                  Icons.lock),
                              obscureText: true,
                            )),
                      ],
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
                          backgroundColor: const Color(0xFF3875BC),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ))),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/lupapassword");
                    },
                    child: const Text(
                      "Lupa Password?",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Belum punya akun? "),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/register");
                        },
                        child: const Text("Register"))
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
