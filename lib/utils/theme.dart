import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
      backgroundColor: MaterialStatePropertyAll(Colors.black),
      textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20)),
    ),
  ),
);
