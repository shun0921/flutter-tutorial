import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:flutter_tutorial/todo_list/model/todos.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final databaseProvider = Provider<MyDatabase>((ref) {
      return MyDatabase();
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(MyDatabase()),
        ],
        child: MyApp(),
      ),
    );
  });
}
