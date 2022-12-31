import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:transgo/API/api.dart';
import 'package:transgo/UI/splashscreen.dart';
import 'package:transgo/provider/auth.dart';
import 'package:http/http.dart' as http;

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var _incomingTicket = [];
  var _acceptedTicket = [];
  var _historyTicket = [];
  Future onSubmit(context) async {}

  void logout() {
    AuthApplication().logOut();
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const LandingScreen()),
        ModalRoute.withName("/"));
  }

  updateStatusTicket(int idTicket, int status) async {
    var update = await http.get(
        Uri.parse("${BaseAPI().updateStatus}/?id=$idTicket&status=$status"));
    print(update.body);
    var output = jsonDecode(update.body);
    if (update.statusCode == 200) {
      loadData();
    }
  }

  loadData() async {
    var userData = Provider.of<AuthApplication>(context, listen: false).user;
    var incomingTicket = await http.get(Uri.parse(
        "${BaseAPI().incomingTicket}/?status=1&kernet_id=${userData["id"]}"));

    var acceptedTicket = await http.get(Uri.parse(
        "${BaseAPI().incomingTicket}/?status=2&kernet_id=${userData["id"]}"));

    var historyTicket = await http.get(
        Uri.parse("${BaseAPI().historyTicket2}/?kernet_id=${userData["id"]}"));

    print({historyTicket.body});

    setState(() {
      if (incomingTicket.statusCode == 200) {
        _incomingTicket = jsonDecode(incomingTicket.body)["data"];
      } else {
        _incomingTicket = [];
      }
    });

    setState(() {
      if (acceptedTicket.statusCode == 200) {
        _acceptedTicket = jsonDecode(acceptedTicket.body)["data"];
      } else {
        _acceptedTicket = [];
      }
    });

    setState(() {
      if (historyTicket.statusCode == 200) {
        _historyTicket = jsonDecode(historyTicket.body)["data"];
      } else {
        _historyTicket = [];
      }
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: Column(
          children: [
            Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    "TransGo",
                    style: GoogleFonts.inter(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        logout();
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ))
                ],
              ),
            )),
            const SizedBox(
              height: 40,
            ),
            Consumer<AuthApplication>(
              builder: (context, value, child) => Text(
                "Hallo, ${value.user["nama"]}",
                style: GoogleFonts.inter(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TabBar(
              unselectedLabelColor: const Color(0xffacb3bf),
              indicatorColor: const Color.fromARGB(255, 89, 70, 253),
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              indicatorPadding: const EdgeInsets.all(10),
              isScrollable: false,
              tabs: [
                SizedBox(
                  height: 35,
                  child: Text(
                    "Tiket Masuk",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                    height: 35,
                    child: Text(
                      "Checkin",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    )),
                SizedBox(
                    height: 35,
                    child: Text(
                      "History",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    )),
              ],
              controller: _tabController,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 300,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: TabBarView(
                controller: _tabController,
                children: [
                  mockUp(_incomingTicket, updateStatusTicket),
                  mockUp(_acceptedTicket, updateStatusTicket),
                  checkin(_historyTicket)
                ],
              ),
            ),
          ],
        )));
  }
}

var incomingTicket = (List ticket) => ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width - 100,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 224),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(255, 139, 139, 139),
                  offset: Offset(0, -1)),
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://img.freepik.com/free-vector/surface-transport-abstract-concept-illustration_335657-3931.jpg",
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ticket[index]["keberangkatan"]),
                Text(
                  DateFormat("HH:mm").format(DateFormat("HH:mm:ss")
                      .parse(ticket[index]["jam_berangkat"])),
                )
              ],
            ),
            Icon(
              Icons.arrow_circle_right,
              color: Theme.of(context).primaryColor,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ticket[index]["tujuan"]),
                Text(DateFormat("HH:mm")
                    .format(DateFormat("HH:mm:ss").parse(ticket[index]["pws"])))
              ],
            ),
          ],
        ),
      ),
      itemCount: 5,
      shrinkWrap: true,
    );

var checkin = (List ticket) => ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
        width: MediaQuery.of(context).size.width - 100,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: ticket[index]["status"] == 3? Colors.green[200] : Colors.redAccent[200] ,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(255, 139, 139, 139),
                  offset: Offset(0, -1)),
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://img.freepik.com/free-vector/surface-transport-abstract-concept-illustration_335657-3931.jpg",
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ticket[index]["nama_user"]),
                Text(
                  ticket[index]["tanggal_berangkat"],
                ),
                ticket[index]["status"] == 3
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : Icon(Icons.cancel_rounded, color: Colors.red[600]),
              ],
            ),
          ],
        ),
      ),
      itemCount: ticket.length,
      shrinkWrap: true,
    );

mockUp(List ticket, onPressed) => ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
        width: MediaQuery.of(context).size.width - 100,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 224),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(255, 139, 139, 139),
                  offset: Offset(0, -1)),
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://img.freepik.com/free-vector/surface-transport-abstract-concept-illustration_335657-3931.jpg",
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ticket[index]["nama_user"]),
                Text(
                  ticket[index]["tanggal_berangkat"],
                ),
                (ticket[index]["status"] == 1 || ticket[index]["status"] == 2)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              onPressed(ticket[index]["id_pemesanan"],
                                  ticket[index]["status"] == 1 ? 2 : 3);
                            },
                            icon: const Icon(Icons.check_circle,
                                color: Colors.green),
                            label: const Text("Konfirmasi"),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              onPressed(ticket[index]["id_pemesanan"], 4);
                            },
                            icon: Icon(Icons.cancel_rounded,
                                color: Colors.red[600]),
                            label: const Text("Tolak"),
                          ),
                        ],
                      )
                    : const Icon(Icons.check_circle, color: Colors.green)
              ],
            ),
          ],
        ),
      ),
      itemCount: ticket.length,
      shrinkWrap: true,
    );
