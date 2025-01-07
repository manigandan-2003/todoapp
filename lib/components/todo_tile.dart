import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(7),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // task status
              Checkbox(
                value: taskStatus,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // task name
              Flexible(
                child: Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskStatus ? TextDecoration.lineThrough : null),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
