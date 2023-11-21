import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/regidence/api/api.dart';
import 'package:flutter_tutorial/regidence/model/regidence.dart';
import 'package:flutter_tutorial/regidence/view/recommend.dart';
import 'package:flutter_tutorial/regidence/view/regidence_detail.dart';

enum Choice { recommend, refurbished }

class RegidencePage extends StatefulWidget {
  const RegidencePage({Key? key}) : super(key: key);

  @override
  State<RegidencePage> createState() => _RegidencePageState();
}

class _RegidencePageState extends State<RegidencePage> {
  Choice selectedChoice = Choice.recommend;
  int _selectedIndex = 0;
  List<Regidence> _regidence = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchRegidences();
  }

  Future<void> _fetchRegidences() async {
    setState(() {
      isLoading = true;
    });

    final dio = Dio();
    final api = Api(dio);

    try {
      final regidences = await api.getRegidences();
      setState(() {
        _regidence = regidences;
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
      appBar: buildPreferredSize(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Recommend(),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _regidence.length,
                    itemBuilder: (context, index) {
                      final regidence = _regidence[index];
                      return HouseDetailWidget(regidence: regidence);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  PreferredSize buildPreferredSize() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: _buildChoiceButton(Choice.recommend, 'カウルのおすすめ'),
                ),
              ),
              Expanded(
                child:
                    _buildChoiceButtonSecond(Choice.refurbished, 'リフォーム済みの物件'),
              ),
              const SizedBox(
                width: 40,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.teal,
                ),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      selectedLabelStyle: const TextStyle(fontSize: 10),
      selectedItemColor: Colors.teal,
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      unselectedItemColor: Colors.grey.withOpacity(0.9),
      backgroundColor: Colors.white,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'お気にいり',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              const Icon(Icons.messenger_outline),
              Positioned(
                top: -5,
                right: -5,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          label: 'メッセージ',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'マイページ',
        ),
      ],
    );
  }

  Widget _buildChoiceButton(Choice choice, String text) {
    return ElevatedButton(
      onPressed: () => setState(() {
        selectedChoice = choice;
      }),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(100, 40)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(
            color: selectedChoice == choice ? Colors.teal : Colors.black,
            fontSize: 13),
      ),
    );
  }

  Widget _buildChoiceButtonSecond(Choice choice, String text) {
    String notificationCount = '3';

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevatedButton(
          onPressed: () => setState(() {
            selectedChoice = choice;
          }),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(100, 40)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          ),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
                color: selectedChoice == choice ? Colors.teal : Colors.black,
                fontSize: 13),
          ),
        ),
        Positioned(
          right: 0,
          top: 2,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(9),
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              notificationCount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
