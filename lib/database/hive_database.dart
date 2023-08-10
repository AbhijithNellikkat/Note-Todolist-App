import 'package:hive_flutter/hive_flutter.dart';

part 'hive_database.g.dart';

@HiveType(typeId: 1)
class TodosModel extends HiveObject {
  TodosModel(
      {required this.title, required this.todoNote, required this.isCompleted});

  @HiveField(0)
  String title;

  @HiveField(1)
  String todoNote;

  @HiveField(2)
  bool isCompleted;
}

@HiveType(typeId: 2)
class NotesModel extends HiveObject {
  NotesModel({
    required this.title,
    required this.notes,
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  String notes;
}
