import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authDecoration({
    required String hintText,
    required String labeText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder:const  UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      focusedBorder: const  UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      prefixIcon: prefixIcon != null ? Icon(
        prefixIcon,
        color: Colors.deepPurple,
      ): null ,
      hintText: hintText,
      labelText: labeText,
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
    );
  }
}