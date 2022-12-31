///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:transgo/API/api.dart';
import 'package:transgo/UI/splashscreen.dart';
import 'package:transgo/provider/auth.dart';
import 'package:http/http.dart' as http;

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var _myTicket= [];
  var _historyTicket= [];
  var _userId;
  void logout() {
    AuthApplication().logOut();
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const LandingScreen()),
        ModalRoute.withName("/"));
  }

  getTickets() async {
    var history = await http.get(Uri.parse("${BaseAPI().historyTicket}/?user_id=$_userId"));
    var myTicket = await http.get(Uri.parse("${BaseAPI().myTicket}/?user_id=$_userId"));

    print({history.body,myTicket.body});

    if (history.statusCode == 200) {
      setState(() {
        _historyTicket = jsonDecode(history.body)["data"] ;
      });
    }
    if (myTicket.statusCode == 200) {
      setState(() {
        _myTicket = jsonDecode(myTicket.body)["data"] ;
      });
    }
  }

  var link =
      "https://img.freepik.com/free-photo/confident-middle-aged-man-portrait_23-2149051737.jpg?w=740&t=st=1670330651~exp=1670331251~hmac=d234672ff9c476d14bb71884f051840ea0ebe7c0148b7bdc680143483e58f469";

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    setState(() {
      _userId = Provider.of<AuthApplication>(context, listen: false).user["id"];
    });

    super.initState();

    getTickets();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style:
                      TextButton.styleFrom(foregroundColor: Colors.transparent),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              Text(
                "P r o f i l e",
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    logout();
                  },
                  style:
                      TextButton.styleFrom(foregroundColor: Colors.transparent),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
         SizedBox(
          height: MediaQuery.of(context).size.height / 20,
        ),
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
        const SizedBox(
          height: 10,
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
                "Tiket Saya",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
                height: 35,
                child: Text(
                  "Riwayat",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                  ),
                )),
          ],
          controller: _tabController,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.only(top: 10),
          child: TabBarView(
            controller: _tabController,
            children: [
              tiketSaya(_myTicket),
              history(_historyTicket),
            ],
          ),
        )
      ])),
    ));
  }
}

var tiketSaya = (List ticket) => ListView.separated(
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
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(ticket[index]["keberangkatan"]),
          Text( DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(ticket[index]["jam_berangkat"])),)
        ],
        ),
        Icon(
          Icons.arrow_circle_right,
          color: Theme.of(context).primaryColor,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(ticket[index]["tujuan"]),
          Text( DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(ticket[index]["pws"])))
        ],
        ),
      ],
    ),
  ),
  itemCount: ticket.length,
  shrinkWrap: true,
);

var history = (List ticket)=> ListView.separated(
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
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(ticket[index]["keberangkatan"]),
          Text( DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(ticket[index]["jam_berangkat"])),)
        ],
        ),
        Icon(
          Icons.arrow_circle_right,
          color: Theme.of(context).primaryColor,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(ticket[index]["tujuan"]),
          Text( DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(ticket[index]["pws"])))
        ],
        ),
      ],
    ),
  ),
 itemCount:  ticket.length,
  shrinkWrap: true,
);
