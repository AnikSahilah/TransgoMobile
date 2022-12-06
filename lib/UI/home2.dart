import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/single_child_widget.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  Future onSubmit(context) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF8E97FD),
                    border:
                        Border.all(color: const Color(0xFF8E97FD), width: 1)),
                height: 50,
                width: MediaQuery.of(context).size.width - 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TransGo",
                        style: GoogleFonts.inter(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.menu,
                        size: 35,
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hallo, Nama",
              style:
                  GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF8E97FD),
                    borderRadius: BorderRadius.circular(14),
                    border:
                        Border.all(color: const Color(0xFF8E97FD), width: 1)),
                width: MediaQuery.of(context).size.width - 15,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
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
                                children: const [
                                  Image(
                                    image: AssetImage("assets/image/bus3.png"),
                                    height: 70,
                                    width: 130,
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Park Jimin",
                                    style: GoogleFonts.laila(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "081000000000",
                                    style: GoogleFonts.laila(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 50,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      alignment: Alignment.center,
                      backgroundColor: const Color(0xFF8E97FD),
                    ),
                    child: const Text(
                      "Konfirmasi",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ))),
            SizedBox(
              height: 10,
            )
          ],
        )));
  }
}
