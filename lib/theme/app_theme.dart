import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF01a3a4);
  static const Color secundary = Color(0xFF556270);
  static const Color formColor = Color(0xFFcd84f1);

  static ThemeData dartTheme = ThemeData.dark().copyWith(
    primaryIconTheme: ThemeData.dark().primaryIconTheme.copyWith(
          color: primary,
        ),
    buttonTheme: ThemeData.dark().buttonTheme.copyWith(
          buttonColor: primary,
        ),
    iconTheme: ThemeData.dark().iconTheme.copyWith(
          color: primary,
        ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyText2: const TextStyle(color: Colors.white),
          bodyText1: const TextStyle(
            color: primary,
          ),
        ),
    floatingActionButtonTheme: ThemeData.dark().floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.green,
        ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    buttonTheme: ThemeData.dark().buttonTheme.copyWith(buttonColor: Colors.orange),
    floatingActionButtonTheme: ThemeData.dark().floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.orange,
        ),
    primaryColor: Colors.orange,
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: const TextStyle(color: Colors.black87),
          bodyText1: const TextStyle(color: Colors.orange),
        ),
    iconTheme: ThemeData.dark().iconTheme.copyWith(color: Colors.orange),
  );
}
