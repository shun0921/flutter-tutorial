import 'package:flutter/material.dart';
import 'package:flutter_tutorial/index_page.dart';
import 'package:flutter_tutorial/todo_list/model/todos.dart';

void main() {
  final database = MyDatabase();
  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final MyDatabase database;
  const MyApp({
    Key? key,
    required this.database,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: IndexPage(database: database),
    );
  }
}
