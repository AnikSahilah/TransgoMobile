///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  var link =
      "https://img.freepik.com/free-photo/close-up-portrait-funny-bearded-male-looks-with-surprisement-touches-cheeks-opens-mouth-can-t-beleive-something-isolated-white-wall-people-emotions-concept_273609-15100.jpg?w=740&t=st=1670143944~exp=1670144544~hmac=61861c83cc67f7ac1e4d7b2d1299a6033624b554848b55987b9d118dd45b17c4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
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
                  child: Image.network(
                    link,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Alexandria Alana",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "@alexadrinalane",
                ),
                SizedBox(
                  height: 70,
                ),
                Column(
                  children: [
                    Row(
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
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
