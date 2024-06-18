import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{

  static ThemeData get lightTheme => ThemeData(
      primarySwatch: Colors.amber,
      fontFamily: GoogleFonts.roboto().fontFamily,
  );
}