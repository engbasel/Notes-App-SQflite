import 'package:flutter/material.dart';

//----------------------------- lightTheme -------------------------------------
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xffF6F5F2),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffFCB07E),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color.fromARGB(255, 199, 179, 166)),
    bodyMedium: TextStyle(color: Color.fromARGB(255, 199, 179, 166)),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Color(0xffF6F5F2),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xffFCB07E),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontSize: 18),
    ),
  ),
);
//----------------------------- lightTheme -------------------------------------

//----------------------------------darkTheme ----------------------------------
final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xff27304e),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff27304e),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Color(0xff395979),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: const Color(0xff9dc0e8),
      backgroundColor: const Color(0xff363f62),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontSize: 18),
    ),
  ),
);
//--------------------------------- darkTheme ----------------------------------
