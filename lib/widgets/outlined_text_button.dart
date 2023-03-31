// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class OutlinedTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  OutlinedTextButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.black;

    return OutlinedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          side: MaterialStateProperty.all(
              const BorderSide(width: 1, color: primaryColor)),
          padding: MaterialStateProperty.all(const EdgeInsets.only(
              right: 35, left: 35, top: 12.5, bottom: 12.5)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: primaryColor, fontSize: 16),
      ),
    );
  }
}
