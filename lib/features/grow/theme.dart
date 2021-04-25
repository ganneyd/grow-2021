import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO change to match GROW's app theme from old app
final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: Colors.lightGreen,
  primaryColorLight: const Color(0xFF64DD17),
  primaryColor: Colors.lightGreen,
  accentColor: const Color(0xFF009688),
  scaffoldBackgroundColor: const Color(0xFFE0F2F1),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black54,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusColor: Colors.lightGreen),
  buttonColor: Colors.lightGreen,
);
