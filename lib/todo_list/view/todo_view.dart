import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tutorial/todo_list/model_view/todoList_notifier.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    return Scaffold(
      body: todos.isEmpty
          ? const Center(child: Text('登録しているToDoはありません'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final item = todos[index];
                return Slidable(
                  key: ValueKey(item.id),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) => ref
                            .read(todoListProvider.notifier)
                            .deleteTodo(item.id),
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                        flex: 1,
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('タイトル: ${item.title}',
                              style: const TextStyle(fontSize: 20)),
                          Text(item.subtitle,
                              style: const TextStyle(fontSize: 16)),
                          Text('作成日時: ${item.date}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, ref),
        tooltip: 'ToDoを追加',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {}
}
