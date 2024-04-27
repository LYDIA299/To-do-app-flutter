import 'package:hive_flutter/hive_flutter.dart';

class ToDoBase {
  List toDoList = [];
  //refence the box
  final _mybox = Hive.box('mybox');

  //first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make my bed", false],
      ["Call my boss", false]
    ];
  }

  //load data from the database
  void loadData() {
    toDoList = _mybox.get("todoList");
  }

  //updata the database
  void updataDataBase() {
    _mybox.put("todoList", toDoList);
  }
}
