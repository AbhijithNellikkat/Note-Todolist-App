import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/hive_database.dart';

class NoteController extends ChangeNotifier {
  Box<NotesModel> noteBox = Hive.box('Note_Database');


  // Create  Notes
  Future<void> createNote(NotesModel notes) async {
    await noteBox.add(notes);
    notifyListeners();
  }

  // Update Notes
  Future<void> updateTodo(
      {required int index, required title, required note}) async {
    await noteBox.putAt(index, NotesModel(title: title, notes: note));
    notifyListeners();
  }

  // Delete Notes
  Future<void> deleteNote(int index) async {
    await noteBox.deleteAt(index);
    notifyListeners();
  }

  
}
