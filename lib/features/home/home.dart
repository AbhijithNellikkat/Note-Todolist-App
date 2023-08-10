import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Notes/views/pages/note_screen.dart';
import '../Todos/controllers/todo_controller.dart';
import '../Todos/views/pages/todo_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Widget> pages = [
     NotesScreen(),
    const TodosScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoController>(
      context,
    );

    return SafeArea(
      child: Scaffold(
        body: pages[provider.currentBottomNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.currentBottomNavIndex,
          onTap: (value) => provider.bottomNavbar(value),
          items: [
            customBottomNavbarItem(
              icon: const Icon(Icons.note_add),
              label: 'Notes',
            ),
            customBottomNavbarItem(
              icon: const Icon(Icons.today_rounded),
              label: 'Todos',
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem customBottomNavbarItem(
      {required Widget icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
