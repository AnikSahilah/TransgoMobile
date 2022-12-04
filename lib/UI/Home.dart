///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:transgo/style/style.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "TransGo",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
                width: 40,
              ),
              const Text(
                "Selamat Datang Jeje",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              Row(
                children: [
                  Flexible(
                    child: DropdownButtonFormField(
                        onChanged: (value) {},
                        items: const [
                          DropdownMenuItem(
                            child: Text("A"),
                          )
                        ]),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
