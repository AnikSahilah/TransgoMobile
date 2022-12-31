import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:transgo/API/api.dart';
import 'package:transgo/UI/register.dart';
import 'package:transgo/provider/auth.dart';
import 'package:transgo/shared/convert_currency.dart';
import 'package:transgo/shared/main_comp.dart';
import "package:http/http.dart" as http;
import 'package:transgo/shared/snackbar.dart';

class DetailPemesanan extends StatefulWidget {
  const DetailPemesanan({super.key, required this.DetailOrderArgument});
  final Map DetailOrderArgument;

  @override
  State<DetailPemesanan> createState() => _DetailPemesananState();
}

class _DetailPemesananState extends State<DetailPemesanan> {
  final _nik = TextEditingController();
  final _nama = TextEditingController();
  final _jenis_kelamin = TextEditingController();
  final _no_hp = TextEditingController();

  bool _modeInput = false;

  onSubmit(context) async {
    var data = Provider.of<AuthApplication>(context, listen: false).user;
    var body = {};
    if (_modeInput) {
      body = data;
    } else {
      body = {
        "nik": _nik.text,
        "nama": _nama.text,
        "no_hp": _no_hp.text,
        "gender": _jenis_kelamin.text
      };
    }
    var dataBody = {
      "user_id": data["id"].toString(),
      "bus_id": widget.DetailOrderArgument["bus_id"].toString(),
      "jadwal_id": widget.DetailOrderArgument["id"].toString(),
      "date": widget.DetailOrderArgument["date"],
      "nik": body["nik"],
      "nama": body["nama"],
      "no_hp": body["no_hp"],
      "gender": body["gender"],
    };
    print(widget.DetailOrderArgument);

    var response =
        await http.post(Uri.parse(BaseAPI().createTicket), body: dataBody);
    print(response.body);

    var output = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var snakbar = SnackBar(
        content: CustomNotification.toast(output["message"], Colors.green),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      );
      ScaffoldMessenger.of(context).showSnackBar(snakbar);
      Navigator.pushReplacementNamed(context, "/");
    } else {
       var snakbar = SnackBar(
        content: CustomNotification.toast(output["message"], Colors.red),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      );
      ScaffoldMessenger.of(context).showSnackBar(snakbar);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
          MainComp.appTitle(Colors.black),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 7, right: 7),
            child: TextButton(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(250, 250, 250, 250),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [BoxShadow(blurRadius: 5)]),
                height: 130,
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.DetailOrderArgument["nama_bus"],
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const Image(
                          image: AssetImage("assets/image/bus3.png"),
                          height: 70,
                          width: 130,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${CurrencyFormat.convertToIdr(widget.DetailOrderArgument["harga"], 0)}/Kursi",
                          style: GoogleFonts.laila(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.DetailOrderArgument["dari"],
                          style: GoogleFonts.laila(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Text(
                          DateFormat("HH:mm").format(DateFormat("HH:mm:ss")
                              .parse(
                                  widget.DetailOrderArgument["jam_berangkat"])),
                          style: GoogleFonts.laila(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Color(0xFF3875BC),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.DetailOrderArgument["ke"],
                          style: GoogleFonts.laila(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Text(
                          DateFormat("HH:mm").format(DateFormat("HH:mm:ss")
                              .parse(widget.DetailOrderArgument["pws"])),
                          style: GoogleFonts.laila(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: true,
                  child: Text("Diri sendiri."),
                ),
                DropdownMenuItem(
                  value: false,
                  child: Text("Orang lain."),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _modeInput = value as bool;
                });
              },
              decoration: InputDecoration(
                hintText: "Pilih menu",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                label: const Text("Tiket Untuk?"),
              ),
            ),
          ),
          if (!_modeInput)
            Container(
              padding:
                  const EdgeInsets.only(top: 15, right: 8, left: 8, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "NIK",
                      style: GoogleFonts.inter(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      maxLength: 16,
                      controller: _nik,
                      decoration: InputDecoration(
                        hintText: "Inputkan nik anda",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nama",
                      style: GoogleFonts.inter(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: _nama,
                      decoration: InputDecoration(
                        hintText: "Inputkan nama anda",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Jenis Kelamin",
                      style: GoogleFonts.inter(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: _jenis_kelamin,
                      decoration: InputDecoration(
                        hintText: "Inputkan jenis kelamin anda",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "No Hp",
                      style: GoogleFonts.inter(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextFormField(
                      controller: _no_hp,
                      maxLength: 12,
                      decoration: InputDecoration(
                        hintText: "Inputkan no hp anda",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              child: TextButton(
                  onPressed: () {
                    onSubmit(context);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    backgroundColor: const Color(0xFF3875BC),
                  ),
                  child: const Text(
                    "Pesan",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))),
          const SizedBox(
            height: 10,
          ),
        ])))));
  }
}
