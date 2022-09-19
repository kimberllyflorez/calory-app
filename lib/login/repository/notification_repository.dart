import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NotificationRepository {
  //estado
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Container(
          //color: AppTheme.secundary,
          child: Text(
        message,
        style: const TextStyle(color: AppTheme.primary,fontSize: 28),
      ),
      ),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
