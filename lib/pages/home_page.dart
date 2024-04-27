// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the Hive box
  final _mybox = Hive.box("mybox");
  final _controller = TextEditingController();
  ToDoBase db = ToDoBase();

  @override
  void initState() {
    super.initState();
    //if it's first time opening the app
    if (_mybox.get("todoList") == null) {
      db.createInitialData();
    } else {
      //there is some data
      db.loadData();
    }
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updataDataBase();
  }

  void saveNewTask() {
    setState(() {
      if (!(_controller.text == null || _controller.text == '')) {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      }
    });
    db.updataDataBase();
    Navigator.of(context).pop();
  }

  //create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(
            mycontroller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }));
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updataDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 232, 248),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "ToDo App",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: ((context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
              deleteFunction: (context) => deleteTask(index),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
