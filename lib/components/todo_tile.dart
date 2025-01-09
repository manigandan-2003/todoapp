import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  final DateTime dateTime;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  Function(BuildContext)? editTask;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.dateTime,
    required this.onChanged,
    required this.deleteTask,
    required this.editTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        startActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: editTask,
            icon: Icons.edit,
            foregroundColor: Color(0xFFD71921),
            backgroundColor: Color(0xFF1B1B1D),
            borderRadius: BorderRadius.circular(7),
          )
        ]),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              foregroundColor: Color(0xFFD71921),
              backgroundColor: Color(0xFF1B1B1D),
              borderRadius: BorderRadius.circular(7),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xFFD71921),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              // row for task name and status
              Row(
                children: [
                  // task status
                  Checkbox(
                    value: taskStatus,
                    onChanged: onChanged,
                    activeColor: Color(0xFF1B1B1D),
                  ),

                  // task name
                  Flexible(
                    child: Text(
                      taskName,
                      style: TextStyle(
                          color: Colors.white,
                          decoration:
                              taskStatus ? TextDecoration.lineThrough : null),
                    ),
                  ),
                ],
              ),
              // task date
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(
                  '${dateTime.day}/${dateTime.month}/${dateTime.year}-${dateTime.hour}:${dateTime.minute}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
