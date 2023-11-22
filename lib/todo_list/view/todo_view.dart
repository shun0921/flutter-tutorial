import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tutorial/todo_list/model/todos.dart';
import 'package:intl/intl.dart';

class TodoView extends StatefulWidget {
  final MyDatabase database;

  const TodoView({
    Key? key,
    required this.database,
  }) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  late final Stream<List<Todo>> _todoStream;

  @override
  void initState() {
    super.initState();
    _todoStream = widget.database.watchEntries();
  }

  Future<void> _addToDoItem(
      String title, String subTitle, DateTime date) async {
    final todo = TodosCompanion(
      title: drift.Value(title),
      subtitle: drift.Value(subTitle),
      date: drift.Value(DateFormat('yyyy-MM-dd').format(date)),
    );
    await widget.database.into(widget.database.todos).insert(todo);
  }

  Future<void> _deleteToDoItem(int id) async {
    // Driftのdeleteメソッドを使用して、指定されたIDのToDoアイテムを削除する
    await (widget.database.delete(widget.database.todos)
          ..where((todo) => todo.id.equals(id)))
        .go();
  }

  void _showAddDialog() {
    TextEditingController titleController = TextEditingController();
    TextEditingController subTitleController = TextEditingController();
    DateTime? selectedDate;

    Future<void> _selectDate(
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
              title: Text('新しいToDoを追加'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'タイトル'),
                    style: TextStyle(fontSize: 20),
                  ),
                  TextField(
                    controller: subTitleController,
                    decoration: InputDecoration(labelText: 'サブタイトル'),
                  ),
                  ListTile(
                    title: Text(selectedDate == null
                        ? '日付を選択'
                        : DateFormat('yyyy/MM/dd').format(selectedDate!)),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context, setStateDialog),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('キャンセル'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('登録'),
                  onPressed: () {
                    if (selectedDate != null) {
                      _addToDoItem(titleController.text,
                          subTitleController.text, selectedDate!);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Todo>>(
        stream: _todoStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('登録しているToDoはありません'));
          }
          final todos = snapshot.data!;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final item = todos[index];
              return Slidable(
                key: ValueKey(item.id),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) => _deleteToDoItem(item.id),
                      backgroundColor: Color(0xFFFE4A49),
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
                        Text('タイトル: ' + item.title,
                            style: TextStyle(fontSize: 20)),
                        Text(item.subtitle, style: TextStyle(fontSize: 16)),
                        Text('作成日時: ' + item.date),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        tooltip: 'ToDoを追加',
        child: Icon(Icons.add),
      ),
    );
  }
}
