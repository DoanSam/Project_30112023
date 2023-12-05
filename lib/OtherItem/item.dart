import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, Color colortext) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: colortext,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.white,
    dismissDirection: DismissDirection.none,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
