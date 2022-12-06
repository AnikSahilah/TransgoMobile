import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MainComp {
  static Text appTitle(Color color) => Text(
        "T r a n s G o",
        style: GoogleFonts.inter(
            fontSize: 32, fontWeight: FontWeight.w800, color: color),
      );
}
