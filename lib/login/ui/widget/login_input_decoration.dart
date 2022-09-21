import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authDecoration({
    required String hintText,
    required String labeText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder:const  UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primary),
      ),
      focusedBorder: const  UnderlineInputBorder(
        borderSide: BorderSide(color: AppTheme.primary),
      ),
      prefixIcon: prefixIcon != null ? Icon(
        prefixIcon,
        color:AppTheme.primary,
      ): null ,
      hintText: hintText,
      labelText: labeText,
      labelStyle:const  TextStyle(
        color: Colors.grey,
      ),
    );
  }
}