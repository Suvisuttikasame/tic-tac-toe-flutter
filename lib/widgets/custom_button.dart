import 'package:flutter/material.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonLabel;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Responsive(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width * 0.75, 50),
        ),
        child: Text(
          buttonLabel,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
