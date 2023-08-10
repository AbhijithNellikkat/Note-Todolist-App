import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../controllers/note_controller.dart';
import '../widgets/custom_note_addButton.dart';
import '../widgets/note_delete.dart';

class NotesScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  NotesScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteController>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notes',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<NoteController>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: MasonryGridView.builder(
                itemCount: value.noteBox.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final notes = value.noteBox.getAt(index);
                  return GestureDetector(
                    onTap: () {
                      if (noteProvider.noteBox.isNotEmpty) {
                        noteDeleteShowDialog(context, noteProvider, index);
                      }
                    },
                    child: Card(
                      margin: const EdgeInsets.all(9),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 12.0, left: 14.0, right: 14.0),
                            child: Text(
                              notes!.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, right: 14.0, bottom: 14.0),
                            child: Text(notes.notes),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        floatingActionButton: NoteAddButton(
          noteProvider: noteProvider,
        ),
      ),
    );
  }
}
