import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF01a3a4);
  static const Color secundary = Color(0xFF556270);

  static ThemeData dartTheme = ThemeData.dark().copyWith(
    primaryIconTheme: const IconThemeData(
      color: primary,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primary,
    ),
    iconTheme: const IconThemeData(
      color: primary,
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white),
      bodyText1: TextStyle(
        color: primary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    buttonTheme: const ButtonThemeData(buttonColor: Colors.orange),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
    ),
    primaryColor: Colors.orange,
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.black87),
      bodyText1: TextStyle(color: Colors.orange),
    ),
    iconTheme: const IconThemeData(color: Colors.orange),
  );
}
