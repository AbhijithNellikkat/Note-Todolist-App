import 'package:flutter/material.dart';

import '../../../../database/hive_database.dart';
import '../../controllers/todo_controller.dart';

Future<String?> todoDeleteShowDialog(BuildContext context,
    TodoController provider, int index, TodosModel todos) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Delete Todo'),
      content: const Text('Are you sure you want to delete this !'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            provider.deleteTodo(index);
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
