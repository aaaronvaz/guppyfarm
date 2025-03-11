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
      iconTheme: IconThemeData(color: Colors.white), // Icon color in AppBar
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.quicksand(fontSize: 18, color: Colors.black),
      bodyMedium: GoogleFonts.quicksand(fontSize: 16, color: Colors.black87),
    ),
  );
}
