import 'package:flutter/material.dart';

abstract class CustomInputStyle {
  static InputDecoration inputDecoration(
          String label, String hint, IconData icon) =>
      InputDecoration(
        hintStyle: const TextStyle(color: Color.fromARGB(255, 96, 110, 255)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 96, 110, 255))),
        focusColor: const Color.fromARGB(255, 96, 110, 255),
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 96, 110, 255)),
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 96, 110, 255),
        ),
        fillColor: Colors.white,
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 96, 110, 255), width: 3),
        ),
      );

  static InputDecoration inputDecorationWithoutIcon(
          String label, String hint) =>
      InputDecoration(
        hintStyle: const TextStyle(color: Color.fromARGB(255, 96, 110, 255)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 96, 110, 255))),
        focusColor: const Color.fromARGB(255, 96, 110, 255),
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 96, 110, 255)),
        hintText: hint,
        fillColor: Colors.white,
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 96, 110, 255), width: 3),
        ),
      );
}
