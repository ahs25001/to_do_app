import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThem{
  static ThemeData light=ThemeData(
    iconTheme: IconThemeData(color: primary),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      elevation: 1,
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge:GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold
      ) ,
      bodyMedium: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ) ,
      bodySmall:GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold
      )  ,
    )
  );
}