import 'package:flutter/material.dart';

class Snackbar {
  static const errorColor = Colors.red;
  static const wellcolor = Colors.green;

  static Future<void> showSnackBar(
      BuildContext context, bool error, String message) async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final snackbar = SnackBar(
      content: Text(message),
      backgroundColor: error ? errorColor : wellcolor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
