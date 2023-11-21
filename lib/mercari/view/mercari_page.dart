import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/mercari/api/api.dart';
import 'package:flutter_tutorial/mercari/model/item.dart';
import 'package:flutter_tutorial/mercari/view/item_list.dart';
import 'package:flutter_tutorial/mercari/view/shortcut.dart';

class Mercari extends StatefulWidget {
  const Mercari({Key? key}) : super(key: key);

  @override
  State<Mercari> createState() => _mercariState();
}

class _mercariState extends State<Mercari> {
  List<Item> _item = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    setState(() {
      isLoading = true;
    });

    final dio = Dio();
    final api = Api(dio);

    try {
      final items = await api.getItemks();
      setState(() {
        _item = items;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '出品',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Shortcut(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
                ),
              ),
              child: ListTile(
                title: const Text(
                  '売れやすい持ち物',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: const Text(
                  '使わないモノを出品してみよう！',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'すべて見る',
                        style: TextStyle(color: Colors.blue),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _item.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext cotext, int index) {
                      return ItemList(item: _item[index]);
                    }),
          ],
        ),
      ),
    );
  }
}
