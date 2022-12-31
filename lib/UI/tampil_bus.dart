import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:transgo/API/api.dart';
import 'package:transgo/UI/detail_pemesanan.dart';
import 'package:transgo/models/orders_argument.dart';
import 'package:http/http.dart' as http;
import 'package:transgo/shared/convert_currency.dart';

class TampilBus extends StatefulWidget {
  const TampilBus({super.key, required this.ordersArgument});
  final Map ordersArgument;

  @override
  State<TampilBus> createState() => _TampilBusState(ordersArgument);
}

class _TampilBusState extends State<TampilBus> {
  final Map _ordersArgument;
  List _listJadwal = [];
  _TampilBusState(this._ordersArgument);

  getListJadwal() async {
    print(_ordersArgument);

    var response = await http.get(Uri.parse(
        "${BaseAPI().allJadwal}/?dari=${_ordersArgument["from"]}&ke=${_ordersArgument["to"]}&jam_berangkat=${_ordersArgument["jam"]}"));
    var output = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(output["data"][0]);
      setState(() {
        _listJadwal = output["data"];
      });
    } else {
      print("FAILED GET JADWAL");
    }
  }

  @override
  void initState() {
    super.initState();

    getListJadwal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Bus Tersedia",
                    style: GoogleFonts.inter(
                        fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 30,
                ),
                _listJadwal.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: _listJadwal.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 0,
                          ),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 7, right: 7),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  var arg = _listJadwal[index];
                                  arg["date"] = _ordersArgument["date"];
                                  return DetailPemesanan(
                                    DetailOrderArgument: arg,
                                  );
                                }));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        250, 250, 250, 250),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(blurRadius: 5)
                                    ]),
                                height: 130,
                                width: MediaQuery.of(context).size.width - 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(_listJadwal[index]["nama_bus"],
                                            style: GoogleFonts.inter(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        const Image(
                                          image: AssetImage(
                                              "assets/image/bus3.png"),
                                          height: 70,
                                          width: 130,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "${CurrencyFormat.convertToIdr(_listJadwal[index]["harga"], 0)}/Kursi",
                                          style: GoogleFonts.laila(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _listJadwal[index]["dari"],
                                          style: GoogleFonts.laila(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          DateFormat("HH:mm").format(
                                              DateFormat("HH:mm:ss").parse(
                                                  _listJadwal[index]
                                                      ["jam_berangkat"])),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _listJadwal[index]["ke"],
                                          style: GoogleFonts.laila(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          DateFormat("HH:mm").format(
                                              DateFormat("HH:mm:ss").parse(
                                                  _listJadwal[index]["pws"])),
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
                        ),
                      )
                    : Text("Jadwal tidak ditemukan")
              ]),
        )));
  }
}
