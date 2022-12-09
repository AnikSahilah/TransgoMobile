import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transgo/shared/main_comp.dart';

class pemesanan extends StatefulWidget {
  const pemesanan({super.key});

  @override
  State<pemesanan> createState() => _pemesananState();
}

class _pemesananState extends State<pemesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset("assets/image/Vector.png"),
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
                  onChanged: (value) {},
                  items: [DropdownMenuItem(child: Text("Terminal A"))],
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
                  onChanged: (value) {},
                  items: [DropdownMenuItem(child: Text("Terminal A"))],
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
                    border: Border.all(color: Color.fromARGB(104, 0, 0, 0),width: 1),
                    borderRadius: BorderRadius.circular(8)
                    ),
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                              maxTime: DateTime(DateTime.now().year + 5), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            print('confirm $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.id);
                        },
                        child: Text(
                          'Pilih tanggal keberangkatan',
                          style: TextStyle(color: Colors.black),
                        ))),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Jumlah Tiket",
                  style: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah Tiket",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/detail_pemesanan");
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    backgroundColor: const Color(0xFF3875BC),
                  ),
                  child: const Text(
                    "Pesan Sekarang",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))),
        ])))));
  }
}
