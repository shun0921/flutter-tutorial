import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({super.key});
  @override
  State<AsyncPage> createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  String _name = '未設定';
  String _age = '未設定';
  String _birthday = '未設定';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '未設定';
      _age = prefs.getString('age') ?? '未設定';
      _birthday = prefs.getString('birthday') ?? '未設定';
    });
  }

  Future<void> _savePreferences(
    String name,
    String age,
    String birthday,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('age', age);
    await prefs.setString('birthday', birthday);
    setState(() {
      _name = name;
      _age = age;
      _birthday = birthday;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('名前: $_name'),
            Text('年齢: $_age'),
            Text('誕生日: $_birthday'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                onSave: (String name, String age, String birthday) async {
                  await _savePreferences(name, age, birthday);
                },
              );
            },
          );
          await _loadPreferences();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key, required this.onSave});
  final Future<void> Function(String name, String age, String birthday) onSave;

  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController birthdayController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    ageController = TextEditingController();
    birthdayController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('登録'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: '名前'),
          ),
          TextField(
            controller: ageController,
            decoration: const InputDecoration(labelText: '年齢'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: birthdayController,
            decoration: const InputDecoration(labelText: '誕生日'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          child: const Text('キャンセル'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text('保存'),
          onPressed: () async {
            final localContext = context;

            final name = nameController.text;
            final age = ageController.text;
            final birthday = birthdayController.text;
            if (name.isEmpty) {
              ScaffoldMessenger.of(localContext).showSnackBar(
                const SnackBar(content: Text('名前を入力してください。')),
              );
              return;
            }
            if (age.isEmpty || int.tryParse(age) == null) {
              ScaffoldMessenger.of(localContext).showSnackBar(
                const SnackBar(content: Text('数値で入力してください。')),
              );
              return;
            }
            if (birthday.isEmpty) {
              ScaffoldMessenger.of(localContext).showSnackBar(
                const SnackBar(content: Text('誕生日を入力してください。')),
              );
              return;
            }
            await widget.onSave(name, age, birthday);
            if (mounted) {
              Navigator.pop(localContext);
            }
          },
        ),
      ],
    );
  }
}
