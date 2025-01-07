import 'package:hive_flutter/adapters.dart';

class TodoDatabase {
  // todo list
  List todoList = [];

  // reference to the hive box
  final _myBox = Hive.box('todoBox');

  // if this is the first time the app is opened, create the box
  void createInitialData() {
    todoList = [
      ["This is a Todo App", false],
      ["if you click the checkbox the task will be marked as completed", false],
      ["if you swipe the task to the right you can delete the task", false],
      ["click the + button to add a new task", false],
    ];
  }

  // get the data from the hive box
  void getData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update the data in the hive box
  void updateData() {
    _myBox.put("TODOLIST", todoList);
  }
}
