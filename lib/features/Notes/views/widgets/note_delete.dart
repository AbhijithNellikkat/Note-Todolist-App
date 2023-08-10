import 'package:flutter/material.dart';

import '../../controllers/note_controller.dart';

Future<dynamic> noteDeleteShowDialog(
    BuildContext context, NoteController noteProvider, int index) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete Note'),
      content: const Text('Are you sure you want to delete this !'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            noteProvider.deleteNote(index);
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}
