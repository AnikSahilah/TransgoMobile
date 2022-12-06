///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transgo/UI/splashscreen.dart';
import 'package:transgo/provider/auth.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  void logout() {
    AuthApplication().logOut();
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const LandingScreen()),
        ModalRoute.withName("/"));
  }

  var link =
      "https://img.freepik.com/free-photo/confident-middle-aged-man-portrait_23-2149051737.jpg?w=740&t=st=1670330651~exp=1670331251~hmac=d234672ff9c476d14bb71884f051840ea0ebe7c0148b7bdc680143483e58f469";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.transparent),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      Text(
                        "P r o f i l e",
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                        width: 70,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Hero(
                        tag: 'profile',
                        child: Image.network(
                          link,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Consumer<AuthApplication>(
                      builder: (context, value, child) => Text(
                        value.user["nama"],
                        style: GoogleFonts.workSans(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Column(
                      children: [
                        Text(
                          "Tiket Saya",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      logout();
                    },
                    child: Text("Logout"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
