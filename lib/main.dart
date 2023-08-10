import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/home/home.dart';
import 'package:todo_app/utils/helpers/database.dart';

import 'features/Notes/controllers/note_controller.dart';
import 'features/Todos/controllers/todo_controller.dart';

void main() async {
  final database = Database();

  await database.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoController()),
        ChangeNotifierProvider(create: (context) => NoteController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.tealAccent,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
