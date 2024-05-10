import 'package:flutter/material.dart';


void displayMessageToUser(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.grey,
      content: Text(message),
    ),
  );
}