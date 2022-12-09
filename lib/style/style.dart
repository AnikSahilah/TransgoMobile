import 'package:flutter/material.dart';

var color = const Color.fromARGB(255, 96, 110, 255);

abstract class CustomInputStyle {
  static InputDecoration inputDecoration(
          String label, String hint, IconData icon) =>
      InputDecoration(
        hintStyle: TextStyle(color: color),
        border: OutlineInputBorder(borderSide: BorderSide(color: color)),
        focusColor: color,
        labelText: label,
        labelStyle: TextStyle(color: color),
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: color,
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 3),
        ),
      );

  static InputDecoration inputDecorationWithoutIcon(
          String label, String hint) =>
      InputDecoration(
        hintStyle: TextStyle(color: color),
        border: OutlineInputBorder(borderSide: BorderSide(color: color)),
        focusColor: color,
        labelText: label,
        labelStyle: TextStyle(color: color),
        hintText: hint,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 3),
        ),
      );
}
