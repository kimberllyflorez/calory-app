import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{

  static const  Color primary = Colors.green;

  static ThemeData dartTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.green,
    //textColors: Colors.white,
    iconTheme: const IconThemeData(
        color: Colors.green
    ),
    floatingActionButtonTheme:const  FloatingActionButtonThemeData(
      backgroundColor: Colors.green,

    ),

  );



  static ThemeData lightTheme = ThemeData.light().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,

    ),
    primaryColor: Colors.orange,
    textTheme: const TextTheme(
         button: TextStyle(color: Colors.black87) ,
    ),
    iconTheme: const IconThemeData(
        color: Colors.orange
    ),

  );
}

