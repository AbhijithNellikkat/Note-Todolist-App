import 'package:flutter/material.dart';
import 'package:todo_app/database/hive_database.dart';

import '../../controllers/todo_controller.dart';
import 'custom_textFormField.dart';

class TodoAddButton extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController todoNoteController = TextEditingController();

  final TodoController todoprovider;
  TodoAddButton({
    super.key,
    required this.todoprovider,
  });

  @override
  Widget build(BuildContext context) {
    createTodos() {
      final todos = TodosModel(
        title: titleController.text,
        todoNote: todoNoteController.text,
        isCompleted: false,
      );
      if (titleController.text.isNotEmpty &&
          todoNoteController.text.isNotEmpty) {
        todoprovider.createTodo(todos);
        Navigator.pop(context);
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error Message'),
            content: const Text('Please fill the Form !'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => showBottomSheet(
        backgroundColor: Colors.grey.shade800,
        enableDrag: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(28.0),
            child: SizedBox(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    textController: titleController,
                    label: 'Title',
                    icon: const Icon(Icons.today_outlined),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    textController: todoNoteController,
                    label: 'todo',
                    icon: const Icon(Icons.edit),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: createTodos,
                        child: const Text("Save"),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ElevatedButton(
                            child: const Text('cancel'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
