import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/hive_database.dart';

class Database {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();

    //  RegisterAdapter => Todo
    Hive.registerAdapter(TodosModelAdapter());

    //  RegisterAdapter => Note
    Hive.registerAdapter(NotesModelAdapter());

    // open todo box
    await Hive.openBox<TodosModel>('Todo_Database');

    // open notes box
    await Hive.openBox<NotesModel>('Note_Database');
  }

}
