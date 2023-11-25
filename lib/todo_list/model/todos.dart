import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_tutorial/todo_list/model/todo_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'todos.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
  TextColumn get date => text()();
  DateTimeColumn get createdDate => dateTime()();
}

@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  Future<int> addTodo(TodoModel model) {
    final todo = TodosCompanion(
      title: Value(model.title),
      subtitle: Value(model.subtitle),
      date: Value(model.date),
      createdDate: Value(model.createdDate),
    );
    return into(todos).insert(todo);
  }

  Future<List<TodoModel>> get allTodoEntries async {
    final queryResult = await select(todos).get();
    return queryResult
        .map((todo) => TodoModel(
              id: todo.id,
              title: todo.title,
              subtitle: todo.subtitle,
              date: todo.date,
              createdDate: todo.createdDate,
            ))
        .toList();
  }

  Stream<List<TodoModel>> watchEntries() {
    return select(todos).watch().map((list) => list
        .map((todo) => TodoModel(
              id: todo.id,
              title: todo.title,
              subtitle: todo.subtitle,
              date: todo.date,
              createdDate: todo.createdDate,
            ))
        .toList());
  }

  Future<void> deleteTodo(int id) {
    return (delete(todos)..where((t) => t.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
