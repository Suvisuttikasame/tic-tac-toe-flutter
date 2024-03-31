import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Color color;
  final bool isDisabled;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.color,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.75,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          spreadRadius: 1,
        )
      ]),
      child: TextField(
        readOnly: isDisabled,
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor: color,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
