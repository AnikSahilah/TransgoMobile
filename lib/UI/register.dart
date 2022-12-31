///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transgo/API/api.dart';
import 'package:transgo/style/style.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

toast(String val, Color color) => Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        val,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(color: Colors.white),
      ),
    );

class _RegisterState extends State<Register> {
  final _nama = TextEditingController();
  final _nik = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _alamat = TextEditingController();
  final _nohp = TextEditingController();
  var _gender = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  generalValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Field tidak boleh kosong!';
    }
    return null;
  }

  onSubmit() async {
    var validate = _formKey.currentState!.validate();

    if (!validate) {
      return;
    }

    var _data = {
      'nama': _nama.text,
      'nik': _nik.text,
      "email": _email.text,
      'sandi': _password.text,
      'alamat': _alamat.text,
      'no_hp': _nohp.text,
      'gender': _gender,
      'level': '4'
    };

    final response =
        await http.post(Uri.parse(BaseAPI().register), body: _data);

    var output = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var snakbar = SnackBar(
        content: toast(output["message"], Colors.green),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      );
      ScaffoldMessenger.of(context).showSnackBar(snakbar);
      print(output);
    } else {
      var snakbar = SnackBar(
        content: toast(output["message"], Color.fromARGB(255, 239, 30, 16)),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      );
      ScaffoldMessenger.of(context).showSnackBar(snakbar);
      print(output['message']);
      print(output);
    }
    _nama.clear();
    _nik.clear();
    _email.clear();
    _password.clear();
    _alamat.clear();
    _nohp.clear();
    setState(() {
      _gender = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Register",
                      style: GoogleFonts.inter(
                          color: Theme.of(context).primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Column(
                          children: [
                            TextFormField(
                                onChanged: (value) {},
                                controller: _nama,
                                style: const TextStyle(
                                    color: Color(0xFF2769B7),
                                    fontWeight: FontWeight.w600),
                                validator: (value) => generalValidator(value),
                                decoration:
                                    CustomInputStyle.inputDecorationWithoutIcon(
                                  "Nama",
                                  "Inputkan nama anda..",
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                onChanged: (value) {},
                                controller: _nik,
                                validator: (value) => generalValidator(value),
                                maxLength: 16,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    color: Color(0xFF2769B7),
                                    fontWeight: FontWeight.w600),
                                decoration:
                                    CustomInputStyle.inputDecorationWithoutIcon(
                                  "NIK",
                                  "Inputkan nik anda..",
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                onChanged: (value) {},
                                controller: _email,
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
                                style: const TextStyle(
                                    color: Color(0xFF2769B7),
                                    fontWeight: FontWeight.w600),
                                decoration:
                                    CustomInputStyle.inputDecorationWithoutIcon(
                                  "Email",
                                  "Inputkan email anda..",
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              onChanged: (value) {},
                              controller: _password,
                              validator: (value) => generalValidator(value),
                              style: const TextStyle(
                                  color: Color(0xFF2769B7),
                                  fontWeight: FontWeight.w600),
                              decoration:
                                  CustomInputStyle.inputDecorationWithoutIcon(
                                "Password",
                                "Inputkan password anda..",
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                onChanged: (value) {},
                                controller: _alamat,
                                validator: (value) => generalValidator(value),
                                style: const TextStyle(
                                    color: Color(0xFF2769B7),
                                    fontWeight: FontWeight.w600),
                                decoration:
                                    CustomInputStyle.inputDecorationWithoutIcon(
                                  "Alamat",
                                  "Inputkan alamat anda..",
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                onChanged: (value) {},
                                controller: _nohp,
                                validator: (value) => generalValidator(value),
                                maxLength: 12,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    color: Color(0xFF2769B7),
                                    fontWeight: FontWeight.w600),
                                decoration:
                                    CustomInputStyle.inputDecorationWithoutIcon(
                                  "No HP",
                                  "Inputkan nomor handphone anda..",
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width - 100,
                              child: DropdownButtonFormField(
                                onChanged: (newValue) {
                                  setState(() => _gender = newValue.toString());
                                },
                                value: _gender,
                                validator: (value) => generalValidator(value),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .primaryColor))),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                                hint: Text(
                                  "Jenis kelamin",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                      value: "",
                                      child: Text("Pilih Jenis Kelamin")),
                                  DropdownMenuItem(
                                      value: "laki-laki",
                                      child: Text("Laki-laki")),
                                  DropdownMenuItem(
                                      value: "perempuan",
                                      child: Text("Perempuan")),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 100,
                              height: 50,
                              child: TextButton(
                                onPressed: onSubmit,
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  backgroundColor: Color(0xFF2769B7),
                                ),
                                child: Text(
                                  "Register",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Sudah punya akun? "),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, "/login");
                                    },
                                    child: const Text("Login"))
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
