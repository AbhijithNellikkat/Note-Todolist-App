import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/Todos/views/widgets/custom_todo_addButton.dart';
import '../../controllers/todo_controller.dart';
import '../widgets/todo_delete.dart';
import '../widgets/todo_update.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoController>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Todos',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Consumer<TodoController>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Expanded(
                child: ListView.builder(
                    itemCount: value.todoBox.length,
                    itemBuilder: (context, index) {
                      final todos = value.todoBox.getAt(index);
                      return GestureDetector(
                        onTap: () {
                          if (todoProvider.todoBox.isNotEmpty) {
                            todoDeleteShowDialog(
                                context, todoProvider, index, todos);
                          }
                        },
                        child: Card(
                          child: ListTile(
                            leading: Checkbox(
                              checkColor: Colors.black,
                              value: todos!.isCompleted,
                              onChanged: (value) {
                                todos.isCompleted = !todos.isCompleted;
                                todoProvider.compeletedTodo(todos);
                              },
                            ),
                            title: Text(
                              todos.title,
                            ),
                            subtitle: Text(
                              todos.todoNote,
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  todoUpdateTodo(context,
                                      index: index,
                                      title: todos.title,
                                      todoNote: todos.todoNote);
                                },
                                icon: const Icon(Icons.edit)),
                          ),
                        ),
                      );
                    }),
              ),
            );
          },
        ),
      ),
      floatingActionButton: TodoAddButton(
        todoprovider: todoProvider,
      ),
    );
  }
}
