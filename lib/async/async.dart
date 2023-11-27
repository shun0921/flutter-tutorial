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
          await showDialog<void>(
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
  final _formKey = GlobalKey<FormState>();

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
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '名前'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '名前を入力してください。';
                }
                return null;
              },
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(labelText: '年齢'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    int.tryParse(value) == null) {
                  return '数値で入力してください。';
                }
                return null;
              },
            ),
            TextFormField(
              controller: birthdayController,
              decoration: const InputDecoration(labelText: '誕生日'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '誕生日を入力してください。';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('キャンセル'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text('保存'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSave(
                nameController.text,
                ageController.text,
                birthdayController.text,
              );
              if (mounted) {
                Navigator.pop(context);
              }
            }
          },
        ),
      ],
    );
  }
}
