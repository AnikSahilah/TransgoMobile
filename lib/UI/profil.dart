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

class _ProfilState extends State<Profil> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
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
      const SizedBox(
        height: 70,
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
            tiketSaya,
            history,
          ],
        ),
      )
    ])));
  }
}

var tiketSaya = ListView.separated(
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
        const Text("Tiket Saya"),
        Icon(
          Icons.arrow_circle_right,
          color: Theme.of(context).primaryColor,
        ),
        Text("Akhir")
      ],
    ),
  ),
  itemCount: 10,
  shrinkWrap: true,
);

var history = ListView.separated(
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
        const Text("Riwayat"),
        Icon(
          Icons.arrow_circle_right,
          color: Theme.of(context).primaryColor,
        ),
        Text("Akhir")
      ],
    ),
  ),
  itemCount: 10,
  shrinkWrap: true,
);
