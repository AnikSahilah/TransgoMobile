import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:transgo/API/api.dart';
import 'package:transgo/UI/tampil_bus.dart';
import 'package:transgo/shared/main_comp.dart';
import 'package:http/http.dart' as http;

class Pemesanan extends StatefulWidget {
  const Pemesanan({super.key});

  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
    ).then((value) {
      var now = DateTime.now();
      var newVal =
          DateTime(now.year, now.month, now.day, value!.hour, value.minute)
              ;
      // print(DateFormat("HHmmss").format(DateFormat("HH:mm").parse(newVal.toString())));
      setState(() {
        _data["jam"] = DateFormat("HH:mm").format(newVal);
      });
    });
  }

  List<dynamic> _listTerminal = [];
  final Map _data = {
    "from": 0,
    "to": 0,
    "tanggal": "",
    "jumlah": "",
    "jam": null
  };

  generalValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Wajib diisi!';
    }
    return null;
  }

  handleChange(name, value) {
    return setState(() {
      _data[name] = value;
    });
  }

  handleSubmit() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TampilBus(
                  ordersArgument: _data,
                )));
  }

  getListTerminal() async {
    var response = await http.get(Uri.parse(BaseAPI().allTerminal));

    var output = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _listTerminal = output["data"];
      });
    } else {
      print("GAGAL GET LIST TERMINAL");
    }
  }

  @override
  void initState() {
    getListTerminal();
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
                    child: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "assets/image/Vector.png",
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27),
                  child: MainComp.appTitle(Colors.black),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Terminal Keberangkatan",
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: DropdownButtonFormField(
                    validator: (value) => generalValidator(value),
                    onChanged: (value) {
                      handleChange("from", value);
                    },
                    items: _listTerminal
                        .where((terminal) => terminal["id"] != _data["to"])
                        .toList()
                        .map((terminal) => DropdownMenuItem(
                            value: terminal["id"],
                            child: Text(terminal["nama"])))
                        .toList(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      hintText: "Terminal Keberangkatan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Terminal Tujuan",
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: DropdownButtonFormField(
                    validator: (value) => generalValidator(value),
                    onChanged: (value) {
                      handleChange("to", value);
                    },
                    items: _listTerminal
                        .where((terminal) => terminal["id"] != _data["from"])
                        .toList()
                        .map((terminal) => DropdownMenuItem(
                            value: terminal["id"],
                            child: Text(terminal["nama"])))
                        .toList(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      hintText: "Terminal Tujuan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tanggal Keberangkatan",
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(104, 0, 0, 0),
                              width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(DateTime.now().year,
                                    DateTime.now().month, DateTime.now().day),
                                maxTime: DateTime(DateTime.now().year + 5),
                                onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              handleChange("date",
                                  DateFormat("yyyy-MM-dd").format(date));
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.id);
                          },
                          child: Text(
                            _data["date"] ?? "Pilih tanggal",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Jam Keberangkatan",
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(104, 0, 0, 0),
                              width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextButton(
                          onPressed: _showTimePicker,
                          child: Text(
                            _data["jam"] != null
                                ? _data["jam"].toString()
                                : "Jam Keberangkatan",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/detail_pemesanan");
                      handleSubmit();
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.center,
                      backgroundColor: const Color(0xFF3875BC),
                    ),
                    child: const Text(
                      "Cari Sekarang",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))),
            const SizedBox(
              height: 30,
            ),
          ]),
        )))));
  }
}
