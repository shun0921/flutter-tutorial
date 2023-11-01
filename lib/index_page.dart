import 'package:flutter/material.dart';
import 'package:flutter_tutorial/building/building_layout_page.dart';

class IndexPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuildingLayoutPage()),
                  );
                },
                child: Text('Tutorial1')
            ),
          ),
        ],
      ),
    );
  }
}
