import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThem {
  static ThemeData light = ThemeData(
    bottomAppBarColor: Colors.white,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primary,
          onPrimary: Colors.black,
          secondary: Colors.white,
          onSecondary: mintGreen,
          error: Colors.red,
          onError: Colors.white,
          background: mintGreen,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white),
      scaffoldBackgroundColor: mintGreen,
      iconTheme: IconThemeData(color: primary),
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        elevation: 1,
      ),
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        // selectedItemColor:primary,
        selectedItemColor: primary,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        // bodyMedium: GoogleFonts.poppins(
        //     color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.poppins(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ));
  static ThemeData dark = ThemeData(
      bottomAppBarColor: Colors.white,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: primary,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: darkBlue,
          error: Colors.red,
          onError: Colors.black,
          background: darkBlue,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white),
      scaffoldBackgroundColor: darkBlue,
      iconTheme: IconThemeData(color: primary),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: blackColor),
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        elevation: 1,
      ),
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        selectedItemColor: primary,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        bodyMedium: GoogleFonts.poppins(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        bodySmall: GoogleFonts.poppins(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      ));
}
