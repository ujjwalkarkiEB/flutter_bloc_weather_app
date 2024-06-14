import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData AppThemeData = ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 48),
          labelLarge: TextStyle(fontSize: 28),
          labelMedium: TextStyle(fontSize: 28),
          labelSmall: TextStyle(fontSize: 14)));
}
