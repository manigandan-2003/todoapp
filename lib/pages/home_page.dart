import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/components/dialog_box.dart';
import 'package:todoapp/components/todo_tile.dart';
import 'package:todoapp/data/database.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference to the hive box
  final _myBox = Hive.box('todoBox');

  // create a instance for the database
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    super.initState();
    // if this is the first time the app is opened, create the box
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already data exists in the box
      db.getData();
    }
  }

  // text controller for dialog box
  final _controller = TextEditingController();

  // function to change the status of the task
  void checkBoxChanged(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1]; // toggle the status
    });
    db.updateData();
  }

  // function to save the new task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false, DateTime.now()]);
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

  // function to create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        });
    _controller.clear();
  }

  // function to delete a task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  // function to edit a task
  void editTask(int index) {
    _controller.text = db.todoList[index][0];
    showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                controller: _controller,
                onSave: () {
                  setState(() {
                    db.todoList[index][0] = _controller.text;
                    db.todoList[index][2] = DateTime.now();
                  });
                  Navigator.pop(context);
                  db.updateData();
                },
                onCancel: () => Navigator.pop(context),
              );
            })
        .then((_) => _controller.clear()); // clear the text field after editing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1D),
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white, fontFamily: 'DotMatrix'),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: const Icon(Icons.add)),
      body: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              // call the reorder function from todo database
              db.reorderTasks(oldIndex, newIndex);
            });
          },
          children: List.generate(db.todoList.length, (index) {
            return Container(
              key: ValueKey(index),
              color: Color(0xFF1B1B1D),
              child: TodoTile(
                taskName: db.todoList[index][0],
                taskStatus: db.todoList[index][1],
                onChanged: (context) => checkBoxChanged(index),
                deleteTask: (context) => deleteTask(index),
                editTask: (context) => editTask(index),
                dateTime: db.todoList[index][2],
              ),
            );
          })),
    );
  }
}
