import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      // cardColor: Colors.white,
      // canvasColor: darkAppBackground,
      // buttonColor: darkishBlueColor,
      // accentColor: Colors.white,
      fontFamily: GoogleFonts.lato().fontFamily,
      // textTheme: GoogleFonts.latoTextTheme()
      // drawerTheme: DrawerTheme.of(context).backgroundColor:accentColor: whi,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,
      // cardColor: Colors.black,
      // canvasColor: darkAppBackground,
      // buttonColor: lightBlueColor,
      // accentColor: Colors.white,
      fontFamily: GoogleFonts.lato().fontFamily,
      // textTheme: GoogleFonts.latoTextTheme()
      // drawerTheme: DrawerTheme.of(context).backgroundColor:accentColor: whi,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6));

  static Color appBackground = Color.fromARGB(248, 248, 248, 248);
  static Color darkAppBackground = Color.fromARGB(248, 248, 248, 248);
  static Color darkishBlueColor = Color.fromARGB(255, 27, 29, 90);
  static Color lightBlueColor = Color.fromARGB(255, 27, 29, 90);
}
