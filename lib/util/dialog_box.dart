// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';

class DialogBox extends StatelessWidget {
  final mycontroller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.mycontroller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            //button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(
                    buttonName: "Save",
                    useColor: true,
                    onPressedButton: onSave),
                //to have space bettween buttons
                const SizedBox(
                  width: 10,
                ),
                //cancel button
                MyButton(
                    buttonName: "Cancel",
                    useColor: false,
                    onPressedButton: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
