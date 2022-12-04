import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class pemesanan extends StatefulWidget {
  const pemesanan({super.key});

  @override
  State<pemesanan> createState() => _pemesananState();
}

class _pemesananState extends State<pemesanan> {
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
            decoration: BoxDecoration(
                color: const Color(0xFF8E97FD),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF8E97FD), width: 1)),
            height: 150,
            width: MediaQuery.of(context).size.width - 15,
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
                    const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Color(0xFF8E97FD),
                      size: 30,
                    ),
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
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFF8E97FD), // <-- Button color
              foregroundColor:
                  const Color.fromARGB(255, 132, 192, 241), // <-- Splash color
            ),
            child: const Icon(Icons.add, size: 50, color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 15,
            decoration: BoxDecoration(
                color: Color(0xFF8E97FD), borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 8,
                left: 8,
                bottom: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Nik",
                        labelStyle:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ) ,
                      
                      ),
                            ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Nama",
                        labelStyle:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ) ,
                      
                      ),
                            ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Jenis Kelamin",
                        labelStyle:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ) ,
                      
                      ),
                            ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "No Hp",
                        labelStyle:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ) ,
                      ),
                            ),
                  ),
                ],
              ),
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
                              borderRadius: BorderRadius.circular(30)),
                          alignment: Alignment.center,
                          backgroundColor: const Color(0xFF8E97FD),
                        ),
                        child: const Text(
                          "Pesan",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))),
        ])))));
  }
}
