import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: GoogleFonts.quicksand(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.quicksand(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.quicksand(fontSize: 17, color: Colors.black87),
      bodySmall: GoogleFonts.quicksand(fontSize: 16, color: Colors.black87),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 6.0,
      iconSize: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      sizeConstraints: BoxConstraints.tightFor(
        width: 60.0,
        height: 60.0,
      ),
      extendedPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),
  );
}
