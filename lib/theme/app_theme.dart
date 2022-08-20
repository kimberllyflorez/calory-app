import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;

  static ThemeData dartTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.green,
    iconTheme: const IconThemeData(color: Colors.green),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
    ),
    primaryColor: Colors.orange,
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.black87),
    ),
    iconTheme: const IconThemeData(color: Colors.orange),
  );
}
