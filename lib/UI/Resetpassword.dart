import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:transgo/UI/register.dart';
import 'package:transgo/style/style.dart';

class Lupapasword extends StatefulWidget {
  const Lupapasword({super.key});

  @override
  State<Lupapasword> createState() => _LupapaswordState();
}

class _LupapaswordState extends State<Lupapasword> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _konfirmpassword = TextEditingController();

  Future onSubmit(context) async {}
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
              Text("Lupa Password",
              style: GoogleFonts.inter(
                fontSize: 26, fontWeight: FontWeight.bold
              )),
              const SizedBox(
                height: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              const Image(
                image: AssetImage("assets/image/lupa_password.png"),
                height: 180,
                width: 300,
                fit: BoxFit.contain,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: .5)
                  )
                ),
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
                    fontWeight: FontWeight.w600
                  ),
                  decoration: CustomInputStyle.inputDecoration(
                    "Email", "Inputkan email anda..", Icons.email)
                  )
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:  50, right: 50),
                  child: TextFormField(
                    controller: _password,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 96, 110, 255),
                      fontWeight: FontWeight.w600
                    ),
                    decoration: CustomInputStyle.inputDecoration(
                      "Password", "Inputkan password anda..", Icons.lock),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                                  Padding(
                  padding: const EdgeInsets.only(left:  50, right: 50),
                  child: TextFormField(
                    controller: _konfirmpassword,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 96, 110, 255),
                      fontWeight: FontWeight.w600
                    ),
                    decoration: CustomInputStyle.inputDecoration(
                      "Konfirmasi Password", "Inputkan ulang password anda..", Icons.lock),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width:  MediaQuery.of(context).size.width - 100,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        onSubmit(context);
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        alignment: Alignment.center,
                        backgroundColor: const Color(0xFF8E97FD),
                      ),
                      child: const Text(
                        "Konfirmasi",
                        style: TextStyle(color: Colors.white),
                      )
                    )
                  ),
            ],
                )
              )
              ),
            
          )
          );
  }
}