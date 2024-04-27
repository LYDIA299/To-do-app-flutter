// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  bool useColor;
  VoidCallback onPressedButton;

  MyButton(
      {super.key,
      required this.buttonName,
      required this.useColor,
      required this.onPressedButton});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressedButton,
      child: Text(
        buttonName,
        style: TextStyle(
            color: useColor
                ? Theme.of(context).secondaryHeaderColor
                : Theme.of(context).primaryColor),
      ),
      color: useColor
          ? Theme.of(context).primaryColor
          : Theme.of(context).secondaryHeaderColor,
    );
  }
}
