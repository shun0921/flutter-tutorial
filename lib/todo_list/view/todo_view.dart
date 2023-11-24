import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tutorial/todo_list/model/todo_model.dart';
import 'package:flutter_tutorial/todo_list/model_view/todoList_notifier.dart';
import 'package:intl/intl.dart';

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

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    TextEditingController titleController = TextEditingController();
    TextEditingController subTitleController = TextEditingController();
    DateTime? selectedDate;

    Future<void> selectDate(
        BuildContext context, StateSetter setStateDialog) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        setStateDialog(() {
          selectedDate = picked;
        });
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(12),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      const Icon(
                        Icons.text_fields,
                      ),
                      Expanded(
                        child: TextField(
                          controller: titleController,
                          decoration:
                              const InputDecoration(labelText: 'タイトルを入力してください'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.text_fields,
                      ),
                      Expanded(
                        child: TextField(
                          controller: subTitleController,
                          decoration:
                              const InputDecoration(labelText: '内容を入力してください'),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => selectDate(context, setStateDialog),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today),
                          const SizedBox(width: 16.0),
                          Text(
                            selectedDate == null
                                ? '期限を選択'
                                : DateFormat('yyyy/MM/dd')
                                    .format(selectedDate!),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('キャンセル'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('登録'),
                  onPressed: () {
                    if (selectedDate != null) {
                      ref.read(todoListProvider.notifier).addTodo(
                            TodoModel(
                              id: 0,
                              title: titleController.text,
                              subtitle: subTitleController.text,
                              date: DateFormat('yyyy-MM-dd')
                                  .format(selectedDate!),
                            ),
                          );
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
