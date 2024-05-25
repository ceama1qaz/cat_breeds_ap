import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFFFF750E),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFF750E),
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: Color(0xFF000405), fontSize: 32, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(color: Color(0xFF000405), fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Color(0xFF000405), fontSize: 16),
    bodyMedium: TextStyle(color: Color(0xFF000405), fontSize: 14),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFFF750E),
    textTheme: ButtonTextTheme.primary,
  ),
  cardTheme: CardTheme(
    color: const Color(0xFFFFFFFF),
    shadowColor: Colors.grey.withOpacity(0.5),
    elevation: 5,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF750E)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF750E)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF770F)),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFFFF750E),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFFF770F)),
);

