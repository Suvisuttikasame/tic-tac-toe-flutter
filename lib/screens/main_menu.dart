import "package:flutter/material.dart";
import "package:tic_tac_toe/widgets/custom_button.dart";

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(onPressed: () {}, buttonLabel: 'create room'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(onPressed: () {}, buttonLabel: 'join room'),
          ],
        ),
      ),
    );
  }
}
