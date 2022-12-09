import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class detail_pemesanan extends StatefulWidget {
  const detail_pemesanan({super.key});

  @override
  State<detail_pemesanan> createState() => _detail_pemesananState();
}

class _detail_pemesananState extends State<detail_pemesanan> {
  final _nik = TextEditingController();
  final _nama = TextEditingController();
  final _jenis_kelamin = TextEditingController();
  final _no_hp = TextEditingController();

  Future onSubmit(context) async {}

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
            height: 30,
          ),
          Text("TransGo",
              style:
                  GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Color.fromARGB(104, 0, 0, 0), width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Tambah pesanan",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                      ),
                      Icon(Icons.add, color: Colors.black,)
                    ],
                  ))),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 7, right: 7),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(250, 250, 250, 250),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 130,
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ladju",
                            style: GoogleFonts.inter(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Image(
                          image: AssetImage("assets/image/bus3.png"),
                          height: 70,
                          width: 130,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Rp.85.000/Kursi",
                          style: GoogleFonts.laila(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tawang alun",
                          style: GoogleFonts.laila(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "12.00",
                          style: GoogleFonts.laila(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_circle_right_rounded, color: Color(0xFF3875BC),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bungurasih",
                          style: GoogleFonts.laila(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "15.00",
                          style: GoogleFonts.laila(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                    decoration: InputDecoration(
                      hintText: "Inputkan nik anda",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
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
                    decoration: InputDecoration(
                      hintText: "Inputkan nik anda",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
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
                    decoration: InputDecoration(
                      hintText: "Inputkan jenis kelamin anda",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
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
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: TextFormField(
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
          SizedBox(
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
