import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO change to match GROW's app theme from old app
///32
final ThemeData theme = ThemeData(
  // fontFamily: 'Arial Rounded MT Bold',
  primaryTextTheme: TextTheme(
    headline1: const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    headline2: const TextStyle(color: Colors.black54),
    headline5: const TextStyle(
        color: Colors.black26, fontWeight: FontWeight.w900, fontSize: 32),
    bodyText1: TextStyle(color: Colors.grey.shade700),
    bodyText2: const TextStyle(color: Colors.black26),
    button: const TextStyle(
      color: Color.fromRGBO(2, 108, 73, 1),
    ),
  ),

  //accentTextTheme: TextTheme(button: ),
  primaryIconTheme: const IconThemeData(color: Colors.black),
  accentIconTheme: const IconThemeData(color: Colors.black),
  iconTheme: const IconThemeData(
    color: Color.fromRGBO(2, 108, 73, 1),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(144, 223, 43, 1),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 36,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 2.0,
      ),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
      actionTextColor: Colors.pink,
      contentTextStyle: TextStyle(color: Colors.white)),
  textTheme: Typography.blackCupertino,
  primaryColorDark: Colors.lightGreen,
  primaryColorLight: const Color(0xFF64DD17),
  primaryColor: Colors.lightGreen,
  accentColor: const Color.fromRGBO(2, 108, 73, 1),
  scaffoldBackgroundColor: Colors.white, //const Color(0xFFE0F2F1),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.red,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusColor: Colors.lightGreen),
  buttonColor: const Color.fromRGBO(144, 223, 43, 1),
  splashColor: const Color.fromRGBO(255, 204, 0, 1),
);
