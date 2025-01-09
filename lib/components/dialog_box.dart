import 'package:flutter/material.dart';
import 'package:todoapp/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input for task name
            TextField(
              controller: controller,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
              style: TextStyle(color: Colors.white),
            ),

            // save and cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // cancel button
                MyButton(
                    buttonName: "Cancel",
                    buttonColor: Color(0xFFD71921),
                    onPressed: onCancel),
                // save button
                MyButton(
                    buttonName: "Save",
                    buttonColor: Color(0xFFD71921),
                    onPressed: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
