import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'todos.g.dart';

@DataClassName('Todo')
class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get subtitle => text()();
  TextColumn get date => text()();
}

@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addTodo(TodosCompanion todo) {
    return into(todos).insert(todo);
  }

  Future<List<Todo>> get allTodoEntries => select(todos).get();
  Stream<List<Todo>> watchEntries() {
    return select(todos).watch();
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
