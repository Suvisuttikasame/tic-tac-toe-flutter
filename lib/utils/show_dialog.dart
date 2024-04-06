import 'package:flutter/material.dart';
import 'package:tic_tac_toe/resources/game_method.dart';

class ShowDialog {
  void dialog(BuildContext context, String content) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text(content),
          actions: [
            ElevatedButton(
                onPressed: () {
                  GameMethod().clearBoard(context);
                  Navigator.pop(context);
                },
                child: const Text('continue'))
          ],
        );
      }),
    );
  }
}
