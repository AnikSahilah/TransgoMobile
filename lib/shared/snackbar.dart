import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNotification {
  static toast(String val, Color color) => Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        val,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(color: Colors.white),
      ),
    );
}