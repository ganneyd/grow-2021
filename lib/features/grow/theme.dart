import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO change to match GROW's app theme from old app
///32
final ThemeData theme = ThemeData(
    // fontFamily: 'Arial Rounded MT Bold',

    primaryTextTheme: TextTheme(
      headline1: GoogleFonts.balooThambi().copyWith(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      headline2: GoogleFonts.balooThambi().copyWith(color: Colors.black54),
      subtitle1: GoogleFonts.balooThambi().copyWith(fontSize: 40),
      subtitle2: GoogleFonts.balooThambi().copyWith(fontSize: 40),
      headline4: GoogleFonts.balooThambi().copyWith(
          color: Colors.white, fontSize: 35, fontWeight: FontWeight.w800),
      headline5: GoogleFonts.balooThambi().copyWith(
          color: Colors.black26, fontWeight: FontWeight.w900, fontSize: 32),
      headline6: GoogleFonts.balooThambi().copyWith(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyText1:
          GoogleFonts.balooThambi().copyWith(color: Colors.grey.shade700),
      bodyText2: GoogleFonts.balooThambi().copyWith(color: Colors.black26),
      button: GoogleFonts.balooThambi().copyWith(
        color: Color.fromRGBO(2, 108, 73, 1),
      ),
    ),
    fontFamily: GoogleFonts.balooThambi().fontFamily,
    //accentTextTheme: TextTheme(button: ),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    accentIconTheme: const IconThemeData(color: Colors.black),
    iconTheme: const IconThemeData(
      color: Color.fromRGBO(2, 108, 73, 1),
    ),
    appBarTheme: AppBarTheme(
      color: const Color.fromRGBO(144, 223, 43, 1),
      titleTextStyle: TextStyle(
          fontSize: 36,
          fontFamily: GoogleFonts.balooThambi().fontFamily,
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(0, 4),
              blurRadius: 6.0,
              color: Color.fromRGBO(0, 0, 0, 0.10),
            ),
          ]),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 36,
          fontFamily: GoogleFonts.balooThambi().fontFamily,
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(0, 4),
              blurRadius: 6.0,
              color: Color.fromRGBO(0, 0, 0, 0.10),
            ),
          ],
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 2.0,
        ),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
        actionTextColor: Colors.pink,
        contentTextStyle: GoogleFonts.balooThambi().copyWith(
          color: Colors.white,
        )),
    textTheme: TextTheme(
      headline6: GoogleFonts.balooThambi(),
      subtitle1: GoogleFonts.balooThambi(),
      subtitle2: GoogleFonts.balooThambi(),
    ),
    primaryColorDark: Colors.lightGreen,
    primaryColorLight: const Color(0xFF64DD17),
    primaryColor: const Color.fromRGBO(144, 223, 43, 1),
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
    //const Color.fromRGBO(235, 235, 75, 1),
    disabledColor: const Color.fromRGBO(235, 235, 238, 1),
    buttonTheme: const ButtonThemeData(
      disabledColor: Colors.red,
    ));
