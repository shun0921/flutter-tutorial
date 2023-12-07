import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/todo_list/model/todos.dart';

final databaseProvider = Provider<MyDatabase>((ref) {
  return MyDatabase();
});
