import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/hive_database.dart';


class TodoController extends ChangeNotifier {
  Box<TodosModel> todoBox = Hive.box('Todo_Database');

  int currentBottomNavIndex = 0;

  Future<void> bottomNavbar(value) async {
    currentBottomNavIndex = value;
    notifyListeners();
  }

  // Create  Todo
  Future<void> createTodo(TodosModel todos) async {
    await todoBox.add(todos);
    notifyListeners();
  }

  // Compeleted  Todo
  Future<void> compeletedTodo(TodosModel todos) async {
    await todos.save();
    notifyListeners();
  }

  // Update Todo
  Future<void> updateTodo(
      {required int index, required title, required todoNote}) async {
    await todoBox.putAt(
      index,
      TodosModel(
        title: title,
        todoNote: todoNote,
        isCompleted: false,
      ),
    );
    notifyListeners();
  }

  // Delete Todo
  Future<void> deleteTodo(int index) async {
    await todoBox.deleteAt(index);
    notifyListeners();
  }
}
