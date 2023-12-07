import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/todo_list/model/todo_model.dart';
import 'package:flutter_tutorial/todo_list/model/todos.dart';
import 'package:flutter_tutorial/todo_list/model_view/database_provider.dart';

class TodoListNotifier extends StateNotifier<List<TodoModel>> {
  final MyDatabase database;

  TodoListNotifier(this.database) : super([]) {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todos = await database.allTodoEntries;
    state = todos;
  }

  Future<void> addTodo(TodoModel model) async {
    await database.addTodo(model);
    _loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await database.deleteTodo(id);
    _loadTodos();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoModel>>((ref) {
  final database = ref.watch(databaseProvider);
  return TodoListNotifier(database);
});
