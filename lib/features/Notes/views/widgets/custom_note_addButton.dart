import 'package:flutter/material.dart';
import 'package:todo_app/database/hive_database.dart';

import '../../../Todos/views/widgets/custom_textFormField.dart';
import '../../controllers/note_controller.dart';

class NoteAddButton extends StatelessWidget {
  NoteAddButton({
    super.key,
    required this.noteProvider,
  });

  final NoteController noteProvider;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    createTodos() {
      final notes = NotesModel(
        title: titleController.text,
        notes: noteController.text,
      );
      if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
        noteProvider.createNote(notes);
        Navigator.pop(context);
      }
    }

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: CustomTextFormField(
                label: 'Title',
                icon: const Icon(Icons.note),
                textController: titleController,
              ),
              content: CustomTextFormField(
                label: 'Note',
                icon: const Icon(Icons.edit),
                textController: noteController,
              ),
              actions: [
                ElevatedButton(
                  onPressed: createTodos,
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("cancel"),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
