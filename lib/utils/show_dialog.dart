import 'package:flutter/material.dart';

class ShowDialog {
  void dialog(
      BuildContext context, String title, String btnName, Function() cb) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text(title),
          actions: [ElevatedButton(onPressed: cb, child: Text(btnName))],
        );
      }),
    );
  }
}
