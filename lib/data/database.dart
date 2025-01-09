import 'package:hive_flutter/adapters.dart';

class TodoDatabase {
  // create a list of tasks
  List todoList = [];

  // reference to the hive box
  final _myBox = Hive.box('todoBox');

  // if this is the first time the app is opened, create the box
  void createInitialData() {
    todoList = [
      ["This is a Todo App", false, DateTime.now()],
      [
        "if you click the checkbox the task will be marked as completed",
        false,
        DateTime.now()
      ],
      [
        "if you drag the tile you will be able to reorder your todos",
        false,
        DateTime.now()
      ],
      [
        "if you swipe the task to the right you can delete the task",
        false,
        DateTime.now()
      ],
      [
        "if you swipe the task to the left you can edit the task",
        false,
        DateTime.now()
      ],
      ["click the + button to add a new task", false, DateTime.now()],
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

  //function to reorder tasks
  void reorderTasks(oldIndex, newIndex) {
    // if the new index is greater than the old index, then the new index will be reduced by 1
    if (oldIndex < newIndex) newIndex -= 1;
    // remove the item from the old index and insert it at the new index
    final item = todoList.removeAt(oldIndex);
    // insert the item at the new index
    todoList.insert(newIndex, item);
    // update the data
    updateData();
  }
}
