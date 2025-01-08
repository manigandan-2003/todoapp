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
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: controller.text.isEmpty
                      ? "Add a new task"
                      : controller.text),
            ),

            // save and cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // cancel button
                MyButton(
                    buttonName: "Cancel",
                    buttonColor: Colors.red,
                    onPressed: onCancel),
                // save button
                MyButton(
                    buttonName: "Save",
                    buttonColor: Colors.green,
                    onPressed: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
