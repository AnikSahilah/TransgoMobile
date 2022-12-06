import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:transgo/UI/splashscreen.dart';
import 'package:transgo/provider/auth.dart';
import 'package:transgo/shared/main_comp.dart';
import 'package:transgo/style/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map> _listW = [
    {"icon": Icons.notes, "label": "Tiket Saya", "path": "/profile"},
    {"icon": Icons.history, "label": "Riwayat", "path": "/profile"}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 3,
                            color: Colors.black.withOpacity(0.4),
                            offset: const Offset(0, 3))
                      ],
                      color: const Color(0xFF2769B7),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(29),
                          bottomRight: Radius.circular(29))),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MainComp.appTitle(Colors.white),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Selamat Datang",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              Consumer<AuthApplication>(
                                builder: (context, value, child) => Text(
                                  value.user["nama"],
                                  style: GoogleFonts.workSans(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.italic),
                                ),
                              )
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)))),
                            onPressed: () {
                              Navigator.pushNamed(context, "/profile");
                            },
                            child: ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: Hero(
                                tag: "profile",
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/confident-middle-aged-man-portrait_23-2149051737.jpg?w=740&t=st=1670330651~exp=1670331251~hmac=d234672ff9c476d14bb71884f051840ea0ebe7c0148b7bdc680143483e58f469",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mau Pergi?",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Cari tiketnya yuk!",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(10)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF2769B7)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Klik untuk cari",
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _listW.map((e) {
                var widget = Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                        )
                      ],
                      color: Color(0xFF2769B7),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, e["path"]);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          e["icon"],
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          e["label"],
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );

                return widget;
              }).toList(),
            )
          ],
        )));
  }
}
