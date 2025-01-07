import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  VoidCallback onPressed;

  MyButton(
      {super.key,
      required this.buttonName,
      required this.buttonColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      color: buttonColor,
      child: Text(buttonName),
    );
  }
}
