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

class _RegisterState extends State<Register> {
  final Map<String, dynamic> _data = {
    'nama': "",
    'nik': "",
    "email": '',
    'sandi': '',
    'alamat': '',
    'no_hp': '',
    'gender': '',
    'level': ''
  };

  final List<Map<String, String>> _levelList = [
    {"label": 'Pilih jenis akun', "value": ''},
    {"label": 'Penumpang', "value": '1'},
    {"label": 'Kernet', "value": '2'}
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  onChange(String name, value) {
    _data[name] = value;
  }

  generalValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Wajib diisi!';
    }
    return null;
  }

  onSubmit() async {
    final response =
        await http.post(Uri.parse(BaseAPI().register), body: _data);

    var output = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(output);
    } else {
      print(output);
    }
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
                                onChanged: (value) {
                                  onChange('nama', value);
                                },
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 96, 110, 255),
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
                                onChanged: (value) {
                                  onChange('nik', value);
                                },
                                validator: (value) => generalValidator(value),
                                maxLength: 16,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 96, 110, 255),
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
                                onChanged: (value) {
                                  onChange('email', value);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Wajib diisi!';
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
                                    color: Color.fromARGB(255, 96, 110, 255),
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
                              onChanged: (value) {
                                onChange('sandi', value);
                              },
                              validator: (value) => generalValidator(value),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 96, 110, 255),
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
                                onChanged: (value) {
                                  onChange('alamat', value);
                                },
                                validator: (value) => generalValidator(value),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 96, 110, 255),
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
                                onChanged: (value) {
                                  onChange('no_hp', value);
                                },
                                validator: (value) => generalValidator(value),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 96, 110, 255),
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
                                  onChange('gender', newValue);
                                },
                                value: _data['gender'],
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
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width - 100,
                              child: DropdownButtonFormField(
                                onChanged: (newValue) {
                                  onChange('level', newValue);
                                },
                                value: _data['level'],
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
                                items: _levelList.map((e) {
                                  return DropdownMenuItem(
                                      value: e['value'],
                                      child: Text(e['label']!));
                                }).toList(),
                              ),
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
                                  backgroundColor: const Color(0xFF8E97FD),
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
