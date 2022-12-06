import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:transgo/UI/splashscreen.dart';
import 'package:transgo/provider/auth.dart';
import 'package:transgo/style/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    Text(
                      "T r a n s G o",
                      style: GoogleFonts.inter(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: Icon(Icons.menu))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Selamat Datang ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              Consumer<AuthApplication>(
                  builder: (context, value, child) => Text(
                        value.user["nama"],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: DropdownButtonFormField(
                      hint: const Text("Keberangkatan"),
                      items: const [
                        DropdownMenuItem(
                          value: "1",
                          child: Text("item 1"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  )),
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: DropdownButtonFormField(
                      hint: const Text("Tujuan"),
                      items: const [
                        DropdownMenuItem(
                          value: "1",
                          child: Text("item 1"),
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                  child: TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2018, 3, 5),
                            maxTime: DateTime(DateTime.now().year + 2),
                            onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.id);
                      },
                      child: const Text(
                        'show date time picker',
                        style: TextStyle(color: Colors.blue),
                      ))),
              ElevatedButton(
                  onPressed: () {
                    AuthApplication().logOut();
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const LandingScreen()),
                        ModalRoute.withName("/"));
                  },
                  child: const Text("Logout"))
            ],
          ),
        ));
  }
}
