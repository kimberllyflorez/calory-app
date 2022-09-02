import 'package:flutter/material.dart';

class NotificationRepository {
  //estado
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Container(
          color: Colors.white10,
          child: Text(
        message,
        style: const TextStyle(color: Colors.purple),
      )),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
