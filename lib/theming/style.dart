import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      disabledColor: Colors.grey,
      textTheme: TextTheme(
          bodyText1: GoogleFonts.montserrat(
              color: isDarkTheme ? Colors.white : Colors.black),
          headline4: GoogleFonts.montserrat(
              color: isDarkTheme ? Colors.white : Colors.black)),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    );
  }
}
